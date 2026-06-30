# @s is the vehicle in clouds. Mark, dismount, and load the target overworld chunk.

# clear tags from all entities, mark current vehicle and riders, dismount
function beyond_the_clouds:common/vehicle_prepare

# stop the advancement from activating again
execute as @e[tag=btc.transfer_rider,type=minecraft:player] run advancement revoke @s only beyond_the_clouds:leave_dimension

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

