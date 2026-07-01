# Player leaves clouds high above overworld with short slow falling.

# load the chunk for teleporting
execute at @s in minecraft:overworld run forceload add ~ ~

# teleport to the overworld sky
execute in minecraft:overworld run function beyond_the_clouds:tp/overworld_exit

# give the player short slow falling
function beyond_the_clouds:effects/leave_fall

# teleport effect
function beyond_the_clouds:fx/transition_visual

# stop forceloading the chunk
execute at @s in minecraft:overworld run forceload remove ~ ~
