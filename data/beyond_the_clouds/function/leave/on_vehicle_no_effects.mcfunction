# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:debug/log {message:"leave/on_vehicle_no_effects"}

function beyond_the_clouds:leave/vehicle_prepare

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit

# mount the riders
execute in minecraft:overworld as @e[tag=btc.transfer_vehicle] at @s run function beyond_the_clouds:leave/vehicle_mount_riders

# teleport effect for both vehicle and riders
execute in minecraft:overworld as @e[tag=btc.transfer_vehicle] at @s run function beyond_the_clouds:fx/transition_visual_vehicle

# Always release the destination chunk, even if the transferred vehicle was lost.
execute in minecraft:overworld run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

return 1
