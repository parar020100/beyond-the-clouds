# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:debug/log {message:"leave/on_vehicle_no_effects"}

function beyond_the_clouds:leave/vehicle_prepare

# Queue the arrival effect before the jump: afterwards the vehicle is a different entity that
# selectors cannot reach until the next tick.
tag @s add btc.pending_fx
execute on passengers run tag @s add btc.pending_fx
schedule function beyond_the_clouds:misc/post_transfer 1t append

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky; the passengers travel with the vehicle
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit

# Always release the destination chunk, even if the transferred vehicle was lost.
execute in minecraft:overworld run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

return 1
