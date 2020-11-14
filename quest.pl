/* Quest */
/* Berisi segala fungsi yang berkaitan dengan quest  */

/* Dynamic variable */
% inQuest : Apakah pemain sedang berada di lokasi quest. 0 = false, 1 = true.
:- dynamic(inQuest/1).

quest :-
    % Cek apakah player berada di posisi pengambilan quest
    object(X, Y, 'P'),
    object(XQuest, YQuest, 'Q'),
    X == XQuest,
    Y == YQuest,

    retract(inQuest(0)),
    assertz(inQuest(1)).