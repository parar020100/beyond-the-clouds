data remove storage beyond_the_clouds cloudStats
#Get Cloud Position
execute store result storage beyond_the_clouds cloudStats.position_x int 1 run random roll -64..64
execute store result storage beyond_the_clouds cloudStats.position_y int 1 run random roll 96..320
execute store result storage beyond_the_clouds cloudStats.position_z int 1 run random roll -64..64
#Get Cloud Size
execute store result storage beyond_the_clouds cloudStats.size_x int 1 run random roll 8..14
execute store result storage beyond_the_clouds cloudStats.size_y int 1 run random roll 3..4
execute store result storage beyond_the_clouds cloudStats.size_z int 1 run random roll 5..9
#Secondary Size Operation
execute store result score #size_x btc.cloud_math run data get storage beyond_the_clouds cloudStats.size_x 4
execute store result score #size_y btc.cloud_math run data get storage beyond_the_clouds cloudStats.size_y 4
execute store result score #size_z btc.cloud_math run data get storage beyond_the_clouds cloudStats.size_z 4
#Get Cloud Center
execute store result storage beyond_the_clouds cloudStats.center_x float 0.125 run scoreboard players get #size_x btc.cloud_math
execute store result storage beyond_the_clouds cloudStats.center_y float 0.125 run scoreboard players get #size_y btc.cloud_math
execute store result storage beyond_the_clouds cloudStats.center_z float 0.125 run scoreboard players get #size_z btc.cloud_math
#Get Cloud Secondary Size
execute store result storage beyond_the_clouds cloudStats.secondary_size_x float 0.25 run scoreboard players operation #size_x btc.cloud_math -= #2 btc.cloud_math
execute store result storage beyond_the_clouds cloudStats.secondary_size_y float 0.25 run scoreboard players operation #size_y btc.cloud_math -= #2 btc.cloud_math
execute store result storage beyond_the_clouds cloudStats.secondary_size_z float 0.25 run scoreboard players operation #size_z btc.cloud_math -= #2 btc.cloud_math
#Start Spawn
function beyond_the_clouds:clouds/spawn_cloud with storage beyond_the_clouds cloudStats