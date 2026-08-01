function beyond_the_clouds:testing/cleanup

say [t25] Вход вверх на верблюде, НАД ПУСТОТОЙ. Появляюсь верхом сразу за порогом.

gamemode creative
execute in minecraft:overworld run tp @s 1000 520 1100
execute at @s run summon minecraft:camel ~ ~ ~ {Tags:["btc.test"],Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:camel,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Ожидаю: подъём из пустоты вдвоём. Ветка enter/on_vehicle/rise_from_void.
