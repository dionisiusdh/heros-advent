/* Character */
/* Berisi segala fungsi dan status yang berkaitan dengan pemain  */

/* Dynamic variable */
% Current Status dari pemain (c = current)
:- dynamic(cjob/1).             % Job
:- dynamic(clevel/1).           % Level
:- dynamic(cattack/1).          % Attack
:- dynamic(cspecialattack/1).   % Special Attack
:- dynamic(chealth/1).          % Health
:- dynamic(cmaxhealth/1).       % Max Health
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
level_stat(11, 1000).
level_stat(12, 1100).
level_stat(13, 1200).
level_stat(14, 1300).
level_stat(15, 1400).
level_stat(16, 1500).
level_stat(17, 1600).
level_stat(18, 1700).
level_stat(19, 1800).
level_stat(20, 1900).
level_stat(21, 2000).
level_stat(22, 2100).
level_stat(23, 2200).
level_stat(24, 2300).
level_stat(25, 2400).
level_stat(26, 2500).
level_stat(27, 2600).
level_stat(28, 2700).
level_stat(29, 2800).
level_stat(30, 2900).
level_stat(31, 3000).

% Attack (Job, Value)
attack_stat(1, 10000).
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
    cexp(EXP),
    level_stat(_,ReqEXP),
    ReqEXP > EXP, !,

    clevel(CurrX),
    level_stat(X1,ReqEXP),
    X is X1-1,
    retract(clevel(CurrX)),
    assertz(clevel(X)),

    cjob(Job),
    % Attack Level Bonus
    attack_stat(Job,CleanAtk),
    TotalAtk is CleanAtk+((X-1)*15),
    retract(cattack(_)),
    assertz(cattack(TotalAtk)),

    % Special attack Level Bonus
    specialattack_stat(Job,CleanSpAtk),
    TotalSpAtk is CleanSpAtk + ((X-1)*10),
    retract(cspecialattack(_)),
    assertz(cspecialattack(TotalSpAtk)),

    % Defense Level Bonus
    defense_stat(Job,CleanDef),
    TotalDef is CleanDef + ((X-1)*15),
    retract(cdefense(_)),
    assertz(cdefense(TotalDef)),

    % HP Level Bonus
    health_stat(Job,CleanHP),
    TotalHP is CleanHP + ((X-1)*25),
    retract(cmaxhealth(_)),
    assertz(cmaxhealth(TotalHP)).

add_exp(X) :-
    % Adding Exp
    cexp(CurrentExp),
    AddedExp is CurrentExp+X,
    retract(cexp(CurrentExp)),
    assertz(cexp(AddedExp)).