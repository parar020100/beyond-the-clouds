# Entry dispatcher. Called for entities above Y512 in the overworld.

function beyond_the_clouds:debug/log {message:"enter"}

execute if entity @s[tag=btc.entering] run return 0
execute if entity @s[tag=btc.leaving] run return 0
tag @s add btc.entering

function beyond_the_clouds:debug/log {message:"trying enter"}

# A vehicle waits for its passenger to move the whole stack.
execute on passengers run return 0

# Player on a happy ghast
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=minecraft:happy_ghast] run return run function beyond_the_clouds:enter/on_vehicle/world_bottom

# Player on a non-living vehicle
execute if entity @s[type=minecraft:player] on vehicle if entity @s[type=#beyond_the_clouds:non_living_vehicle] run return run function beyond_the_clouds:enter/on_vehicle/island_or_fall

# Player on a mob
execute if entity @s[type=minecraft:player] on vehicle run return run function beyond_the_clouds:enter/on_vehicle/island_or_rise

# Player with elytra and no vehicle
execute if entity @s[type=minecraft:player] if data entity @s Inventory[{Slot:102b,id:"minecraft:elytra"}] run return run function beyond_the_clouds:enter/alone/world_bottom

# Player without elytra and no vehicle
execute if entity @s[type=minecraft:player] run return run function beyond_the_clouds:enter/alone/island_or_rise

# Entity or mob sitting on a mob or vehicle
execute if entity @s on vehicle run return run function beyond_the_clouds:enter/on_vehicle/island_or_fall

# Other entities
function beyond_the_clouds:enter/alone/island_or_fall
