function beyond_the_clouds:debug/log {message:"enter/on_vehicle/fall_from_sky"}

# no island found, fall from the sky
function beyond_the_clouds:tp/sky_top

# mount the riders back onto the vehicle
function beyond_the_clouds:enter/vehicle_mount_riders

# we must receive short slow falling for a controlled descent
tag @s add btc.continuous_fall
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] add btc.continuous_fall

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start

