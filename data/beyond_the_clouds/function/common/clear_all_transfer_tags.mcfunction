function beyond_the_clouds:debug/log {message:"common/clear_all_transfer_tags"}

# Clear stale state from the previous transfer in both dimensions. The caller then marks
# the new main entity, vehicle, and riders with the tags appropriate for its flow.

execute in minecraft:overworld run tag @e[tag=btc.transfer_entity] remove btc.transfer_entity
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_entity] remove btc.transfer_entity

execute in minecraft:overworld run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider

execute in minecraft:overworld run tag @e[tag=btc.transfer_vehicle] remove btc.transfer_vehicle
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_vehicle] remove btc.transfer_vehicle

execute in minecraft:overworld run tag @e[tag=btc.no_cloud_island] remove btc.no_cloud_island
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.no_cloud_island] remove btc.no_cloud_island
