function beyond_the_clouds:testing/cleanup

say [t03] Выход вниз на лошади.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 103 1000 -90 0
execute at @s run summon minecraft:horse ~1 ~ ~ {Tags:["btc.test"],Tame:1b,Temper:100,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:horse,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Мне надо доскакать до края острова и спрыгнуть с него верхом.
say Ожидаю: прибудем ВЕРХОМ, у обоих slow falling. Ветка leave/on_vehicle_with_effects.
