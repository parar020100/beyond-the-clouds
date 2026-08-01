function beyond_the_clouds:debug/log {message:"leave/falling_block"}

tag @s add btc.leaving

# Mark the entity so it can be recovered after the cross-dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# Y=500 is above the Overworld build height, so the age has to be reset and some downward
# velocity added, and the arrival effect has to be played. None of that can be done in this
# tick: the rebuilt falling block is not addressable by selectors until the next one.
tag @s add btc.pending_falling_block
tag @s add btc.pending_fx
schedule function beyond_the_clouds:misc/post_transfer 1t append

# Keep the destination chunk loaded for the teleport itself.
execute at @s in minecraft:overworld run forceload add ~ ~

# Transfer at the requested height.
execute in minecraft:overworld run tp @s ~ 500 ~

execute in minecraft:overworld run forceload remove ~ ~
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"leave/falling_block: complete"}
