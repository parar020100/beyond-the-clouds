say [t28] Поднимаю лодку выше порога. Живого способа поднять лодку нет, поэтому телепорт.
say Телепорт лодки высаживает пассажиров, поэтому сразу после него сажаю всех обратно.

execute at @s on vehicle run tag @s add btc.test
execute at @s on vehicle run tag @s add btc.test.lift
execute in minecraft:overworld as @e[tag=btc.test.lift] run tp @s 1000 520 1100
execute in minecraft:overworld as @e[type=minecraft:cow,tag=btc.test,limit=1] run ride @s mount @e[tag=btc.test.lift,limit=1]
execute in minecraft:overworld run ride @s mount @e[tag=btc.test.lift,limit=1]
execute in minecraft:overworld run tag @e[tag=btc.test.lift] remove btc.test.lift
