# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# search for an island to land on; if not found, add btc.no_cloud_island tag to @s
function beyond_the_clouds:enter/find_cloud_island

# if island not found, rise from world bottom with levitation, then descend using slow falling
execute if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/rise_from_void

# if island found, enter the island
execute unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/land_above_island

# teleport effect
function beyond_the_clouds:fx/transition_visual

# remove the tag used for finding a cloud island
tag @s remove btc.no_cloud_island

# stop forceloading the chunk
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~
