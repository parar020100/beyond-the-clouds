# Move riders from clouds to the vehicle in overworld and mount them back.
function beyond_the_clouds:debug/log {message:"leave/vehicle_mount_riders"}


# teleport riders above the vehicle
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] in minecraft:overworld at @e[tag=btc.transfer_vehicle,limit=1] run tp @s ~ ~1 ~

# mount the riders on the vehicle
execute in minecraft:overworld as @e[tag=btc.transfer_rider] at @s run ride @s mount @e[tag=btc.transfer_vehicle,limit=1,sort=nearest]
