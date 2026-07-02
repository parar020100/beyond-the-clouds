# Start applying a movement effect every tick for ~1s so a client-authoritative (saddled)
# mount keeps it while its controller re-syncs after a cross-dimension teleport.
# Callers must add the matching btc.continuous_* profile tag first.

scoreboard players set #btc.continuous_effects btc.continuous_effects_timer 20
function beyond_the_clouds:effects/continuous_effects_apply_tick
