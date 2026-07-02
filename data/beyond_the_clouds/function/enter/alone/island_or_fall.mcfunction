function beyond_the_clouds:debug/log {message:"enter/alone/island_or_fall"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# search for an island to land on; if not found, add btc.no_cloud_island tag to @s
function beyond_the_clouds:enter/find_cloud_island
function beyond_the_clouds:debug/log {message:"enter/alone/island_or_fall: island search complete"}

# if island not found, fall from sky top with slow falling if applicable
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/fall_from_sky

# if island found, enter the island
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/land_above_island

# teleport effect
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:fx/transition_visual

# clean up using the recovered entity rather than the invalid pre-teleport @s.
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:enter/entity_cleanup
function beyond_the_clouds:debug/log {message:"enter/alone/island_or_fall: complete"}
