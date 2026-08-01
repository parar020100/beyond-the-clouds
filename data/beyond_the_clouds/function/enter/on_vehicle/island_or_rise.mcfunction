function beyond_the_clouds:debug/log {message:"enter/on_vehicle/island_or_rise"}

# Player on a living/non-listed vehicle: same island logic as an unmounted player.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:enter/vehicle_prepare

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# decide where to arrive; sets btc.no_cloud_island on @s, nothing is moved yet
function beyond_the_clouds:enter/find_cloud_island

# queue the arrival effect for the whole stack before the jump
tag @s add btc.pending_fx
execute on passengers run tag @s add btc.pending_fx
schedule function beyond_the_clouds:misc/post_transfer 1t append

# Each branch below is a single cross-dimension jump made while @s still exists, so nothing
# has to be found again in the clouds afterwards.

# if island not found, rise from y=-40 with levitation, then descend using slow falling
execute if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/on_vehicle/rise_from_void

# if island found, enter the island
execute unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/on_vehicle/land_above_island

# Always release the destination chunk, even if the transferred vehicle was lost.
execute in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

return 1
