# Player riding a happy ghast: overworld Y500, no potion effects.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:leave/vehicle_prepare

# teleport to the top of overworld
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit

# mount the riders
function beyond_the_clouds:leave/vehicle_mount_riders

# teleport effect for both vehicle and riders
function beyond_the_clouds:fx/transition_visual_vehicle

# clean up tags, remove forceload chunk
function beyond_the_clouds:leave/vehicle_cleanup

return 1
