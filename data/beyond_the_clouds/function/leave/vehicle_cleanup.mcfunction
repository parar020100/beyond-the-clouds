# stop forceloading the chunk
execute at @s in minecraft:overworld run forceload remove ~ ~

# remove rider tag
execute in minecraft:overworld run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider

# remove vehicle tag
tag @s remove btc.transfer_vehicle
