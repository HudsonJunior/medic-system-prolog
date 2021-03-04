:- include('base.pl').

% funcao inicial a ser chamada
iniciar :-
write('Bem vindo ao sistema de gerenciamento medico :)'), nl,
write('Para as opçoes dos menus, a informação de doenças e sintomas, digite a entrada com um ponto no final, já para as informações do paciente, pode digitar normalmente sem essas considerações'),nl,
write('Para cada um desses casos ha um aviso antes!'), menu.


% menu do usario
menu :- write('\n-- Sistema médico -- \n\n'),
        write('0. Sair'), nl,
        write('1. Cadastrar paciente'), nl,
        write('2. Alterar dados paciente'), nl,
        write('3. Vizualizar dados paciente'), nl,
        write('4. Remover paciente'), nl,
        write('5. Listar pacientes'), nl,
        write('6. Informar sintomas'), nl,
        read(Opcao),
        selectOpcao(Opcao).

% Manager do menu
selectOpcao(Opcao) :- Opcao =@= 0, true;
                     Opcao =@= 1, cadastrarPaciente, menu;
                     Opcao =@= 2, alterarPaciente, menu;
                     Opcao =@= 3, consultarPaciente, menu;
                     Opcao =@= 4, removerPaciente, menu;
                     Opcao =@= 5, listarPacientes, menu;
                     Opcao =@= 6, informarSintomas, menu.

% funcao para alterar dados do paciente
alterarPaciente :-
    write('Digite o Nome do paciente que deseja alterar (Sem ponto no final)'),
    ler_string_input(NomePaciente),
    get_paciente(NomePaciente, Paciente),
    Paciente \== '' ->
    get_all_pacientes(Pacientes), nl,
    write('Dentre as opções a seguir, digite qual informação você deseja alterar do paciente: '),
    quest_alterar_paciente(Pacientes, Paciente); menu.

% funcao padrao para ler entradas do usuario sem necessidade do '.'
ler_string_input(Var) :-
    get_char(_),
    read_string(user_input, "\n","\t ", _, Var).

% questionario para alteracao de dados do paciente
quest_alterar_paciente(Pacientes, Paciente) :-
    split_string(Paciente, ",", "", [Nome, Data, Cpf]), nl,
    write('0. Voltar'), nl,
    write('1. Nome'), nl,
    write('2. Data de nascimento'), nl,
    write('3. Cpf'), nl,
    read(Opcao),
    alterar_opcao(Opcao,Pacientes, Paciente, Nome, Data, Cpf).

% questionario alterar opcao 1
alterar_opcao(1,Pacientes, Paciente, _ ,Data, Cpf) :-
    write('Digite o novo nome do paciente: (Sem ponto no final)'),
    ler_string_input(NewNome),
    delete(Pacientes, Paciente, Result),
    escrever_arquivo(Result),
    inserir_paciente(NewNome, Data, Cpf),
    write('Paciente atualizado!').

% questionario alterar opcao 2
alterar_opcao(2, Pacientes, Paciente, Nome, _, Cpf) :-
    write('Digite a nova data de nascimento do paciente: (Sem ponto no final) '),
    ler_string_input(NewData),
    delete(Pacientes, Paciente, Result),
    escrever_arquivo(Result),
    inserir_paciente(Nome, NewData, Cpf),
    write('\nPaciente atualizado!\n').

%questionario alterar opcao 3
alterar_opcao(3, Pacientes, Paciente, Nome, Data, _) :-
    write('Digite o novo CPF do paciente: (Sem ponto no final)'),
    ler_string_input(NewCpf),
    delete(Pacientes, Paciente, Result),
    escrever_arquivo(Result),
    inserir_paciente(Nome, Data, NewCpf),
    write('Paciente atualizado!').

% funcao para inserir um paciente no arquivo pacientes.txt
inserir_paciente(Nome, Data, Cpf) :-
    working_directory(CWD, CWD),
    PacienteFile = '/pacientes.txt',
    atom_concat(CWD,PacienteFile, Arquivo),
    open(Arquivo, append, Out),
    write(Out, '\''),
    write(Out, Nome),
    write(Out, ','),
    write(Out, Data),
    write(Out, ','),
    write(Out, Cpf),
    write(Out, '\''),
    write(Out, '.'),
    write(Out, '\n'),
    close(Out).

% funcao para cadastrar um paciente no arquivo pacientes.txt
cadastrarPaciente :-
    write('Digite o nome do paciente: (Sem ponto no final)'),
    ler_string_input(NomePaciente),
    write('Digite a data de nascimento do paciente: (Sem ponto no final)'),
    ler_string_input(DataNasc),
    write('Digite o CPF do paciente: (Sem ponto no final)'),
    ler_string_input(CpfPaciente),
    inserir_paciente(NomePaciente, DataNasc, CpfPaciente),
    write('\nPaciente cadastrado com sucesso!'), nl.

% funcao para printar uma lista
printaList([]).

printaList([X|Y]):-
  X == end_of_file, !;
  format('\n ~w', X), nl,
  printaList(Y).

% funcoes para printar uma lista de pacientes
printaListPaciente([]).

printaListPaciente([X|Y]) :-
    split_string(X, ",", "", Z),
    printaPaciente(Z),
    printaListPaciente(Y).

printaPaciente(List) :-
    length(List, 1), !;
    nl, write('Paciente : '),
    nth0(0, List, Nome),
    write(Nome), nl,
    nth0(1, List, DataNasc),
    nth0(2, List, Cpf),
    write('Data de nascimento: '),
    write(DataNasc), nl,
    write('CPF: '),
    write(Cpf), nl.

% listagem de todos os pacientes salvos no arquivo
listarPacientes :-
    write('\nListando todos os pacientes...\n'),
    get_all_pacientes(Pacientes),
    printaListPaciente(Pacientes).

% funcao que realiza a consulta de um paciente
consultarPaciente :-
    get_nome_paciente(Nome),
    get_paciente(Nome, Paciente).

% funcao que realiza a remoçao de um paciente
removerPaciente :-
    write('Digite o nome do paciente que deseja remover: (Sem ponto no final)'),
    ler_string_input(NomePaciente),
    get_paciente(NomePaciente, Paciente),
    Paciente \== '' ->
    get_all_pacientes(Pacientes),
    delete(Pacientes, Paciente, Result),
    write('\nPaciente removido com sucesso!\n'),
    escrever_arquivo(Result); menu.

% funcao auxiliar para escrever uma lista no arquivo
escrever_arquivo(Lista) :-
    working_directory(CWD, CWD),
    PacienteFile = '/pacientes.txt',
    atom_concat(CWD, PacienteFile, Arquivo),
    open(Arquivo, write, Pfile),
    write_file(Lista, Pfile),
    close(Pfile).

% funcao auxiliar para escrever uma lista no arquivo
write_file([P | Pacientes], Out) :-
    length(Pacientes, 0), !;
    split_string(P, ",", "", [Nome, Data, Cpf]),
    write(Out,'\''),
    write(Out,Nome),
    write(Out,','),
    write(Out,Data),
    write(Out,','),
    write(Out,Cpf),
    write(Out,'\''),
    write(Out,'.'),
    write(Out,'\n'),
    write_file(Pacientes, Out).

write_file([], _).

% recuperar as possiveis doenças do paciente dado seus sintomas
getDoencas(Sintomas) :-
    findall(A, doencaSintomasProb(A, Sintomas), Z),
    remove_duplicates(Z, Lista),
    length(Lista, Tamanho),
    (   (Tamanho = 1,
    write('\nFoi encontrado apenas uma doença relacionada com os sintomas informados, a doença pode ser vista a seguir:\n'),
    printaUmaDoenca(Lista),
    write('\nO resultado do prótipo é apenas informativo e que o paciente deve consultar um médico para obter um diagnóstico correto e preciso\n')
    );
    (write('\nAs seguintes doenças e suas probabilidades de ocorrência foram encontradas dado os sintomas informados:\n'), printaList(Lista),
     write('\nO resultado do prótipo é apenas informativo e o paciente deve consultar um médico para obter um diagnóstico correto e preciso\n'))),
    verificarSintomas(Sintomas).

% verificar sintomas adicionais dada uma doença
verificarSintomas(SintomasPaci) :-
    write('\nDeseja verificar todos os sintomas de alguma doença? Se sim, digite o nome da doença entre aspas e com um ponto no final, digite 0 caso contrario\n'),
    read(Escolha),
    dif(Escolha, 0) ->
    (   doenca(Escolha, Sintomas)->
    write('\nTodos os sintomas da doença '),
    write(Escolha),
    write(' podem ser encontrados a seguir:\n'),
    printaListSintomas(Sintomas, SintomasPaci),
    verificarSintomas(SintomasPaci);
    write('\nNão foi encontrado nenhuma doença com esse nome, por favor, tente novamente!\n'),
    verificarSintomas(SintomasPaci)); !.

% mostrar pro usuario a lista de sintomas que informou/nao informou
printaListSintomas(SintomasDoenca, SintomasPaci) :-
    subtract(SintomasDoenca, SintomasPaci, Result),
    write('Sintomas que você não informou:\n'),
    printaList(Result),
    write('\nSintomas que você informou:\n'),
    intersection(SintomasDoenca, SintomasPaci, ResultInformado),
    printaList(ResultInformado).

% funcao que recupera os sintomas do usuario e mostra as doencas
informarSintomas :-
    write('Informe os sintomas que está sentindo:'), nl,
    write('Por exemplo alguns sintomas sao: nausea,febre, hemorragia, calafrios, diarreia, vomito, dor generalizada, tosse prolongada, fadiga, garganta inflamada, suor excessivo, hemorragia, dor nas constas, coriza, dor de cabeca, garganta inflamada, olhos amarelados, dor no peito, pouco apetito, formigamento, ulcera... etc .'),
    write("\n\nDigite os seus sintomas, adicionando um por um com um ponto no final, entre aspas e apertando a tecla enter. Ao fim informar \"parar.\" para finalizar:\n"),
    add_read_list(ResultList, []),
    getDoencas(ResultList).

% funcao para printar apenas uma doenca quando so tiver uma
printaUmaDoenca([X | Y]) :-
    split_string(X, " ", "", Result),
    nth0(0, Result, Doenca),
    format('\n ~w\n', Doenca), !.

% funcao auxiliar que le uma lista de entradas do usuario e salva em uma
% lista
add_read_list(Resultlist, Entrylist) :-
  read(Input),
  (  Input = parar
  -> reverse(Resultlist, Entrylist)
  ;  add_read_list(Resultlist, [Input|Entrylist])
  ).
% recuperar o nome do paciente
get_nome_paciente(Nome) :-
    write('Digite o nome do paciente a ser consultado: (Sem ponto no final)'),
    ler_string_input(Nome).

% recupera um paciente dado o nome
get_paciente(Nome, Paciente) :-
    get_all_pacientes(Pacientes),
    check_paciente_exists(Pacientes, Nome, Paciente).

% recupera todos os pacientes do arquivo
get_all_pacientes(Pacientes) :-
    working_directory(CWD, CWD),
    PacienteFile = '/pacientes.txt',
    atom_concat(CWD, PacienteFile, Arquivo),
    open(Arquivo, read, Pfile),
    current_input(Stream),
    set_input(Pfile),
    ler_arquivo_pacientes(Pfile, Pacientes), !,
    close(Pfile),
    set_input(Stream).

% Funcao auxiliar para verificar se um paciente existe
check_paciente_exists([X | Y], Nome, Paciente) :-
    split_string(X, ",", "", [NomeP, DataP, CpfP]),
    Nome == NomeP ->
    Paciente = X,
    write('\nPaciente encontrado no sistema:\n'),nl,
    write('Nome: '), write(NomeP), nl,
    write('Data de nascimento: '), write(DataP), nl,
    write('Cpf do paciente: '), write(CpfP), nl;
    check_paciente_exists(Y, Nome, Paciente).

check_paciente_exists([], _, '') :- write('\nPaciente não encontrado\n'), !.

% funcao que realiza a leitura do arquivo de pacientes e salva em uma
% lista
ler_arquivo_pacientes(Stream,[]) :-
    at_end_of_stream(Stream).

ler_arquivo_pacientes(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    ler_arquivo_pacientes(Stream,L).

% remover elemento duplicados dada uma lista
remove_duplicates([],[]).

remove_duplicates([H],[H]).

remove_duplicates([H ,H| T], List) :-remove_duplicates( [H|T], List).

remove_duplicates([H,Y | T], [H|T1]):- Y \= H,remove_duplicates( [Y|T], T1).


%% Execução dos testes unitarios

:- begin_tests(main).
:- use_module(library(main)).

test(doenca):-
    doenca('Rubeola', ['coriza', 'febre', 'manchas avermelhadas no corpo']).

test(doenca):-
doenca('Sifilis', ['dor generalizada', 'fadiga', 'febre', 'pouco apetite', 'ulcera']).

test(doenca):-
doenca('Herpes', ['formigamento', 'erupcoes cutaneas', 'manchas avermelhadas no corpo', 'ulcera']).

test(doenca):-
doenca('H1N1', ['dor generalizada', 'diarreia', 'nausea', 'vomito', 'febre', 'calafrios', 'fadiga']).

test(doenca):-
doenca('Hanseniase', ['Meningite', 'dor no peito', 'perda de peso', 'pouco apetite', 'febre', 'calafrios']).

test(doenca):-
doenca('Sarampo', ['dor generalizada', 'tosse prolongada', 'fadiga', 'erupcoes cutaneas', 'febre', 'manchas avermelhadas no corpo']).

test(doenca):-
doenca('Bronquite', ['tosse prolongada', 'calafrios', 'fadiga', 'febre', 'dificuldade respiratoria', 'coriza']).

test(doenca):-
doenca('Catapora', ['manchas avermelhadas no corpo', 'fadiga', 'febre', 'garganta inflamada', 'pouco apetite']).

test(doencaSintomaProb) :-
    doencaSintomasProb('Caxumba 10,4%', ['fadiga', 'febre', 'pouco apetite']).

test(doencaSintomaProb) :-
    doencaSintomasProb('Bronquite 41,8%', ['tosse prolongada', 'febre', 'coriza']).

test(doencaSintomaProb) :-
    doencaSintomasProb('Meningite 61,7%', ['vomito', 'calafrios', 'fadiga']).

end_tests(main).
