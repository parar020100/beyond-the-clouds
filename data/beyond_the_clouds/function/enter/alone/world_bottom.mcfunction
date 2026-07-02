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

# Always release the destination chunk, even if the transferred entity was lost.
execute in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom: complete"}
