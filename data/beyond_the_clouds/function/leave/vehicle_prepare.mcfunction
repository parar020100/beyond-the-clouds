# @s is the vehicle in clouds. Mark it and its riders.
function beyond_the_clouds:debug/log {message:"leave/vehicle_prepare"}


# clear tags from all entities, mark current vehicle and riders
function beyond_the_clouds:common/vehicle_prepare

# block duplicate exit calls for the vehicle and its riders
tag @s add btc.leaving
execute on passengers run tag @s add btc.leaving
