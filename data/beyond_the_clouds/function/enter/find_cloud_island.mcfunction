# Move @s into clouds and mark btc.no_cloud_island when there is no surface at this X/Z.

# remove the tag used for finding a cloud island
tag @s remove btc.no_cloud_island

# teleport to y=0 and search for a block above, if found, teleport to it
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ 0 ~
execute at @s in beyond_the_clouds:beyond_the_clouds positioned over motion_blocking run tp @s ~ ~ ~

# save result location
execute store result score @s btc.y run data get entity @s Pos[1] 1

# if not found, mark no island
execute if score @s btc.y matches 0 run tag @s add btc.no_cloud_island
