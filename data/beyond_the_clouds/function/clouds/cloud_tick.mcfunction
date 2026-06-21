$execute as @e[tag=btc.cloud_part,distance=..24,scores={btc.cloudID=$(cloudID)}] at @s run tp ^0.025 ^ ^
$particle cloud ~ ~ ~ $(particle_x) $(particle_y) $(particle_z) 0.1 5 force @a
$execute positioned ~$(corner_x) ~$(corner_y) ~$(corner_z) run effect give @a[dx=$(size_x),dy=$(size_y),dz=$(size_z)] levitation 1 15 false
scoreboard players add @s btc.cloud_duration 1
$execute if score @s btc.cloud_duration matches 6000 run beyond_the_clouds:clouds/cloud_death {"cloudID":"$(cloudID)","particle_x":"$(particle_x)","particle_y":"$(particle_y)","particle_z":"$(particle_z)"}