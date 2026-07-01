function beyond_the_clouds:debug/log {message:"common/vehicle_prepare"}

# clear transfer_rider and transfer_vehicle tags from all entities in both dimensions
execute in minecraft:overworld run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider
execute in minecraft:overworld run tag @e[tag=btc.transfer_vehicle] remove btc.transfer_vehicle
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_vehicle] remove btc.transfer_vehicle

# mark @s as current vehicle
tag @s add btc.transfer_vehicle

# mark passengers as current riders
execute on passengers run tag @s add btc.transfer_rider

# dismount passengers
execute on passengers run ride @s dismount

