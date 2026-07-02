# Leave dispatcher. Called for entities below Y-48 in clouds.

function beyond_the_clouds:debug/log {message:"leave"}

execute if entity @s[tag=btc.entering] run return 0
execute if entity @s[tag=btc.leaving] run return 0
tag @s add btc.leaving

function beyond_the_clouds:debug/log {message:"trying leave"}

# A vehicle waits for its passenger to move the whole stack.
execute on passengers run return 0

# Player, sitting on a happy ghast
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=minecraft:happy_ghast] run return run function beyond_the_clouds:leave/on_vehicle_no_effects

# Player, sitting on a non-living vehicle
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=#beyond_the_clouds:non_living_vehicle] run return run function beyond_the_clouds:leave/on_vehicle_no_effects

# Player, sitting on a mob
execute if entity @s[type=minecraft:player] on vehicle run return run function beyond_the_clouds:leave/on_vehicle_with_effects

# Player with elytra and no vehicle
execute if entity @s[type=minecraft:player] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run return run function beyond_the_clouds:leave/alone_no_effects

# Player without vehicle
execute if entity @s[type=minecraft:player] run return run function beyond_the_clouds:leave/alone_with_effects

# Entity on a vehicle without a player
execute on vehicle run return run function beyond_the_clouds:leave/on_vehicle_with_effects

# Other entities
function beyond_the_clouds:leave/alone_with_effects
