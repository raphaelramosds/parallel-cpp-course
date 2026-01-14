// A simple example of double buffering in C++
// By: Nick from CoffeeBeforeArch
// Modified by: raphaelramosds

#include <random>
#include <semaphore>
#include <span>
#include <thread>
#include <vector>

// Function for generating data
void generate_data(std::span<int> data)
{
    // Create random number generator
    std::random_device rd;
    std::mt19937 mt(rd());
    std::uniform_int_distribution dist(1, 100);

    // Generate random data
    for (auto &value : data)
    {
        value = dist(mt);
    }
}

// Function for processing data (dummy work)
void process_data(std::span<int> data)
{
    for (int i = 0; i < 5; i++)
    {
        for (auto &value : data)
        {
            value %= value + 1;
        }
    }
}

int main()
{
    // Create std::vector passed between generation/processing
    std::vector<int> data_1;
    std::vector<int> data_2;
    data_1.resize(1 << 20);
    data_2.resize(1 << 20);

    // Semaphores for coordinating work
    std::binary_semaphore signal_to_process{0};     // Inicializa como 0 para que o processador espere o gerador
    std::binary_semaphore signal_to_generate{1};    // Inicializa como 1 para permitir que o gerador comece primeiro

    // Number of iterations to perform
    const int num_iterations = 100;

    // Work function for generating data
    auto data_generator = [&]()
    {
        // Run for 100 iterations
        for (int i = 0; i < num_iterations; i++)
        {
            // Preencha TODO o buffer atual
            // NOTE!! O generate_data executado ANTES do acquire garante que enquanto o buffer da iteracao 
            // anterior esta sendo processado, ja estamos preenchendo novos dados no buffer atual
            generate_data(data_1);

            // Decrementa o semaforo para indicar que a geracao esta completa, esperando se necessario
            signal_to_generate.acquire();

            // Troca os buffers
            // NOTE: Com essa troca, observe que na proxima iteracao o buffer que acabamos de preencher sera 
            // processado pela outra thread, enquanto o outro buffer sera preenchido novamente por esta thread
            // apos a chamada de release() da thread de processamento
            data_1.swap(data_2);

            // Incrementa o semaforo de processamento para indicar que ha dados prontos
            signal_to_process.release();
        }
    };

    // Work function for generating data
    auto data_processor = [&]()
    {
        // Run for 100 iterations
        for (int i = 0; i < num_iterations; i++)
        {
            // Tenta adquirir o semaforo de processamento da thread que gera os dados, esperando se necessario
            signal_to_process.acquire();

            // Processa o buffer que a outra thread acabou de preencher 
            process_data(data_2);

            // Incrementa o semaforo de geracao para indicar que o buffer esta livre para ser preenchido novamente
            signal_to_generate.release();
        }
    };

    // Spawn our two threads
    std::jthread generator(data_generator);
    std::jthread processor(data_processor);

    return 0;
}