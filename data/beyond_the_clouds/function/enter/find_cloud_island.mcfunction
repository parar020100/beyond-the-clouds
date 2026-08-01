# Decide whether there is a surface to land on at this X/Z in the clouds. Nothing is moved:
# a heightmap probe only needs a position, and @s is still in the overworld where it is
# addressable. The verdict is stored as a tag, which survives the teleport recreating @s.
#
# `positioned over <heightmap>` does not run the rest of the chain at all when the column is
# empty - it does not fall through with Y at the world bottom. So the verdict is built the
# safe way round: assume there is no island, and only withdraw that when the chain both
# resolves and finds a real block under the surface. An unreachable or unloaded column then
# degrades to "no island", which is the harmless direction.

function beyond_the_clouds:debug/log {message:"enter/find_cloud_island"}

tag @s add btc.no_cloud_island
execute at @s in beyond_the_clouds:beyond_the_clouds positioned over motion_blocking unless block ~ ~-1 ~ minecraft:void_air run tag @s remove btc.no_cloud_island

execute if entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:debug/log {message:"enter/find_cloud_island: NO island"}
execute unless entity @s[tag=btc.no_cloud_island] run function beyond_the_clouds:debug/log {message:"enter/find_cloud_island: island found"}
