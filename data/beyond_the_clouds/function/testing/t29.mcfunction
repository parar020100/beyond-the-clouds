function beyond_the_clouds:testing/cleanup

say [t29] Рельеф: остров толщиной в ОДИН блок. Ставлю его над точкой П и вхожу туда.
say Ожидаю: определится как остров, появление около Y161. Не должно быть NO island.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 155 1100
execute in beyond_the_clouds:beyond_the_clouds run setblock 1000 150 1100 minecraft:stone

execute in minecraft:overworld run tp @s 1000 490 1100
gamemode survival
effect give @s minecraft:levitation 1 39 true

say После проверки мне нужно убрать блок: function beyond_the_clouds:testing/t29_undo
