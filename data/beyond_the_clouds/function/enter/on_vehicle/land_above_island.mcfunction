function beyond_the_clouds:debug/log {message:"enter/on_vehicle/land_above_island"}

# tp slightly above the island
function beyond_the_clouds:tp/above_ground

# mount the riders
function beyond_the_clouds:enter/vehicle_mount_riders

# we need to receive short slow falling for a controlled descent
tag @s add btc.continuous_descend
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] add btc.continuous_descend

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
