# Эффект входа в измерение для @s: поток частиц (облака + снежинки + портал) на ~8 секунд
# и эпичный звук для игроков. Длинное окно — чтобы эффект был виден после прогрузки чанков у клиента.
# Запускать как "execute as <цель> run function ..." (или напрямую).
scoreboard players set @s btc.fx 160
tag @s add btc.enter_fx
schedule function beyond_the_clouds:misc/landing_fx 1t
execute if entity @s[type=minecraft:player] run playsound minecraft:block.end_portal.spawn ambient @s
