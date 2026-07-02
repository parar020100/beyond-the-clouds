# Один кадр потока частиц для @s (вызывается из misc/landing_fx, выполняется "at @s")
#function beyond_the_clouds:debug/log {message:"fx/landing_fx_emit"}

particle minecraft:cloud ~ ~2 ~ 0.2 0.4 0.2 0.2 1
particle minecraft:snowflake ~ ~2 ~ 0.2 0.4 0.2 0.2 1
particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.08 16
scoreboard players remove @s btc.fx 1
