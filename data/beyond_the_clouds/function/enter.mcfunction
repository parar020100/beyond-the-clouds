execute if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:enter_dimension
execute on vehicle if entity @s[type=minecraft:happy_ghast] run return run function beyond_the_clouds:enter_on_happy_ghast
execute on vehicle run return run function beyond_the_clouds:enter_on_vehicle
execute on passengers run return 0
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ 0 ~
execute at @s in beyond_the_clouds:beyond_the_clouds positioned over motion_blocking run tp @s ~ ~ ~
execute at @s run particle minecraft:cloud ~ ~1 ~ 0.2 0.4 0.2 0.25 50
execute at @s run particle minecraft:snowflake ~ ~1 ~ 0.2 0.4 0.2 0.1 50
execute at @s if predicate beyond_the_clouds:at_dimension_floor_clouds run effect give @s levitation 16 20 false
execute at @s if predicate beyond_the_clouds:at_dimension_floor_clouds run effect give @s slow_falling 60 0 false
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~
