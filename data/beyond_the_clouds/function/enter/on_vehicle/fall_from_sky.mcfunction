function beyond_the_clouds:debug/log {message:"enter/on_vehicle/fall_from_sky"}

# tag before the cross-dimension teleport: the vehicle and its riders are recreated on
# dimension change, and the tags carry over to the new entities so the driver finds them
tag @s add btc.continuous_fall
execute on passengers run tag @s add btc.continuous_fall

# no island found, fall from the sky
function beyond_the_clouds:tp/sky_top

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
