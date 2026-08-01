# Window closed: drop every continuous-effect profile tag in both dimensions.
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.continuous_rise] remove btc.continuous_rise
execute in minecraft:overworld run tag @e[tag=btc.continuous_rise] remove btc.continuous_rise
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.continuous_fall] remove btc.continuous_fall
execute in minecraft:overworld run tag @e[tag=btc.continuous_fall] remove btc.continuous_fall
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.continuous_descend] remove btc.continuous_descend
execute in minecraft:overworld run tag @e[tag=btc.continuous_descend] remove btc.continuous_descend
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.continuous_hover] remove btc.continuous_hover
execute in minecraft:overworld run tag @e[tag=btc.continuous_hover] remove btc.continuous_hover
