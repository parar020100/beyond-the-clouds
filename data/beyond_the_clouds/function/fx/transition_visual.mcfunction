# Same long visual effect for entering and leaving clouds.
function beyond_the_clouds:debug/log {message:"fx/transition_visual"}


scoreboard players set @s btc.fx 80

schedule function beyond_the_clouds:fx/landing_fx 1t

tag @s add btc.transition_sound
schedule function beyond_the_clouds:fx/transition_sound 10t

execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transition_sound] at @s run playsound minecraft:entity.enderman.teleport ambient @a[tag=!btc.transition_sound] ~ ~ ~ 1 1 1
execute in minecraft:overworld as @e[tag=btc.transition_sound] at @s run playsound minecraft:entity.enderman.teleport ambient @a[tag=!btc.transition_sound] ~ ~ ~ 1 1 1

