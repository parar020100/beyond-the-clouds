function beyond_the_clouds:testing/cleanup

say [t08] Выход вниз в вагонетке. Разгоняюсь ускоряющими рельсами.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 998 103 1000 -90 0
give @s minecraft:rail 32
give @s minecraft:powered_rail 16
give @s minecraft:redstone_block 8
give @s minecraft:minecart
gamemode survival

say Мне надо проложить рельсы на восток до края острова, край примерно в семи блоках.
say Перед самым краем поставить ускоряющие рельсы и подпереть их блоком редстоуна снизу или сбоку.
say Потом поставить вагонетку в начале пути, сесть в неё и разогнаться за край.
say Ожидаю: прибуду СИДЯ В ВАГОНЕТКЕ, без зелий.
