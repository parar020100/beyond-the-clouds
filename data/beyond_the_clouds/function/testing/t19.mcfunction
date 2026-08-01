function beyond_the_clouds:testing/cleanup

say [t19] Вход вверх в лодке, НАД ОСТРОВОМ.
say Живого способа поднять лодку выше Y512 в игре нет вообще - лодка не принимает зелья.
say Поэтому появляюсь в лодке сразу за порогом: телепорт лодки высаживает пассажира.

gamemode creative
execute in minecraft:overworld run tp @s 1000 520 1000
execute at @s run summon minecraft:oak_boat ~ ~ ~ {Tags:["btc.test"]}
execute at @s run ride @s mount @e[type=minecraft:oak_boat,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Ожидаю: появление НАД ОСТРОВОМ в лодке. Раньше эта ветка не работала вовсе - лодка оставалась на Y0.
