/* Character */
/* Berisi segala fungsi dan status yang berkaitan dengan pemain  */

/* Dynamic variable */
% Current Status dari pemain (c = current)
:- dynamic(cjob/1).             % Job
:- dynamic(clevel/1).           % Level
:- dynamic(cattack/1).          % Attack
:- dynamic(cspecialattack/1).   % Special Attack
:- dynamic(chealth/1).          % Health
:- dynamic(cdefense/1).         % Defense
:- dynamic(cgold/1).            % Gold
:- dynamic(cexp/1).             % EXP
:- dynamic(cweapon/1).          % Equipped weapon
:- dynamic(carmor/1).           % Equipped armor

% Job (ID, Name)
job_stat(1, 'Swordsman').
job_stat(2, 'Archer').
job_stat(3, 'Sorcerer').

% Level (Level, Required XP)
level_stat(1, 100).
level_stat(2, 200).
level_stat(3, 300).
level_stat(4, 400).
level_stat(5, 500).
level_stat(6, 600).
level_stat(7, 700).
level_stat(8, 8000).
level_stat(9, 900).
level_stat(10, 1000).

% Attack (Job, Value)
attack_stat(1, 70).
attack_stat(2, 60).
attack_stat(3, 90).

% Special attack (Job, Value)
specialattack_stat(1, 100).
specialattack_stat(2, 130).
specialattack_stat(3, 160).

% Health (Job, Value)
health_stat(1, 200).
health_stat(2, 180).
health_stat(3, 150).

% Defense (Job, Value)
defense_stat(1, 90).
defense_stat(2, 80).
defense_stat(3, 50).