function beyond_the_clouds:testing/cleanup

say [t40] Мультиплеер: оба в ОДНОЙ лодке, уходим вниз. Лодку ставлю сам.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1003 103 1000 -90 0
execute in beyond_the_clouds:beyond_the_clouds run tp @a[tag=btc.test.observer] 1002 103 1000 -90 0
give @s minecraft:oak_boat
gamemode survival

say Мне надо поставить лодку у края, сесть в неё, дождаться наблюдателя вторым и разогнать лодку через край.
say Ожидаю: прибудем в лодке ВДВОЁМ.
