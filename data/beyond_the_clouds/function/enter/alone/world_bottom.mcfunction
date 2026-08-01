# Player with elytra enters the clouds near the world bottom, a little above the plain
# arrival height and with brief levitation, so a slow-loading client cannot drop them
# straight back out of the world.

function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom"}

# Mark @s so it can be recovered if the dimension teleport recreates it.
function beyond_the_clouds:common/entity_prepare

# queue the arrival effect and the hover before the jump
tag @s add btc.pending_fx
tag @s add btc.continuous_hover
schedule function beyond_the_clouds:misc/post_transfer 1t append

# load the chunk for teleporting
execute at @s in beyond_the_clouds:beyond_the_clouds run forceload add ~ ~

# teleport near the bottom of the world, with headroom
execute in beyond_the_clouds:beyond_the_clouds run function beyond_the_clouds:tp/sky_bottom_elytra
function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom: dimension teleport complete"}

# refresh effects until the client re-syncs
function beyond_the_clouds:effects/continuous_effects_apply_start

# Always release the destination chunk, even if the transferred entity was lost.
execute in beyond_the_clouds:beyond_the_clouds run forceload remove ~ ~

# clean up tags
function beyond_the_clouds:common/clear_all_transfer_tags

function beyond_the_clouds:debug/log {message:"enter/alone/world_bottom: complete"}
