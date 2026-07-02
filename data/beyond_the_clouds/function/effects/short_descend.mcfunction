# Short slow falling for a controlled descent. Called every tick while the continuous window is open.
function beyond_the_clouds:debug/log {message:"effects/short_descend"}

effect give @s minecraft:slow_falling 10 0 true
