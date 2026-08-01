function beyond_the_clouds:testing/cleanup

say [t47] Элитра надевается уже В ПАДЕНИИ, до порога Y-48. Ветка выбирается по факту наличия элитры.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
give @s minecraft:elytra
give @s minecraft:firework_rocket 64
gamemode survival

say Мне надо шагнуть с края БЕЗ элитры на себе, а уже в падении надеть её правым кликом из хотбара.
say Успеть надо до Y-48, лететь от острова примерно четыре секунды.
say Ожидаю: сработает leave/alone_no_effects, БЕЗ slow falling.
