# Один кадр потока частиц для @s (вызывается из misc/landing_fx, выполняется "at @s")
#function beyond_the_clouds:debug/log {message:"fx/landing_fx_emit"}

particle minecraft:cloud ~ ~1 ~ 0.2 0.4 0.2 0.1 4
particle minecraft:snowflake ~ ~1 ~ 0.2 0.4 0.2 0.05 5
particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 20
scoreboard players remove @s btc.fx 1
