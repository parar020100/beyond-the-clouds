function beyond_the_clouds:testing/cleanup

say [t41] Мультиплеер: оба на ОДНОМ верблюде, уходим вниз.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 103 1000 -90 0
execute in beyond_the_clouds:beyond_the_clouds run tp @a[tag=btc.test.observer] 1001 103 1000 -90 0
execute at @s run summon minecraft:camel ~1 ~ ~ {Tags:["btc.test"],Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
gamemode survival

say Нам обоим надо сесть на верблюда, а потом мне доехать до края и свалиться с него.
say Ожидаю: прибудем верхом ВДВОЁМ, у всех троих slow falling.
