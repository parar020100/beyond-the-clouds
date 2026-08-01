function beyond_the_clouds:testing/cleanup

say [t10b] Вагонетка с коровой уходит вниз БЕЗ меня. То же, что t10, но другой тип транспорта.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1002 103 1000 -90 0
execute at @s run summon minecraft:minecart ~1 ~ ~ {Tags:["btc.test"]}
execute at @s run summon minecraft:cow ~2 ~ ~ {Tags:["btc.test"]}
give @s minecraft:wheat 16
gamemode survival

say Вагонетку без рельсов поставить нельзя, поэтому она уже стоит рядом.
say Мне надо заманить в неё корову пшеницей, а потом столкнуть вагонетку к востоку за край. Сам НЕ сажусь.
say Ожидаю: обе долетят, корова останется в вагонетке, у неё slow falling.
say Ветка leave/on_vehicle_with_effects, та же что у лодки с мобом.
