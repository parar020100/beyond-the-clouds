# Возврат любого транспорта (включая happy ghast) с пассажирами в оверворлд. Вызывается из leave.
# @s — транспорт. С игроком стек выходит на Y500, без игрока — на 10 блоков над поверхностью.

# Пометить транспорт и пассажиров
tag @s add btc.transfer_vehicle
execute on passengers run tag @s add btc.transfer_rider
# Пометить транспорт, если среди пассажиров есть игрок (определяет высоту выхода)
execute if entity @e[tag=btc.transfer_rider,type=minecraft:player] run tag @s add btc.unit_has_player
# Игрокам сбросить advancement выхода
execute on passengers if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:leave_dimension
# Ссадить пассажиров (телепорт между мирами рвёт посадку — пересадим вручную)
execute on passengers run ride @s dismount

# Прогрузить чанк и вынести транспорт в оверворлд на Y500
execute at @s in overworld run forceload add ~ ~
execute in minecraft:overworld run tp @s ~ 500 ~
# Стек без игрока опускаем на 10 блоков над поверхностью (игрок остаётся на Y500)
execute unless entity @s[tag=btc.unit_has_player] at @s in minecraft:overworld positioned over motion_blocking run tp @s ~ ~10 ~
# Перенести пассажиров к транспорту и снова посадить их
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] in minecraft:overworld at @e[tag=btc.transfer_vehicle,limit=1] run tp @s ~ ~1 ~
execute in minecraft:overworld as @e[tag=btc.transfer_rider] at @s run ride @s mount @e[tag=btc.transfer_vehicle,limit=1,sort=nearest]

# Эффекты: плавное падение транспорту и пассажирам, левитация на 10с игрокам + визуальный эффект выхода
effect give @s slow_falling 60 0 false
effect give @a[tag=btc.transfer_rider] slow_falling 60 0 false
execute if entity @s[tag=btc.unit_has_player] run effect give @a[tag=btc.transfer_rider] levitation 10 0 false
function beyond_the_clouds:misc/leave_fx
execute in minecraft:overworld as @e[tag=btc.transfer_rider] run function beyond_the_clouds:misc/leave_fx

# Снять forceload и убрать временные метки
execute at @s in overworld run forceload remove ~ ~
execute in minecraft:overworld run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider
tag @s remove btc.transfer_vehicle
tag @s remove btc.unit_has_player
return 1
