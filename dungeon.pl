/* Dungeon */
/* Berisi segala fungsi yang berkaitan dengan dungeon  */

/* Dynamic variable */
% inDungeon : Apakah pemain sedang berada di lokasi Dungeon. 0 = false, 1 = true.
:- dynamic(inDungeon/1).

dungeon :-
    % Cek apakah player berada di posisi dungeon
    object(X, Y, 'P'),
    object(XDungeon, YDungeon, 'D'),
    X == XDungeon,
    Y == YDungeon,

    retract(inDungeon(0)),
    assertz(inDungeon(1)).