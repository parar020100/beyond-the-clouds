function beyond_the_clouds:testing/cleanup

say [t32] Падающий блок: один песок сквозь дно облаков.
say Ожидаю: песок появится в оверворлде и ДОЛЕТИТ ДО ЗЕМЛИ, а не исчезнет.
say В логе: leave/falling_block complete, через тик сброс возраста из misc/post_transfer.

gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
execute in beyond_the_clouds:beyond_the_clouds run summon minecraft:falling_block 1000 -20 1000 {Tags:["btc.test"],BlockState:{Name:"minecraft:sand"},Time:1}

say Мне нужно спуститься в оверворлд на 1000/1000 и посмотреть, лежит ли там песок.
