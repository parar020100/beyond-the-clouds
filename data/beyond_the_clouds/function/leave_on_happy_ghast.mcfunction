tag @s add btc.happy_ghast_transfer_vehicle
execute on passengers run tag @s add btc.happy_ghast_transfer_rider
execute on passengers if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:leave_dimension
execute on passengers run ride @s dismount
execute at @s in overworld run forceload add ~ ~
execute in minecraft:overworld run tp @s ~ 320 ~
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.happy_ghast_transfer_rider] in minecraft:overworld at @e[type=minecraft:happy_ghast,tag=btc.happy_ghast_transfer_vehicle,limit=1] run tp @s ~ ~1 ~
execute in minecraft:overworld as @e[tag=btc.happy_ghast_transfer_rider] at @s run ride @s mount @e[type=minecraft:happy_ghast,tag=btc.happy_ghast_transfer_vehicle,limit=1,sort=nearest]
effect give @a[tag=btc.happy_ghast_transfer_rider] slow_falling 60 0 false
execute at @s run particle minecraft:cloud ~ ~1 ~ 0.8 0.8 0.8 0.25 80
execute at @s run particle minecraft:snowflake ~ ~1 ~ 0.8 0.8 0.8 0.1 80
execute at @s in overworld run forceload remove ~ ~
execute in minecraft:overworld run tag @e[tag=btc.happy_ghast_transfer_rider] remove btc.happy_ghast_transfer_rider
tag @s remove btc.happy_ghast_transfer_vehicle
return 1
