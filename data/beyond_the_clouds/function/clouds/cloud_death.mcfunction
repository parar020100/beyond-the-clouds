$particle cloud ~ ~ ~ $(particle_x) $(particle_y) $(particle_z) 0.2 250 force @a
$kill @e[scores={btc.cloudID=$(cloudID)}]
tellraw @a "cloud_died"