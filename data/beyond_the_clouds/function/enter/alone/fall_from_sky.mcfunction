# No island: start at Y-40 and apply levitation if this entity can receive it.

function beyond_the_clouds:debug/log {message:"enter/alone/fall_from_sky"}

# no island found, fall from the sky
function beyond_the_clouds:tp/sky_top

# give the slow falling effect (45 seconds)
function beyond_the_clouds:effects/fall_from_sky
