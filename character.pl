/* Character */
/* Berisi segala fungsi dan status yang berkaitan dengan pemain  */

% c = current
:- dynamic(cjob/1).
:- dynamic(cattack/1).
:- dynamic(cspecialattack/1).
:- dynamic(chealth/1).
:- dynamic(cdefense/1).
:- dynamic(cmoney/1).
:- dynamic(cweapon/1).
:- dynamic(carmor/1).

% Job
job_stat(1, 'Swordsman').
job_stat(2, 'Archer').
job_stat(3, 'Sorcerer').

% Attack
attack_stat(1, 70).
attack_stat(2, 60).
attack_stat(3, 90).

% Special attack
specialattack_stat(1, 100).
specialattack_stat(2, 130).
specialattack_stat(3, 160).

% Health
health_stat(1, 200).
health_stat(2, 180).
health_stat(3, 150).

% Defense
defense_stat(1, 90).
defense_stat(2, 80).
defense_stat(3, 50).

% Status
status :-
    % Getting character stats
    cjob(Name),
    cattack(Attack),
    cspecialattack(SpecialAttack),
    chealth(Health),
    cdefense(Defense),

    % Output
    write('Your job: '), write(Name), nl,
    write('Your current attack: '), write(Attack), nl,
    write('Your current special attack: '), write(SpecialAttack), nl,
    write('Your current health: '), write(Health), nl,
    write('Your current defense: '), write(Defense), nl.

