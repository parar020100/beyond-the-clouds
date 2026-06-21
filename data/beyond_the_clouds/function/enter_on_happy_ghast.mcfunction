tag @s add btc.happy_ghast_transfer_vehicle
execute on passengers run tag @s add btc.happy_ghast_transfer_rider
execute on passengers run advancement revoke @s only beyond_the_clouds:enter_dimension
execute on passengers run ride @s dismount
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ 0 ~
execute at @s in beyond_the_clouds:beyond_the_clouds positioned over motion_blocking run tp @s ~ ~10 ~
execute as @a[tag=btc.happy_ghast_transfer_rider] in beyond_the_clouds:beyond_the_clouds at @e[type=minecraft:happy_ghast,tag=btc.happy_ghast_transfer_vehicle,limit=1] run tp @s ~ ~1 ~
execute as @a[tag=btc.happy_ghast_transfer_rider] at @s in beyond_the_clouds:beyond_the_clouds run ride @s mount @e[type=minecraft:happy_ghast,tag=btc.happy_ghast_transfer_vehicle,limit=1,sort=nearest]
effect give @a[tag=btc.happy_ghast_transfer_rider] slow_falling 60 0 false
execute at @s run particle minecraft:cloud ~ ~1 ~ 0.8 0.8 0.8 0.25 80
execute at @s run particle minecraft:snowflake ~ ~1 ~ 0.8 0.8 0.8 0.1 80
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~
tag @a[tag=btc.happy_ghast_transfer_rider] remove btc.happy_ghast_transfer_rider
tag @s remove btc.happy_ghast_transfer_vehicle
return 1
