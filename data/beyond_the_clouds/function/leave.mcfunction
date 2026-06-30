# Leave dispatcher. Called for entities below Y-48 in clouds.

execute if entity @s[type=minecraft:player] run advancement revoke @s only beyond_the_clouds:leave_dimension

# A vehicle waits for its passenger to move the whole stack.
execute on passengers run return 0

# Игрок на гасте
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=minecraft:happy_ghast] run return run function beyond_the_clouds:leave/player_on_ghast

# Игрок, сидит на неодушевлённом транспортном средстве
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=#beyond_the_clouds:non_living_vehicle] run return run function beyond_the_clouds:leave/player_on_transport

# Игрок, сидит на мобе
execute if entity @s[type=minecraft:player] on vehicle run return run function beyond_the_clouds:leave/player_on_mob

# Игрок без транспорта
execute if entity @s[type=minecraft:player] run return run function beyond_the_clouds:leave/player_alone

# Энтити на транспорте без игрока
execute on vehicle run return run function beyond_the_clouds:leave/entity_on_vehicle

# Другие энтити
function beyond_the_clouds:leave/entity_without_player
