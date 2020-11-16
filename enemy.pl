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
enemy_name(4, 'Boss').

/*Enemy HP*/
/*enemy_hp(ID,HP)*/
enemy_hp(1,100).
enemy_hp(2,200).
enemy_hp(3,300).
enemy_hp(4,1000).

/*Enemy Attack*/
/*enemy_hp(ID,Attack)*/
enemy_attack(1,25).
enemy_attack(2,50).
enemy_attack(3,80).
enemy_attack(4,200).

/*Enemy Defense*/
/*enemy_hp(ID,Defense)*/
enemy_defense(1,15).
enemy_defense(1,25).
enemy_defense(1,40).
enemy_defense(1,150).

generate_random_enemy :-
    random(1, 3, EnemyID),
    retract(cenemyid(_)),
    assertz(cenemyid(EnemyID)),

    random(1, 3, Level),
    retract(cenemylevel(_)),
    assertz(cenemylevel(Level)),

    enemy_hp(EnemyID, EnemyHP),
    EnemyHP2 is EnemyHP * Level,
    retract(cenemyhp(_)),
    assertz(cenemyhp(EnemyHP2)),

    enemy_attack(EnemyID, EnemyAttack),
    EnemyAttack2 is EnemyAttack * Level,
    retract(cenemyattack(_)),
    assertz(cenemyattack(EnemyAttack2)).

    enemy_defense(EnemyID, EnemyDefense),
    EnemyDefense2 is EnemyDefense * Level,
    retract(cenemydefense(_)),
    assertz(cenemydefense(EnemyDefense2)).