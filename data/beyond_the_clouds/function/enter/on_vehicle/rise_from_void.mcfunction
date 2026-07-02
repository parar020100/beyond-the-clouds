function beyond_the_clouds:debug/log {message:"enter/on_vehicle/rise_from_void"}

# tp to the bottom of the world
function beyond_the_clouds:tp/sky_bottom

# mount the riders
function beyond_the_clouds:enter/vehicle_mount_riders

# we must receive short levitation and then slow falling
tag @s add btc.continuous_rise
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] add btc.continuous_rise

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
