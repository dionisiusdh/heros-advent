/* Map */
/* Berisi fungsi untuk mengoutput map dan objek didalamnya */

% ==================== MAIN  ====================
map :-
    print_map.

print_map :-
    printXY(0,0).

% ==================== OBJECT  ====================
:- dynamic(object/3).

% object(X, Y, O) berarti ada sebuah objek O, bisa berupa player atau lokasi, dengan koordinat X, Y
object(1, 3, 'P').

% Ukuran dari map
size(10,10).

% ==================== PAGAR ====================
% Batas atas
printXY(X, Y) :-
    size(W, _),
    X > 0,
    X < W+1,
    Y =:= 0,
    write('# '),
    X2 is X+1,
    printXY(X2, Y).

% Batas bawah
printXY(X, Y) :-
    size(W, H),
    X > 0,
    X < W+1,
    Y =:= H+1,
    write('# '),
    X2 is X+1,
    printXY(X2, Y).

% Batas kanan
printXY(X, Y) :-
    size(W, H),
    X =:= W + 1,
    Y =< H + 1,
    write('# '),
    nl,
    Y2 is Y+1,
    printXY(0, Y2).

% Batas kiri
printXY(X, Y) :-
    size(_, H),
    X =:= 0,
    Y =< H + 1,
    write('# '),
    X2 is X+1,
    printXY(X2, Y).

% ==================== Object ====================
% Object
printXY(X, Y) :-
    size(W, H),
    X > 0,
    Y > 0,
    X < W+1,
    Y < H+1,
	object(X, Y, 'P'), !,
	write('P'),
	write(' '),
    X2 is X+1,
    printXY(X2, Y).

printXY(X, Y) :-
    size(W, H),
    X > 0,
    Y > 0,
    X < W+1,
    Y < H+1,
    object(X, Y, O), !,
	write(O),
	write(' '),
    X2 is X+1,
    printXY(X2, Y).

% ==================== Space kosong ====================
% Empty space
printXY(X, Y) :-
    size(W, H),
    X > 0,
    Y > 0,
    X < W+1,
    Y < H+1,
    \+ object(X, Y, _),
    write('- '),
    X2 is X+1,
    printXY(X2, Y).