function beyond_the_clouds:debug/log {message:"enter/on_vehicle/world_bottom"}

# Player riding a happy ghast: clouds Y40, no potion effects.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:enter/vehicle_prepare

# queue the arrival effect for the whole stack before the jump
tag @s add btc.pending_fx
execute on passengers run tag @s add btc.pending_fx
schedule function beyond_the_clouds:misc/post_transfer 1t append

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# teleport to the bottom of the world; the passengers travel with the vehicle
execute in beyond_the_clouds:beyond_the_clouds run function beyond_the_clouds:tp/sky_bottom

# Always release the destination chunk, even if the transferred vehicle was lost.
execute in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

return 1
