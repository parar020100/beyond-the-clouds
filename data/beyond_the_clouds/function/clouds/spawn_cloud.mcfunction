#Spawn cloud parts
$execute positioned ~$(position_x) $(position_y) ~$(position_z) run summon block_display ~ ~ ~ {block_state:{Name:"minecraft:white_stained_glass"},Tags:["btc.cloud_dis1","btc.cloud_dis","btc.cloud_dis1_new","btc.cloud_part","btc.cloud_part_new"]}
$execute positioned ~$(position_x) $(position_y) ~$(position_z) run summon block_display ~0.25 ~0.25 ~0.25 {block_state:{Name:"minecraft:powder_snow"},Tags:["btc.cloud_dis2","btc.cloud_dis","btc.cloud_dis2_new","btc.cloud_part","btc.cloud_part_new"]}
$execute positioned ~$(position_x) $(position_y) ~$(position_z) run summon marker ~$(center_x) ~$(center_y) ~$(center_z) {Tags:["btc.cloud","btc.cloud_new","btc.cloud_part","btc.cloud_part_new"]}
#Resize block displays
$data merge entity @e[tag=btc.cloud_dis1_new,limit=1] {transformation:{scale:[$(size_x)f,$(size_y)f,$(size_z)f]}}
$data merge entity @e[tag=btc.cloud_dis2_new,limit=1] {transformation:{scale:[$(secondary_size_x)f,$(secondary_size_y)f,$(secondary_size_z)f]}}
#Set Cloud IDs
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.cloudID int 1 run scoreboard players get #current_id btc.cloudID
execute as @e[tag=btc.cloud_part_new] run scoreboard players operation @s btc.cloudID = #current_id btc.cloudID
scoreboard players add #current_id btc.cloudID 1
#Get Particle Stats
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.particle_x float 0.0625 run scoreboard players operation #size_x btc.cloud_math += #2 btc.cloud_math
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.particle_y float 0.0625 run scoreboard players operation #size_y btc.cloud_math += #2 btc.cloud_math
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.particle_z float 0.0625 run scoreboard players operation #size_z btc.cloud_math += #2 btc.cloud_math
#Get Cloud Corner
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.corner_x float -0.125 run scoreboard players get #size_x btc.cloud_math
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.corner_y float -0.125 run scoreboard players get #size_y btc.cloud_math
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.corner_z float -0.125 run scoreboard players get #size_z btc.cloud_math
#Get Size
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.size_x float 0.25 run scoreboard players operation #size_x btc.cloud_math -= #2 btc.cloud_math
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.size_y float 0.25 run scoreboard players operation #size_y btc.cloud_math -= #2 btc.cloud_math
execute as @e[tag=btc.cloud_new,limit=1] store result entity @s data.size_z float 0.25 run scoreboard players operation #size_z btc.cloud_math -= #2 btc.cloud_math
#Remove tags
tag @e[tag=btc.cloud_dis1_new] remove btc.cloud_dis1_new
tag @e[tag=btc.cloud_dis2_new] remove btc.cloud_dis2_new
tag @e[tag=btc.cloud_new] remove btc.cloud_new
tag @e[tag=btc.cloud_part_new] remove btc.cloud_part_new
tellraw @a "cloud_spawned"