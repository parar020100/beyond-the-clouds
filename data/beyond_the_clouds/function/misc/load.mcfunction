# Таймер потока частиц при переходе между мирами (см. misc/landing_fx)
scoreboard objectives add btc.fx dummy
scoreboard objectives add btc.y dummy

schedule clear beyond_the_clouds:misc/sky_village_check
function beyond_the_clouds:misc/sky_village_check
schedule clear beyond_the_clouds:misc/check_enter
function beyond_the_clouds:misc/check_enter
schedule clear beyond_the_clouds:misc/check_leave
function beyond_the_clouds:misc/check_leave
