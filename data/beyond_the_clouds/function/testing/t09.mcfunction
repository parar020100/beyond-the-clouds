function beyond_the_clouds:testing/cleanup

say [t09] Выход вниз в лодке вместе с коровой. ГЛАВНАЯ проверка исправления.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1003 103 1000 -90 0
execute at @s run summon minecraft:cow ~1 ~ ~ {Tags:["btc.test"]}
give @s minecraft:oak_boat
give @s minecraft:wheat 16
gamemode survival

say Мне надо поставить лодку у края, заманить корову внутрь пшеницей, сесть вторым и разогнать лодку через край.
say Ожидаю: прибудем ВТРОЁМ, корова останется в лодке.
