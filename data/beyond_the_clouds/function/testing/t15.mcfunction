function beyond_the_clouds:testing/cleanup

say [t15] Вход вверх НА ЭЛИТРЕ, НАД ОСТРОВОМ. Полностью живой сценарий - лечу сам на ракетах.

gamemode creative
execute in minecraft:overworld positioned 1000 0 1000 positioned over motion_blocking run tp @s ~ ~ ~
item replace entity @s armor.chest with minecraft:elytra
give @s minecraft:firework_rocket 64
gamemode survival

say Мне надо взлететь на элитре с ракетами выше Y512, оставаясь В ПОЛЁТЕ.
say Ожидаю: появление на Y около -28, а НЕ -40 и НЕ на острове. Остров не должен влиять.
say ГЛАВНОЕ здесь: даёт ли трёхсекундная левитация удержаться, пока грузятся чанки.
say Есть подозрение, что во время планирования левитация не действует - тогда правку надо переделывать.
say После появления мне надо выполнить: data get entity @s Pos
say Дальше обязательно запустить парный тест t15b - то же самое, но без планирования.
say Разница между t15 и t15b и покажет, действует ли левитация во время полёта на элитре.
