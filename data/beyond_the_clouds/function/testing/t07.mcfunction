function beyond_the_clouds:testing/cleanup

say [t07] Выход вниз в лодке. Лодку ставлю сам.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1003 103 1000 -90 0
give @s minecraft:oak_boat
gamemode survival

say Мне надо поставить лодку у самого края острова, сесть в неё и разогнать её через край.
say Ожидаю: прибуду СИДЯ В ЛОДКЕ, без зелий.
say Ветка leave/on_vehicle_no_effects, следом fx/transition_visual.
