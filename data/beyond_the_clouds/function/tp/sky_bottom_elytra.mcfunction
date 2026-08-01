function beyond_the_clouds:debug/log {message:"tp/sky_bottom_elytra"}

# 12 blocks above the plain world-bottom arrival. An elytra flier arrives without any
# vehicle to hold them up, so they need room while the destination is still loading.
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ -28 ~

function beyond_the_clouds:debug/log {message:"tp/sky_bottom_elytra: complete"}
