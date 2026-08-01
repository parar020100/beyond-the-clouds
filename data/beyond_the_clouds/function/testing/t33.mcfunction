function beyond_the_clouds:testing/cleanup

say [t33] Падающие блоки: четыре штуки сразу. Проверка того, что schedule append не теряет работу.
say Ожидаю: перенесутся ВСЕ ЧЕТЫРЕ. При replace вместо append часть откладывалась бы бесконечно.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
execute in beyond_the_clouds:beyond_the_clouds run summon minecraft:falling_block 1000 -20 1000 {Tags:["btc.test"],BlockState:{Name:"minecraft:sand"},Time:1}
execute in beyond_the_clouds:beyond_the_clouds run summon minecraft:falling_block 1001 -20 1000 {Tags:["btc.test"],BlockState:{Name:"minecraft:gravel"},Time:1}
execute in beyond_the_clouds:beyond_the_clouds run summon minecraft:falling_block 1002 -20 1000 {Tags:["btc.test"],BlockState:{Name:"minecraft:anvil"},Time:1}
execute in beyond_the_clouds:beyond_the_clouds run summon minecraft:falling_block 1003 -20 1000 {Tags:["btc.test"],BlockState:{Name:"minecraft:white_concrete_powder"},Time:1}

say Мне нужно спуститься в оверворлд на 1000/1000 и пересчитать: должно быть четыре блока.
