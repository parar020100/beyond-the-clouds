# Re-apply movement effects for a short window after a cross-dimension teleport.
#
# A player-controlled (saddled) mount is client-authoritative: the controlling client
# computes the mount's position and sends it to the server. Right after a cross-dimension
# teleport + remount the client spends several ticks finishing the dimension change and
# re-taking control; during that window it applies plain gravity and overrides server-side
# levitation / slow falling, so the mount drops through. Refreshing the effect every tick
# keeps it active and freshly synced until the client re-syncs and honours it.
#
# Scheduled functions run in the overworld, so every selection is made explicitly per
# dimension (arriving entities live in clouds on enter, in the overworld on leave).

execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.continuous_rise] run function beyond_the_clouds:effects/rise_from_void
execute in minecraft:overworld as @e[tag=btc.continuous_rise] run function beyond_the_clouds:effects/rise_from_void

execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.continuous_fall] run function beyond_the_clouds:effects/fall_from_sky
execute in minecraft:overworld as @e[tag=btc.continuous_fall] run function beyond_the_clouds:effects/fall_from_sky

execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.continuous_descend] run function beyond_the_clouds:effects/short_descend
execute in minecraft:overworld as @e[tag=btc.continuous_descend] run function beyond_the_clouds:effects/short_descend

execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.continuous_hover] run function beyond_the_clouds:effects/short_hover
execute in minecraft:overworld as @e[tag=btc.continuous_hover] run function beyond_the_clouds:effects/short_hover

# count the window down; keep ticking while it is open, otherwise drop the profile tags
scoreboard players remove #btc.continuous_effects btc.continuous_effects_timer 1

execute if score #btc.continuous_effects btc.continuous_effects_timer matches 1.. run schedule function beyond_the_clouds:effects/continuous_effects_apply_tick 1t
execute if score #btc.continuous_effects btc.continuous_effects_timer matches ..0 run function beyond_the_clouds:effects/continuous_effects_apply_stop
