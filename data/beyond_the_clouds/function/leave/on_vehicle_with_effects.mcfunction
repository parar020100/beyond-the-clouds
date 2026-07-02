# clear tags from all entities; add vehicle tag to vehicle; add rider tag to passengers
function beyond_the_clouds:debug/log {message:"leave/on_vehicle_with_effects"}

function beyond_the_clouds:leave/vehicle_prepare

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit

# mount the riders
execute in minecraft:overworld as @e[tag=btc.transfer_vehicle] at @s run function beyond_the_clouds:leave/vehicle_mount_riders

# we must receive short slow falling for a controlled descent
execute in minecraft:overworld run tag @e[tag=btc.transfer_vehicle] add btc.continuous_descend
execute in minecraft:overworld run tag @e[tag=btc.transfer_rider] add btc.continuous_descend

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start

# teleport effect for both vehicle and riders
execute in minecraft:overworld as @e[tag=btc.transfer_vehicle] at @s run function beyond_the_clouds:fx/transition_visual_vehicle

# clean up tags, remove forceload chunk
execute in minecraft:overworld as @e[tag=btc.transfer_vehicle] at @s run function beyond_the_clouds:leave/vehicle_cleanup

return 1
