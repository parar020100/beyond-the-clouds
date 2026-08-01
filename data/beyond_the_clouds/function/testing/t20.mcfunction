function beyond_the_clouds:testing/cleanup

say [t20] Вход вверх в вагонетке, НАД ОСТРОВОМ. Живого способа поднять её нет - появляюсь в ней сразу за порогом.

gamemode creative
execute in minecraft:overworld run tp @s 1000 520 1000
execute at @s run summon minecraft:minecart ~ ~ ~ {Tags:["btc.test"]}
execute at @s run ride @s mount @e[type=minecraft:minecart,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Ожидаю: появление НАД ОСТРОВОМ в вагонетке.
say Дальше надо запустить парный тест t20b - вагонетка с коровой, но без меня.
