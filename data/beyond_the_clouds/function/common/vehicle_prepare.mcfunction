function beyond_the_clouds:debug/log {message:"common/vehicle_prepare"}

# clear tags from all entities in both dimensions
function beyond_the_clouds:common/clear_all_transfer_tags

# mark @s as both the main transferred entity and the current vehicle
tag @s add btc.transfer_entity
tag @s add btc.transfer_vehicle

# Mark passengers as current riders. They stay mounted on purpose: a cross-dimension
# teleport of the vehicle carries its passengers along and re-seats them afterwards.
execute on passengers run tag @s add btc.transfer_rider
