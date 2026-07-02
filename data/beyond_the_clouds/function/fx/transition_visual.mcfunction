# Same long visual effect for entering and leaving clouds.
function beyond_the_clouds:debug/log {message:"fx/transition_visual"}


scoreboard players set @s btc.fx 100

schedule function beyond_the_clouds:fx/landing_fx 1t

tag @s add btc.transition_sound
schedule function beyond_the_clouds:fx/transition_sound 10t

execute if dimension beyond_the_clouds:beyond_the_clouds run playsound minecraft:entity.enderman.teleport ambient @a[tag=!btc.transition_sound] ~ ~ ~ 16 0.9
execute if dimension minecraft:overworld run playsound minecraft:entity.lightning_bolt.thunder weather @a[tag=!btc.transition_sound] ~ ~ ~ 100 0.5
execute if dimension minecraft:overworld run playsound minecraft:entity.lightning_bolt.thunder weather @a[tag=!btc.transition_sound] ~ ~ ~ 100 1
