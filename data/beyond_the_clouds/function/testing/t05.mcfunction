function beyond_the_clouds:testing/cleanup

say [t05] Выход вниз на осёдланной свинье. Свинья управляется клиентом - важный случай.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 103 1000 -90 0
execute at @s run summon minecraft:pig ~1 ~ ~ {Tags:["btc.test"],equipment:{saddle:{id:"minecraft:saddle",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:pig,tag=btc.test,limit=1,sort=nearest]
give @s minecraft:carrot_on_a_stick
gamemode survival

say Мне надо взять морковь на палке в руку, доехать до края острова и свалиться с него верхом.
say Ожидаю: прибудем ВЕРХОМ. Отдельно смотрю, не дёргает ли свинью обратно вверх после переноса.
