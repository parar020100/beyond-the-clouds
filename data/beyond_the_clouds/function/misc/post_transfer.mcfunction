# Runs one tick after a cross-dimension transfer.
#
# Every entity except a player is destroyed and rebuilt in the destination world, and the new
# copy is not addressable by selectors during the tick of the jump — it is found in neither
# dimension. Anything that has to run in the destination therefore has to wait a tick. Tags
# survive the rebuild, so they are what carries the work order across.
#
# Callers tag the entities and `schedule ... 1t append` this function before teleporting.
# Append rather than replace: transfers can happen on consecutive ticks, and a replacing
# schedule would keep pushing the pending work forward instead of running it.

# Falling blocks arrive above the Overworld build height. Reset the age so they do not expire,
# and give them enough downward velocity to reach the valid height range.
execute in minecraft:overworld as @e[tag=btc.pending_falling_block] run data modify entity @s Time set value 1
execute in minecraft:overworld as @e[tag=btc.pending_falling_block] run data modify entity @s Motion[1] set value -4.0d

# Arrival effect for everything that was transferred.
execute in minecraft:overworld as @e[tag=btc.pending_fx] at @s run function beyond_the_clouds:fx/transition_visual
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.pending_fx] at @s run function beyond_the_clouds:fx/transition_visual

execute in minecraft:overworld run tag @e[tag=btc.pending_falling_block] remove btc.pending_falling_block
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.pending_falling_block] remove btc.pending_falling_block
execute in minecraft:overworld run tag @e[tag=btc.pending_fx] remove btc.pending_fx
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.pending_fx] remove btc.pending_fx
