# no island found, fall from the sky
function beyond_the_clouds:tp/sky_top

# mount the riders
function beyond_the_clouds:enter/vehicle_mount_riders

# give the transport and its riders the slow falling effect (45 seconds)
function beyond_the_clouds:effects/fall_from_sky
execute in beyond_the_clouds:beyond_the_clouds as @e[tag=btc.transfer_rider] run function beyond_the_clouds:effects/fall_from_sky
