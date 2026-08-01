function beyond_the_clouds:testing/cleanup

say [t39] Мультиплеер: я спускаюсь, наблюдатель следом через полсекунды. САМОЕ ПОДОЗРИТЕЛЬНОЕ МЕСТО.
say Здесь телепорт намеренно: нужна точная задержка в 10 тиков, вручную её не выдержать.
say Окно эффектов держится на одном общем счётчике, а его остановка снимает метки сразу у всех.

gamemode survival
execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -20 1000
schedule function beyond_the_clouds:testing/t39_second 10t

say Ожидаю: у МЕНЯ slow falling НЕ обрывается досрочно. Если я вдруг ускорюсь и разобьюсь - механизм надо чинить.
