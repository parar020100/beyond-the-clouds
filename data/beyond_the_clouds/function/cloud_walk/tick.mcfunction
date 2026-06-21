execute store result storage btc:cloud_walk_id ownerID int 1 run scoreboard players get @s btc.playerID
execute unless predicate beyond_the_clouds:crouching align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ air run function beyond_the_clouds:cloud_walk/place_cloud_block with storage btc:cloud_walk_id
execute if predicate beyond_the_clouds:crouching run function beyond_the_clouds:cloud_walk/crouching_remove_blocks with storage btc:cloud_walk_id
function beyond_the_clouds:cloud_walk/detect_unused_barrier with storage btc:cloud_walk_id
scoreboard players remove @s btc.potion.cloud_walker.duration 1
execute if block ~ ~-0.5 ~ barrier run particle minecraft:cloud ~ ~-0.5 ~ 0.2 0.2 0.2 0.05 3
effect give @s slow_falling 5 0 true
execute if score @s btc.potion.cloud_walker.duration matches ..0 run function beyond_the_clouds:cloud_walk/take_effect with storage btc:cloud_walk_id