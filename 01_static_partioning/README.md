# Particionamento estático

## Visão geral

O particionamento estático requer que cada thread saiba antecipadamente quais tarefas ela irá processar. Isso é geralmente feito dividindo-as em partes iguais e atribuindo cada parte a um thread específico.

Quando as tarefas são uniformemente distribuídas e o tempo de processamento é previsível, o particionamento estático pode ser eficiente, pois minimiza a sobrecarga de gerenciamento de threads. No entanto, se as tarefas variarem significativamente em termos de tempo de execução, o particionamento estático pode levar a um desequilíbrio na carga de trabalho entre os threads, resultando em subutilização dos recursos disponíveis.

Aqui citamos duas formas comuns de particionamento estático: coarse-grained e fine-grained.

- **Coarse-grained:** os dados são divididos em blocos sequenciais, no sentido que cada thread recebe um bloco contíguo de dados para processar.

- **Fine-grained:** os dados são divididos em partes menores, e cada thread recebe várias partes não contíguas para processar. Esse tipo de divisão também é conhecido como round-robin.

Para exemplificar, considere o processamento de um array de 16 elementos com 4 threads.

| Thread | Coarse-Grained          | Fine-Grained          |
| :----- | :---------------------- | :-------------------- |
| 0      | `0, 1, 2, 3`            | `0, 4, 8, 12`         |
| 1      | `4, 5, 6, 7`            | `1, 5, 9, 13`         |
| 2      | `8, 9, 10, 11`          | `2, 6, 10, 14`        |
| 3      | `12, 13, 14, 15`        | `3, 7, 11, 15`        |


Existe uma consideração quando se trata de cache: o particionamento coarse-grained tende a ser mais amigável ao cache, pois os dados acessados por cada thread são contíguos na memória. Por outro lado, o particionamento fine-grained pode levar a mais falhas de cache devido ao acesso não contíguo aos dados.

No entanto, o particionamento fine-grained pode ser mais eficaz em cenários onde a carga de trabalho é altamente variável, pois distribui as tarefas de maneira mais uniforme entre os threads.