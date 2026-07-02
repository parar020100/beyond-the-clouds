# Rise out of the void, then descend gently. Called every tick during the re-apply window,
# so it must not clear the effect first (that would leave a 1-tick gap the client falls in).
function beyond_the_clouds:debug/log {message:"effects/rise_from_void"}

effect give @s minecraft:levitation 10 30 false
effect give @s minecraft:slow_falling 30 0 false
