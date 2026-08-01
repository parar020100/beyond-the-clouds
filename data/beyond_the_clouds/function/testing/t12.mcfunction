function beyond_the_clouds:testing/cleanup

say [t12] Корова верхом на лошади падает вниз без меня. Стек из двух мобов.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1002 103 1000 -90 0
execute at @s run summon minecraft:horse ~1 ~ ~ {Tags:["btc.test"],Tame:1b,Passengers:[{id:"minecraft:cow",Tags:["btc.test"]}]}
give @s minecraft:lead
gamemode survival

say Посадить корову на лошадь руками нельзя, поэтому пара уже собрана. Но к краю веду её я.
say Мне надо привязать лошадь поводком, подвести к восточному краю и столкнуть вниз. Сам НЕ сажусь.
say Ожидаю: долетят вместе, корова останется верхом.
say Мне надо спуститься следом на 1000/1000 и проверить.
