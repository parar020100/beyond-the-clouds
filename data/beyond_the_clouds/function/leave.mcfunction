# Возврат сущности из измерения облаков в оверворлд (вызывается из misc/check_leave)

# Сбросить advancement выхода (только для игроков — у мобов команда advancement падает с ошибкой)
execute if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:leave_dimension

# Если @s едет верхом — перенести весь "стек" целиком и выйти (любой транспорт, включая happy ghast)
execute on vehicle run return run function beyond_the_clouds:leave_on_vehicle
# Если у @s есть пассажиры — перенос выполнит сам пассажир, поэтому здесь ничего не делаем
execute on passengers run return 0

# Прогрузить целевой чанк, чтобы телепорт и поиск поверхности работали корректно
execute at @s in overworld run forceload add ~ ~

# Зайти в оверворлд на Y500
execute in minecraft:overworld run tp @s ~ 500 ~

# Игрок остаётся высоко на Y500 (долгий спуск); прочие сущности — в 10 блоках над поверхностью
execute unless entity @s[type=minecraft:player] at @s in minecraft:overworld positioned over motion_blocking run tp @s ~ ~10 ~

# Плавное падение: игроку — на весь спуск с Y500, остальным — коротко
execute if entity @s[type=minecraft:player] run effect give @s slow_falling 10 0 false
execute unless entity @s[type=minecraft:player] run effect give @s slow_falling 5 0 false

# Игроку — левитация на 10 секунд (парящее появление над облаками перед спуском)
execute if entity @s[type=minecraft:player] run effect give @s levitation 10 0 false

# Поверхности не нашлось (упали на дно мира Y-64): продлить падение и вернуть на Y500
execute at @s if predicate beyond_the_clouds:at_dimension_floor_overworld run effect give @s slow_falling 60 0 false
execute at @s if predicate beyond_the_clouds:at_dimension_floor_overworld run tp @s ~ 500 ~

# Эффект выхода: поток частиц (облака + снежинки) — см. misc/leave_fx
function beyond_the_clouds:misc/leave_fx

# Снять forceload — чанк больше не нужно держать загруженным
execute at @s in overworld run forceload remove ~ ~
