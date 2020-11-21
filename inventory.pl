/* Inventory */
/* Berisi segala fungsi yang berkaitan dengan inventory  */
/* Penerapan: List, Rekurens, Loop, Cut */

/* Dynamic variable */
% cinventory([Inventory], Total) : [Inventory] adalah inventory dari pengguna dan Total adalah jumlah item dalam inventory
:- dynamic(cinventory/2).

% cinventory([InventoryCount]) : [InventoryCount] adalah jumlah per ID barang (representasi indeks = ID Barang) [1..100]
:- dynamic(cinventory_count/1).

/* ******************* Utility functions ******************* */
% Adding element to list
add(X, [], [X]) :- !.
add(X, [H|T], [H|T1]) :- 
    add(X, T, T1).

% Get N-th element from list
get_n([H|_], 1, H) :- !.
get_n([_|T], N, X) :- 
    N1 is N-1, 
    get_n(T, N1, X).

% Set N-th element from list
set_n([_|T], 1, X, [X|T]).
set_n([H|T], N, X, [H|T1]):-
    N1 is N-1, 
    set_n(T, N1, X, T1).

% Check if X is a member of the list
is_member([X|_], X).
is_member([_|T], X) :-
    is_member(T, X).

% Remove N-th element from list
remove_n(_, [], []).
remove_n(1, [_|T], T) :- !.
remove_n(X, [H|T], [H|T1]) :- 
    X1 is X-1, 
    remove_n(X1, T, T1).

% Print N-th element
print_n(N) :-
    cinventory(Inventory, _),
    cinventory_count(InventoryCount),

    get_n(Inventory, N, ItemID_N),
    get_n(InventoryCount, ItemID_N, ItemCount_N),
    item_name(ItemID_N, ItemName_N),
    item_equipable(ItemID_N, Job_N),
    job_stat(Job_N, JobName),
    
    % Jika jumlah item = 0, tidak ditulis
    % Jika item = potion, tidak ditulis job requirementsnya
    (\+ (ItemCount_N = 0) -> 
        write('ID '),
        write(ItemID_N),
        write(' - '),
        write(ItemCount_N),
        write(' '),
        write(ItemName_N),
        (\+ (ItemID_N = 50) -> 
            write(' ('),
            write(JobName),
            write(')'),
            nl
        ;
            nl)
    ;
        write('')).


% Print list
print_list(I) :- 
    cinventory(_, Total),
    I =< Total,
    print_n(I), 
    I2 is I + 1,
    print_list(I2).

/* ******************* Inventory functions ******************* */
/* Item Management */
% Adding an item based on its ID
add_item(ItemID) :-
    cinventory(Inventory, Total),
    cinventory_count(InventoryCount),
    Total2 is Total + 1,
    Total2 =< 100,
 
    (is_member(Inventory, ItemID) ->
        get_n(InventoryCount, ItemID, Count),
        Count2 is Count + 1,
        set_n(InventoryCount, ItemID, Count2, InventoryCount2),
        retract(cinventory(Inventory, Total)),
        retract(cinventory_count(InventoryCount)),
        assertz(cinventory(Inventory, Total2)),
        assertz(cinventory_count(InventoryCount2))
    ; 
        add(ItemID, Inventory, Inventory2),
        retract(cinventory(Inventory, Total)),
        assertz(cinventory(Inventory2, Total2)),

        set_n(InventoryCount, ItemID, 1, InventoryCount2),
        retract(cinventory_count(InventoryCount)),
        assertz(cinventory_count(InventoryCount2))
    ).

% Deleting an item based on its ID
deleteItem(ItemID) :-
    % Cek ketersediaan item dalam inventory
    cinventory(Inventory, _),
    is_member(Inventory, ItemID),

    % Ambil data inventory count
    cinventory_count(InventoryCount),
    get_n(InventoryCount, ItemID, Count),

    % Mengurangi item count dalam inventory
    Count2 is Count - 1,
    set_n(InventoryCount, ItemID, Count2, InventoryCount2),
    retract(cinventory_count(InventoryCount)),
    assertz(cinventory_count(InventoryCount2)),
    write('Successfully deleted 1 '),
    item_name(ItemID, ItemName),
    write(ItemName), nl.

deleteItem(_) :-
    write('You do not have such item with corresponding ID').

/* Use and equip */
equipWeapon(ItemID) :-
    % Cek ketersediaan item dalam inventory
    cinventory(Inventory, _),
    is_member(Inventory, ItemID),

    % Cek restriksi job
    cjob(Job),
    item_equipable(ItemID, EquipableJob),
    Job == EquipableJob,

    % Mengganti current weapon
    retract(cweapon(_)),
    assertz(cweapon(ItemID)),
    item_name(ItemID, ItemName),
    write(ItemName), 
    write(' equipped successfully'), nl.

equipWeapon(_) :-
    \+ Job == EquipableJob,
    write('Your job is not suitable with the item').

equipWeapon(_) :-
    write('You do not have such weapon with corresponding ID').

equipArmor(ItemID) :-
    % Cek ketersediaan item dalam inventory
    cinventory(Inventory, _),
    is_member(Inventory, ItemID),

    % Cek restriksi job
    cjob(Job),
    item_equipable(ItemID, EquipableJob),
    Job == EquipableJob,

    retract(carmor(_)),
    assertz(carmor(ItemID)),
    item_name(ItemID, ItemName),
    write(ItemName), 
    write(' equipped successfully'), nl.

equipArmor(_) :-
    \+ Job == EquipableJob,
    write('Your job is not suitable with the item').

equipArmor(_) :-
    write('You do not have such armor with corresponding ID').

usePotion :-
    cinventory_count(InventoryCount),
    get_n(InventoryCount, 50, Count),
    Count2 is Count - 1,
    Count2 >= 0,

    % Cek apakah health penuh
    chealth(Health),
    cjob(Job),
    health_stat(Job, MaxHealth),
    \+ Health == MaxHealth,

    % Kurangi stok potion di inventory
    set_n(InventoryCount, 50, Count2, InventoryCount2),
    retract(cinventory_count(InventoryCount)),
    assertz(cinventory_count(InventoryCount2)),

    % Ubah status health
    HealedHealth is Health + 100,
    retract(chealth(Health)),
    assertz(chealth(HealedHealth)),
    write('Successfully used 1 potion'), nl.

usePotion :-
    \+ Health == MaxHealth,
    write('Your health is full!'), nl.

usePotion :-
    write('No potion available'), nl.

/* ******************* Initiation ******************* */
% Generate Inventory Count
generate_inventory_count(0, []) :- !.
generate_inventory_count(N, [0 | T]) :-
  N2 is N-1,
  generate_inventory_count(N2, T).

% Show inventory
inventory :- 
    start_flag(true),
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                              Inventory Commands                              %'),nl,
    write('% 1. deleteItem(ItemID).    : membuang 1 item sesuai IDnya                     %'),nl,
    write('% 2. equipWeapon(ItemID).   : mengequip weapon sesuai IDnya                    %'),nl,
    write('% 3. equipArmor(ItemID).    : mengequip armor sesuai IDnya                     %'),nl,
    write('% 4. usePotion.             : memakai potion untuk merestore health            %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, nl,
    write('Your items: '),nl,
    print_list(1).

inventory :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

