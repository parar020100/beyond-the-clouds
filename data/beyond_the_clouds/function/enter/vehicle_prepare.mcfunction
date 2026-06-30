# @s is the vehicle in overworld. Mark, dismount, and load the target clouds chunk.

# clear transfer_rider and transfer_vehicle tags from all entities in both dimensions
execute in minecraft:overworld run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider
execute in minecraft:overworld run tag @e[tag=btc.transfer_vehicle] remove btc.transfer_vehicle
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_vehicle] remove btc.transfer_vehicle

# mark @s as current vehicle
tag @s add btc.transfer_vehicle

# mark passengers as current riders
execute on passengers run tag @s add btc.transfer_rider

# stop the advancement from activating again
execute as @e[tag=btc.transfer_rider,type=minecraft:player] run advancement revoke @s only beyond_the_clouds:enter_dimension

# dismount passengers
execute on passengers run ride @s dismount

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~
