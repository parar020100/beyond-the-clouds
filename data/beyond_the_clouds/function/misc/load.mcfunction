schedule clear beyond_the_clouds:misc/5s
schedule clear beyond_the_clouds:clouds/cloud_spawn_loop
function beyond_the_clouds:misc/5s
#schedule function beyond_the_clouds:clouds/cloud_spawn_loop 60s

#Create Scoreboards
scoreboard objectives add btc.cloud_math dummy
scoreboard objectives add btc.cloudID dummy
scoreboard objectives add btc.cloud_duration dummy

#Clouds
scoreboard players set #2 btc.cloud_math 2
scoreboard players set #4 btc.cloud_math 4
execute unless score #current_id btc.cloudID matches -2147483648..2147483647 run scoreboard players set #current_id btc.cloudID 0
