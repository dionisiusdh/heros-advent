/* Inventory */
/* Berisi segala fungsi yang berkaitan dengan inventory  */
/* Penerapan: List, Rekurens */

:- dynamic(cinventory/2).

/* Utility functions */
% Adding element to list
add(X, [], [X]) :- !.
add(X, [H|T], [H|T1]) :- 
    add(X, T, T1).

% Remove X-th element from list
remove_i(_, [], []).
remove_i(1, [_|T], T) :- !.
remove_i(X, [H|T], [H|T1]) :- 
    X1 is X-1, 
    remove_i(X1, T, T1).

% Print list
print_list([], _).
print_list([H|T], I) :- 
    item_name(H,Name),
    write('Slot '),
    write(I),
    I2 is I + 1,
    write(' - '),
    write(Name), nl, 
    print_list(T, I2).

/* Inventory functions */
% Adding an item
add_item(Item) :-
    cinventory(Inventory, ItemCount),
    ItemCount2 is ItemCount + 1,
    ItemCount2 < 100,
    add(Item, Inventory, Inventory2),
    retract(cinventory(Inventory, ItemCount)),
    assertz(cinventory(Inventory2, ItemCount2)).

% Show inventory
inventory :- 
    cinventory(Inventory, _),
    print_list(Inventory, 0).


