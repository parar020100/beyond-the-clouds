advancement revoke @s only beyond_the_clouds:leave_dimension
execute at @s in overworld run forceload add ~ ~
execute in minecraft:overworld run tp @s ~ 448 ~
execute at @s in minecraft:overworld positioned over motion_blocking run tp @s ~ ~10 ~
effect give @s slow_falling 5 0 false
execute at @s run particle minecraft:cloud ~ ~1 ~ 0.2 0.4 0.2 0.25 50
execute at @s run particle minecraft:snowflake ~ ~1 ~ 0.2 0.4 0.2 0.1 50
execute at @s if predicate beyond_the_clouds:at_dimension_floor_overworld run effect give @s slow_falling 60 0 false
execute at @s if predicate beyond_the_clouds:at_dimension_floor_overworld run tp @s ~ 448 ~
execute at @s in overworld run forceload remove ~ ~