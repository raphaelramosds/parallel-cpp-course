# Programação Paralela em C++

## Visão geral

Boa parte dos códigos e recursos utilizados nesse repositório são adaptações do material presente no curso [**Parallel C++**](https://youtube.com/playlist?list=PLxNPSjHT5qvsGKsAhirvZn7W73pXhXpfv&si=Uzp-SLVjFj6OcZVK).

## Conteúdo

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./00_work_distribution/README.md) **Aula 00 - Distribuição de trabalho**
- Distribuição de trabalho em programação paralela usando Intel TBB
- Diferenciação entre particionamento estático e dinâmico
- Diferenciação entre distribuição balanceada e desbalanceada

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./01_static_partioning/README.md) **Aula 01 - Particionamento estático**
- Implementação de duas formas de particionamento estático: coarse-grained e fine-grained (round-robin) 
- Uso da classe `std::jthread` do C++20 para gerenciamento automático de threads

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./02_dynamic_partitioning/README.md) **Aula 02 - Particionamento dinâmico**
- Atribuição dinâmica de tarefas aos threads conforme ficam disponíveis
- Uso da classe `std::atomic` para gerenciar índice compartilhado
- Balanceamento de carga para tarefas com tempos de execução variáveis

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./03_false_sharing/README.md) **Aula 03 - Falso compartilhamento**
- Compreensão da hierarquia de cache (L1, L2, L3) em processadores multi-core
- Identificação de problemas de compartilhamento direto e falso compartilhamento
- Impacto de invalidações de cache no desempenho paralelo

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./04_double_buffering/README.md) **Aula 04 - Buffer duplo**
- Introdução aos semáforos para sincronização entre threads
- Uso da classe `std::binary_semaphore` do C++20
- Otimização com buffer duplo para processamento simultâneo de dados

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./05_spinlocks/README.md) **Aula 05 - Spinlocks**
- Diferenciação entre mutexes e spinlocks para proteção de recursos compartilhados
- Análise de trade-offs: overhead do sistema operacional vs. uso de CPU
- Aplicabilidade de cada mecanismo conforme tempo de espera

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./16_openmp/README.md) **Aula 16 - OpenMP**
- Introdução à API OpenMP para programação paralela em memória compartilhada
- Uso de diretivas de compilação com `#pragma omp`
- Construtor `parallel` e work-sharing com loops

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./17_openmp_sync/README.md) **Aula 17 - Sincronização em OpenMP**
- Diretiva `critical` para definição de seções críticas
- Diretiva `atomic` para operações atômicas em variáveis compartilhadas
- Comparação de desempenho e análise de código assembly

[![CXX](https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white)](./18_openmp_reduction/README.md) **Aula 18 - Redução em OpenMP**
- Uso da cláusula `reduction` para agregação eficiente de valores
- Cálculo paralelo de operações como soma, produto, máximo e mínimo
- Colaboração entre threads para computar valores agregados
