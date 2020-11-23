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
:- include('enemy.pl').
:- include('encounter.pl').
:- include('quest.pl').
:- include('battle.pl').
:- include('dungeon.pl').   

/* Dynamic variable */
% Initiate start flag
:- dynamic(start_flag/1).
start_flag(false).

start :-
    ['map.pl'],
    ['help.pl'],
    ['character.pl'],
    ['move.pl'],
    ['inventory.pl'],
    ['items.pl'],
    ['shop.pl'],
    ['status.pl'],
    ['enemy.pl'],
    ['encounter.pl'],
    ['quest.pl'],
    ['battle.pl'],

    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                                                        _____------------_____%'),nl,
    write('%                                                    ._--\':::::\'-------____    %'),nl,
    write('%                .___------__       /-.._.    _---_ \'|:::::::::::::::::::::----%'),nl,
    write('%        ._--\'.---::::::/ `      \\ .-. \'-\'\' *__*|/::::::::::::::::::::::::::   %'),nl,
    write('%    .__-\'  _-\'::::::::/ ._------_| \'_\'  __--\' _\'/:::::::::::::::::::::::::::  %'),nl,
    write('%_--\'    _-\'::::::::::|.\'  ._----_\\    -\'  ._-\'::::::::::::::::::::::::::::::  %'),nl,
    write('%    _-\':::::::::::::\\  .\'       /  .__--\' -\':::::::::_--_:::::::::::.------   %'),nl,
    write('%_-\'::::::::::::::::::-_|       /    /   /::::::::::/      \\:::::::/           %'),nl,
    write('%\'::::::::::::::::::::::::----__-   .   .  |.--_:::/          \\:::/            %'),nl,
    write('%.----_::::::::::::::::::::/                \\  \\\\ \\/             \\/            %'),nl,
    write('%| ._.-_\'-_:::.----.:::.:. . .    .         . |  \\\\                            %'),nl,
    write('%_ -__ -.\\  \\ .-.----..----_. .----. .-_____-.----:|\\                     _    %'),nl, 
    write('%( ) ( )                   ( )         (  _  )    (\\|                     ( )_ %'),nl,
    write('%| |_| |   __   _ __   _   |/   ___    | (_) |   _| | _   _    __    ___  | ,_)%'),nl,
    write('%|  _  | /\'__`\\( \'__)/\'_`\\    /\',__)   |  _  | /\'_` |( ) ( ) /\'__`\\/\' _ `\\| |  %'),nl,
    write('%| | | |(  ___/| |  ( (_) )   \\__, \\   | | | |( (_| || \\_/ |(  ___/| ( ) || |_ %'),nl,
    write('%(_) (_)`\\____)(_)  `\\___/\'   (____/   (_) (_)`\\__,_)`\\___/\'`\\____)(_) (_)`\\__)%'),nl,
                                                                              
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
    assertz(cmaxhealth(Health)),
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
    assertz(inDungeon(0)),
    assertz(inQuest(0)),
    assertz(lagiQuest(0)),
    assertz(inBattle(0)),
    assertz(cooldown(0)),

    % Starter pack
    assertz(cweapon(Job)),
    Job2 is Job + 9,
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
    assertz(object(2, 3, 'Q')),

    % Initiate quest requirements
    assertz(requiredQuestX(0)),
    assertz(requiredQuestY(0)),
    assertz(requiredQuestZ(0)),

    % Initiate quest kill status
    assertz(killX(0)),
    assertz(killY(0)),
    assertz(killZ(0)),
    
    % Initiate quest rewards
    assertz(rewardQuestX(0)),
    assertz(rewardQuestY(0)),

    % Initiate enemy variable
    assertz(cenemyid(0)),
    assertz(cenemylevel(0)),
    assertz(cenemyhp(0)),
    assertz(cenemyattack(0)),
    assertz(cenemydefense(0)).