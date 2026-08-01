function beyond_the_clouds:testing/cleanup

say [t17] Вход вверх на верблюде, НАД ОСТРОВОМ. Появляюсь верхом сразу за порогом.

gamemode creative
execute in minecraft:overworld run tp @s 1000 520 1000
execute at @s run summon minecraft:camel ~ ~ ~ {Tags:["btc.test"],Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:camel,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Ожидаю: появление над островом ВЕРХОМ, у обоих slow falling.
