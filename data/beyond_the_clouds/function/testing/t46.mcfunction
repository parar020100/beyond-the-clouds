function beyond_the_clouds:testing/cleanup

say [t46] Перезаход в мир сразу после перехода.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
gamemode survival

say Мне надо шагнуть с края, после прибытия выйти в меню и зайти обратно, потом вызвать check_state.
say Ожидаю: ничего не залипло, forceload пуст.
