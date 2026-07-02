function beyond_the_clouds:debug/log {message:"enter/alone/island_or_rise"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# search for an island to land on; if not found, add btc.no_cloud_island tag to @s
function beyond_the_clouds:enter/find_cloud_island
function beyond_the_clouds:debug/log {message:"enter/alone/island_or_rise: island search complete"}

# if island not found, rise from world bottom with levitation, then descend using slow falling
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/rise_from_void

# if island found, enter the island
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/land_above_island

# teleport effect
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:fx/transition_visual

# Always release the destination chunk, even if the transferred entity was lost.
execute in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"enter/alone/island_or_rise: complete"}
