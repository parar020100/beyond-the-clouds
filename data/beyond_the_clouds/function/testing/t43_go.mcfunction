say [t43] Ухожу вниз на холодном чанке.
say Ожидаю: прибуду В ЛОДКЕ. Сообщения "выпал из мира" быть не должно.

gamemode survival
execute in beyond_the_clouds:beyond_the_clouds as @e[type=minecraft:oak_boat,tag=btc.test,limit=1] run tp @s 5000 -20 5000
execute in beyond_the_clouds:beyond_the_clouds run ride @s mount @e[type=minecraft:oak_boat,tag=btc.test,limit=1]
