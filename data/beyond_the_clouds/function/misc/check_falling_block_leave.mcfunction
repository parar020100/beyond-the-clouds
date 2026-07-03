# Falling blocks older than 100 ticks expire outside the dimension's build height. Keep
# their age low near the bottom so they survive long enough to reach the Y=0 transfer.
execute in beyond_the_clouds:beyond_the_clouds as @e[type=minecraft:falling_block,tag=!btc.entering,tag=!btc.leaving] at @s if predicate beyond_the_clouds:falling_block_near_cloud_bottom run data modify entity @s Time set value 1

execute in beyond_the_clouds:beyond_the_clouds as @e[type=minecraft:falling_block,tag=!btc.entering,tag=!btc.leaving] at @s if predicate beyond_the_clouds:falling_block_at_cloud_bottom run function beyond_the_clouds:leave/falling_block

schedule function beyond_the_clouds:misc/check_falling_block_leave 1t
