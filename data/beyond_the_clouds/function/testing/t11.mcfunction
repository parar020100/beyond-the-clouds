function beyond_the_clouds:testing/cleanup

say [t11] Корова падает вниз сама по себе. Веду её к краю сам.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1002 103 1000 -90 0
execute at @s run summon minecraft:cow ~1 ~ ~ {Tags:["btc.test"]}
give @s minecraft:wheat 16
give @s minecraft:lead
gamemode survival

say Мне надо подвести корову к восточному краю пшеницей или поводком и столкнуть её вниз.
say Ожидаю: долетит живой, со slow falling. Ветка leave/alone_with_effects.
say Мне надо спуститься следом на 1000/1000 и проверить, жива ли она.
