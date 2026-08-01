function beyond_the_clouds:debug/log {message:"tp/above_ground"}

# One cross-dimension jump straight onto the island: the heightmap is read at @s's X/Z in the
# clouds while @s still exists, so nothing has to be found again after the teleport.
execute at @s in beyond_the_clouds:beyond_the_clouds positioned over motion_blocking run tp @s ~ ~10 ~

function beyond_the_clouds:debug/log {message:"tp/above_ground: complete"}
