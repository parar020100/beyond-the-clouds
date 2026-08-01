function beyond_the_clouds:testing/cleanup

say [t20b] Вагонетка с коровой идёт ВВЕРХ без меня. Живого способа поднять её нет - появляется сразу за порогом.
say Телепортировать вагонетку нельзя: /tp высаживает пассажира, поэтому она сразу спавнится с коровой внутри.

gamemode creative
execute in minecraft:overworld positioned 1000 0 1000 positioned over motion_blocking run tp @s ~ ~ ~
gamemode survival
execute in minecraft:overworld run summon minecraft:minecart 1000 520 1000 {Tags:["btc.test"],Passengers:[{id:"minecraft:cow",Tags:["btc.test"]}]}

say Ожидаю: вагонетка с коровой уйдёт в облака над островом, корова останется внутри.
say Сам я стою внизу. Через несколько секунд проверить, где корова:
say execute in beyond_the_clouds:beyond_the_clouds run data get entity @e[type=minecraft:cow,tag=btc.test,limit=1] Pos
