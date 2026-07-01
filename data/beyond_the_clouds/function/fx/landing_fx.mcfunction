#function beyond_the_clouds:debug/log {message:"fx/landing_fx"}

execute in minecraft:overworld as @e[scores={btc.fx=1..}] at @s run function beyond_the_clouds:fx/landing_fx_emit
execute in beyond_the_clouds:beyond_the_clouds as @e[scores={btc.fx=1..}] at @s run function beyond_the_clouds:fx/landing_fx_emit
execute in minecraft:overworld if entity @e[scores={btc.fx=1..}] run return run schedule function beyond_the_clouds:fx/landing_fx 1t
execute in beyond_the_clouds:beyond_the_clouds if entity @e[scores={btc.fx=1..}] run schedule function beyond_the_clouds:fx/landing_fx 1t
