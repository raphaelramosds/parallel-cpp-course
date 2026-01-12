# Aula 00 - Distribuição de trabalho

## Visão geral

Este diretório contém exemplos relacionados à distribuição de trabalho em programação paralela usando a biblioteca Intel TBB (Threading Building Blocks).

Em todas as implementações desse diretório, a tarefa executada por cada thread é basicamente esperar `work_items[i]` microsegundos, em que `work_items` guarda tempos de espera gerados por uma distribuição uniforme que gera números entre `t0` e `t1` microsegundos através da função `bin(t0,t1)`. Isso simula uma carga de trabalho variável para cada item.

De forma resumida, a *thread* responsável por processar items gerados por uma distribuição `bin(25,30)` pode demorar entre 25 e 30 microsegundos para processar cada item.

## Teoria

A distribuição de trabalho refere-se à maneira como as tarefas são divididas entre múltiplas threads para otimizar o desempenho do processamento paralelo.

Quanto ao balanceamento, essa distribuição pode ser

- **Balanceada:** a carga de trabalho é aproximadamente igual.

- **Desbalanceada:** a carga de trabalho pode variar entre threads.

Por exemplo, em `0_even_job_length`, cada thread processa itens de trabalho que levam aproximadamente o mesmo tempo para serem concluídos: `bin(20, 30)`, representando uma carga balanceada. Entretanto, em `1_uneven_job_length`, observe que as distribuições criam cargas de trabalho com variações significativas: `bin(1, 25)`, `bin(26, 50)`, `bin(51, 75)` e `bin(76,100)`, o que representa uma carga desbalanceada.

Quanto ao método de distribuição, pode ser

- **Estática:** a divisão do trabalho é feita antes da execução, como em `0_static.cpp`

- **Dinâmica:** o trabalho é atribuído às threads em tempo de execução, conforme elas ficam disponíveis, como em `1_dynamic.cpp`.



## Tempos de execução

Compare os tempos de execução de CPU dos diferentes exemplos para observar como a distribuição de trabalho afeta o desempenho do processamento paralelo.

```bash
# Comparação entre estático e dinâmico com carga de trabalho uniforme
time ./0_even_job_length/0_static.out
time ./0_even_job_length/1_dynamic.out

# Comparação entre estático e dinâmico com carga de trabalho desigual
time ./1_uneven_job_length/0_static.out
time ./1_uneven_job_length/1_dynamic.out
```

Abaixo os resultados obtidos em um sistema com 16 núcleos

| Programa | Tempo de CPU (`user`) | Tempo de Sistema (`system`) | Tempo Total (`total`) |
| :---------------- | :------------ | :-------------------- | :------------------------ |
| 0_even_job_length/0_static.cpp | 0.41s | 1.24s | 1.369s |
| 0_even_job_length/1_dynamic.cpp | 0.34s | 1.28s | 1.369s |
| 1_uneven_job_length/0_static.cpp | 0.47s | 0.91s | 2.314s |
| 1_uneven_job_length/1_dynamic.cpp | 0.38s | 1.22s | 1.751s |

A seguir algumas considerações sobre os resultados acima

- No cenário de carga de trabalho uniforme (`0_even_job_length`), tanto o particionamento estático quanto o dinâmico apresentam tempos totais semelhantes, visto que a carga é bem distribuída entre as threads
- No cenário de carga de trabalho desigual (`1_uneven_job_length`), o particionamento dinâmico é significativamente mais eficiente, reduzindo o tempo total de execução em comparação ao particionamento estático.