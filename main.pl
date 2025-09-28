
%defino respostas como dinâmico
:- dynamic resposta/3.


% determinando as características gerais que serão perguntadas:
caracteristicas_gerais([
    gosta_programacao,
    gosta_matematica_logica,
    interesse_dados_pesquisa,
    curiosidade_automacao_devops,
    interesse_design_visual,
    atencao_detalhes,
    interesse_seguranca, 
	pensamento_critico, 
    interesse_infraestrutura, 
	afinidade_redes, 
	interesse_hardware, 
	interesse_mobile
]).

% Estipulando as perguntas para cada característica:
pergunta(1, 'Você gosta de programação?', gosta_programacao).
pergunta(2, 'Você gosta de matemática lógica?', gosta_matematica_logica).
pergunta(3, 'Você tem interesse em dados de pesquisas?', interesse_dados_pesquisa).
pergunta(4, 'Você tem curiosidade em automação e devOps?', curiosidade_automacao_devops).
pergunta(5, 'Você tem interesse em design visual?', interesse_design_visual).
pergunta(6, 'Você possui atenção a detalhes?', atencao_detalhes).
pergunta(7, 'Você tem interesse em segurança?', interesse_seguranca).
pergunta(8, 'Você possui pensamento crítico?', pensamento_critico).
pergunta(9, 'Você tem interesse em hardware?', interesse_hardware).
pergunta(10, 'Você tem interesse em infrestrutura?', interesse_infraestrutura).
pergunta(11, 'Você tem afinidade com redes?', afinidade_redes).
pergunta(12, 'Você tem interesse em mobile?', interesse_mobile).

lista_perguntas(L) :- findall(ID_PERGUNTA, pergunta(ID_PERGUNTA, _, _), L).



% função para perguntar sobre uma característica
perguntar(ID_Pergunta) :-
    pergunta(ID_Pergunta, Texto, Caracteristica),
    repeat,  % repete a pergunta até que usuário dê uma resposta válida
        write(Texto), write(' (sim/nao): '),
        read(Resposta),
        ( (Resposta = sim ; Resposta = nao) ->  
            assert(resposta(usuario, Caracteristica, Resposta)),
            !
        ; 
            write('Resposta inválida. Digite apenas "sim" ou "nao".'), nl,
            fail  
        ).


% aplicando a função que pergunta todas as perguntas para as características gerais:
perguntar_todas([]). 
perguntar_todas([H|T]) :-
    perguntar(H),       
    perguntar_todas(T).


% Definindo as trilhas e suas descrições
trilha(inteligencia_artificial_ml, 'Foco em algoritmos inteligentes, machine learning e automação.').
trilha(seguranca_informacao, 'Proteção de sistemas, redes e dados contra ataques.').
trilha(redes_infraestrutura, 'Gestão de redes de computadores e infraestrutura.').
trilha(graficos_jogos, 'Desenvolvimento de gráficos, animações e funcionalidades para jogos digitais.').
trilha(embarcados_iot, 'Projetos e programação de sistemas embarcados e dispositivos conectados por IoT.').



% Trilha para inteligência artificial / machine learning
caracteristica(inteligencia_artificial_ml, gosta_programacao, 5).
caracteristica(inteligencia_artificial_ml, gosta_matematica_logica, 5).
caracteristica(inteligencia_artificial_ml, interesse_dados_pesquisa, 4).
caracteristica(inteligencia_artificial_ml, curiosidade_automacao_devops, 2).
caracteristica(inteligencia_artificial_ml, interesse_design_visual, 1).
caracteristica(inteligencia_artificial_ml, atencao_detalhes, 2).
caracteristica(inteligencia_artificial_ml, interesse_mobile, 1).

% Trilha para segurança da informação / CyberSegurança
caracteristica(seguranca_informacao, gosta_programacao, 3).
caracteristica(seguranca_informacao, atencao_detalhes, 5).
caracteristica(seguranca_informacao, interesse_seguranca, 5).
caracteristica(seguranca_informacao, pensamento_critico, 4).
caracteristica(seguranca_informacao, interesse_infraestrutura, 3).
caracteristica(seguranca_informacao, curiosidade_automacao_devops, 2).
caracteristica(seguranca_informacao, afinidade_redes, 2).

% Trilha para redes e infraestrutura
caracteristica(redes_infraestrutura, curiosidade_automacao_devops, 4).
caracteristica(redes_infraestrutura, interesse_infraestrutura, 5).
caracteristica(redes_infraestrutura, afinidade_redes, 5).
caracteristica(redes_infraestrutura, atencao_detalhes, 3).
caracteristica(redes_infraestrutura, interesse_hardware, 3).
caracteristica(redes_infraestrutura, pensamento_critico, 2).
caracteristica(redes_infraestrutura, interesse_seguranca, 2).

% Trilha para computação gráfica e jogos digitais
caracteristica(graficos_jogos, gosta_programacao, 4).
caracteristica(graficos_jogos, interesse_design_visual, 5).
caracteristica(graficos_jogos, atencao_detalhes, 3).
caracteristica(graficos_jogos, gosta_matematica_logica, 4).
caracteristica(graficos_jogos, interesse_mobile, 3).
caracteristica(graficos_jogos, interesse_dados_pesquisa, 1).
caracteristica(graficos_jogos, curiosidade_automacao_devops, 2).

% Trilha para sistemas embarcados e IoT
caracteristica(embarcados_iot, gosta_programacao, 4).
caracteristica(embarcados_iot, interesse_hardware, 5).
caracteristica(embarcados_iot, interesse_infraestrutura, 3).
caracteristica(embarcados_iot, atencao_detalhes, 3).
caracteristica(embarcados_iot, curiosidade_automacao_devops, 4).
caracteristica(embarcados_iot, afinidade_redes, 2).
caracteristica(embarcados_iot, pensamento_critico, 1).



% Calculando a pontuação de uma trilha pelas respostas do usuário
pontuacao_trilha(Trilha, Pontuacao, Explicacao) :-
    findall(Peso-Carac,
        (
            caracteristica(Trilha, Carac, Peso),
            resposta(usuario, Carac, sim)  % só pega se usuário responde 'sim'
        ),
        ListaPesos),
    pegar_pesos(ListaPesos, Pesos),
    sum_list(Pesos, Pontuacao),
    pegar_caracteristicas(ListaPesos, Explicacao).


% Pega só os pesos da lista
pegar_pesos([], []).
pegar_pesos([Peso-_|T], [Peso|R]) :-
    pegar_pesos(T, R).


% Pega só as características da lista
pegar_caracteristicas([], []).
pegar_caracteristicas([_-Carac|T], [Carac|R]) :-
    pegar_caracteristicas(T, R).



% calculando o ranking de todas as trilhas
ranking_trilhas(Ranking) :-
    setof(Trilha, C^P^caracteristica(Trilha, C, P), Trilhas),  % pega todas as trilhas
    findall(Pontos-Trilha-Explicacao,
        ( member(Trilha, Trilhas),
          pontuacao_trilha(Trilha, Pontos, Explicacao)
        ),
        Lista),
    sort(0, @>=, Lista, Ranking).  % ordena decrescente por meio dos pontos

% mostrando o ranking completo
mostrar_ranking :-
    ranking_trilhas(Ranking),
    nl, write('Ranking de trilhas de aprendizado:'), nl, nl,
    mostrar_lista_ranking(Ranking, 1).

mostrar_lista_ranking([], _).
mostrar_lista_ranking([Pontos-Trilha-Exp|Resto], N) :-
    trilha(Trilha, Descricao),
    format("~d) ~w (~w pontos)~n   ~w~n   Afinidades: ~w~n~n", [N, Trilha, Pontos, Descricao, Exp]),
    N2 is N + 1,
    mostrar_lista_ranking(Resto, N2).


% mostra a lista de caracteristicas explicativas
mostrar_explicacao([]).
mostrar_explicacao([H|T]) :-
    write('- '), write(H), nl,
    mostrar_explicacao(T).


% ponto de entrada pro programa
iniciar :-
    lista_perguntas(L),
    perguntar_todas(L),
    mostrar_ranking.


% executa teste automático a partir de arquivo de respostas já preenchido
executar_teste(Arquivo) :-
    retractall(resposta(_,_,_)),        
    consult(Arquivo),                   
    mostrar_ranking.                    

