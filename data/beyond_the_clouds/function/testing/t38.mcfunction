function beyond_the_clouds:testing/cleanup

say [t38] Мультиплеер: одновременный переход в РАЗНЫЕ стороны. Я вниз, наблюдатель вверх.
say Ожидаю: доедем оба, ветки не мешают друг другу.

gamemode survival
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -20 1000
execute in minecraft:overworld run tp @a[tag=btc.test.observer] 1000 520 1100
