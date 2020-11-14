/* Main Program */
/* Program utama */

% Modules
:- include('map.pl').
:- include('help.pl').
:- include('character.pl').
:- include('move.pl').
:- include('inventory.pl').
:- include('items.pl').
:- include('shop.pl').
:- include('status.pl').

/* Dynamic variable */
% Initiate start flag
:- dynamic(start_flag/1).
start_flag(false).             % Untuk debug, set jadi true

start :-
    ['map.pl'],
    ['help.pl'],
    ['character.pl'],
    ['move.pl'],
    ['inventory.pl'],
    ['items.pl'],
    ['shop.pl'],
    ['status.pl'],
    
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                                   Game                                       %'),nl,
    write('% 1. start       : untuk memulai petualanganmu                                 %'),nl,
    write('% 2. map         : menampilkan peta                                            %'),nl,
    write('% 3. status      : menampilkan kondisimu terkini                               %'),nl,
    write('% 4. w           : gerak ke utara 1 langkah                                    %'),nl,
    write('% 5. s           : gerak ke selatan 1 langkah                                  %'),nl,
    write('% 6. d           : gerak ke ke timur 1 langkah                                 %'),nl,
    write('% 7. a           : gerak ke barat 1 langkah                                    %'),nl,
    write('% 8. inventory   : menampilkan inventory anda                                  %'),nl,
    write('% 9. help        : menampilkan segala bantuan                                  %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,

    retract(start_flag(false)), 
    !,
    asserta(start_flag(true)),

    write('Welcome to blabla. Choose your job'),nl,
    write('1. Swordsman'),nl,
    write('2. Archer'),nl,
    write('3. Sorcerer'),nl,
    read(Job),

    % Getting character stats
    job_stat(Job, JobName),
    attack_stat(Job, Attack),
    specialattack_stat(Job, SpecialAttack),
    health_stat(Job, Health),
    defense_stat(Job, Defense),

    % Initiate character stats
    assertz(cjob(Job)),
    assertz(clevel(1)),
    assertz(chealth(Health)),
    assertz(cattack(Attack)),
    assertz(cspecialattack(SpecialAttack)),
    assertz(cdefense(Defense)),
    assertz(cgold(5000)),
    assertz(cexp(0)),
    assertz(cinventory([], 0)),
    generate_inventory_count(100, InventoryCount),
    assertz(cinventory_count(InventoryCount)),

    % Initiate location track
    assertz(inShop(0)),

    % Starter pack
    assertz(cweapon(Job)),
    Job2 is Job + 20,
    assertz(carmor(Job2)),
    add_item(Job),
    add_item(Job2),
    add_item(50),
    add_item(50),
    add_item(50),
    add_item(50),
    add_item(50),

    write('You choose '),
    write(JobName),
    write(', lets explore the world!'),

    % Initiate map objects
    assertz(object(5, 5, 'P')),
    assertz(object(9, 8, 'D')),
    assertz(object(7, 2, 'S')),
    assertz(object(2, 3, 'Q')).