function beyond_the_clouds:testing/cleanup

say [t31] Рельеф: крона дерева и деревня. Это ручной тест.
say Мне нужно самому найти в облаках дерево и деревню sky_village и записать их X и Z.
say Затем для каждой точки выполнить: execute in minecraft:overworld run tp @s <X> 490 <Z>
say И следом: effect give @s minecraft:levitation 1 39 true
say Ожидаю: появление НАД кроной и НАД крышами, не внутри блоков. Проверить через data get entity @s Pos и что меня не душит.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 110 1000
