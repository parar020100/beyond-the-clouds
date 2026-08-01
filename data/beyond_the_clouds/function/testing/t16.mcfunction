function beyond_the_clouds:testing/cleanup

say [t16] Вход вверх на лошади, НАД ОСТРОВОМ.
say Живого способа поднять лошадь выше Y512 нет - появляюсь верхом сразу за порогом.

gamemode creative
execute in minecraft:overworld run tp @s 1000 520 1000
execute at @s run summon minecraft:horse ~ ~ ~ {Tags:["btc.test"],Tame:1b,Temper:100,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:horse,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Ожидаю: появление над островом ВЕРХОМ, у обоих slow falling. Ветка enter/on_vehicle/land_above_island.
