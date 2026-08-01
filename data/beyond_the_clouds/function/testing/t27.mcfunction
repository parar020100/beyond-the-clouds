function beyond_the_clouds:testing/cleanup

say [t27] Вход вверх в вагонетке, НАД ПУСТОТОЙ. Живого способа нет - появляюсь в ней сразу за порогом.

gamemode creative
execute in minecraft:overworld run tp @s 1000 520 1100
execute at @s run summon minecraft:minecart ~ ~ ~ {Tags:["btc.test"]}
execute at @s run ride @s mount @e[type=minecraft:minecart,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Ожидаю: появление на Y400 и падение со slow falling.
