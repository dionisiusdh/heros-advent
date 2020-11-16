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
    % Cek apakah player berada di posisi pengambilan quest.
    object(A, B, 'P'),
    object(XQuest, YQuest, 'Q'),
    A == XQuest,
    B == YQuest,
    retract(inQuest(0)),
    assertz(inQuest(1)),

    % Cek apakah lagi melakukan quest
    \+ lagiQuest(1),

    % Generate dan menyimpan nilai random sebagai jumlah enemy yang harus dikalahkan untuk menyelesaikan quest.
    random(1,10,SlimeRequired),
    random(1,10,GoblinRequired),
    random(1,10,WolfRequired),

    retract(requiredQuestX(0)),
    assertz(requiredQuestX(SlimeRequired)),
    retract(requiredQuestY(0)),
    assertz(requiredQuestY(GoblinRequired)),
    retract(requiredQuestZ(0)),
    assertz(requiredQuestZ(WolfRequired)),
    
    % Generate dan menyimpan nilai random sebagai reward apabila character berhasil menyelesaikan quest.
    random(1,100,ExpReward),
    random(1,1000,GoldReward),

    retract(rewardQuestX(0)),
    assertz(rewardQuestX(ExpReward)),
    retract(rewardQuestY(0)),
    assertz(rewardQuestY(GoldReward)).

quest :-
    lagiQuest(1),
    write('Anda sedang berada dalam quest! Selesaikan quest anda terlebih dahulu').

claimQuest :-
    % Cek apakah player berada di posisi pengambilan quest.
    object(A, B, 'P'),
    object(XQuest, YQuest, 'Q'),
    A == XQuest,
    B == YQuest,
    retract(inQuest(0)),
    assertz(inQuest(1)),