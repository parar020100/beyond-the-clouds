# Move riders from overworld to the vehicle in clouds and mount them back.

# teleport riders above the vehicle
execute in minecraft:overworld as @e[tag=btc.transfer_rider] in beyond_the_clouds:beyond_the_clouds at @e[tag=btc.transfer_vehicle,limit=1] run tp @s ~ ~1 ~

# mount the riders on the vehicle
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] at @s run ride @s mount @e[tag=btc.transfer_vehicle,limit=1,sort=nearest]
