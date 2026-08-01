function beyond_the_clouds:debug/log {message:"enter/alone/island_or_fall"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# decide where to arrive; sets btc.no_cloud_island on @s, nothing is moved yet
function beyond_the_clouds:enter/find_cloud_island
function beyond_the_clouds:debug/log {message:"enter/alone/island_or_fall: island search complete"}

# queue the arrival effect before the jump
tag @s add btc.pending_fx
schedule function beyond_the_clouds:misc/post_transfer 1t append

# Each branch below is a single cross-dimension jump made while @s still exists, so nothing
# has to be found again in the clouds afterwards.

# if island not found, fall from sky top with slow falling if applicable
execute if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/fall_from_sky

# if island found, enter the island
execute unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:enter/alone/land_above_island

# Always release the destination chunk, even if the transferred entity was lost.
execute in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"enter/alone/island_or_fall: complete"}
