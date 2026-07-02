execute as @a[tag=btc.transition_sound] at @s if dimension beyond_the_clouds:beyond_the_clouds run playsound minecraft:block.portal.travel ambient @s
execute as @a[tag=btc.transition_sound] at @s if dimension minecraft:overworld run playsound minecraft:entity.lightning_bolt.thunder weather @s ~ ~ ~ 16 0.5
execute as @a[tag=btc.transition_sound] at @s if dimension minecraft:overworld run playsound minecraft:entity.lightning_bolt.thunder weather @s ~ ~ ~ 16 0.9

execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transition_sound] remove btc.transition_sound
execute in minecraft:overworld run tag @e[tag=btc.transition_sound] remove btc.transition_sound
