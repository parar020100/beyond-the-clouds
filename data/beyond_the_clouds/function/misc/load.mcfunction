schedule clear beyond_the_clouds:misc/5s
schedule clear beyond_the_clouds:clouds/cloud_spawn_loop
function beyond_the_clouds:misc/5s
#schedule function beyond_the_clouds:clouds/cloud_spawn_loop 60s

#Create Scoreboards
scoreboard objectives add btc.cloud_math dummy
scoreboard objectives add btc.cloudID dummy
scoreboard objectives add btc.cloud_duration dummy
scoreboard objectives add btc.playerID dummy

#Potion Effects Scoreboards
scoreboard objectives add btc.potion.cloud_walker.crouch minecraft.custom:sneak_time
scoreboard objectives add btc.potion.cloud_walker.duration dummy

#Clouds
scoreboard players set #2 btc.cloud_math 2
scoreboard players set #4 btc.cloud_math 4
execute unless score #current_id btc.cloudID matches -2147483648..2147483647 run scoreboard players set #current_id btc.cloudID 0

#Player IDs
execute unless score #current_id btc.playerID matches -2147483648..2147483647 run scoreboard players set #current_id btc.playerID 0
scoreboard players set #1 btc.playerID 1
execute as @a unless score @s btc.playerID matches -2147483648..2147483647 run function beyond_the_clouds:misc/player_id