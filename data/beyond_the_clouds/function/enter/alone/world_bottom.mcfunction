# Player with elytra enters clouds at Y40 without potion effects.

function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# teleport to the bottom of the world
execute in beyond_the_clouds:beyond_the_clouds run function beyond_the_clouds:tp/sky_bottom
function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom: dimension teleport complete"}

# teleport effect
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:fx/transition_visual

# Clean up using the recovered entity rather than the invalid pre-teleport @s.
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:enter/entity_cleanup
function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom: complete"}
