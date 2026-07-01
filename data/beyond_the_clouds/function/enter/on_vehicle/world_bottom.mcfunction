# Player riding a happy ghast: clouds Y40, no potion effects.

# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:enter/vehicle_prepare

# teleport to the bottom of the world
execute in beyond_the_clouds:beyond_the_clouds run function beyond_the_clouds:tp/sky_bottom

# mount the riders
function beyond_the_clouds:enter/vehicle_mount_riders

# teleport effect for both vehicle and riders
function beyond_the_clouds:fx/transition_visual_vehicle

# clean up tags, remove forceload chunk
function beyond_the_clouds:enter/vehicle_cleanup

return 1
