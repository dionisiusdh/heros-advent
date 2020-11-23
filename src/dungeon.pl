/* Dungeon */
/* Berisi segala fungsi yang berkaitan dengan dungeon  */

/* Dynamic variable */
% inDungeon : Apakah pemain sedang berada di lokasi Dungeon. 0 = false, 1 = true.
:- dynamic(inDungeon/1).

dungeon :-
    start_flag(true),

    % Cek apakah player berada di posisi dungeon
    object(X, Y, 'P'),
    object(XDungeon, YDungeon, 'D'),
    X == XDungeon,
    Y == YDungeon,

    % Set location status
    retract(inDungeon(_)),
    assertz(inDungeon(1)),
    
    % Boss cinematic cutscene
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,    
    write('%                                            __----~~~~~~~~~~~------___        %'),nl,
    write('%                                .  .   ~~//====......          __--~ ~~       %'),nl,
    write('%                -.            \\_|//     |||\\\\  ~~~~~~::::... /~               %'),nl,
    write('%            ___-==_       _-~o~  \\/    |||  \\\\            _/~~-               %'),nl,
    write('%    __---~~~.==~||\\=_    -_--~/_-~|-   |\\\\   \\\\        _/~                    %'),nl,
    write('%_-~~     .=~    |  \\\\-_    \'-~7  /-   /  ||    \\      /                       %'),nl,
    write('%.~       .~       |   \\\\ -_    /  /-   /   ||      \\   /                      %'),nl,
    write('%/  ____  /         |     \\\\ ~-_/  /|- _/   .||       \\ /                      %'),nl,
    write('%|~~    ~~|--~~~~--_ \\     ~==-/   | \\~--===~~        .\\                       %'),nl,
    write('%        \'         ~-|      /|    |-~\\~~       __--~~                          %'),nl,
    write('%                    |-~~-_/ |    |   ~\\_   _-~            /\\                  %'),nl,
    write('%                        /  \\     \\__   \\/~                \\__                 %'),nl,
    write('%                    _--~ _/ | .-~~____--~-/                  ~~==.            %'),nl,
    write('%                    ((->/~   \'.|||\' -_|    ~~-/ ,              . _||          %'),nl,
    write('%                                -_     ~\\      ~~---l__i__i__i--~~_/          %'),nl,
    write('%                                _-~-__   ~)  \\--______________--~~            %'),nl,
    write('%                            //.-~~~-~_--~- |-------~~~~~~~~                   %'),nl,
    write('%                                    //.-~~~--\\                                %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, !,

    % Initialize boss
    EnemyID is 4,
    retract(cenemyid(_)),
    assertz(cenemyid(EnemyID)),

    Level is 1,
    retract(cenemylevel(_)),
    assertz(cenemylevel(Level)),

    enemy_hp(EnemyID, EnemyHP),
    retract(cenemyhp(_)),
    assertz(cenemyhp(EnemyHP)),

    enemy_attack(EnemyID, EnemyAttack),
    retract(cenemyattack(_)),
    assertz(cenemyattack(EnemyAttack)),

    enemy_defense(EnemyID, EnemyDefense),
    retract(cenemydefense(_)),
    assertz(cenemydefense(EnemyDefense)),

    % Enter battle
    retract(inBattle(_)),
    assertz(inBattle(1)),
    battle, !.

dungeon :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').

dungeon :-
    write('Please go to the dungeon!'),nl.

exitDungeon :- 
    retract(inDungeon(1)),
    assertz(inDungeon(0)),

    retract(inBattle(_)),
    assertz(inBattle(0)),
    write('You wake up, all disoriented and hazy, at the entrance of the dungeon.'), nl.