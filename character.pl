/* Character */
/* Berisi segala fungsi dan status yang berkaitan dengan pemain  */

:- dynamic(defense_stat).
:- dynamic(attack_stat).
:- dynamic(specialattack_stat).
:- dynamic(defense_stat).

% Job
job_stat(1, 'Swordsman').
job_stat(2, 'Archer').
job_stat(3, 'Sorcerer').

% Health
defense_stat(1, 200).
defense_stat(1, 180).
defense_stat(1, 150).

% Attack
attack_stat(1, 70).
attack_stat(2, 60).
attack_stat(3, 90).

% Special attack
specialattack_stat(1, 100).
specialattack_stat(1, 130).
specialattack_stat(1, 160).

% Defense
defense_stat(1, 90).
defense_stat(2, 80).
defense_stat(3, 50).


