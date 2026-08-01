function beyond_the_clouds:debug/log {message:"enter/on_vehicle/rise_from_void"}

# tag before the cross-dimension teleport: the vehicle and its riders are recreated on
# dimension change, and the tags carry over to the new entities so the driver finds them
tag @s add btc.continuous_rise
execute on passengers run tag @s add btc.continuous_rise

# tp to the bottom of the world
function beyond_the_clouds:tp/sky_bottom

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
