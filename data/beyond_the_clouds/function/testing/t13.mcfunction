function beyond_the_clouds:testing/cleanup

say [t13] Вниз падает дропнутый предмет. Бросаю его с края сам.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
give @s minecraft:diamond 5
gamemode survival

say Мне надо встать на самом краю и выбросить алмазы вниз клавишей выброса.
say Ожидаю: перенесутся в оверворлд, в логе нет ошибок. Ветка leave/alone_with_effects.
say Сферы опыта идут по тому же пути, отдельно их не проверяю - они притягиваются ко мне и вниз не улетят.
say Мне надо спуститься следом на 1000/1000 и поискать алмазы.
