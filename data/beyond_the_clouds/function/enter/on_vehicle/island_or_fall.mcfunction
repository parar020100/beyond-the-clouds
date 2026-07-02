function beyond_the_clouds:debug/log {message:"enter/on_vehicle/island_or_fall"}

# Player on a boat/minecart-like vehicle: island if possible, otherwise sky top and slow falling if applicable.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:enter/vehicle_prepare

# search for an island to land on; if not found, add btc.no_cloud_island tag to @s
function beyond_the_clouds:enter/find_cloud_island

# if island not found, fall from sky top with slow falling if applicable
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_vehicle] at @s if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/on_vehicle/fall_from_sky

# if island found, enter the island
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_vehicle] at @s unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/on_vehicle/land_above_island

# teleport effect for both vehicle and riders
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_vehicle] at @s run function beyond_the_clouds:fx/transition_visual_vehicle

# clean up tags, remove forceload chunk
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_vehicle] at @s run function beyond_the_clouds:enter/vehicle_cleanup

return 1
