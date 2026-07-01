# Leave dispatcher. Called for entities below Y-48 in clouds.

execute if entity @s[tag=btc.entering] run return 0
execute if entity @s[tag=btc.leaving] run return 0
tag @s add btc.leaving

# A vehicle waits for its passenger to move the whole stack.
execute on passengers run return 0

# Игрок на гасте
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=minecraft:happy_ghast] run return run function beyond_the_clouds:leave/on_vehicle_no_effects

# Игрок, сидит на неодушевлённом транспортном средстве
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=#beyond_the_clouds:non_living_vehicle] run return run function beyond_the_clouds:leave/on_vehicle_no_effects

# Игрок, сидит на мобе
execute if entity @s[type=minecraft:player] on vehicle run return run function beyond_the_clouds:leave/on_vehicle_with_effects

# Игрок с элитрами без транспорта
execute if entity @s[type=minecraft:player] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run return run function beyond_the_clouds:leave/alone_no_effects

# Игрок без транспорта
execute if entity @s[type=minecraft:player] run return run function beyond_the_clouds:leave/alone_with_effects

# Энтити на транспорте без игрока
execute on vehicle run return run function beyond_the_clouds:leave/on_vehicle_with_effects

# Другие энтити
function beyond_the_clouds:leave/alone_with_effects
