# Aula 16 - OpenMP
## Visão Geral

O OpenMP é uma API que suporta programação paralela em sistemas de **memória compartilhada** em linguagens como C, C++ e Fortran. Ele permite que os desenvolvedores escrevam código paralelo de maneira mais simples, utilizando diretivas de compilação para indicar quais partes do código devem ser executadas em paralelo.

## Utilização

Diretivas de compilação são comentários especiais no código-fonte. No C/C++, uma diretiva de compilação é definida utilizando a sintaxe 

```c++
#pragma nome_da_diretiva [cláusulas]
```

As classes do OpenMP são utilizadas a partir da diretiva 

```c++
#pragma omp 
```

Para utilizá-la, é necessário incluir o cabeçalho `<omp.h>` no código-fonte.

```c++
#include <omp.h>
```

E, no momento da compilação, é necessário adicionar a flag `-fopenmp` ao compilador.

```bash
g++ -fopenmp programa.cpp -o programa
```

## O construtor `parallel`

O construtor `parallel` é utilizado para definir uma região de código que será executada em paralelo por múltiplas threads. A sintaxe básica é a seguinte:

```c++
#pragma omp parallel [cláusulas]
{
    // Código a ser executado em paralelo
} // Barreira implicita: apenas a thread mestre continua daqui
```

Dentro do bloco `parallel`, cada thread executa o código de forma independente. O OpenMP gerencia a criação e sincronização das threads automaticamente.

Existe uma barreira implícita no final do bloco `parallel`, o que significa que todas as threads devem completar a execução do bloco antes que o programa possa continuar além dele.

O construtor `parallel` pode ser combinado com outras diretivas, como `for`, para indicar que um loop deve ser dividido entre as threads, isto é, haverá work-sharing.

```c++
int i;
int N = 100;

#pragma omp parallel for private(i) shared(N) 
for (i = 0; i < N; ++i) {
    // Código a ser executado em paralelo para cada iteração do loop
}
```

Neste exemplo, a cláusula `private(i)` indica que cada thread terá sua própria cópia da variável `i`, enquanto a cláusula `shared(N)` indica que a variável `N` será compartilhada entre todas as threads.

## Exemplos 

Neste diretório, teremos exemplos de implementações em C++ que basicamente possuem o mesmo objetivo: popular um vetor com valores inteiros

- `0_baseline.cpp`: Implementação sequencial para popular um vetor com valores inteiros.
- `1_openmp.cpp` : Implementação utilizando a cláusula `parallel for` do OpenMP para paralelizar uma estrutura de repetição 
- `2_openmp_cpp11.cpp` : Implementação utilizando a classe `omp::sequence` do OpenMP em conjunto com recursos do C++11 para paralelizar a operação de preenchimento do vetor.
- `3_tbb.cpp` : Implementação utilizando a biblioteca Intel TBB (Threading Building Blocks) para paralelizar o preenchimento do vetor.

## Benchmark

Os tempos de execução de todos os exemplos foram testados utilizando a biblioteca Google Benchmark. A seguir estão instruções retiradas do [google/benchmark](https://github.com/google/benchmark) de como instalar essa biblioteca.

```bash
# Check out the library.
$ git clone https://github.com/google/benchmark.git

# Go to the library root directory
$ cd benchmark

# Make a build directory to place the build output.
$ cmake -E make_directory "build"

# Generate build system files with cmake, and download any dependencies.
$ cmake -E chdir "build" cmake -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on -DCMAKE_BUILD_TYPE=Release ../

# or, starting with CMake 3.13, use a simpler form:
# cmake -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on -DCMAKE_BUILD_TYPE=Release -S . -B "build"
# Build the library.
$ cmake --build "build" --config Release

# Check the build
cmake -E chdir "build" ctest --build-config Release

# Install the library globally
sudo cmake --build "build" --config Release --target install
```