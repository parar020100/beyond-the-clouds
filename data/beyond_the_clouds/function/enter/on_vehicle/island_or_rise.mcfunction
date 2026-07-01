function beyond_the_clouds:debug/log {message:"enter/on_vehicle/island_or_rise"}

# Player on a living/non-listed vehicle: same island logic as an unmounted player.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:enter/vehicle_prepare

# search for an island to land on; if not found, add btc.no_cloud_island tag to @s
function beyond_the_clouds:enter/find_cloud_island

# if island not found, rise from y=-40 with levitation, then descend using slow falling
execute if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/on_vehicle/rise_from_void

# if island found, enter the island
execute unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/on_vehicle/land_above_island

# teleport effect for both vehicle and riders
function beyond_the_clouds:fx/transition_visual_vehicle

# clean up tags, remove forceload chunk
function beyond_the_clouds:enter/vehicle_cleanup

return 1
