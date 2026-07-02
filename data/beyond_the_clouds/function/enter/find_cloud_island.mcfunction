# Move @s into clouds and mark btc.no_cloud_island when there is no surface at this X/Z.

function beyond_the_clouds:debug/log {message:"enter/find_cloud_island"}

# remove the tag used for finding a cloud island
tag @s remove btc.no_cloud_island

# teleport to y=0 in the clouds
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ 0 ~
function beyond_the_clouds:debug/log {message:"enter/find_cloud_island: dimension teleport complete"}

# search for a block above; if found, teleport onto it.
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s positioned over motion_blocking run tp @s ~ ~ ~

function beyond_the_clouds:debug/log {message:"enter/find_cloud_island: heightmap teleport complete"}

# save result height
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] store result score @s btc.y run data get entity @s Pos[1] 1

# if still at y=0 there was no surface -> mark no island
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] if score @s btc.y matches 0 run tag @s add btc.no_cloud_island

# debug: report the no-island verdict
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.no_cloud_island] run function beyond_the_clouds:debug/log {message:"find_cloud_island: NO island -> rise_from_void"}

function beyond_the_clouds:debug/log {message:"enter/find_cloud_island: complete"}
