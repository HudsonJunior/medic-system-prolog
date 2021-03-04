
doencaSintomasProb('Gastrite 74,7%', A):-
    member('dor no estomago', A);
    member('queimacao no estomago', A);
    member('enjoo', A);
    member('pouco apetite', A);
    member('vomito', A).


doencaSintomasProb('Catapora 63,8%', A):-
    member('manchas avermelhadas no corpo', A);
    member('fadiga', A);
    member('febre', A);
    member('garganta inflamada', A);
    member('pouco apetite', A).

doencaSintomasProb('Sarampo 63,4%', A):-
	member('dor generalizada', A);
	member('tosse prolongada', A);
	member('fadiga', A);
	member('febre', A);
	member('erupcoes cutaneas', A);
	member('manchas avermelhadas no corpo', A).

doencaSintomasProb('Meningite 61,7%', A):-
    member('dor generalizada', A);
    member('calafrios', A);
    member('manchas avermelhadas no corpo', A);
    member('erupcoes cutaneas', A);
    member('fadiga', A);
    member('febre', A);
    member('dor de cabeca', A);
    member('nausea', A);
    member('vomito', A).

doencaSintomasProb('Pneumonia 60,3%', A):-
    member('dor nas costas', A);
    member('dor no peito', A);
    member('tosse prolongada', A);
    member('calafrios', A);
    member('fadiga', A);
    member('febre', A);
    member('suor excessivo', A);
    member('dificuldade respiratoria',A).

doencaSintomasProb('Herpes 58,8%', A):-
    member('formigamento', A);
    member('erupcoes cutaneas', A);
    member('manchas avermelhadas no corpo', A);
    member('ulcera', A).

doencaSintomasProb('Bronquite 41,8%', A):-
    member('tosse prolongada', A);
    member('calafrios', A);
    member('fadiga', A);
    member('febre', A);
    member('dificuldade respiratoria', A);
    member('coriza', A).

doencaSintomasProb('Dengue Hemorragica 40,6%', A):-
    member('hemorragia', A);
    member('vomito', A);
    member('dificuladde respiratoria',A);
    member('ja tive dengue', A);
    member('tontura', A).


doencaSintomasProb('Ataque Cardiaco 32,4%', A):-
    member('dor no peito', A);
    member('fadiga', A);
    member('tontura', A);
    member('nausea', A);
    member('vomito', A);
    member('azia', A).

doencaSintomasProb('Dengue Classica 30,8%', A):-
    member('hemorragia', A);
    member('dor de cabeca', A);
    member('dor generalizada',A).

doencaSintomasProb('Tuberculose 25,7%', A):-
    member('hemorragia', A);
    member('dor no peito', A);
    member('perda de peso', A);
    member('pouco apetite', A);
    member('febre', A);
    member('calafrios', A).

doencaSintomasProb('Febre Amarela 24,9%', A):-
    member('dor generalizada', A);
    member('calafrios', A);
    member('fadiga', A);
    member('febre', A);
    member('pouco apetite', A);
    member('nausea', A);
    member('vomito', A);
    member('olhos amarelados', A);
    member('pele amarelada', A).

doencaSintomasProb('Leptospirose 20,2%', A):-
    member('dor generalizada', A);
    member('diarreia', A);
    member('nausea', A);
    member('vomito', A);
    member('calafrios', A);
    member('fadiga', A);
    member('febre', A).

doencaSintomasProb('Rubeola 18,7%', A):-
    member('coriza', A);
    member('febre', A);
    member('manchas avermelhadas no corpo', A);!.

doencaSintomasProb('Sifilis 10,7%', A):-
    member('dor generalizada', A);
    member('fadiga', A);
    member('febre', A);
    member('pouco apetite', A);
    member('ulcera', A).


doencaSintomasProb('Caxumba 10,4%', A):-
    member('dor no testiculo', A);
    member('fadiga', A);
    member('febre', A);
    member('pouco apetite', A);
    member('dor de cabeca', A).

doencaSintomasProb('Hanseniase 7,4%', A):-
    member('fadiga', A);
    member('formigamento', A);
    member('perda de peso', A);
    member('dor generalizada', A);
    member('manchas avermelhadas no corpo', A);
    member('erupcoes cutaneas', A).

doencaSintomasProb('H1N1 7,2%', A):-
    member('dor generalizada', A);
    member('diarreia', A);
    member('nausea', A);
    member('vomito', A);
    member('febre', A);
    member('calafrios', A);
    member('fadiga', A).

doenca('Tuberculose', ['hemorragia', 'dor no peito', 'perda de peso', 'pouco apetite', 'febre', 'calafrios']).

doenca('Dengue Hemorragica', ['hemorragia', 'vomito', 'dificulade respiratoria', 'tontura']).

doenca('Dengue Classica', ['hemorragia', 'dor de cabeca', 'dor generalizada']).

doenca('Pneumonia', ['dor nas costas', 'dor no peito', 'tosse prolongada', 'calafrios', 'fadiga', 'febre', 'suor excessivo', 'dificuldade respiratoria']).

doenca('Gastrite', ['dor no estomago', 'queimacao no estomago', 'enjoo', 'pouco apetite', 'vomito']).

doenca('Catapora', ['manchas avermelhadas no corpo', 'fadiga', 'febre', 'garganta inflamada', 'pouco apetite']).

doenca('Leptospirose', ['dor generalizada', 'diarreia', 'nausea', 'vomito', 'calafrios', 'fadiga', 'febre']).

doenca('Rubeola', ['coriza', 'febre', 'manchas avermelhadas no corpo']).

doenca('Caxumba', ['dor no testiculo', 'fadiga', 'febre', 'pouco apetite', 'dor de cabeca']).

doenca('Bronquite', ['tosse prolongada', 'calafrios', 'fadiga', 'febre', 'dificuldade respiratoria', 'coriza']).

doenca('Sarampo', ['dor generalizada', 'tosse prolongada', 'fadiga', 'erupcoes cutaneas', 'febre', 'manchas avermelhadas no corpo']).

doenca('Hanseniase', ['Meningite', 'dor no peito', 'perda de peso', 'pouco apetite', 'febre', 'calafrios']).

doenca('Meningite', ['dor generalizada', 'calafrios', 'manchas avermelhadas no corpo', 'erupcoes cutaneas', 'fadiga', 'febre', 'dor de cabeca', 'nausea', 'vomito']).

doenca('Ataque Cardiaco', ['dor no peito', 'fadiga', 'tontura', 'nausea', 'vomito', 'azia']).

doenca('H1N1', ['dor generalizada', 'diarreia', 'nausea', 'vomito', 'febre', 'calafrios', 'fadiga']).

doenca('Febre Amarela', ['dor generalizada', 'calafrios', 'fadiga', 'febre', 'pouco apetite', 'nausea', 'vomito', 'olhos amarelados', 'pele amarelada']).

doenca('Herpes', ['formigamento', 'erupcoes cutaneas', 'manchas avermelhadas no corpo', 'ulcera']).

doenca('Sifilis', ['dor generalizada', 'fadiga', 'febre', 'pouco apetite', 'ulcera']).
