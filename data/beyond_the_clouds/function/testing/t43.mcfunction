function beyond_the_clouds:testing/cleanup

say [t43] ХОЛОДНЫЙ ЧАНК - ключевая регрессия. Точка 5000/5000, куда мы не заходили.
say Именно здесь раньше в оверворлд улетала только лодка, а игрок погибал в пустоте.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 5000 105 5000
execute at @s run summon minecraft:oak_boat ~1 ~ ~ {Tags:["btc.test"]}
execute at @s run ride @s mount @e[type=minecraft:oak_boat,tag=btc.test,limit=1,sort=nearest]

say Мне нужно подождать примерно полминуты, чтобы чанк оверворлда точно остыл.
say Потом вызвать: function beyond_the_clouds:testing/t43_go
