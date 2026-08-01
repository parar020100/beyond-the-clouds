function beyond_the_clouds:testing/cleanup

say [t36] Мультиплеер: наблюдатель далеко. Проверка, что эффект не играет на весь мир.

execute in minecraft:overworld run tp @a[tag=btc.test.observer] 4000 100 4000
gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
gamemode survival

say Мне надо шагнуть с края острова и упасть вниз.
say Ожидаю: наблюдатель НЕ слышит ничего, у меня всё как обычно.
say Наблюдателю нужно подтвердить, что он ничего не слышал.
