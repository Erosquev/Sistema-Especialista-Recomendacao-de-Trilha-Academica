# Sistema-Especialista-Recomendacao-de-Trilha-Academica
Sistema especialista em Prolog que ajuda estudantes de tecnologia a escolher trilhas de especialização, sugerindo áreas acadêmicas e justificando a recomendação com base em respostas do usuário.

Instituição: Pontifícia Universidade Católica do Paraná
Disciplina: Programação Lógica e Funcional
Aluno: Eros Felipe de Quevedo dos Santos - Erosquev

Estrutura do Projeto
main.pl – Código principal do sistema especialista.
perfil_teste_1.pl, perfil_teste_2.pl, perfil_teste_3.pl – Arquivos de teste contendo respostas pré-definidas de diferentes perfis de usuário.
README.md – Este documento.

Como Executar
O sistema pode ser executado tanto na plataforma SWISH (SWI-Prolog for SHaring), quanto no terminal do computador se possui-lo baixado. Há duas maneiras de rodá-lo: a interativa e a automática de teste (com um arquivo já com as respostas que apenas será lido pelo main.pl).

As intruções para cada um dos métodos se encontra abaixo:


Execução Interativa

- Executando no terminal:
Abra o terminal no diretório onde está seu projeto..

Inicie o SWI-Prolog:
swipl

Carregue o programa principal
?- consult('main.pl').

Rode:
?- iniciar.

Responda as questões com sim ou não

Ao final, será exibido o ranking completo de trilhas, com seus pontos e justificativas




Executando no SWISH Prolog online:

Abra o SWISH em https://swish.swi-prolog.org
Copie e cole todo o código principal (main.pl) no editor.
No console de consultas do SWISH, digite: 
?- iniciar.
Clique em “Run”
Responda as perguntas com sim ou nao
Ao final, será exibido o ranking completo de trilhas, com seus pontos e justificativas


2. Execução Automática com Perfis de Teste

Executando no terminal:

Abra o terminal no diretório onde está seu projeto..

Inicie o SWI-Prolog:
swipl

Carregue o programa principal
?- consult('main.pl').

Execute um dos testes automáticos:

?- executar_teste(‘perfil_teste_1.pl').

Ao final, será exibido o ranking completo de trilhas, com seus pontos e justificativas


Executando no SWISH Prolog online:

Abra o SWISH em https://swish.swi-prolog.org
Copie e cole todo o código principal (main.pl) no editor. 
Copie e cole o conteúdo do perfil de teste automático no final do código
No console de consultas do SWISH, rode: 
?- mostrar_ranking.
Ao final, será exibido o ranking completo de trilhas, com seus pontos e justificativas







Observações
O sistema não possui interface gráfica. Toda a interação ocorre via terminal ou área de consulta do Prolog.
As respostas devem ser exatamente sim ou nao.
O ranking é sempre exibido do mais compatível para o menos compatível.




