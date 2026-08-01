# No island: arrive at world bottom and rise visibly above the void

function beyond_the_clouds:debug/log {message:"enter/alone/rise_from_void"}

# tag before the cross-dimension teleport: a non-player entity is recreated on dimension
# change (which invalidates @s), and the tag carries over to the new entity so the driver finds it
tag @s add btc.continuous_rise

# tp to the bottom of the world
function beyond_the_clouds:tp/sky_bottom

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
