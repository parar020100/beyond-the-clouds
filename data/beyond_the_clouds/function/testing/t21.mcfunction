function beyond_the_clouds:testing/cleanup

say [t21] Вход вверх в лодке вместе с коровой, НАД ОСТРОВОМ. Корову сажаю сам.

gamemode creative
execute in minecraft:overworld positioned 1000 0 1000 positioned over motion_blocking run tp @s ~ ~ ~
execute at @s run summon minecraft:oak_boat ~ ~ ~ {Tags:["btc.test"]}
execute at @s run summon minecraft:cow ~1 ~ ~ {Tags:["btc.test"]}
give @s minecraft:wheat 16
gamemode survival

say Мне надо заманить корову в лодку пшеницей, сесть вторым, а потом вызвать t21_go.
say Ожидаю: прибудем ВТРОЁМ над островом, корова останется в лодке.
