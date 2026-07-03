function beyond_the_clouds:debug/log {message:"leave/falling_block"}

tag @s add btc.leaving

# Mark the entity so it can be recovered after the cross-dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# Keep the destination chunk loaded for the teleport itself.
execute at @s in minecraft:overworld run forceload add ~ ~

# Transfer at the requested height.
execute in minecraft:overworld run tp @s ~ 500 ~

# Y=500 is above the Overworld build height. Reset the age and give the falling block
# enough downward velocity to enter the valid height range before it can expire again.
execute in minecraft:overworld as @e[type=minecraft:falling_block,tag=btc.transfer_entity] run data modify entity @s Time set value 1
execute in minecraft:overworld as @e[type=minecraft:falling_block,tag=btc.transfer_entity] run data modify entity @s Motion[1] set value -4.0d

execute in minecraft:overworld as @e[type=minecraft:falling_block,tag=btc.transfer_entity] at @s run function beyond_the_clouds:fx/transition_visual

execute in minecraft:overworld run forceload remove ~ ~
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"leave/falling_block: complete"}
