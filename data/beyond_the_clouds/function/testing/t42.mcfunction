function beyond_the_clouds:testing/cleanup

say [t42] Мультиплеер: наблюдатель выходит из игры в момент моего перехода.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
gamemode survival

say Мне надо шагнуть с края и падать, а наблюдателю выйти из игры прямо в этот момент.
say Ожидаю: мой переход завершается корректно, в логе нет ошибок.
