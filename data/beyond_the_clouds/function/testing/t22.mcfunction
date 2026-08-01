function beyond_the_clouds:testing/cleanup

say [t22] Вход вверх: корова верхом на лошади, БЕЗ меня. Стек мобов через порог.
say Ожидаю: пара переносится в облака над островом.

gamemode creative
execute in minecraft:overworld positioned 1000 0 1000 positioned over motion_blocking run tp @s ~ ~ ~
gamemode survival
execute in minecraft:overworld run summon minecraft:horse 1000 520 1000 {Tags:["btc.test"],Tame:1b,Passengers:[{id:"minecraft:cow",Tags:["btc.test"]}]}

say Пара появилась за порогом надо мной, сам я остаюсь внизу и через порог не иду.
say Через несколько секунд проверить, где корова:
say execute in beyond_the_clouds:beyond_the_clouds run data get entity @e[type=minecraft:cow,tag=btc.test,limit=1] Pos
