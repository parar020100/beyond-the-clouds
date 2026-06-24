# Перенос сущности из оверворлда в измерение облаков (вызывается из misc/check_enter)

# Сбросить advancement входа (только для игроков — у мобов команда advancement падает с ошибкой)
execute if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:enter_dimension

# Если @s едет верхом — перенести весь "стек" целиком и выйти (любой транспорт, включая happy ghast)
execute on vehicle run return run function beyond_the_clouds:enter_on_vehicle
# Если у @s есть пассажиры — перенос выполнит сам пассажир, поэтому здесь ничего не делаем
execute on passengers run return 0

# Прогрузить целевой чанк, чтобы телепорт и поиск поверхности работали корректно
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# Зайти в измерение на Y0, затем встать на верхнюю твёрдую поверхность (остров) под этой точкой
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ 0 ~
execute at @s in beyond_the_clouds:beyond_the_clouds positioned over motion_blocking run tp @s ~ ~ ~

# Острова нет (остались на полу Y0): левитация поднимает над пустотой + плавное падение
execute at @s if predicate beyond_the_clouds:at_dimension_floor_clouds run effect give @s levitation 10 35 false
execute at @s if predicate beyond_the_clouds:at_dimension_floor_clouds run effect give @s slow_falling 30 0 false

# Под ногами реальный остров: подбросить на +10 и дать плавное падение, чтобы приземлиться с эффектом
execute at @s unless predicate beyond_the_clouds:at_dimension_floor_clouds run tp @s ~ ~10 ~
execute at @s unless predicate beyond_the_clouds:at_dimension_floor_clouds run effect give @s slow_falling 5 0 false

# Эффект входа: поток частиц (облака + снежинки + портал) и эпичный звук — см. misc/enter_fx
function beyond_the_clouds:misc/enter_fx

# Снять forceload — чанк больше не нужно держать загруженным
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~
