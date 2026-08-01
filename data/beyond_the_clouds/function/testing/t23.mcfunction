function beyond_the_clouds:testing/cleanup

say [t23] Вход вверх пешком, НАД ПУСТОТОЙ (точка П). Поднимаюсь левитацией, живого способа нет.

gamemode survival
execute in minecraft:overworld run tp @s 1000 490 1100
effect give @s minecraft:levitation 1 39 true

say Ожидаю: подъём из пустоты с левитацией, затем плавный спуск. Ветка enter/alone/rise_from_void.
say В логе: find_cloud_island NO island.
say Дальше надо запустить парный тест t23b - вход над пустотой на элитре.
