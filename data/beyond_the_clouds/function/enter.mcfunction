# Entry dispatcher. Called for entities above Y512 in the overworld.

execute if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:enter_dimension

# A vehicle waits for its passenger to move the whole stack.
execute on passengers run return 0

# Игрок, сидит на гасте
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=minecraft:happy_ghast] run return run function beyond_the_clouds:enter/on_vehicle/world_bottom

# Игрок, сидит на неодушевлённом транспортном средстве
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=#beyond_the_clouds:non_living_vehicle] run return run function beyond_the_clouds:enter/on_vehicle/island_or_fall

# Игрок, сидит на мобе
execute if entity @s[type=minecraft:player] on vehicle run return run function beyond_the_clouds:enter/on_vehicle/island_or_rise

# Игрок с элитрами без транспорта
execute if entity @s[type=minecraft:player] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run return run function beyond_the_clouds:enter/alone/world_bottom

# Игрок без элитр и без транспорта
execute if entity @s[type=minecraft:player] run return run function beyond_the_clouds:enter/alone/island_or_rise

# Энтити или моб сидит на мобе или транспорте
execute if entity @s on vehicle run return run function beyond_the_clouds:enter/on_vehicle/island_or_fall

# Другие энтити
function beyond_the_clouds:enter/alone/fall_from_sky
