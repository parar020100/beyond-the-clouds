function beyond_the_clouds:testing/cleanup

say [t06] Выход вниз на happy ghast. Полностью живой сценарий - лечу сам.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000 -90 0
execute at @s run summon minecraft:happy_ghast ~2 ~1 ~ {Tags:["btc.test"],IsBaby:0b,equipment:{body:{id:"minecraft:white_harness",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:happy_ghast,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Мне надо отлететь на гасте в сторону от острова и спуститься ниже Y-48.
say Ожидаю: прибудем ВЕРХОМ и БЕЗ зелий, гаст держит высоту сам. Ветка leave/on_vehicle_no_effects.
