# Timer of the particle stream when transitioning between worlds (see misc/landing_fx)
scoreboard objectives add btc.fx dummy
scoreboard objectives add btc.y dummy
scoreboard objectives add btc.continuous_effects_timer dummy

# stop any continuous effect window left running across a reload
schedule clear beyond_the_clouds:effects/continuous_effects_apply_tick
function beyond_the_clouds:effects/continuous_effects_apply_stop

# drop pending post-transfer work left over from before the reload
schedule clear beyond_the_clouds:misc/post_transfer
execute in minecraft:overworld run tag @e[tag=btc.pending_fx] remove btc.pending_fx
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.pending_fx] remove btc.pending_fx
execute in minecraft:overworld run tag @e[tag=btc.pending_falling_block] remove btc.pending_falling_block
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.pending_falling_block] remove btc.pending_falling_block

schedule clear beyond_the_clouds:misc/sky_village_check
function beyond_the_clouds:misc/sky_village_check
schedule clear beyond_the_clouds:misc/check_enter
function beyond_the_clouds:misc/check_enter
schedule clear beyond_the_clouds:misc/check_leave
function beyond_the_clouds:misc/check_leave
schedule clear beyond_the_clouds:misc/check_falling_block_leave
function beyond_the_clouds:misc/check_falling_block_leave
schedule clear beyond_the_clouds:misc/check_transition
function beyond_the_clouds:misc/check_transition
