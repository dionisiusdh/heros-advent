/* Shop */
/* Berisi segala fungsi yang berkaitan dengan shop  */

/* Dynamic variable */
% inShop : Apakah pemain sedang berada di lokasi shop. 0 = false, 1 = true.
:- dynamic(inShop/1).

shop :-
    % Cek apakah player berada di posisi shop
    object(X, Y, 'P'),
    object(XShop, YShop, 'S'),
    X == XShop,
    Y == YShop,

    retract(inShop(0)),
    assertz(inShop(1)),

    % Menu shop
    nl, 
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('% SHOP AVAILABLE COMMANDS                                                      %'),nl,
    write('% 1. shop.        : memasuki dan menampilkan menu shop                         %'),nl,
    write('% 1. gacha.       : melakukan gacha                                            %'),nl,
    write('% 1. buyPotion.   : membeli potion                                             %'),nl,
    write('% 2. exitShop.    : keluar dari shop                                           %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, nl,
    write('What do you want to buy?'), nl,
    write('1. Gacha (1000 gold)'), nl,
    write('2. Health Potion (100 gold)'), nl.

shop :-
    write('Please go to the shop!'),nl.

exitShop :- 
    retract(inShop(1)),
    assertz(inShop(0)),
    write('Thanks for coming.'), nl.

gacha :-
    % Cek apakah berada di dalam shop
    inShop(Status),
    Status = 1,

    % Cek apakah gold player mencukupi
    cgold(Gold),
    Gold >= 1000,
    Gold2 is Gold - 1000,
    retract(cgold(Gold)),
    assertz(cgold(Gold2)),

    % Menghasilkan random item
    random(1,9,GachaItem),
    write('Gacha! You got '),
    item_name(GachaItem, ItemName),
    write(ItemName),
    write('!'),nl,

    % Menambahkan item gacha ke inventory
    add_item(GachaItem).

gacha :-
    inShop(0),
    !,
    write('Please go to the shop!'), nl.

gacha :-
    write('Not enough gold.'), nl.

buyPotion :-
    % Cek apakah berada di dalam shop
    inShop(Status),
    Status = 1,

    % Cek apakah gold player mencukupi
    cgold(Gold),
    Gold >= 100,
    Gold2 is Gold - 100,
    retract(cgold(Gold)),
    assertz(cgold(Gold2)),

    % Menambahkan potion ke inventory
    add_item(50),
    write('Potion added to you inventory!'),nl.

buyPotion :-
    inShop(0),
    !,
    write('Please go to the shop!'), nl.

buyPotion :-
    write('Not enough gold.\n').
