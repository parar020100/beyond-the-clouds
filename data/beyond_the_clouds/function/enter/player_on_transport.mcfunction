# Player on a boat/minecart-like vehicle: island if possible, otherwise Y400 and slow falling if applicable.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:enter/vehicle_prepare

# search for an island to land on; if not found, add btc.no_cloud_island tag to @s
function beyond_the_clouds:enter/find_cloud_island

# if island not found, fall from y=400 with slow falling if applicable
execute if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/no_island/player_on_transport

# if island found, enter the island
execute unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/on_island/vehicle_land_above_island

# teleport effect for both vehicle and riders
function beyond_the_clouds:fx/transition_visual_vehicle

# clean up tags, remove forceload chunk
function beyond_the_clouds:enter/vehicle_cleanup

return 1
