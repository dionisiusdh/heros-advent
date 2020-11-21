/* Encounter */
/* Mekanisme bertemu musuh secara acak */

encounter :-  
    % Randomize encounter status
    random(1, 4, RandomEncounterStatus),
    RandomEncounterStatus == 2,

    % If encounter, generate random enemy
    generate_random_enemy,

    % Battle
    retract(inBattle(_)),
    assertz(inBattle(1)),
    battle.
