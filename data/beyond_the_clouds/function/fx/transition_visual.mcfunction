# Same long visual effect for entering and leaving clouds.
function beyond_the_clouds:debug/log {message:"fx/transition_visual"}


scoreboard players set @s btc.fx 200

schedule function beyond_the_clouds:fx/landing_fx 1t

execute if entity @s[type=minecraft:player] run playsound minecraft:block.end_portal.spawn ambient @s
