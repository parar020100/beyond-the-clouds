function beyond_the_clouds:debug/log {message:"enter/entity_cleanup"}

# @s is the recovered lone entity in the clouds dimension.
tag @s remove btc.no_cloud_island
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~
tag @s remove btc.transfer_entity
