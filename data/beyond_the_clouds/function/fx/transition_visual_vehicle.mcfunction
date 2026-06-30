# run the effect for the vehicle
function beyond_the_clouds:fx/transition_visual

# run the effect for the riders
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] run function beyond_the_clouds:fx/transition_visual
