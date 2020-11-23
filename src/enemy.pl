/* File : enemy.pl */
/* Place to store Enemy Facts */

:- dynamic(cenemyid/1).
:- dynamic(cenemylevel/1).
:- dynamic(cenemyhp/1).
:- dynamic(cenemyattack/1).
:- dynamic(cenemydefense/1).

/*ID and Name*/
/*enemy_name(ID, Name)*/
enemy_name(1, 'Slime').
enemy_name(2, 'Goblin').
enemy_name(3, 'Wolf').
enemy_name(4, 'Dragon').

/*Enemy HP*/
/*enemy_hp(ID,HP)*/
enemy_hp(1,25).
enemy_hp(2,75).
enemy_hp(3,150).
enemy_hp(4,900).

/*Enemy Attack*/
/*enemy_hp(ID,Attack)*/
enemy_attack(1,10).
enemy_attack(2,20).
enemy_attack(3,40).
enemy_attack(4,100).

/*Enemy Defense*/
/*enemy_hp(ID,Defense)*/
enemy_defense(1,5).
enemy_defense(2,10).
enemy_defense(3,20).
enemy_defense(4,70).

generate_random_enemy :-
    random(1, 4, EnemyID),
    retract(cenemyid(_)),
    assertz(cenemyid(EnemyID)),

    % Biar ga terlalu OP
    clevel(PlayerLevel),
    ( PlayerLevel =< 5 -> 
        random(1, 3, Level),
        retract(cenemylevel(_)),
        assertz(cenemylevel(Level))
    ;
        random(1, 4, Level),
        retract(cenemylevel(_)),
        assertz(cenemylevel(Level))
    ),

    enemy_hp(EnemyID, EnemyHP),
    EnemyHP2 is EnemyHP * Level,
    retract(cenemyhp(_)),
    assertz(cenemyhp(EnemyHP2)),

    enemy_attack(EnemyID, EnemyAttack),
    EnemyAttack2 is EnemyAttack * Level,
    retract(cenemyattack(_)),
    assertz(cenemyattack(EnemyAttack2)),

    enemy_defense(EnemyID, EnemyDefense),
    EnemyDefense2 is EnemyDefense * Level,
    retract(cenemydefense(_)),
    assertz(cenemydefense(EnemyDefense2)).