# Brief levitation so an arriving elytra flier does not drop straight back out while the
# client is still loading the destination. Called every tick during the re-apply window,
# so it must not clear the effect first (that would leave a 1-tick gap the client falls in).
function beyond_the_clouds:debug/log {message:"effects/short_hover"}

effect give @s minecraft:levitation 3 0 true
