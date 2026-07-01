# Unlock as soon as the condition that started the transition is no longer true.
execute in minecraft:overworld as @e[tag=btc.entering] at @s unless predicate beyond_the_clouds:at_enter_height_overworld run tag @s remove btc.entering
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.entering] at @s unless predicate beyond_the_clouds:at_enter_height_overworld run tag @s remove btc.entering
execute in minecraft:overworld as @e[tag=btc.leaving] at @s unless predicate beyond_the_clouds:at_leave_height_clouds run tag @s remove btc.leaving
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.leaving] at @s unless predicate beyond_the_clouds:at_leave_height_clouds run tag @s remove btc.leaving

schedule function beyond_the_clouds:misc/check_transition 5t
