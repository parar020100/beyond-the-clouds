function beyond_the_clouds:testing/cleanup

say [t18] Вход вверх на happy ghast, НАД ОСТРОВОМ. Полностью живой сценарий - лечу сам.

gamemode creative
execute in minecraft:overworld positioned 1000 0 1000 positioned over motion_blocking run tp @s ~ ~ ~
execute at @s run summon minecraft:happy_ghast ~ ~-2 ~ {Tags:["btc.test"],IsBaby:0b,equipment:{body:{id:"minecraft:white_harness",count:1}}}
execute at @s run ride @s mount @e[type=minecraft:happy_ghast,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Мне надо поднять гаста выше Y512 своим ходом.
say Ожидаю: появление на Y-40, а НЕ над островом - остров игнорируется. Без зелий.
say Ветка enter/on_vehicle/world_bottom.
