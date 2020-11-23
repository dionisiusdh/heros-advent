/* Map */
/* Berisi fungsi untuk menggerakkan karakter */

wall_flag :-
    write('There\'s  a wall! Type \'map\' to look at your current position!').

/* Utara */
w :-
    start_flag(true),
    \+ inBattle(1),
    \+ inQuest(1),
    \+ inShop(1),

    object(X, Y, 'P'),
    Y2 is Y-1,
    \+ object(X, Y2, '#'),
    Y2 > 0,
    map_size(_, H),
    Y2 =< H,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X, Y2, 'P')),
    write('You move north.'),
    encounter.

w :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

w :- 
    inBattle(1),
    !,
    write('You are in battle! Either finish off your enemy or try to run away').

w :- 
    inQuest(1),
    !,
    write('You are in quest bank! Exit first').

w :- 
    inShop(1),
    !,
    write('You are in shop! Exit first').

w :- 
    wall_flag.
    
/* Barat */
a :-
    start_flag(true),
    \+ inBattle(1),
    \+ inQuest(1),
    \+ inShop(1),

    object(X, Y, 'P'),
    X2 is X-1,
    \+ object(X2, Y, '#'),
    X2 > 0,
    map_size(W, _),
    X2 =< W,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X2, Y, 'P')),
    write('You move west.'),
    encounter.

a :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

a :- 
    inBattle(1),
    !,
    write('You are in battle! Either finish off your enemy or try to run away').

a :- 
    inQuest(1),
    !,
    write('You are in quest bank! Exit first').

a :- 
    inShop(1),
    !,
    write('You are in shop! Exit first').

a :- 
    wall_flag.
    
/* Selatan */
s :-
    start_flag(true),
    \+ inBattle(1),
    \+ inQuest(1),
    \+ inShop(1),

    object(X, Y, 'P'),
    Y2 is Y+1,
    \+ object(X, Y2, '#'),
    Y2 > 0,
    map_size(_, H),
    Y2 =< H,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X, Y2, 'P')),
    write('You move south.'),
    encounter.

s :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

s :- 
    inBattle(1),
    !,
    write('You are in battle! Either finish off your enemy or try to run away').

s :- 
    inQuest(1),
    !,
    write('You are in quest bank! Exit first').

s :- 
    inShop(1),
    !,
    write('You are in shop! Exit first').

s :- 
    wall_flag.
    
/* Timur */
d :-
    start_flag(true),
    \+ inBattle(1),
    \+ inQuest(1),
    \+ inShop(1),

    object(X, Y, 'P'),
    X2 is X+1,
    \+ object(X2, Y, '#'),
    X2 > 0,
    map_size(W, _),
    X2 =< W,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X2, Y, 'P')),
    write('You move east.'),
    encounter.

d :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

d :- 
    inBattle(1),
    !,
    write('You are in battle! Either finish off your enemy or try to run away').

d :- 
    inQuest(1),
    !,
    write('You are in quest bank! Exit first').

d :- 
    inShop(1),
    !,
    write('You are in shop! Exit first').

d :- 
    wall_flag.