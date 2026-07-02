function beyond_the_clouds:debug/log {message:"leave/entity_cleanup"}

# @s is the recovered lone entity in the overworld.
execute at @s in minecraft:overworld run forceload remove ~ ~
tag @s remove btc.transfer_entity
