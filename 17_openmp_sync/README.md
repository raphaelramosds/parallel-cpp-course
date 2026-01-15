# Aula 17 - Sincronização em OpenMP

## Visão Geral

Existem diversas diretivas de sincronização em OpenMP que permitem controlar o fluxo de execução das threads e garantir a consistência dos dados compartilhados. Neste diretório serão abordadas as diretivas: `critical` e `atomic`.

## Diretiva `critical`

A diretiva `critical` é utilizada para definir uma seção crítica, ou seja, um bloco de código que deve ser executado por apenas uma thread por vez. Isso é útil quando múltiplas threads precisam acessar ou modificar uma variável compartilhada, garantindo que apenas uma thread possa fazê-lo de cada vez.

A sintaxe básica é a seguinte:

```c++
#pragma omp critical [nome_da_seção]
{
    // Código da seção crítica
}
```

Se o nome da seção crítica for omitido, todas as seções críticas sem nome serão tratadas como a mesma seção, ou seja, apenas uma thread poderá executar qualquer uma dessas seções críticas por vez. Se um nome for fornecido, diferentes seções críticas com nomes diferentes podem ser executadas simultaneamente por diferentes threads.

A desvantagem do uso da diretiva `critical` é que ela pode causar contenção entre as threads, levando a um desempenho reduzido se muitas threads tentarem acessar a seção crítica ao mesmo tempo.

## Diretiva `atomic`

A diretiva `atomic` é utilizada para garantir que uma operação específica em uma variável compartilhada seja realizada de forma atômica, ou seja, sem interrupção por outras threads. Isso é útil para operações simples, como incrementos ou atribuições, onde o uso de uma seção crítica completa seria excessivo.

A sintaxe básica é a seguinte:

```c++
#pragma omp atomic
variável operação= expressão;
```

## Tempos de execução

Compare os tempos de execução dos dois programas fornecidos neste diretório: `1_critical.cpp` e `2_atomic.cpp`.

```bash
```

Vamos gerar o código assembly dos dois programas compilados

```bash
objdump -d 0_critical.out > critical.asm
objdump -d 1_atomic.out > atomic.asm
```

Observe que o código gerado para a seção crítica é basicamente a chamada de um mutex: `GOMP_critical_end` libera o lock, e `GOMP_critical_start` adquire o lock.

```asm
00000000000010e0 <main>:
    ...
    1268:	e8 63 fe ff ff       	call   10d0 <GOMP_critical_start@plt>
    126d:	83 45 00 01          	addl   $0x1,0x0(%rbp)
    1271:	e8 2a fe ff ff       	call   10a0 <GOMP_critical_end@plt>
```
 
Enquanto o código gerado para a operação atômica utiliza uma instrução específica do seu processador para garantir a atomicidade da operação. No caso da arquitetura do meu processaodr, a instrução utilizada é a `lock addl`, que realiza um incremento atômico na variável.

```asm
0000000000001220 <main._omp_fn.0>:
    ...
    1233:	f0 83 02 01          	lock addl $0x1,(%rdx)
```