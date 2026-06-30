# stop forceloading the chunk
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~

# remove rider tag
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider

# remove vehicle and cloud search tags
tag @s remove btc.transfer_vehicle
tag @s remove btc.no_cloud_island
