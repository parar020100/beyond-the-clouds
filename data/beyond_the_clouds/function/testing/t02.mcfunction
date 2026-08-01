function beyond_the_clouds:testing/cleanup

say [t02] Выход вниз НА ЭЛИТРЕ, по-настоящему в полёте.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
item replace entity @s armor.chest with minecraft:elytra
give @s minecraft:firework_rocket 64
gamemode survival

say Мне надо спрыгнуть с края острова, раскрыть элитру прыжком и лететь вниз на ней.
say Важно: пересечь Y-48 именно В ПОЛЁТЕ, а не в свободном падении.
say Ожидаю: перенос на Y500 БЕЗ slow falling, и я продолжаю лететь.
say Отдельно смотрю: не сбивает ли перенос сам полёт - не складывается ли элитра.
say Ветка leave/alone_no_effects.
