function beyond_the_clouds:debug/log {message:"leave/alone_with_effects"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit
function beyond_the_clouds:debug/log {message:"leave/alone_with_effects: dimension teleport complete"}

# we must receive short slow falling for a controlled descent
execute in minecraft:overworld as @e[tag=btc.transfer_entity] run tag @s add btc.continuous_descend

# refresh effects until the client re-syncs
execute in minecraft:overworld as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:effects/continuous_effects_apply_start

# teleport effect
execute in minecraft:overworld as @e[tag=btc.transfer_entity] at @s run function beyond_the_clouds:fx/transition_visual

# Always release the destination chunk, even if the transferred entity was lost.
execute in minecraft:overworld run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"leave/alone_with_effects: complete"}
