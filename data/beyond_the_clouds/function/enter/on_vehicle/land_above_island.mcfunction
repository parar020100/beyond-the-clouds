function beyond_the_clouds:debug/log {message:"enter/on_vehicle/land_above_island"}

# tag before the cross-dimension teleport: the vehicle and its riders are recreated on
# dimension change, and the tags carry over to the new entities so the driver finds them
tag @s add btc.continuous_descend
execute on passengers run tag @s add btc.continuous_descend

# tp slightly above the island
function beyond_the_clouds:tp/above_ground

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
