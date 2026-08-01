function beyond_the_clouds:testing/cleanup

say [t01] Выход вниз пешком, без элитры.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
gamemode survival

say Мне надо шагнуть вперёд с края острова и падать вниз, ничего не делая.
say Ожидаю: около Y-48 меня перенесёт в оверворлд на Y500, дальше медленное падение и я не разобьюсь.
say Ветка leave/alone_with_effects.
