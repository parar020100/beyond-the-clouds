function beyond_the_clouds:testing/cleanup

say [t23b] Вход НА ЭЛИТРЕ, НАД ПУСТОТОЙ. Живой сценарий, дополняет t15.

gamemode creative
execute in minecraft:overworld positioned 1000 0 1100 positioned over motion_blocking run tp @s ~ ~ ~
item replace entity @s armor.chest with minecraft:elytra
give @s minecraft:firework_rocket 64
gamemode survival

say Мне надо взлететь на элитре выше Y512 над пустотой.
say Ожидаю: тот же низ мира на Y около -28 - для элитры рельеф не важен, остров тут и не при чём.
say Заодно проверяю, что подо мной действительно нет острова и я не застряну в блоках.
