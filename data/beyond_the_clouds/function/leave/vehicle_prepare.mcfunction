# @s is the vehicle in clouds. Mark, dismount, and load the target overworld chunk.
function beyond_the_clouds:debug/log {message:"leave/vehicle_prepare"}


# clear tags from all entities, mark current vehicle and riders, dismount
function beyond_the_clouds:common/vehicle_prepare

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~
