/* Quest */
/* Berisi segala fungsi yang berkaitan dengan quest  */

/* Dynamic variable */
% inQuest : Apakah pemain sedang berada di lokasi quest. 0 = false, 1 = true.
:- dynamic(inQuest/1).

% inQuest : Apakah pemain sedang melakukan quest. 0 = false, 1 = true.
:- dynamic(lagiQuest/1).

% kill : Jumlah enemy yang telah terbunuh di dalam quest yang sedang dijalankan. X = Slime, Y = Goblin, Z = Wolf.
:- dynamic(killX/1).
:- dynamic(killY/1).
:- dynamic(killZ/1).

% requiredQuest : Apakah jumlah enemy berdasarkan jenisnya sudah mencukupi untuk menyelesaikan quest. X = Slime, Y = Goblin, Z = Wolf.
:- dynamic(requiredQuestX/1).
:- dynamic(requiredQuestY/1).
:- dynamic(requiredQuestZ/1).

% rewardQuest : Reward yang diperoleh character ketika quest terselesaikan. X = Reward Exp, Y = Reward Gold.
:- dynamic(rewardQuestX/1).
:- dynamic(rewardQuestY/1).

quest :-
    start_flag(true),

    % Cek apakah player berada di posisi pengambilan quest.
    object(A, B, 'P'),
    object(XQuest, YQuest, 'Q'),
    A == XQuest,
    B == YQuest,
    retract(inQuest(_)),
    assertz(inQuest(1)),

    % Menu
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('% QUEST AVAILABLE COMMANDS                                                     %'),nl,
    write('% 1. getQuest.      : mengambil quest random                                   %'),nl,
    write('% 2. claimReward.    : mengambil hadiah quest setelah selesai dilakukan        %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, nl,
    write('Your current quest: '), nl,
    lagiQuest(Status),
    requiredQuestX(SlimeRequired),
    requiredQuestY(GoblinRequired),
    requiredQuestZ(WolfRequired),
    rewardQuestX(ExpReward),
    rewardQuestY(GoldReward),

    (Status = 1 -> 
        write('Kill: '), nl,
        write(SlimeRequired),
        write(' Slime'), nl,
        write(GoblinRequired),
        write(' Goblin'), nl,
        write(WolfRequired),
        write(' Wolf'), nl,
        write('Reward: '),
        write(ExpReward),
        write(' EXP and '),
        write(GoldReward),
        write(' Gold.'), nl
    ;
        write('No quest.')
    ).

quest :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

quest :-
    inQuest(0),
    write('Please go to the quest location!'),nl.

getQuest :-
    % Cek apakah lagi melakukan quest
    \+ lagiQuest(1),

    % Generate dan menyimpan nilai random sebagai jumlah enemy yang harus dikalahkan untuk menyelesaikan quest.
    random(1,5,SlimeRequired),
    random(1,5,GoblinRequired),
    random(1,3,WolfRequired),

    retract(requiredQuestX(0)),
    assertz(requiredQuestX(SlimeRequired)),
    retract(requiredQuestY(0)),
    assertz(requiredQuestY(GoblinRequired)),
    retract(requiredQuestZ(0)),
    assertz(requiredQuestZ(WolfRequired)),
    
    % Generate dan menyimpan nilai random sebagai reward apabila character berhasil menyelesaikan quest.
    random(1,100,ExpRandomReward),
    random(1,1000,GoldRandomReward),

    ExpReward is ExpRandomReward + 10*SlimeRequired + 10*GoblinRequired + 10*WolfRequired,
    GoldReward is GoldRandomReward + 100*SlimeRequired + 100*GoblinRequired + 100*WolfRequired,

    retract(rewardQuestX(_)),
    assertz(rewardQuestX(ExpReward)),
    retract(rewardQuestY(_)),
    assertz(rewardQuestY(GoldReward)),
    
    % Output quest
    write('Here is your quest: '), nl,
    write('Kill: '), nl,
    write(SlimeRequired),
    write(' Slime'), nl,
    write(GoblinRequired),
    write(' Goblin'), nl,
    write(WolfRequired),
    write(' Wolf'), nl,
    write('Reward: '),
    write(ExpReward),
    write(' EXP and '),
    write(GoldReward),
    write(' Gold.'), nl,
    
    % Ganti status lagiQuest
    retract(lagiQuest(0)),
    assertz(lagiQuest(1)).

getQuest :-
    write('There\'s an on going quest. Finish it first!').

claimReward :-
    % Cek apakah player berada di posisi pengambilan quest.
    object(A, B, 'P'),
    object(XQuest, YQuest, 'Q'),
    A == XQuest,
    B == YQuest,
    retract(inQuest(0)),
    assertz(inQuest(1)).