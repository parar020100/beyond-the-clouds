# Player on a living/non-listed vehicle: player and vehicle get short slow falling.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:leave/vehicle_prepare

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit

# mount the riders
function beyond_the_clouds:leave/vehicle_mount_riders

# give the transport and its riders short slow falling
function beyond_the_clouds:effects/leave_fall
execute in minecraft:overworld as @e[tag=btc.transfer_rider] run function beyond_the_clouds:effects/leave_fall

# teleport effect for both vehicle and riders
function beyond_the_clouds:fx/transition_visual_vehicle_leave

# clean up tags, remove forceload chunk
function beyond_the_clouds:leave/vehicle_cleanup

return 1
