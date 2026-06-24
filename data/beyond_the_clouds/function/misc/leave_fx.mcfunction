# Запуск эффекта ВЫХОДА для @s: поток частиц (облака + снежинки) ~8 секунд.
# Без портала и звука — это атрибуты входа. Вызывать "execute as <цель> run function ...".
# Тот же механизм, что и enter_fx (общий таймер btc.fx + misc/landing_fx).
scoreboard players set @s btc.fx 160
schedule function beyond_the_clouds:misc/landing_fx 1t
