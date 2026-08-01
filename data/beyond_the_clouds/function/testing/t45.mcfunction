function beyond_the_clouds:testing/cleanup

say [t45] Перезагрузка в момент открытого окна эффектов.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
gamemode survival

say Мне надо шагнуть с края, а сразу после прибытия, пока действует slow falling, выполнить /reload.
say Потом вызвать check_state. Ожидаю: misc/load почистил расписание и метки, всё пусто.
