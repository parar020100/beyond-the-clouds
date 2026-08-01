function beyond_the_clouds:debug/log {message:"leave/alone_with_effects"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# Mark before the jump. Tags survive @s being recreated in the destination, and the effect
# driver picks them up there on its own.
tag @s add btc.continuous_descend
tag @s add btc.pending_fx
schedule function beyond_the_clouds:misc/post_transfer 1t append

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit
function beyond_the_clouds:debug/log {message:"leave/alone_with_effects: dimension teleport complete"}

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start

# Always release the destination chunk, even if the transferred entity was lost.
execute in minecraft:overworld run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"leave/alone_with_effects: complete"}
