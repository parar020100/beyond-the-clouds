function beyond_the_clouds:testing/cleanup

say [t14] Вход вверх пешком, без элитры, НАД ОСТРОВОМ.
say Живого способа подняться пешком выше Y512 в игре нет - выше потолка застройки не встать.
say Поэтому здесь единственная поблажка: поднимаюсь левитацией с обычной высоты.

gamemode survival
execute in minecraft:overworld run tp @s 1000 490 1000
effect give @s minecraft:levitation 1 39 true

say Дальше не делаю ничего, просто поднимаюсь и жду перехода.
say Ожидаю: появление НАД поверхностью острова, около Y113, плавный спуск.
say В логе: find_cloud_island island found, затем enter/alone/land_above_island.
