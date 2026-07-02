function beyond_the_clouds:debug/log {message:"common/vehicle_prepare"}

# clear tags from all entities in both dimensions
function beyond_the_clouds:common/clear_all_transfer_tags

# mark @s as current vehicle
tag @s add btc.transfer_vehicle

# mark passengers as current riders
execute on passengers run tag @s add btc.transfer_rider

# dismount passengers
execute on passengers run ride @s dismount

