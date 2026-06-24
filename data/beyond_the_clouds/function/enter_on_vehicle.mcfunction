# Перенос любого транспорта (включая happy ghast) с пассажирами из оверворлда в измерение облаков.
# Вызывается из enter. @s — транспорт. Гаст и прочий транспорт обрабатываются единым кодом:
# пассажиров ссаживаем, переносим транспорт, сажаем обратно, накладываем эффекты.

# Пометить транспорт и пассажиров; игрокам сбросить advancement входа
tag @s add btc.transfer_vehicle
execute on passengers run tag @s add btc.transfer_rider
execute on passengers if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:enter_dimension

# Ссадить пассажиров (телепорт между мирами рвёт посадку — пересадим вручную)
execute on passengers run ride @s dismount

# Прогрузить чанк и перенести транспорт в измерение
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~
execute in beyond_the_clouds:beyond_the_clouds run tp @s ~ -40 ~

# Перенести пассажиров к транспорту и снова посадить их
execute in minecraft:overworld as @e[tag=btc.transfer_rider] in beyond_the_clouds:beyond_the_clouds at @e[tag=btc.transfer_vehicle,limit=1] run tp @s ~ ~1 ~
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] at @s run ride @s mount @e[tag=btc.transfer_vehicle,limit=1,sort=nearest]

# Эффекты: плавное падение транспорту и пассажирам + визуальный эффект входа (частицы + звук)
effect give @s slow_falling 30 0 false
effect give @a[tag=btc.transfer_rider] slow_falling 30 0 false

function beyond_the_clouds:misc/enter_fx
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] run function beyond_the_clouds:misc/enter_fx

# Снять forceload и убрать временные метки
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~
execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.transfer_rider] remove btc.transfer_rider
tag @s remove btc.transfer_vehicle
return 1
