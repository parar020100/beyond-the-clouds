# run the effect for the vehicle
function beyond_the_clouds:fx/transition_visual

# run the effect for the riders
execute in minecraft:overworld as @e[tag=btc.transfer_rider] run function beyond_the_clouds:fx/transition_visual
