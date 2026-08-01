function beyond_the_clouds:testing/cleanup

say [t04] Выход вниз на верблюде.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 103 1000 -90 0
execute at @s run summon minecraft:camel ~1 ~ ~ {Tags:["btc.test"],Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:camel,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Мне надо доехать до края острова и спрыгнуть с него верхом.
say Ожидаю: прибудем ВЕРХОМ, у обоих slow falling.
