tag @s add btc.vehicle_transfer_vehicle
execute on passengers run tag @s add btc.vehicle_transfer_rider
execute on passengers if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:leave_dimension
execute on passengers run ride @s dismount
execute at @s in overworld run forceload add ~ ~
execute in minecraft:overworld run tp @s ~ 320 ~
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.vehicle_transfer_rider] in minecraft:overworld at @e[tag=btc.vehicle_transfer_vehicle,limit=1] run tp @s ~ ~0.3 ~
execute in minecraft:overworld as @e[tag=btc.vehicle_transfer_rider] at @s run ride @s mount @e[tag=btc.vehicle_transfer_vehicle,limit=1,sort=nearest]
effect give @a[tag=btc.vehicle_transfer_rider] slow_falling 60 0 false
effect give @s slow_falling 60 0 false
execute at @s run particle minecraft:cloud ~ ~0.5 ~ 0.4 0.3 0.4 0.2 50
execute at @s run particle minecraft:snowflake ~ ~0.5 ~ 0.4 0.3 0.4 0.1 50
execute at @s in overworld run forceload remove ~ ~
execute in minecraft:overworld run tag @e[tag=btc.vehicle_transfer_rider] remove btc.vehicle_transfer_rider
tag @s remove btc.vehicle_transfer_vehicle
return 1
