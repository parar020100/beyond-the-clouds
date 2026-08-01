# Сброс между тестами. Вызывается в начале каждого t*.
# Чистит арену целиком: игрок ставит лодки и садится на мобов сам, метки на них не попадают.
# ВНИМАНИЕ: убивает всё живое и неживое в радиусе 100 блоков от опорных точек.
# Мир должен быть тестовым.

# слезть, если на чём-то сижу
tag @s add btc.testing.self
execute on vehicle run ride @e[tag=btc.testing.self,limit=1] dismount
tag @s remove btc.testing.self

# служебная метка подъёма транспорта из t21_go/t28_go, если функция оборвалась
execute in minecraft:overworld run tag @e[tag=btc.test.lift] remove btc.test.lift
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.test.lift] remove btc.test.lift

# помеченные сущности - в обоих измерениях, где бы ни оказались
execute in minecraft:overworld run kill @e[tag=btc.test]
execute in beyond_the_clouds:beyond_the_clouds run kill @e[tag=btc.test]

# арена: точка И и точка П в облаках, обе колонки в оверворлде
execute in beyond_the_clouds:beyond_the_clouds positioned 1000 60 1000 run kill @e[type=!minecraft:player,distance=..100]
execute in beyond_the_clouds:beyond_the_clouds positioned 1000 60 1100 run kill @e[type=!minecraft:player,distance=..100]
execute in minecraft:overworld positioned 1000 200 1000 run kill @e[type=!minecraft:player,distance=..100]
execute in minecraft:overworld positioned 1000 200 1100 run kill @e[type=!minecraft:player,distance=..100]

effect clear @s
item replace entity @s armor.chest with minecraft:air
clear @s minecraft:firework_rocket
clear @s minecraft:oak_boat
clear @s minecraft:minecart
