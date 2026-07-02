# No island: arrive at world bottom and rise visibly above the void

function beyond_the_clouds:debug/log {message:"enter/alone/rise_from_void"}

# tp to the bottom of the world
function beyond_the_clouds:tp/sky_bottom

# we must receive short levitation and then slow falling
tag @s add btc.continuous_rise

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
