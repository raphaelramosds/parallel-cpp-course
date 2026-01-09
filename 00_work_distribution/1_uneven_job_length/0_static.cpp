// Static work distribution with uneven job length
// By: Nick from CoffeeBeforeArch
// Adaptado por: raphaelramosds

#include <tbb/parallel_for.h>

#include <algorithm>
#include <chrono>
#include <iterator>
#include <random>
#include <vector>

int main()
{
    // Instancie um gerador de numeros pseudo aleatorios
    std::random_device rd;
    std::mt19937 mt(rd());

    // Instancie quatro distribuicoes uniformes para diferentes intervalos de duracao
    std::uniform_int_distribution bin_1(1, 25);
    std::uniform_int_distribution bin_2(26, 50);
    std::uniform_int_distribution bin_3(51, 75);
    std::uniform_int_distribution bin_4(76, 100);

    // Calcule o número de elementos que sera gerado por cada distribuicao
    int num_work_items = 1 << 18;
    int n_bins = 4;
    int elements_per_bin = num_work_items / n_bins;

    // Instancie os itens de trabalho
    std::vector<int> work_items;
    
    // Popule o vetor de itens de trabalho com duracoes de diferentes distribuicoes
    // NOTE: os primeiros elementos serao mais rapidos, os ultimos mais lentos
    std::generate_n(std::back_inserter(work_items), elements_per_bin,
                    [&]
                    { return bin_1(mt); });
    std::generate_n(std::back_inserter(work_items), elements_per_bin,
                    [&]
                    { return bin_2(mt); });
    std::generate_n(std::back_inserter(work_items), elements_per_bin,
                    [&]
                    { return bin_3(mt); });
    std::generate_n(std::back_inserter(work_items), elements_per_bin,
                    [&]
                    { return bin_4(mt); });

    // Processe os itens de trabalho em paralelo com TBB
    tbb::parallel_for(
        tbb::blocked_range<int>(0, num_work_items),
        [&](tbb::blocked_range<int> r)
        {
            for (int i = r.begin(); i < r.end(); i++)
            {
                std::this_thread::sleep_for(std::chrono::microseconds(work_items[i]));
            }
        },
        tbb::static_partitioner());

    return 0;
}