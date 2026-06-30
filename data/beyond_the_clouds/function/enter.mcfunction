# Entry dispatcher. Called for entities above Y512 in the overworld.

execute if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:enter_dimension

# A vehicle waits for its passenger to move the whole stack.
execute on passengers run return 0

# Игрок, сидит на гасте
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=minecraft:happy_ghast] run return run function beyond_the_clouds:enter/player_on_ghast

# Игрок, сидит на неодушевлённом транспортном средстве
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=#beyond_the_clouds:non_living_vehicle] run return run function beyond_the_clouds:enter/player_on_transport

# Игрок, сидит на мобе
execute if entity @s[type=minecraft:player] on vehicle run return run function beyond_the_clouds:enter/player_on_mob

# Игрок с элитрами без транспорта
execute if entity @s[type=minecraft:player] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run return run function beyond_the_clouds:enter/player_with_elytra

# Фигня какая-то
##execute if entity @s[type=minecraft:player] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] on vehicle run return run function beyond_the_clouds:enter/player_with_elytra_on_vehicle

# Игрок без элитр и без транспорта
execute if entity @s[type=minecraft:player] run return run function beyond_the_clouds:enter/player_alone

# Энтити на транспорте без игрока
execute on vehicle run return run function beyond_the_clouds:enter/entity_on_vehicle

# Другие энтити
function beyond_the_clouds:enter/entity_without_player
