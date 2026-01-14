# Aula 05 - Spinlocks

## Visão geral

Proteger recursos compartilhados é importante em programação concorrente para evitar condições de corrida e garantir a integridade dos dados. Existem duas formas de implementar essa proteção de recursos: exclusão mútua (mutexes) e spinlocks.

## O que é um Mutex?

O termo vem de Mutual Exclusion (Exclusão Mútua). Quando uma thread tenta adquirir um Mutex que já está ocupado, o sistema operacional coloca essa thread em estado de dormência (sleep).

A desvantagem de usar mutexes é que o processo de colocar uma thread em dormência e acordá-la novamente envolve uma sobrecarga significativa do sistema operacional, o que pode ser ineficiente se a espera for curta.

Por isso, mutexes são mais adequados para situações onde a espera pode ser longa.

## O que é um Spinlock?

Como o nome sugere, a thread fica "girando" (spinning) em um loop contínuo, verificando repetidamente se o bloqueio ficou disponível.

Como consequência, a thread permanece ativa e ocupa 100% de um núcleo de processamento enquanto espera.

