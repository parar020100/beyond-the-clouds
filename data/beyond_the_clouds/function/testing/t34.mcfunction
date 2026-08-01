function beyond_the_clouds:testing/cleanup

say [t34] Мультиплеер: наблюдатель ждёт в ТОЧКЕ ПРИБЫТИЯ в оверворлде, я спускаюсь к нему.
say Эффект перехода играет в точке ПРИБЫТИЯ, а не отправления - поэтому наблюдатель ждёт внизу.

gamemode creative @a[tag=btc.test.observer]
execute in minecraft:overworld run tp @a[tag=btc.test.observer] 1000 490 1000
gamemode creative
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1004 103 1000 -90 0
gamemode survival

say Наблюдателю: ты в креативе на Y490, ДВАЖДЫ НАЖМИ ПРОБЕЛ и зависни, иначе разобьёшься.
say Мне надо шагнуть с края острова и упасть вниз.
say Ожидаю: наблюдатель слышит гром и видит поток частиц, я слышу свой звук примерно через полсекунды.
say Наблюдателю нужно сказать, слышал ли он гром и видел ли частицы.
