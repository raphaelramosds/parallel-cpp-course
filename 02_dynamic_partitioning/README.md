# Aula 02 - Particionamento dinâmico

## Visão geral

O particionamento dinâmico envolve a atribuição de tarefas aos threads conforme eles ficam disponíveis para processá-las.

Isso é especialmente útil quando as tarefas têm tempos de execução variáveis, pois permite que os threads que terminam suas tarefas mais rapidamente possam pegar novas tarefas, equilibrando melhor a carga de trabalho.

## A classe `std::atomic`

O particionamento dinâmico pode ser implementado no C++ utilizando a classe `std::atomic` para gerenciar um índice compartilhado que indica a próxima tarefa a ser processada.

```cpp
// Indice compartilhado para a próxima tarefa
std::atomic<int> index = 0;

// Cada thread vai entrar em um loop para pegar novas tarefas
auto work = [&]()
{
    for (int i = index.fetch_add(1); i < num_work_items; i = index.fetch_add(1))
    {
        std::this_thread::sleep_for(std::chrono::microseconds(work_items[i]));
    }
};
```

Observe que a função `fetch_add` da classe `std::atomic` retorna o valor atual do índice e, em seguida, incrementa-o. Isso é feito duas vezes pela thread: uma para obter o índice da próxima tarefa e outra para atualizar o índice para a próxima thread que solicitará uma tarefa.

Essa operação deve ser atômica para evitar condições de corrida, garantindo que cada thread receba um índice único e correto.

## Exemplo prático

Para simular um programa em que existem tarefas que levam tempos diferentes para serem concluídas, adotamos a seguinte estratégia

- Definimos um vetor `std::vector<int> work_items` que possui inteiros representando o tempo (em milissegundos) que cada tarefa levará para ser concluída
- A thread responsável por processar a posição `i` do vetor `work_items` simplesmente "dorme" por `work_items[i]` milissegundos, simulando o tempo gasto para completar a tarefa

- Propositalmente vamos sabotar o particionamento estático, fazendo com que as threads que recebem tarefas mais longas fiquem ociosas enquanto outras threads já terminaram suas tarefas e estão aguardando novas atribuições.

Abaixo a implementação em C++ da estatégia acima

```cpp
std::vector<int> work_items;
work_items.reserve(num_work_items);
for (int i = 0; i < num_work_items; i += num_threads)
{
    // Threads 0/1 recebem os menores tempos de trabalho (1 a 25 ms)
    work_items.push_back(bin_1(mt));
    work_items.push_back(bin_1(mt));

    // Threads 2/3 recebem tempos de trabalho intermediarios (26 a 50 ms)
    work_items.push_back(bin_2(mt));
    work_items.push_back(bin_2(mt));

    // Threads 4/5 recebem tempos de trabalho longos (51 a 75 ms)
    work_items.push_back(bin_3(mt));
    work_items.push_back(bin_3(mt));

    // Threads 6/7 recebem os maiores tempos de trabalho (76 a 100 ms)
    work_items.push_back(bin_4(mt));
    work_items.push_back(bin_4(mt));
}
```

Essa estratégia está presentes nos programas `0_static.cpp` e `1_dynamic.cpp`, só que o primeiro utiliza particionamento estático e o segundo particionamento dinâmico. 