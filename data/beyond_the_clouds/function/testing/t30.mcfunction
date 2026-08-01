function beyond_the_clouds:testing/cleanup

say [t30] Рельеф: вода как поверхность. Строю островок с водоёмом над точкой П.
say Ожидаю: остров найден, появление НАД ВОДОЙ, не внутри камня.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 110 1100
execute in beyond_the_clouds:beyond_the_clouds run fill 998 100 1098 1002 101 1102 minecraft:stone
execute in beyond_the_clouds:beyond_the_clouds run fill 999 102 1099 1001 102 1101 minecraft:water

execute in minecraft:overworld run tp @s 1000 490 1100
gamemode survival
effect give @s minecraft:levitation 1 39 true

say После проверки мне нужно убрать островок: function beyond_the_clouds:testing/t30_undo
