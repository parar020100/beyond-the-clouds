function beyond_the_clouds:debug/log {message:"leave/alone_no_effects"}

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit
function beyond_the_clouds:debug/log {message:"leave/alone_no_effects: dimension teleport complete"}

# teleport effect
function beyond_the_clouds:fx/transition_visual

# stop forceloading the chunk
execute at @s in minecraft:overworld run forceload remove ~ ~
function beyond_the_clouds:debug/log {message:"leave/alone_no_effects: complete"}
