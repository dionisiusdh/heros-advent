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
    write('% 1. getQuest.     : mengambil quest random                                    %'),nl,
    write('% 2. claimReward.  : mengambil hadiah quest setelah selesai dilakukan          %'),nl,
    write('% 3. exitQuest.    : keluar dari tempat pengambilan quest                      %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, nl,
    write('Your current quest: '), nl,
    lagiQuest(Status),
    killX(SlimeKilled),
    killY(GoblinKilled),
    killZ(WolfKilled),
    requiredQuestX(SlimeRequired),
    requiredQuestY(GoblinRequired),
    requiredQuestZ(WolfRequired),
    rewardQuestX(ExpReward),
    rewardQuestY(GoldReward),

    (Status = 1 -> 
        write('Kill: '), nl,
        write(SlimeKilled),
        write('/'),
        write(SlimeRequired),
        write(' Slime'), nl,
        write(GoblinKilled),
        write('/'),
        write(GoblinRequired),
        write(' Goblin'), nl,
        write(WolfKilled),
        write('/'),
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

exitQuest :-
    retract(inQuest(_)),
    assertz(inQuest(0)),
    write('See ya later.'), nl.

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

    retract(killX(_)),
    assertz(killX(0)),
    retract(killY(_)),
    assertz(killY(0)),
    retract(killZ(_)),
    assertz(killZ(0)),
    
    % Generate dan menyimpan nilai random sebagai reward apabila character berhasil menyelesaikan quest.
    random(1,100,ExpRandomReward),
    random(1,1000,GoldRandomReward),

    ExpReward is ExpRandomReward + 30*SlimeRequired + 40*GoblinRequired + 50*WolfRequired,
    GoldReward is GoldRandomReward + 200*SlimeRequired + 300*GoblinRequired + 400*WolfRequired,

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
    retract(inQuest(_)),
    assertz(inQuest(1)),
    
    % Cek apakah jumlah enemy yang terbunuh sudah mencukupi.
    killX(XSlain),
    requiredQuestX(XRequired),
    killY(YSlain),
    requiredQuestY(YRequired),
    killZ(ZSlain),
    requiredQuestZ(ZRequired),
    XSlain >= XRequired,
    YSlain >= YRequired,
    ZSlain >= ZRequired, !,
    
    % Mengambil reward
    rewardQuestX(RewardExp),
    rewardQuestY(RewardGold),

    % Menambah Exp player dengan reward
    cexp(CurrentExp),
    AddedExp is CurrentExp + RewardExp,
    retract(cexp(_)),
    assertz(cexp(AddedExp)),

    % Menambah Exp player dengan reward
    cgold(CurrentGold),
    AddedGold is CurrentGold + RewardGold,
    retract(cexp(_)),
    assertz(cexp(AddedGold)),

    % Menulis Reward.
    write('Congratulations. Here is your Reward :'),nl,
    write('Exp Reward : '),
    write(RewardExp),nl,
    write('Gold Reward : '),
    write(RewardGold),nl.

claimReward :-
    inQuest(0),
    write('Please go to the quest location to claim your reward!'), nl.

claimReward :-
    !,
    write('Your kill count is not enough! Kill more monster'), nl.