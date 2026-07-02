function beyond_the_clouds:debug/log {message:"leave/alone_no_effects"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit
function beyond_the_clouds:debug/log {message:"leave/alone_no_effects: dimension teleport complete"}

# teleport effect
execute in minecraft:overworld as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:fx/transition_visual

# Always release the destination chunk, even if the transferred entity was lost.
execute in minecraft:overworld run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"leave/alone_no_effects: complete"}
