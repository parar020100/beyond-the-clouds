# Island found: arrive above its surface and slowly descend.

function beyond_the_clouds:debug/log {message:"enter/alone/land_above_island"}

# tag before the cross-dimension teleport: a non-player entity is recreated on dimension
# change (which invalidates @s), and the tag carries over to the new entity so the driver finds it
tag @s add btc.continuous_descend

# tp slightly above the island
function beyond_the_clouds:tp/above_ground

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
