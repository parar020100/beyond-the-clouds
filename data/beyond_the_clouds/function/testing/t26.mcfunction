function beyond_the_clouds:testing/cleanup

say [t26] Вход вверх в лодке, НАД ПУСТОТОЙ. Живого способа поднять лодку нет - появляюсь в ней сразу за порогом.

gamemode creative
execute in minecraft:overworld run tp @s 1000 520 1100
execute at @s run summon minecraft:oak_boat ~ ~ ~ {Tags:["btc.test"]}
execute at @s run ride @s mount @e[type=minecraft:oak_boat,tag=btc.test,limit=1,sort=nearest]
gamemode survival

say Ожидаю: появление на Y400 и падение со slow falling. Ветка enter/on_vehicle/fall_from_sky.
