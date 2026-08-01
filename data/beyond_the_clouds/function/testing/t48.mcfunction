function beyond_the_clouds:testing/cleanup

say [t48] Стрела летит вниз сквозь дно облаков. Стреляю сам.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
give @s minecraft:bow
give @s minecraft:arrow 64
gamemode survival

say Мне надо встать на краю, посмотреть вниз и выстрелить в пустоту.
say Ожидаю: стрела перенесётся или исчезнет, но БЕЗ ошибок в логе.
