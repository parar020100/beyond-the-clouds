# Player with elytra enters clouds at Y40 without potion effects.

function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom"}

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# teleport to the bottom of the world
execute in beyond_the_clouds:beyond_the_clouds run function beyond_the_clouds:tp/sky_bottom
function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom: dimension teleport complete"}

# teleport effect
function beyond_the_clouds:fx/transition_visual

# stop forceloading the chunk
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~
function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom: complete"}
