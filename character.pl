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
level_stat(1, 0).
level_stat(2, 100).
level_stat(3, 200).
level_stat(4, 300).
level_stat(5, 400).
level_stat(6, 500).
level_stat(7, 600).
level_stat(8, 700).
level_stat(9, 800).
level_stat(10, 900).

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

% Leveling up
level_up :-  
    clevel(X),
    XLevelUp is X + 1,
    retract(clevel(X)),
    assertz(clevel(XLevelUp)),

    % Attack Level Bonus
    TotalAtk is CleanAtk + ((X-1)*15),
    retract(cattack(CleanAtk)),
    assertz(cattack(TotalAtk)),

    % Special attack Level Bonus
    TotalSpAtk is CleanSpAtk + ((X-1)*10),
    retract(cspecialattack(CleanSpAtk)),
    assertz(cspecialattack(TotalSpAtk)),

    % Defense Level Bonus
    TotalDef is CleanDef + ((X-1)*15),
    retract(cattack(CleanDef)),
    assertz(cattack(TotalDef)),

    % HP Level Bonus
    TotalHP is CleanHP + ((X-1)*25),
    retract(cattack(CleanHP)),
    assertz(cattack(TotalHP)).

add_exp(X) :-
    % Adding Exp
    cexp(CurrentExp),
    AddedExp is CurrentExp + X,
    retract(cexp(CurrentExp)),
    assertz(cexp(AddedExp)),

    % Updating Level
    clevel(OldLevel),
    level_stat(NewLevel,AddedExp),
    retract(clevel(OldLevel)),
    assertz(clevel(NewLevel)).