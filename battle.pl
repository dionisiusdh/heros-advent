/* Battle */
/* Tampilan dan fungsi-fungsi battle */

/* Dynamic Variable */
:- dynamic(inBattle/1).         % Apakah player sedang berada di dalam battle
:- dynamic(cooldown/1).         % 0 : cooldown 0 turn = can use special, 1: cooldown 1 turn = wait 1 more turn, dst

battle :-
    \+ inBattle(0),
    cenemyid(EnemyID),
    enemy_name(EnemyID, EnemyName), nl, 

    printPicture,

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
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,

    retract(cooldown(_)),
    assertz(cooldown(0)).

% Print monster portrait function
printPicture :-
    cenemyid(1), !,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,  
    write('%                                                                              %'),nl,                                                                                                                                   
    write('%                                       ,,,,,,,,                               %'),nl, 
    write('%                                     ,|||````||||                             %'),nl, 
    write('%                               ,,,,|||||       ||,                            %'),nl, 
    write('%                            ,||||```````       `||                            %'),nl, 
    write('%                         ,|||`                 |||,                           %'),nl, 
    write('%                          ||`     ....,          `|||                         %'),nl, 
    write('%                          ||     ::::::::          |||,                       %'),nl, 
    write('%                          ||     :::::::\'     ||    ``|||,                    %'),nl, 
    write('%                          ||,     :::::\'               `|||                   %'),nl, 
    write('%                          `||,                           |||                  %'),nl, 
    write('%                           `|||,       ||          ||    ,||                  %'),nl, 
    write('%                             `||                        |||`                  %'),nl, 
    write('%                              ||                   ,,,||||                    %'),nl, 
    write('%                              ||              ,||||||```                      %'),nl, 
    write('%                             ,||         ,,|||||`                             %'),nl, 
    write('%                            ,||`   ||   |||`                                  %'),nl, 
    write('%                           |||`         ||                                    %'),nl, 
    write('%                          ,||           ||                                    %'),nl, 
    write('%                          ||`           ||                                    %'),nl, 
    write('%                          |||,         |||                                    %'),nl, 
    write('%                           `|||,,    ,|||                                     %'),nl, 
    write('%                             ``||||||||`                                      %'),nl, 
    write('%                                                                              %'),nl,  
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,nl.
    
printPicture :-
    cenemyid(2), !,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                             ,,\'``````````````\',,                             %'),nl,
    write('%                          ,\'`                   `\',                           %'),nl,
    write('%                        ,\'                         \',                         %'),nl,
    write('%                      ,\'          ;       ;          \',                       %'),nl,
    write('%         (           ;             ;     ;             ;     (                %'),nl,
    write('%          )         ;              ;     ;              ;     )               %'),nl,
    write('%         (         ;                ;   ;                ;   (                %'),nl,
    write('%          )    ;   ;    ,,\'```\',,,   ; ;   ,,,\'```\',,    ;   ;                %'),nl,
    write('%         (    ; \',;   \'`          `\',   ,\'`          `\'   ;,\' ;               %'),nl,
    write('%          )  ; ;`,`\',  _--~~~~--__   \' \'   __--~~~~--_  ,\'`,\'; ;     )        %'),nl,
    write('%         (    ; `,\' ; :  /       \\~~-___-~~/       \\  : ; \',\' ;     (         %'),nl,
    write('%    )     )   )\',  ;   -_\\  o    /  \'   \'  \\    o  /_-   ;  ,\'       )   (    %'),nl,
    write('%   (     (   (   `;      ~-____--~\'       \'~--____-~      ;\'  )     (     )   %'),nl,
    write('%    )     )   )   ;            ,`;,,,   ,,,;\',            ;  (       )   (    %'),nl,
    write('%   (     (   (  .  ;        ,\'`  (__ \'_\' __)  `\',        ;  . )     (     )   %'),nl,
    write('%    )     \\/ ,".). \';    ,\'`        ~~ ~~        `\',    ;  .(.", \\/  )   (    %'),nl,
    write('%   (   , ,\'|// / (/ ,;  \'        _--~~-~~--_        \'  ;, \\)    \\|\', ,    )   %'),nl,
    write('%   ,)  , \\/ \\|  \\\\,/  ;;       ,; |_| | |_| ;,       ;;  \\,//  |/ \\/ ,   ,    %'),nl,
    write('%  ",   .| \\_ |\\/ |#\\_/;       ;_| : `~\'~\' : |_;       ;\\_/#| \\/| _/ |.   ,"   %'),nl,
    write('%  #(,\'  )  \\\\\\#\\ \\##/)#;     :  `\\/       \\/   :     ;#(\\##/ /#///  (  \',)# , %'),nl,
    write('%  | ) | \\ |/ /#/ |#( \\; ;     :               ;     ; ;/ )#| \\#\\ \\| / | ( |)  %'),nl,
    write('%  \\ |.\\\\ |\\_/#| /#),,`   ;     ;./\\_     _/\\.;     ;   `,,(#\\ |#\\_/| //.| / , %'),nl,
    write('%   \\\\_/# |#\\##/,,\'`       ;     ~~--|~|~|--~~     ;       `\',,\\##/#| #\\_// \\/ %'),nl,
    write('%    ##/#  #,,\'`            ;        ~~~~~        ;            `\',,#  #\\##  // %'),nl,
    write('%  ####@,,\'`                 `\',               ,\'`                 `\',,@####|  %'),nl,
    write('%  #,,\'`                        `\',         ,\'`                        `\',,### %'),nl,
    write('%  \'                               ~~-----~~                               `\'  %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,nl.

printPicture :-
    cenemyid(3), !,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                                            __                                %'),nl, 
    write('%                                          .d$$b                               %'),nl, 
    write('%                                        .\' TO$;\\                              %'),nl, 
    write('%                                       /  : TP._;                             %'),nl, 
    write('%                                      / _.;  :Tb|                             %'),nl, 
    write('%                                     /   /   ;j$j                             %'),nl, 
    write('%                                 _.-"       d$$$$                             %'),nl, 
    write('%                               .\' ..       d$$$$;                             %'),nl, 
    write('%                              /  /P\'      d$$$$P. |\\                          %'),nl, 
    write('%                             /   "      .d$$$P\' |\\^"l                         %'),nl, 
    write('%                           .\'           `T$P^"""""  :                         %'),nl, 
    write('%                       ._.\'      _.\'                ;                         %'),nl, 
    write('%                    `-.-".-\'-\' ._.       _.-"    .-"                          %'),nl, 
    write('%                  `.-" _____  ._              .-"                             %'),nl, 
    write('%                 -(.g$$$$$$$b.              .\'                                %'),nl, 
    write('%                   ""^^T$$$P^)            .(:                                 %'),nl, 
    write('%                     _/  -"  /.\'         /:/;                                 %'),nl, 
    write('%                  ._.\'-\'`-\'  ")/         /;/;                                 %'),nl, 
    write('%               `-.-"..--""   " /         /  ;                                 %'),nl, 
    write('%              .-" ..--""        -\'          :                                 %'),nl, 
    write('%              ..--""--.-"         (\\      .-(\\                                %'),nl, 
    write('%                ..--""              `-\\(\\/;`                                  %'),nl, 
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,nl.

printPicture :-
    !.

% Run from battle
run :-
    \+ inDungeon(0), !,
    nl,write('You can\'t run from me puny adventurer!'),nl,
    enemy_check.

run :-
    \+ inDungeon(1),
    % Randomize run status
    random(1, 11, RandomRunStatus),
    RandomRunStatus =< 4,
    write('You successfully ran away.'),
    retract(inBattle(_)),
    assertz(inBattle(0)).

run :-
    \+ inDungeon(1),
    write('Failed to run away'),nl,
    enemy_check.

% Stats Calculator
attack_dealt(AggroAtk,VictimDef,Damage) :-
    Damage is AggroAtk*(100/(100+VictimDef)).

spattack_dealt(AggroAtk,VictimDef,Damage) :-
    LowerBound is AggroAtk/1.5,
    random(LowerBound,AggroAtk,NewAggroAtk),
    Damage is NewAggroAtk*(300/(300+VictimDef)).

exp_gained(Def,Exp) :- !,
    Exp is (Def*3).

% Monster Death Check Function
enemy_check :-
    cenemyhp(HP),
    HP =< 0, !,

    % Query terhadap stats
    cenemydefense(Def),

    % Penggantian Exp baru
    exp_gained(Def,ExpGain),
    add_exp(ExpGain),
    nl,write('You earn '), write(ExpGain), write(' exp'),nl, !,

    retract(inBattle(_)),
    assertz(inBattle(0)), !,

    % Mengupgrade level jika level melebihi batas exp
    level_up,
    dungeon_winner.

enemy_check :- !,
    opponent_turn.

% Check winner
dungeon_winner :-
    \+ inDungeon(1), !.

dungeon_winner :-
    \+ inDungeon(0), !,
    nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                                                        _____------------_____%'),nl,
    write('%                                                    ._--\':::::\'-------____    %'),nl,
    write('%                .___------__       /-.._.    _---_ \'|:::::::::::::::::::::----%'),nl,
    write('%        ._--\'.---::::::/ `      \\ .-. \'-\'\' *__*|/::::::::::::::::::::::::::   %'),nl,
    write('%    .__-\'  _-\'::::::::/ ._------_| \'_\'  __--\' _\'/:::::::::::::::::::::::::::  %'),nl,
    write('%_--\'    _-\'::::::::::|.\'  ._----_\\    -\'  ._-\'::::::::::::::::::::::::::::::  %'),nl,
    write('%    _-\':::::::::::::\\  .\'       /  .__--\' -\':::::::::_--_:::::::::::.------   %'),nl,
    write('%_-\'::::::::::::::::::-_|       /    /   /::::::::::/      \\:::::::/           %'),nl,
    write('%\'::::::::::::::::::::::::----__-   .   .  |.--_:::/          \\:::/            %'),nl,
    write('%.----_::::::::::::::::::::/                \\  \\\\ \\/             \\/            %'),nl,
    write('%| ._.-_\'-_:::.----.:::.:. . .    .         . |  \\\\                            %'),nl,
    write('%_ -__ -.\\  \\ .-.----..----_. .----. .-_____-.----:|\\                     _    %'),nl, 
    write('%    $$\\     $$\\                         $$\\      $$\\                          %'),nl,
    write('%    \\$$\\   $$  |                        $$ | $\\  $$ |                         %'),nl,
    write('%     \\$$\\ $$  /$$$$$$\\  $$\\   $$\\       $$ |$$$\\ $$ | $$$$$$\\  $$$$$$$\\       %'),nl,
    write('%      \\$$$$  /$$  __$$\\ $$ |  $$ |      $$ $$ $$\\$$ |$$  __$$\\ $$  __$$\\      %'),nl,
    write('%       \\$$  / $$ /  $$ |$$ |  $$ |      $$$$  _$$$$ |$$ /  $$ |$$ |  $$ |     %'),nl,
    write('%        $$ |  $$ |  $$ |$$ |  $$ |      $$$  / \\$$$ |$$ |  $$ |$$ |  $$ |     %'),nl,
    write('%        $$ |  \\$$$$$$  |\\$$$$$$  |      $$  /   \\$$ |\\$$$$$$  |$$ |  $$ |     %'),nl, 
    write('%        \\__|   \\______/  \\______/       \\__/     \\__| \\______/ \\__|  \\__|     %'),nl,
    write('%                                                                              %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,

    % End game
    retract(inBattle(_)),
    assertz(inBattle(0)), !,
    retract(start_flag(true)),
    assertz(start_flag(false)),
    nl,write('Game over, please restart the game. Type \'start.\''), !, fail.                                                     

% Player Death Check Function
player_check :-
    chealth(HP),
    HP =< 0, !,

    % End game
    retract(inBattle(_)),
    assertz(inBattle(0)), !,
    retract(start_flag(true)),
    assertz(start_flag(false)),
    nl,write('Game over, please restart the game. Type \'start.\''), !, fail.

player_check :- !.

% Monster Attack
opponent_turn :- !,
    % Query terhadap stats
    chealth(HP),
    cdefense(Def),
    cenemyid(ID),
    enemy_name(ID,Name),
    
    % Query weapon and armor
    carmor(Armor),
    armor_stat(Armor, ArmorStat),
    DefNew is Def+ArmorStat,

    % Randomize attack and special attack
    cenemyattack(Atk),
    random(1,6,SpecialChance),
    attack_chance(SpecialChance,SpecialMulti),
    AtkChance is Atk*SpecialMulti,

    % Penggantian HP baru
    attack_dealt(AtkChance,DefNew,Damage),
    CalcHP is HP-Damage,
    retract(chealth(HP)),
    assertz(chealth(CalcHP)),

    nl, write(Name), write(' deal '),write(Damage), write(' damage'),nl,
    player_check.

% Monster attack/special attack choice
attack_chance(SpecialChance,SpecialMulti) :-
    \+ SpecialChance == 4, !,
    SpecialMulti is 1.

attack_chance(SpecialChance,SpecialMulti) :- !,
    SpecialMulti is 1.5,

    cenemyid(ID),
    enemy_name(ID,Name),
    nl, write(Name), write(' used its special attack.').

% Player Attack
attack :-
    \+ inBattle(0), !,

    % Kurangi cooldown
    subtract_cooldown,

    % Melakukan query stats
    cenemyhp(HP),
    cattack(Atk),
    cenemydefense(Def),

    % Query weapon and armor
    cweapon(Weapon),
    weapon_stat(Weapon, WeaponStat),
    AtkNew is Atk+WeaponStat,

    % Penggantian HP baru
    attack_dealt(AtkNew,Def,Damage),
    CalcHP is HP-Damage,
    retract(cenemyhp(HP)),
    assertz(cenemyhp(CalcHP)),
    
    nl, write('You deal '), write(Damage), write(' damage'),nl,
    enemy_check.

% Fungsi cluster pengurangan cooldown
subtract_cooldown :-
    cooldown(0), !.

subtract_cooldown :-
    \+ cooldown(0), !,

    % Query dan kurangi nilai
    cooldown(X),
    XNew is X-1,
    retract(cooldown(X)),
    assertz(cooldown(XNew)).    

% Player Special Attack
specialAttack :-
    % Cek jika masih cooldown
    cooldown(0), !,
    \+ inBattle(0), !,

    % Menandakan special telah digunakan
    retract(cooldown(0)),
    assertz(cooldown(2)),

    % Melakukan query stats
    cenemyhp(HP),
    cspecialattack(Atk),
    cenemydefense(Def),

    % Penggantian HP baru
    spattack_dealt(Atk,Def,Damage),
    CalcHP is HP-Damage,
    retract(cenemyhp(HP)),
    assertz(cenemyhp(CalcHP)),
    
    nl,write('You used your special attack.'),nl,
    write('You deal '), write(Damage), write(' damage'),nl,
    enemy_check.

specialAttack :-
    \+ inBattle(0), !,

    % Kembali player turn
    nl, write('You can only use special attacks once every three turns! Re-enter another in-battle command.'),
    player_check.