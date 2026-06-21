execute as @a[predicate=beyond_the_clouds:in_dimension,limit=1,sort=random] at @s run function beyond_the_clouds:clouds/randomize
schedule function beyond_the_clouds:clouds/cloud_spawn_loop 60s