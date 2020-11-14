/* Map */
/* Berisi fungsi untuk menggerakkan karakter */

wall_flag :-
    write('There\'s  a wall! Type \'map\' to look at your current position!').

/* Utara */
w :-
    start_flag(true),
    object(X, Y, 'P'),
    Y2 is Y-1,
    \+ object(X, Y2, '#'),
    Y2 > 0,
    map_size(_, H),
    Y2 =< H,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X, Y2, 'P')),
    write('You move north.').

w :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

w :- 
    wall_flag.
    
/* Barat */
a :-
    start_flag(true),
    object(X, Y, 'P'),
    X2 is X-1,
    \+ object(X2, Y, '#'),
    X2 > 0,
    map_size(W, _),
    X2 =< W,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X2, Y, 'P')),
    write('You move west.').

a :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

a :- 
    wall_flag.
    
/* Selatan */
s :-
    start_flag(true),
    object(X, Y, 'P'),
    Y2 is Y+1,
    \+ object(X, Y2, '#'),
    Y2 > 0,
    map_size(_, H),
    Y2 =< H,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X, Y2, 'P')),
    write('You move south.').

s :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

s :- 
    wall_flag.
    
/* Timur */
d :-
    start_flag(true),
    object(X, Y, 'P'),
    X2 is X+1,
    \+ object(X2, Y, '#'),
    X2 > 0,
    map_size(W, _),
    X2 =< W,
    !,
    retract(object(X, Y, 'P')),
    assertz(object(X2, Y, 'P')),
    write('You move east.').

d :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

d :- 
    wall_flag.