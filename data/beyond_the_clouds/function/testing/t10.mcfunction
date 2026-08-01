function beyond_the_clouds:testing/cleanup

say [t10] Лодка с коровой уходит вниз БЕЗ меня. Сажаю корову и сталкиваю лодку сам.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1002 103 1000 -90 0
execute at @s run summon minecraft:cow ~1 ~ ~ {Tags:["btc.test"]}
give @s minecraft:oak_boat
give @s minecraft:wheat 16
gamemode survival

say Мне надо поставить лодку рядом, заманить в неё корову пшеницей, а потом столкнуть лодку к востоку за край. Сам НЕ сажусь.
say Край примерно в трёх блоках. Лодку толкаю, идя в неё.
say Ожидаю: обе долетят в оверворлд, у коровы slow falling. Ветка leave/on_vehicle_with_effects.
say Мне надо спуститься следом на 1000/1000 и проверить, сидит ли корова в лодке.
say Дальше надо запустить парный тест t10b - то же самое, но в вагонетке.
