function beyond_the_clouds:testing/cleanup

say [t35] Мультиплеер: наблюдатель стоит на острове в облаках, я поднимаюсь к нему НА ЭЛИТРЕ.

execute in beyond_the_clouds:beyond_the_clouds run tp @a[tag=btc.test.observer] 1000 104 1000
gamemode creative
execute in minecraft:overworld positioned 1000 0 1000 positioned over motion_blocking run tp @s ~ ~ ~
item replace entity @s armor.chest with minecraft:elytra
give @s minecraft:firework_rocket 64
gamemode survival

say Мне надо взлететь на элитре выше Y512 над островом.
say Ожидаю: наблюдатель слышит звук телепорта эндермена и видит частицы в точке моего появления.
say Наблюдателю нужно сказать, слышал ли он звук и видел ли частицы.
