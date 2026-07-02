# Same long visual effect for entering and leaving clouds.
function beyond_the_clouds:debug/log {message:"fx/transition_visual"}


scoreboard players set @s btc.fx 80

schedule function beyond_the_clouds:fx/landing_fx 1t

tag @s add btc.transition_sound
schedule function beyond_the_clouds:fx/transition_sound 10t

