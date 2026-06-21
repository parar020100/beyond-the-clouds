tellraw @s "Your potion of Cloud Walking has run out!"
$execute as @e[type=marker,nbt={data:{ownerID:$(ownerID)}}] at @s run particle cloud ~ ~ ~ 0.3 0.3 0.3 0.2 25
$execute as @e[type=marker,nbt={data:{ownerID:$(ownerID)}}] at @s run function beyond_the_clouds:cloud_walk/unplace_cloud_block
tag @s remove btc.potion.cloud_walk