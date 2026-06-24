# Таймер потока частиц при переходе между мирами (см. misc/landing_fx)
scoreboard objectives add btc.fx dummy

schedule clear beyond_the_clouds:misc/5s
function beyond_the_clouds:misc/5s
schedule clear beyond_the_clouds:misc/check_enter
function beyond_the_clouds:misc/check_enter
schedule clear beyond_the_clouds:misc/check_leave
function beyond_the_clouds:misc/check_leave
