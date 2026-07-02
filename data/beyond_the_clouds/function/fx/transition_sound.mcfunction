#execute as @e[tag=btc.transition_sound] at @s run playsound minecraft:entity.enderman.teleport ambient @s
execute as @e[tag=btc.transition_sound] at @s run playsound minecraft:block.portal.travel ambient @s

tag @e[tag=btc.transition_sound] remove btc.transition_sound