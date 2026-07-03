# Timer of the particle stream when transitioning between worlds (see misc/landing_fx)
scoreboard objectives add btc.fx dummy
scoreboard objectives add btc.y dummy
scoreboard objectives add btc.continuous_effects_timer dummy

# stop any continuous effect window left running across a reload
schedule clear beyond_the_clouds:effects/continuous_effects_apply_tick
function beyond_the_clouds:effects/continuous_effects_apply_stop

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
