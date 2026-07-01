function beyond_the_clouds:debug/log {message:"enter/on_vehicle/rise_from_void"}

# tp to the bottom of the world
function beyond_the_clouds:tp/sky_bottom

# mount the riders
function beyond_the_clouds:enter/vehicle_mount_riders

# give the transport and its riders levitation for 10 seconds, then slow falling for 30
function beyond_the_clouds:effects/rise_from_void
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] run function beyond_the_clouds:effects/rise_from_void
