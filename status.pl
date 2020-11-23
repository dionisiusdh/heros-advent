/* Status */
/* Berisi informasi status pemain  */

% Status
status :-
    start_flag(true),

    % Getting character stats
    cjob(Job),
    job_stat(Job, JobName),
    clevel(Level),
    Level2 is Level+1,
    level_stat(Level2, RequiredExp),
    cattack(Attack),
    % cspecialattack(SpecialAttack),
    chealth(Health),
    cmaxhealth(MaxHP),
    cdefense(Defense),
    cgold(Gold),
    cexp(Exp),

    cweapon(Weapon),
    carmor(Armor),
    item_name(Weapon, WeaponName),
    item_name(Armor, ArmorName),
    weapon_stat(Weapon, WeaponStat),
    armor_stat(Armor, ArmorStat),

    % Output
    write('Your status: '), nl,
    write('Job: '), write(JobName), nl,
    write('Level: '), write(Level), nl,
    write('Health: '), write(Health), write('/'), write(MaxHP), nl,
    write('Attack: '), write(Attack), write(' + '), write(WeaponStat), nl,
    write('Defense: '), write(Defense), write(' + '), write(ArmorStat), nl,
    write('Exp: '), write(Exp), write('/'), write(RequiredExp), nl,
    write('Gold: '), write(Gold), nl,
    write('Your current weapon: '), write(WeaponName), nl,
    write('Your current armor: '), write(ArmorName), nl.

status :-
    start_flag(false),
    !,
    write('Please start the game. Type \'start.\'').