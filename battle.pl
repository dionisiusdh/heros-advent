/* Battle */
/* Tampilan dan fungsi-fungsi battle */

/* Dynamic Variable */
:- dynamic(inBattle/1).         % Apakah player sedang berada di dalam battle
:- dynamic(playerTurn/1).       % 0 : Giliran enemy, 1 : Giliran player

battle :-
    \+ inBattle(0),
    cenemyid(EnemyID),
    enemy_name(EnemyID, EnemyName),
    nl, 
    write('You found a '),
    write(EnemyName), nl,

    cenemylevel(EnemyLevel),
    write('Level: '),
    write(EnemyLevel), nl,
    
    cenemyhp(EnemyHP),
    write('Health: '),
    write(EnemyHP), nl,
    
    cenemyattack(EnemyAttack),
    write('Attack: '),
    write(EnemyAttack), nl,
    
    cenemydefense(EnemyDefense),
    write('Defense: '),
    write(EnemyDefense), nl,
    
    write('What will you do ?'), nl, nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                              In-Battle Commands                              %'),nl,
    write('% 1. attack.        : menyerang lawan dengan attack biasa                      %'),nl,
    write('% 2. specialAttack. : menyerang lawan dengan special attack                    %'),nl,
    write('% 3. usePotion.     : menggunakan potion yang ada untuk heal HP                %'),nl,
    write('% 4. run.           : coba meninggalkan battle                                 %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl.

run :-
    % Randomize run status
    random(1, 11, RandomRunStatus),
    RandomRunStatus =< 4,
    write('You successfully ran away.'),
    retract(inBattle(_)),
    assertz(inBattle(0)).

run :-
    write('Failed to run away').