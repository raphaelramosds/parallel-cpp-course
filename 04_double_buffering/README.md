# Aula 04 - Buffer Duplo

## O que são semáforos?

No contexto de programação concorrente, semáforos são mecanismos de sincronização usados para controlar o acesso a recursos compartilhados por múltiplas threads.

Simplificando, um semáforo é um contador que mantém o controle de quantas threads podem acessar um recurso ao mesmo tempo.

Funciona assim:

1. Inicialização do contador
- Um semáforo é inicializado com um valor que representa o número máximo de threads que podem acessar o recurso simultaneamente.
- Diz-se que o semáforo é binário quando apenas permite dois estados: 0 (ocupado) e 1 (livre).

2. Aquisição (Wait/P)
- Quando uma thread deseja acessar o recurso, ela tenta "adquirir" o semáforo.
- Se o valor do semáforo for maior que zero, a thread decrementa o contador e continua a execução.
- Se o valor for zero, a thread é bloqueada até que o semáforo seja liberado por outra thread.

3. Liberação (Signal/V)
- Quando a thread termina de usar o recurso, ela "libera" o semáforo, incrementando o contador.
- Se houver threads bloqueadas esperando pelo semáforo, uma delas é desbloqueada para continuar a execução.

## A classe `std::binary_semaphore`

É a implementação padrão de semáforo binário na biblioteca C++20.

- A aquisição do semáforo é feita com o método `acquire()`, que **decrementa** o contador e pode bloquear a thread se o semáforo estiver indisponível (ou seja, se o contador for zero).
- A liberação do semáforo é feita com o método `release()`, que **incrementa** o contador e pode desbloquear uma thread que esteja esperando para adquirir o semáforo.

## A otimização de buffer duplo com semáforos

Na otimização de buffer duplo, semáforos são usados para coordenar o acesso entre duas threads: uma que gera dados e outra que processa esses dados.

Para exemplificar, considere o cenário em que um buffer precisa ser preenchido com dados e depois esses mesmos dados precisam ser processados. 

O programa `0_baseline.cpp` implementa essa lógica de forma sequencial em um for loop: em cada iteração, todos os dados do buffer são gerados pela função `generate_data` e depois processados pela função `process_data`.

Por outro lado, o programa `1_double_buffer.cpp` utiliza uma thread para preencher o buffer com dados, e outra thread para processá-los. Note que ambas escrevem e leem em seus buffers.

O problema da versão sequencial é que a geração e o processamento dos dados são feitos de forma consecutiva, ou seja, o processador fica ocioso enquanto o gerador está preenchendo o buffer, e vice-versa.

Com o uso de semáforos, a versão com buffer duplo permite que ambas as threads trabalhem simultaneamente: enquanto uma thread está gerando dados em um buffer, a outra thread pode processar os dados do buffer que já foi preenchido.

## Tempos de execução

Compare os tempos de execução entre os programas `0_baseline.cpp` e `1_double_buffer.cpp` para observar o impacto positivo do buffer duplo no desempenho.

```bash


```