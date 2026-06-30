# @s is the vehicle in overworld. Mark, dismount, and load the target clouds chunk.

# clear tags from all entities, mark current vehicle and riders, dismount
function beyond_the_clouds:common/vehicle_prepare

# stop the advancement from activating again
execute as @e[tag=btc.transfer_rider,type=minecraft:player] run advancement revoke @s only beyond_the_clouds:enter_dimension

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~
