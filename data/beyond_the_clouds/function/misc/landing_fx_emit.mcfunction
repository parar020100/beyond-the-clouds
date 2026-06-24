# Один кадр потока частиц для @s (вызывается из misc/landing_fx, выполняется "at @s")
particle minecraft:cloud ~ ~1 ~ 0.2 0.4 0.2 0.1 8
particle minecraft:snowflake ~ ~1 ~ 0.2 0.4 0.2 0.05 5
# Только при входе в измерение (метка btc.enter_fx) — добавить частицы портала
execute if entity @s[tag=btc.enter_fx] run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.3 10
# Уменьшить таймер; когда истёк — снять метку входа
scoreboard players remove @s btc.fx 1
execute if score @s btc.fx matches ..0 run tag @s remove btc.enter_fx
