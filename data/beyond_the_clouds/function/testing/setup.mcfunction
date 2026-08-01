# Собирает испытательный стенд. Вызывать один раз перед прогоном.

say [setup] Собираю стенд. Точка И = 1000/1000 (остров), точка П = 1000/1100 (пусто).

gamemode creative

# Сначала переместиться, только потом строить: так чанки прогружены и видно результат.
say Перемещаюсь в точку И, чтобы прогрузить чанки.
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 110 1000
execute in beyond_the_clouds:beyond_the_clouds run fill 995 100 995 1005 102 1005 minecraft:stone

say Перемещаюсь в точку П.
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 110 1100
execute in beyond_the_clouds:beyond_the_clouds run fill 997 0 1097 1003 191 1103 minecraft:air
execute in beyond_the_clouds:beyond_the_clouds run fill 997 192 1097 1003 383 1103 minecraft:air

say Ответ "не удалось произвести заполнение" для точки П - это норма, там и так было пусто.

# Вернуться на остров: в точке П под ногами пустота, там стоять нельзя.
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 104 1000

say Стенд построен, я на острове.
say Проверку стенда надо вызвать ОТДЕЛЬНО, следующей командой: function beyond_the_clouds:testing/check_stand
say В том же тике, что и стройка, она не отрабатывает - чанки ещё не в том состоянии.
say Ожидаю от неё ровно две строки: "И: остров есть - верно" и "П: острова нет - верно".
