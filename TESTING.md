# Прогон тестов Beyond the Clouds + Maa

Пошаговый план. Команды выполнять подряд, сверху вниз.

Пороги: вход — выше **Y512** в оверворлде, выход — ниже **Y-48** в облаках.
Дно облаков `min_y 0`, пустотный урон с Y-64.

**Опорные точки** (используются во всех блоках):

| Метка | Координаты | Что это |
|---|---|---|
| **И** | X 1000, Z 1000 | в облаках построен остров |
| **П** | X 1000, Z 1100 | в облаках колонка расчищена, острова нет |
| **Х** | X 5000, Z 5000 | чанк оверворлда, куда мы не заходили |

---

## Блок 0. Подготовка стенда

Выполнить один раз в новом творческом мире с паком.

```mcfunction
/gamerule immediate_respawn true
/gamerule keep_inventory true
/gamerule send_command_feedback false
/gamerule command_block_output false
/gamerule spawn_mobs false
/gamerule spawn_monsters false
/gamerule advance_weather false
/gamerule player_movement_check false
/gamerule elytra_movement_check false
/gamemode creative
/function beyond_the_clouds:debug/on
```

Зачем последние четыре: дождь идёт в звуковой категории `weather`, в которой играет и звук
прибытия, — без него слышнее; проверки перемещения могут вмешиваться в наши телепорты и
левитацию.

`fall_damage` намеренно **не** отключаем: урон при приземлении сам по себе показывает, что
slow falling не сработал. `show_death_messages` оставляем включённым — на сообщение
`выпал из мира` завязаны проверки.

Построить остров в облаках над точкой **И**:

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run fill 995 100 995 1005 102 1005 minecraft:stone
```

Расчистить колонку в облаках над точкой **П**:

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run fill 997 0 1097 1003 191 1103 minecraft:air
/execute in beyond_the_clouds:beyond_the_clouds run fill 997 192 1097 1003 383 1103 minecraft:air
```

> Ответ «не удалось произвести заполнение блоками» здесь **нормален**: `fill` так сообщает,
> что не изменил ни одного блока, то есть колонка и так была пуста. Точка **П** годится.
> Если же заполнение прошло — значит там что-то было, и теперь его нет. Оба исхода рабочие.

### Проверка стенда

Обе точки проверяются тем же условием, которым пользуется сам датапак: встать на карту
высот и посмотреть, что на блок ниже — камень острова или пустота за границей мира.

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds positioned 1000 0 1000 positioned over motion_blocking unless block ~ ~-1 ~ minecraft:void_air run say И: остров есть - верно
/execute in beyond_the_clouds:beyond_the_clouds positioned 1000 0 1000 positioned over motion_blocking if block ~ ~-1 ~ minecraft:void_air run say И: острова нет - стенд не собран
/execute in beyond_the_clouds:beyond_the_clouds positioned 1000 0 1100 positioned over motion_blocking if block ~ ~-1 ~ minecraft:void_air run say П: острова нет - верно
/execute in beyond_the_clouds:beyond_the_clouds positioned 1000 0 1100 positioned over motion_blocking unless block ~ ~-1 ~ minecraft:void_air run say П: остров есть - точку надо расчистить
```

Должны напечататься ровно две строки: `И: остров есть - верно` и `П: острова нет - верно`.
Если так — стенд собран, и заодно подтверждено, что новая логика поиска острова видит
обе точки правильно.

Точная высота поверхности, если нужна для сверки координат прибытия:

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds positioned 1000 0 1000 positioned over motion_blocking run summon minecraft:marker ~ ~ ~ {Tags:["btc.probe"]}
/execute in beyond_the_clouds:beyond_the_clouds run data get entity @e[type=marker,tag=btc.probe,limit=1] Pos
/execute in beyond_the_clouds:beyond_the_clouds run kill @e[type=marker,tag=btc.probe]
```

Для точки **И** ожидается Y103 — на блок выше построенной площадки.

Отладку выключить в конце всего прогона: `/function beyond_the_clouds:debug/off`

---

## Блок A. Выход вниз

Каждый пункт начинается с телепорта в облака над точкой **И**.

### A1. Игрок пешком, без элитры

```mcfunction
/item replace entity @s armor.chest with minecraft:air
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -20 1000
/gamemode survival
```
Дать упасть.
**Ожидание:** прибытие в оверворлд на Y500, медленное падение, звук и частицы перехода.
В логе `leave/alone_with_effects`, затем `fx/transition_visual`.

### A2. Игрок с элитрой

```mcfunction
/gamemode creative
/item replace entity @s armor.chest with minecraft:elytra
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -20 1000
/gamemode survival
```
**Ожидание:** прибытие на Y500 **без** slow falling, можно сразу расправить элитру.
В логе `leave/alone_no_effects`.

### A3. Игрок на лошади

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
/item replace entity @s armor.chest with minecraft:air
/summon minecraft:horse ~1 ~ ~ {Tame:1b,Temper:100,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
```
Сесть на лошадь, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
/gamemode survival
```
**Ожидание:** прибытие **верхом**, у обоих slow falling. В логе `leave/on_vehicle_with_effects`.

### A4. Игрок на верблюде

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
/summon minecraft:camel ~1 ~ ~ {Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
```
Сесть, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
```
**Ожидание:** то же, что A3.

### A5. Игрок на осёдланной свинье

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
/summon minecraft:pig ~1 ~ ~ {equipment:{saddle:{id:"minecraft:saddle",count:1}}}
```
Сесть, взять в руку морковь на палке, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
```
**Ожидание:** прибытие верхом. Отдельно смотреть, не дёргает ли свинью обратно —
она управляется клиентом.

### A6. Игрок на happy ghast

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
/summon minecraft:happy_ghast ~2 ~1 ~ {IsBaby:0b,equipment:{body:{id:"minecraft:white_harness",count:1}}}
```
Сесть, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
```
**Ожидание:** прибытие верхом, **без** зелий. В логе `leave/on_vehicle_no_effects`.

### A7. Игрок в лодке

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
/summon minecraft:oak_boat ~1 ~ ~
```
Сесть в лодку, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
```
**Ожидание:** прибытие в лодке. В логе `leave/on_vehicle_no_effects`, следом `fx/transition_visual`.

### A8. Игрок в вагонетке

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
/summon minecraft:minecart ~1 ~ ~
```
Сесть, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
```
**Ожидание:** прибытие в вагонетке.

### A9. Игрок в лодке плюс корова вторым пассажиром

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 105 1000
/summon minecraft:oak_boat ~1 ~ ~ {Passengers:[{id:"minecraft:cow"}]}
```
Сесть в лодку вторым, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
```
**Ожидание:** прибывают **втроём**, корова остаётся в лодке. Это главная проверка исправления.

### A10. Лодка с коровой, без игрока

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -10 1000
/summon minecraft:oak_boat ~2 ~ ~ {Passengers:[{id:"minecraft:cow"}]}
```
Не садиться, оставаться рядом и наблюдать.
**Ожидание:** лодка с коровой уходит вниз, обе прибывают, у коровы slow falling.
В логе `leave/on_vehicle_with_effects`.

### A11. Корова сама по себе

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -10 1000
/summon minecraft:cow ~2 ~ ~
```
**Ожидание:** прибывает со slow falling. В логе `leave/alone_with_effects`.

### A12. Корова верхом на лошади

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -10 1000
/summon minecraft:horse ~2 ~ ~ {Tame:1b,Passengers:[{id:"minecraft:cow"}]}
```
**Ожидание:** прибывают вместе, корова верхом.

### A13. Дропнутый предмет и сфера опыта

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -10 1000
/summon minecraft:item ~2 ~ ~ {Item:{id:"minecraft:diamond",count:1}}
/summon minecraft:experience_orb ~2 ~ ~ {Value:5s}
```
**Ожидание:** оба переносятся, в логе нет ошибок.

**Общее для блока A:** сообщения `выпал из мира` не должно быть ни разу.
После `tp/overworld_exit: complete` в логе через тик обязан появиться `fx/transition_visual`.

---

## Блок B. Вход вверх, над островом (точка И)

### B1. Игрок пешком, без элитры

```mcfunction
/gamemode creative
/item replace entity @s armor.chest with minecraft:air
/tp @s 1000 480 1000
/effect give @s minecraft:levitation 10 60 true
```
**Ожидание:** появление **над поверхностью острова** (около Y113), плавный спуск.
В логе `enter/find_cloud_island: island found`, затем `enter/alone/land_above_island`.

Убрать левитацию: `/effect clear @s minecraft:levitation`

### B2. Игрок с элитрой — остров игнорируется

```mcfunction
/effect clear @s
/item replace entity @s armor.chest with minecraft:elytra
/tp @s 1000 480 1000
/effect give @s minecraft:levitation 10 60 true
```
Сразу после появления:
```mcfunction
/effect clear @s minecraft:levitation
/data get entity @s Pos
```
**Ожидание:**
- Y около **-28**, а не -40 и не на острове;
- значок левитации держится около 3 секунд;
- игрок не проваливается вниз, пока грузятся чанки;
- в логе `enter/alone/world_bottom`, `tp/sky_bottom_elytra`, `effects/short_hover`;
- **остров над головой на это не влияет**.

### B3. Игрок на лошади

```mcfunction
/gamemode creative
/effect clear @s
/item replace entity @s armor.chest with minecraft:air
/tp @s 1000 480 1000
/summon minecraft:horse ~ ~ ~ {Tame:1b,Temper:100,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
```
Сесть на лошадь, затем:
```mcfunction
/execute on vehicle run effect give @s minecraft:levitation 10 60 true
```
**Ожидание:** появление над островом верхом, оба со slow falling.
В логе `enter/on_vehicle/land_above_island`.

### B4. Игрок на верблюде

Как B3, но:
```mcfunction
/summon minecraft:camel ~ ~ ~ {Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1}}}
```

### B5. Игрок на happy ghast — остров игнорируется

```mcfunction
/gamemode creative
/effect clear @s
/tp @s 1000 480 1000
/summon minecraft:happy_ghast ~ ~-2 ~ {IsBaby:0b,equipment:{body:{id:"minecraft:white_harness",count:1}}}
```
Сесть, затем:
```mcfunction
/execute on vehicle run effect give @s minecraft:levitation 10 60 true
```
**Ожидание:** появление на **Y-40**, а не над островом, без зелий.
В логе `enter/on_vehicle/world_bottom`.

### B6. Игрок в лодке

Лодка зелья не принимает, поднимаем телепортом.

```mcfunction
/gamemode creative
/effect clear @s
/tp @s 1000 480 1000
/summon minecraft:oak_boat ~ ~ ~
```
Сесть в лодку, затем:
```mcfunction
/execute on vehicle run tp @s 1000 515 1000
```
**Ожидание:** появление над островом в лодке. В логе `enter/on_vehicle/land_above_island`.
Раньше эта ветка не работала вовсе — лодка оставалась на Y0.

### B7. Игрок в вагонетке

Как B6, но `/summon minecraft:minecart ~ ~ ~`.

### B8. Игрок в лодке плюс корова

```mcfunction
/gamemode creative
/tp @s 1000 480 1000
/summon minecraft:oak_boat ~ ~ ~ {Passengers:[{id:"minecraft:cow"}]}
```
Сесть вторым, затем:
```mcfunction
/execute on vehicle run tp @s 1000 515 1000
```
**Ожидание:** прибывают втроём над островом.

### B9. Корова верхом на лошади, без игрока

```mcfunction
/tp @s 1000 515 1000
/summon minecraft:horse ~2 ~ ~ {Tame:1b,Passengers:[{id:"minecraft:cow"}]}
```
**Ожидание:** пара переносится в облака над островом.

---

## Блок C. Вход вверх, над пустотой (точка П)

Повторить **B1, B3, B4, B6, B7, B8**, заменив все координаты `1000 ... 1000` на
`1000 ... 1100`.

Ожидания меняются так:

| Сценарий | Ожидание над пустотой |
|---|---|
| C1 (=B1) пешком | `enter/alone/rise_from_void`: появление у дна, резкий подъём с левитацией, затем плавный спуск |
| C2 (=B3) на лошади | `enter/on_vehicle/rise_from_void`, то же для пары |
| C3 (=B4) на верблюде | То же |
| C4 (=B6) в лодке | `enter/on_vehicle/fall_from_sky`: появление на **Y400** и падение со slow falling |
| C5 (=B7) в вагонетке | То же |
| C6 (=B8) лодка с коровой | То же, прибывают втроём |

Во всех — в логе `enter/find_cloud_island: NO island`.

### C7. Тонкий остров в один блок

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run setblock 1000 150 1100 minecraft:stone
/tp @s 1000 480 1100
/effect give @s minecraft:levitation 10 60 true
```
**Ожидание:** определяется как остров, появление около Y161.
Убрать за собой:
```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run setblock 1000 150 1100 minecraft:air
```

### C8. Вода как поверхность

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run fill 998 100 1098 1002 101 1102 minecraft:stone
/execute in beyond_the_clouds:beyond_the_clouds run fill 999 102 1099 1001 102 1101 minecraft:water
/tp @s 1000 480 1100
/effect give @s minecraft:levitation 10 60 true
```
**Ожидание:** остров найден, появление над водой, не внутри камня.
Убрать за собой:
```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run fill 998 100 1098 1002 102 1102 minecraft:air
```

### C9. Крона дерева и деревня

Найти в облаках дерево и деревню `sky_village`, записать их X/Z, зайти над ними
через `/tp @s <X> 480 <Z>` плюс левитация.
**Ожидание:** появление над кроной и над крышами, не внутри блоков.
Проверить `/data get entity @s Pos` — не должно быть удушения.

---

## Блок D. Падающие блоки

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -10 1100
```

### D1. Один блок

```mcfunction
/summon minecraft:falling_block ~2 ~ ~ {BlockState:{Name:"minecraft:sand"},Time:1}
```
**Ожидание:** песок появляется в оверворлде и **долетает до земли**, а не исчезает.
В логе `leave/falling_block: complete`, через тик сброс возраста из `misc/post_transfer`.

### D2. Пачка блоков подряд

```mcfunction
/summon minecraft:falling_block ~2 ~ ~ {BlockState:{Name:"minecraft:sand"},Time:1}
/summon minecraft:falling_block ~3 ~ ~ {BlockState:{Name:"minecraft:gravel"},Time:1}
/summon minecraft:falling_block ~4 ~ ~ {BlockState:{Name:"minecraft:anvil"},Time:1}
/summon minecraft:falling_block ~5 ~ ~ {BlockState:{Name:"minecraft:white_concrete_powder"},Time:1}
```
**Ожидание:** переносятся все четыре, ни один не теряется.
Это проверка `schedule ... append`: при `replace` часть работы откладывалась бы бесконечно.

---

## Блок E. Мультиплеер

Нужны два клиента. **A** — путешественник, **B** — наблюдатель.
Ниже `<A>` и `<B>` заменить на ники.

### E1. Наблюдатель видит уход

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp <B> 1000 -30 1000
/execute in beyond_the_clouds:beyond_the_clouds run tp <A> 1000 -20 1000
```
**Ожидание:** B слышит звук перехода и видит поток частиц на месте A.

### E2. Наблюдатель видит прибытие

```mcfunction
/tp <B> 1000 500 1000
/execute in beyond_the_clouds:beyond_the_clouds run tp <A> 1000 -20 1000
```
**Ожидание:** B слышит гром и видит частицы прибытия, A слышит свой звук через ~0.5 с.

### E3. Наблюдатель далеко

```mcfunction
/tp <B> 3000 100 3000
/execute in beyond_the_clouds:beyond_the_clouds run tp <A> 1000 -20 1000
```
**Ожидание:** B ничего не слышит, у A всё как обычно.

### E4. Одновременный переход в одну сторону

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp @a 1000 -20 1000
```
**Ожидание:** оба доезжают, у обоих свои эффекты и slow falling.

### E5. Одновременный переход в разные стороны

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp <A> 1000 -20 1000
/tp <B> 1000 515 1100
```
**Ожидание:** оба доезжают, ветки не мешают друг другу.

### E6. Переход с задержкой в несколько тиков

A уходит вниз, B уходит вниз примерно через полсекунды после него.

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp <A> 1000 -20 1000
```
через ~10 тиков
```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp <B> 1000 -20 1000
```
**Ожидание:** у A slow falling **не обрывается досрочно**, оба спускаются плавно.

Это самое подозрительное место. Окно повторного применения эффектов держится на одном
общем счётчике `#btc.continuous_effects`, а его остановка снимает профильные метки сразу
у всех сущностей. Если у A эффект пропадёт раньше времени и он ускорится — механизм надо
переводить на пер-сущностный счётчик. Я это не чинил.

### E7. Два игрока в одной лодке

```mcfunction
/gamemode creative
/execute in beyond_the_clouds:beyond_the_clouds run tp @a 1000 105 1000
/summon minecraft:oak_boat ~1 ~ ~
```
Оба садятся в лодку, затем:
```mcfunction
/execute on vehicle run tp @s 1000 -20 1000
```
**Ожидание:** оба прибывают в лодке.

### E8. Два игрока на одном верблюде

Как E7, но `/summon minecraft:camel ~1 ~ ~ {Tame:1b,equipment:{saddle:{id:"minecraft:saddle",count:1}}}`.

### E9. Выход наблюдателя в момент перехода

B выходит из игры, пока A летит вниз.
**Ожидание:** у A переход завершается корректно, в логе нет ошибок.

---

## Блок F. Крайние случаи и регрессии

### F1. Холодный чанк — ключевая регрессия

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 5000 105 5000
/summon minecraft:oak_boat ~1 ~ ~
```
Сесть в лодку, подождать полминуты, затем:
```mcfunction
/execute on vehicle run tp @s 5000 -20 5000
```
**Ожидание:** прибытие в лодке. Раньше в оверворлд улетала только лодка, а игрок погибал
в пустоте — именно на непрогретом чанке.

### F2. Пять переходов подряд

Повторить A7 и B6 пять раз, не выходя из мира.
**Ожидание:** срабатывает каждый раз, метки не залипают. После:
```mcfunction
/execute in minecraft:overworld run tag @e[tag=btc.leaving] list
/execute in beyond_the_clouds:beyond_the_clouds run tag @e[tag=btc.entering] list
/execute in minecraft:overworld run tag @e[tag=btc.pending_fx] list
/forceload query
```
Всё должно быть пусто.

### F3. Перезагрузка в момент открытого окна эффектов

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -20 1000
```
сразу после прибытия
```mcfunction
/reload
```
**Ожидание:** нет зависших меток, `misc/load` чистит расписание.
```mcfunction
/execute in minecraft:overworld run tag @e[tag=btc.pending_fx] list
/execute in minecraft:overworld run tag @e[tag=btc.continuous_descend] list
```

### F4. Перезаход в мир сразу после перехода

Выйти в меню и зайти обратно.
**Ожидание:** ничего не залипло, `/forceload query` пуст.

### F5. Элитра надета в полёте вниз

```mcfunction
/gamemode creative
/item replace entity @s armor.chest with minecraft:air
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -20 1000
/item replace entity @s armor.chest with minecraft:elytra
/gamemode survival
```
**Ожидание:** сработает ветка `leave/alone_no_effects`, без slow falling.

### F6. Стрела сквозь дно

```mcfunction
/execute in beyond_the_clouds:beyond_the_clouds run tp @s 1000 -10 1000
/summon minecraft:arrow ~2 ~ ~ {Motion:[0.0d,-2.0d,0.0d]}
```
**Ожидание:** переносится или исчезает, но без ошибок в логе.

---

## Что искать в логе

Здоровый переход вниз на лодке:

```
[<ник>] leave
[<ник>] trying leave
[Лодка] leave/on_vehicle_no_effects
[Лодка] leave/vehicle_prepare
[Лодка] common/vehicle_prepare
[Лодка] common/clear_all_transfer_tags
[Лодка] tp/overworld_exit
[Лодка] tp/overworld_exit: complete
[Лодка] common/clear_all_transfer_tags
[Лодка] fx/transition_visual          <- через тик, из misc/post_transfer
```

Признаки поломки:

- `выпал из мира` после перехода — сущность или пассажир потерялись;
- нет `fx/transition_visual` — отложенная обработка не отработала;
- `enter/find_cloud_island: NO island` там, где остров есть — сломано определение острова;
- повторяющиеся `leave` у одной сущности без продолжения — залипла метка `btc.leaving`.

```bash
grep -nE "BTC DEBUG|выпал из мира|Received passengers" logs/latest.log | tail -60
```

---

## Порядок прогона

1. Блок 0 — собрать стенд.
2. Блок A целиком.
3. Блок B целиком.
4. Блок C целиком.
5. Блок D.
6. Блок F1 — отдельно, на холодном чанке.
7. Блок E — с двумя клиентами.
8. Остальное из F.

---

## Известные оговорки

Названия игровых правил и порог версии сверены с реестром из `level.dat` вашего мира
(`test_btc_maa_boats_3`) и с историей команд — короткая форма без `minecraft:` рабочая.

Строки снаряжения (`equipment:{saddle:...}`, сбруя гаста) под 1.21.11 **не проверял**, в
истории команд их нет. Седло переехало в слот снаряжения в 1.21.5, сбруя гаста появилась
в 1.21.6, но точный вид NBT я подтвердить не могу. Если команда не примет `equipment`,
надеть седло и сбрую руками — на суть тестов это не влияет.

Определение «острова нет» переписано заново, а не перенесено — блок C стоит проходить
внимательнее остальных.
