// Static work distribution with ~equal job length
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
  std::random_device rd; // Seed para o gerador
  std::mt19937 mt(rd()); // Mersenne Twister: produz inteiros aleatorios de 32 bits (repete-se apos gerar 2^19937-1 numeros)

  // NOTE: para gerar um numero aleatorio chame mt(), e para gerar varios de uma vez chame mt

  // Instancie uma distribuicao uniforme com igual chance de gerar numeros entre 20 e 30
  std::uniform_int_distribution bin(20, 30);

  // Numero total de itens de trabalho: 2^18
  int num_work_items = 1 << 18;

  // Instancie os itens de trabalho
  std::vector<int> work_items;

  // Popule os itens de trabalho com duracoes entre 20 e 30 microsegundos
  std::generate_n(
      // Insere num_work_items valores de 20 a 30 (gerados por bin(mt)) no inicio do vetor work_items
      std::back_inserter(work_items),
      num_work_items,
      [&]
      { return bin(mt); });

  // Processe os itens de trabalho em paralelo com TBB
  tbb::parallel_for(
      // Defina o intervalo de trabalho de 0 a num_work_items
      tbb::blocked_range<int>(0, num_work_items),
      // Funcao a ser executada em paralelo: o ponteiro r guarda onde a thread deve comecar e terminar
      [&](tbb::blocked_range<int> r)
      {
        for (int i = r.begin(); i < r.end(); i++)
        {
          std::this_thread::sleep_for(std::chrono::microseconds(work_items[i]));
        }
      },
      // Use particionador estatico: divide o trabalho em partes iguais no inicio da execucao
      tbb::static_partitioner());

  return 0;
}