# Проверяет обе опорные точки тем же условием, которым пользуется сам датапак.
# Ожидаются ровно две строки: "И: остров есть - верно" и "П: острова нет - верно".
#
# Важно: "positioned over motion_blocking" не выполняет остаток цепочки, если колонка пуста.
# Поэтому нельзя писать if/unless двумя строками - при пустой колонке не сработает ни одна.
# Считаем остров найденным только тогда, когда цепочка дошла до конца.

tag @s remove btc.testing.island
execute in beyond_the_clouds:beyond_the_clouds positioned 1000 0 1000 positioned over motion_blocking unless block ~ ~-1 ~ minecraft:void_air run tag @s add btc.testing.island
execute if entity @s[tag=btc.testing.island] run say И: остров есть - верно
execute unless entity @s[tag=btc.testing.island] run say И: острова нет - стенд не собран

tag @s remove btc.testing.island
execute in beyond_the_clouds:beyond_the_clouds positioned 1000 0 1100 positioned over motion_blocking unless block ~ ~-1 ~ minecraft:void_air run tag @s add btc.testing.island
execute if entity @s[tag=btc.testing.island] run say П: остров есть - точку надо расчистить
execute unless entity @s[tag=btc.testing.island] run say П: острова нет - верно

tag @s remove btc.testing.island
