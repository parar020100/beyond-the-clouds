# Проверка, что после переходов ничего не залипло. В норме все списки пустые.

say [state] Проверяю остаточное состояние. В норме всё пусто.

execute in minecraft:overworld run tag @e[tag=btc.leaving] list
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.leaving] list
execute in minecraft:overworld run tag @e[tag=btc.entering] list
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.entering] list
execute in minecraft:overworld run tag @e[tag=btc.pending_fx] list
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.pending_fx] list
execute in minecraft:overworld run tag @e[tag=btc.pending_falling_block] list
execute in minecraft:overworld run tag @e[tag=btc.transfer_entity] list
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_entity] list
execute in minecraft:overworld run tag @e[tag=btc.continuous_descend] list

execute in minecraft:overworld run forceload query
execute in beyond_the_clouds:beyond_the_clouds run forceload query
