function beyond_the_clouds:debug/log {message:"leave/alone_with_effects"}

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit
function beyond_the_clouds:debug/log {message:"leave/alone_with_effects: dimension teleport complete"}

# we must receive short slow falling for a controlled descent
tag @s add btc.continuous_descend

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start

# teleport effect
function beyond_the_clouds:fx/transition_visual

# stop forceloading the chunk
execute at @s in minecraft:overworld run forceload remove ~ ~
function beyond_the_clouds:debug/log {message:"leave/alone_with_effects: complete"}
