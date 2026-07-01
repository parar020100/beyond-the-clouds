# run the effect for the vehicle
function beyond_the_clouds:debug/log {message:"fx/transition_visual_vehicle"}

function beyond_the_clouds:fx/transition_visual

# run the effect for the riders
execute as @e[tag=btc.transfer_rider] run function beyond_the_clouds:fx/transition_visual
