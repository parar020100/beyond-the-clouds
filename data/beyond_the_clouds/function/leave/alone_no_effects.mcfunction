function beyond_the_clouds:debug/log {message:"leave/alone_no_effects"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# Queue the arrival effect before the jump: afterwards @s may be a different entity that
# selectors cannot reach until the next tick.
tag @s add btc.pending_fx
schedule function beyond_the_clouds:misc/post_transfer 1t append

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit
function beyond_the_clouds:debug/log {message:"leave/alone_no_effects: dimension teleport complete"}

# Always release the destination chunk, even if the transferred entity was lost.
execute in minecraft:overworld run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"leave/alone_no_effects: complete"}
