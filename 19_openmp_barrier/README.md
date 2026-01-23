# Aula 19 - Diretiva `single` do OpenMP

## Visão geral

Thread safety é a propriedade de um código ou estrutura de dados que garante que ele funcione corretamente mesmo quando acessado por múltiplas threads simultaneamente.

## Analisando um código não thread-safe

Existem alguns blocos de código que não são thread-safe. Por exemplo, o algoritmo de redução de Gauss é executado com as seguintes etapas

```Pascal
Ler Matriz A(n, n)

Para cada linha i de 1 até n faça
    // Definir o pivô
    pivot := A[i, i]

    // Dividir os elementos da linha i pelo pivot
    Para cada coluna j de 1 até n faça
        A[i, j] := A[i, j] / pivot

    // Eliminar os elementos abaixo do pivô
    Para cada linha k de i+1 até n faça
        fator := A[k, i]
        Para cada coluna j de 1 até n faça
            A[k, j] := A[k, j] - fator * A[i, j]
        FimPara
    FimPara 
FimPara
```

Observe que a operação de eliminar o elemento abaixo do pivô vai afetar os demais elementos da linha, por isso percorremos todas as colunas da linha no loop de j até n.

Suponha que queremos dividir o trabalho entre múltiplas threads, de modo que cada linha seja processada por um thread diferente, ou seja, criamos uma região paralela no laço mais externo.

Essa decisão cria uma condição de corrida porque, por exemplo, enquanto uma thread está atualizando a i-ésima linha (dividindo-a pelo pivô), outra thread, responsável pela k-ésima linha pode tentar usar a i-ésima linha para a eliminação. Se a segunda thread ler os valores da i-ésima linha antes de serem completamente atualizados, ela usará dados inconsistentes (uma mistura de valores antigos e novos), levando a um resultado final incorreto.

Então, note que a definição do pivô e a divisão da linha pelo pivô devem ser concluídas antes que qualquer thread comece a eliminar os elementos abaixo do pivô.

## O conceito de barreira

Uma barreira é um ponto de sincronização onde todas as threads devem chegar antes que qualquer uma delas possa continuar a execução. Quando uma thread atinge uma barreira, ela espera até que todas as outras threads também cheguem a esse ponto. Somente quando todas as threads estiverem na barreira, elas poderão prosseguir.

No exemplo do algoritmo de Gauss, podemos usar uma barreira para garantir que todas as threads tenham concluído a definição do pivô e a divisão da linha pelo pivô antes de qualquer thread começar a eliminar os elementos abaixo do pivô.

## A diretiva `single` do OpenMP

A diretiva `single` do OpenMP é usada para especificar que um bloco de código deve ser executado por apenas uma thread dentro de uma região paralela. As outras threads esperam até que a thread que está executando o bloco `single` termine antes de continuar.

```c
#pragma omp parallel
{
	#pragma omp single 
	{
		// Essa região é executada pela primeira thread que a encontra
	} // Barreira implícita
}
```

Observe que há uma barreira implícita no final do bloco `single`, ou seja, todas as threads esperam até que a thread que executou o bloco `single` termine antes de continuar.

## Comparando implementações

A versão sequencial do algoritmo de Gauss é implementada no arquivo `0_baseline.cpp`. Suas versões paralelas estão implementadas nos arquivos `1_parallel_for.cpp` e `2_single.cpp`.

No programa `1_parallel_for.cpp`, a região paralela é criada apenas no loop em que ocorre a eliminação dos elementos abaixo do pivô, ou seja, as threads trabalham numa mesma coluna da matriz. Neste caso, não há distribuição de linhas entre as threads, portanto não há condição de corrida.

Mas, no programa `2_single.cpp`, a região paralela envolve o loop mais externo, que distribui as linhas entre as threads. Nesse caso, a diretiva `single` é usada para garantir que apenas uma thread defina o pivô e divida a linha pelo pivô, evitando assim a condição de corrida. Além disso, note que a diretiva single também inclui a linha atual que está sendo eliminada.