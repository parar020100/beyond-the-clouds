# No island: start at Y-40 and apply levitation if this entity can receive it.

function beyond_the_clouds:debug/log {message:"enter/alone/fall_from_sky"}

# tag before the cross-dimension teleport: a non-player entity is recreated on dimension
# change (which invalidates @s), and the tag carries over to the new entity so the driver finds it
tag @s add btc.continuous_fall

# no island found, fall from the sky
function beyond_the_clouds:tp/sky_top

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start
