function beyond_the_clouds:debug/log {message:"tp/above_ground"}

#execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ ~10 ~
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ 0 ~
execute at @s in beyond_the_clouds:beyond_the_clouds positioned over motion_blocking run tp @s ~ ~10 ~

function beyond_the_clouds:debug/log {message:"tp/above_ground: complete"}
