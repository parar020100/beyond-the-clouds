function beyond_the_clouds:debug/log {message:"enter/vehicle_prepare"}

# @s is the vehicle in overworld. Mark, dismount, and load the target clouds chunk.

# clear tags from all entities, mark current vehicle and riders, dismount
function beyond_the_clouds:common/vehicle_prepare

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~
