/* Help */
/* Menampilkan command-command yang tersedia */

help :-
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                               Available Commands                             %'),nl,
    write('% 1. start.      : untuk memulai petualanganmu                                 %'),nl,
    write('% 2. map.        : menampilkan peta                                            %'),nl,
    write('% 3. status.     : menampilkan kondisimu terkini                               %'),nl,
    write('% 4. w.          : gerak ke utara 1 langkah                                    %'),nl,
    write('% 5. s.          : gerak ke selatan 1 langkah                                  %'),nl,
    write('% 6. d.          : gerak ke ke timur 1 langkah                                 %'),nl,
    write('% 7. a.          : gerak ke barat 1 langkah                                    %'),nl,
    write('% 8. inventory.  : menampilkan inventory anda                                  %'),nl,
    write('% 10. help.      : menampilkan segala bantuan                                  %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                              In-Battle Commands                              %'),nl,
    write('% 1. attack.        : menyerang lawan dengan attack biasa                      %'),nl,
    write('% 2. specialAttack. : menyerang lawan dengan special attack                    %'),nl,
    write('% 3. usePotion.     : menggunakan potion yang ada untuk heal HP                %'),nl,
    write('% 4. run.           : coba meninggalkan battle                                 %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,

    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                              Inventory Commands                              %'),nl,
    write('% 1. delete_item(ItemID).    : membuang 1 item sesuai IDnya                    %'),nl,
    write('% 2. equip_weapon(ItemID).   : mengequip weapon sesuai IDnya                   %'),nl,
    write('% 3. equip_armor(ItemID).    : mengequip armor sesuai IDnya                    %'),nl,
    write('% 4. use_potion(ItemID).     : memakai potion untuk merestore health           %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,

    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                          Special Location Commands                           %'),nl,
    write('% SHOP                                                                         %'),nl,
    write('% 1. shop.        : memasuki dan menampilkan menu shop                         %'),nl,
    write('% 2. exitShop.    : keluar dari shop                                           %'),nl,
    write('%                                                                              %'),nl,
    write('% DUNGEON                                                                      %'),nl,
    write('% 1. shop.        : memasuki dan menampilkan menu shop                         %'),nl,
    write('% 2. exitShop.    : keluar dari shop                                           %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl.