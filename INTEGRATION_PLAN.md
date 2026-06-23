# Sky Islands Integration Plan

## Update 2026-06-23

Done in the latest pass:

- Fixed `sky_islands:archaeology/mineshaft_island` loot parse issue: replaced invalid `minecraft:chain` entry with `minecraft:iron_ingot` and normalized `dead_bush` to `minecraft:dead_bush`.
- Adapted underground `sky_islands:vanilla_adapted` placed features for the custom dimension: removed negative Y ranges and relative `above_bottom`/`below_top` anchors from ore/geode/monster-room wrappers.
- Finished the main tree/leaf wrapper pass for `trees_savanna`, `trees_windswept_hills`, `fallen_oak_tree`, `fallen_spruce_tree`, `oak_leaf_litter`, `fancy_oak_leaf_litter`, and `spruce_checked`.
- Added placed wrappers for the tree selectors so biome feature lists reference placed features, not configured features.
- Added missing template pools discovered in logs/tests: `beyond_the_clouds:sky_village/hall` and `sky_islands:forest_tower/tower`.
- Checked template pool JSON links, NBT custom links, and biome/placed/configured registry links.

Still open:

- Re-test current datapack in-game and check fresh `latest.log` for remaining `Empty height range`, loot, pool, or structure warnings.
- Continue visual/gameplay validation of every imported biome and structure.
- Full 1.21.11 format audit for audio/music/mood/animal variants and other registry-format changes.
- Decide later whether to create custom analogs for source-pack vanilla structure overrides.
- Final cleanup of unused leftovers after the in-game test pass.

Цель: перенести фичи из `maa-s-sky-islands-lite-1-21-5` в `Beyond the Clouds`, получить один финальный датапак и не переопределять vanilla Overworld.

## Важное правило

- Не копировать vanilla overrides в `data/minecraft`, если это меняет vanilla Overworld.
- Всё, что исходный пак переопределял в `minecraft:*`, переносить как custom resource и подключать только к `beyond_the_clouds:beyond_the_clouds`.
- `_source_packs` остаётся только рабочим источником и не должен участвовать в финальном датапаке.
- Перед крупными этапами проверять JSON и ссылки на несуществующие ресурсы.

Примечание по старому плану: там предлагался namespace вида `beyond_the_clouds:sky_islands/...`, чтобы исключить конфликт с отдельным установленным паком `sky_islands`. Фактически сейчас используется namespace `sky_islands:*`. Это нормально для одного финального datapack, если второй пак не установлен отдельно. Если нужна максимальная изоляция, это можно позже переименовать, но это будет большой mechanical rename.

## Группа 0. Подготовка

Задачи:

- оставить source pack в `_source_packs`;
- выбрать namespace для переноса;
- не трогать `data/minecraft`, кроме уже существующих function tags;
- перед каждым этапом проверять JSON и dangling references.

Статус:

- Сделано: source pack лежит в `_source_packs`.
- Сделано: vanilla Overworld не переопределяется; в `data/minecraft` сейчас только `tags/functions/load.json` и `tags/functions/tick.json`.
- Сделано с отклонением: используется `sky_islands:*`, а не `beyond_the_clouds:sky_islands/*`.

## Группа 1. Базовые custom features

Перенести `sky_islands` configured/placed features, сначала без прямого подключения к биомам, затем включать через биомы.

Configured features из исходного плана:

- `acacia_leaf_litter`
- `acid_springs`
- `acid_spring_pool`
- `acid_spring_with_deadtrees`
- `andesite_rock`
- `beach_birch`
- `beach_sand_disk`
- `beach_trees`
- `cobblestone_rock`
- `deepslate_rock`
- `disk_path`
- `fall_bush`
- `giant_oak`
- `granite_rock`
- `leaf_litter_patch`
- `mangrove_swamp_mud`
- `med_mushroom_brown`
- `med_mushroom_red`
- `mud_pool_with_lilys`
- `mud_pool_with_roots`
- `mud_with_bushs`
- `mycelium_disk`
- `old_dark_oak`
- `old_fall_forest_trees`
- `old_mega_jungle`
- `old_mushroom_vegetation`
- `patch_glow_lichen`
- `patch_shroomlight`
- `patch_spooky_pumpkin`
- `small_mushroom_brown`
- `small_mushroom_red`
- `small_mushroom_spooky`
- `small_old_dark_oak`
- `small_spruce`
- `spruce_bush`
- `swamp_bush`
- `swamp_mud`
- `trees_acid_badlands`
- `trees_old_jungle`

Subfolders:

- `birch_forest_features/*`
- `cold_swamp_vegetation/*`
- `cold_taiga_features/*`
- `mushroom_trees/*`
- `redwoods_features/*`

Placed features:

- одноимённые wrappers;
- `*_checked`;
- `leaf_litter_patch_1..5`;
- `patch_firefly_bush`;
- `mushroom_checked/*`;
- `redwoods_features/*`;
- `cold_taiga_features/*`;
- остальные placed wrappers исходного namespace.

Статус:

- Сделано: скопированы `106` configured features.
- Сделано: скопированы `78` placed features.
- Частично: ссылки уже исправлялись после registry errors, но ещё нужен точный аудит tree/leaf wrappers и высотных ограничений.

## Группа 2. Vanilla feature overrides

Исходный пак переопределяет vanilla configured features:

- деревья: `acacia`, `birch`, `cherry`, `dark_oak`, `fancy_oak`, `jungle_tree`, `mega_jungle_tree`, `mega_pine`, `mega_spruce`, `oak`, `pale_oak`, `pine`, `spruce`, `swamp_oak`;
- грибы: `huge_brown_mushroom`, `huge_red_mushroom`;
- composite/random selectors: `trees_savanna`, `trees_windswept_hills`;
- fallen trees;
- leaf litter variants.

Правило:

- не копировать их в `data/minecraft`;
- создавать custom copies в `sky_islands:vanilla_adapted/*`;
- если исходный пак менял configured feature, но vanilla biome ссылался на неё через vanilla placed feature, создать custom placed wrapper;
- в imported features/biomes ссылаться на custom copy или на безопасный vanilla original.

Статус:

- Сделано частично: создан слой `sky_islands:vanilla_adapted/*`.
- Сделано: registry errors из-за missing `vanilla_adapted/*` исправлены.
- Не завершено: надо доделать точность для `trees_savanna`, `trees_windswept_hills`, `fallen_oak_tree`, `fallen_spruce_tree`, `oak_leaf_litter`, `fancy_oak_leaf_litter` и проверить остальные tree/leaf overrides.

## Группа 3. Custom биомы `sky_islands`

Перенести и подключить к biome source нового измерения:

- `sky_islands:acid_badlands`
- `sky_islands:cold_swamp`
- `sky_islands:cold_taiga`
- `sky_islands:fall_forest`
- `sky_islands:old_fall_forest`
- `sky_islands:old_jungle`
- `sky_islands:old_mushroom_fields`
- `sky_islands:redwoods`
- `sky_islands:sky_beach`
- `sky_islands:spooky_forest`

После переноса:

- адаптировать surface rules в `beyond_the_clouds` noise settings;
- проверить, что поверхности не становятся просто stone/deepslate;
- проверить визуал, спавн и features в игре.

Статус:

- Сделано: все 10 биомов перенесены.
- Сделано: добавлены в `beyond_the_clouds` biome source.
- Сделано: visual colors продублированы в `attributes`.
- Частично: surface rules сделаны первично, нужен визуальный тест.

## Группа 4. Vanilla-биомы как новые custom биомы

Исходный пак переопределяет vanilla biomes:

- `bamboo_jungle`
- `cherry_grove`
- `dark_forest`
- `jungle`
- `mangrove_swamp`
- `meadow`
- `mushroom_fields`
- `old_growth_birch_forest`
- `old_growth_pine_taiga`
- `old_growth_spruce_taiga`
- `pale_garden`
- `savanna`
- `snowy_plains`
- `swamp`

Плановые custom versions:

- `sky_islands:sky_bamboo_jungle`
- `sky_islands:sky_cherry_grove`
- `sky_islands:sky_dark_forest`
- `sky_islands:sky_jungle`
- `sky_islands:sky_mangrove_swamp`
- `sky_islands:sky_meadow`
- `sky_islands:sky_mushroom_fields`
- `sky_islands:sky_old_growth_birch_forest`
- `sky_islands:sky_old_growth_pine_taiga`
- `sky_islands:sky_old_growth_spruce_taiga`
- `sky_islands:sky_pale_garden`
- `sky_islands:sky_savanna`
- `sky_islands:sky_snowy_plains`
- `sky_islands:sky_swamp`

Для каждого нужно проверить, что vanilla-overridden features заменены custom copies или безопасными vanilla originals.

Статус:

- Сделано: все 14 custom versions созданы.
- Сделано: добавлены в biome source.
- Сделано: добавлены в `explore_clouds`.
- Сделано: visual colors продублированы в `attributes`.
- Частично: feature accuracy ещё требует аудита.

## Группа 5. Генератор островов

Не копировать напрямую:

- `data/minecraft/dimension/overworld.json`
- `data/minecraft/dimension_type/overworld.json`
- `data/minecraft/worldgen/noise_settings/overworld.json`

Варианты из старого плана:

- оставить текущий generator `beyond_the_clouds`;
- частично перенести density/noise идею из source;
- сделать гибрид.

Это отдельный рискованный этап, потому что меняет форму всего измерения.

Статус:

- Сделано: vanilla Overworld generator не перенесён.
- Сделано: оставлен текущий generator `beyond_the_clouds`.
- Частично: surface rules адаптированы.
- Не сделано: density/noise идея source pack не переносилась.

## Группа 6. Structures

Custom structures и structure sets:

- `flying_ship`
- `forest_tower`
- `frozen_sky_lake`
- `islands`
- `jungle_sky_lake`
- `rocks`
- `sky_lake`
- `spherical_monument`
- `spiders_lair`
- `swamp_house`
- `taiga_house`
- `large_lakes/forestlake`
- `large_lakes/sealake`
- `large_lakes/swamplake`

Template pools:

- `flying_ship`
- `frozen_sky_lake`
- `islands`
- `jungle_sky_lake`
- `rocks`
- `sky_lake`
- `spherical_monument`
- `spiders_lair`
- `swamp_house`
- `taiga_house`
- `forest_tower/*`
- `large_lakes/*`
- `trees/small_old_dark_oak`

Также перенести NBT из `data/sky_islands/structure`.

Нужно адаптировать:

- biome selectors;
- start heights;
- start pools;
- pool references;
- locate behavior;
- генерацию в высотах `beyond_the_clouds`.

Статус:

- Сделано: перенесены `14` structures.
- Сделано: перенесены `14` structure sets.
- Сделано: перенесены `40` template pools.
- Сделано: перенесены `118` NBT-структур.
- Сделано частично: biome selectors перепривязаны к `sky_islands:sky_*`.
- Сделано частично: `rocks` поднят по высоте.
- Не завершено: проверить все структуры в игре; разобрать missing/empty pools и высоты.

## Группа 7. Loot

Перенести:

- `archaeology/mineshaft_island`
- `chests/barrel_of_berries`
- `chests/prison_ship`
- `chests/spiders_lair`

Потом проверить NBT/template pools на ссылки на эти loot tables и переписать namespace при необходимости.

Статус:

- Сделано: перенесены `4` loot tables.
- Не завершено: игровой тест loot и проверка ссылок из NBT/template pools.

## Группа 8. Vanilla structure overrides

Источник трогает vanilla:

- `ancient_city`
- `igloo`
- `mansion`
- `mineshaft`
- `pillager_outpost`
- ruined portals
- villages
- `swamp_hut`
- structure sets `ancient_cities`, `trail_ruins`, `trial_chambers`

План:

- не копировать это в `data/minecraft`;
- если нужен аналог в новом измерении, делать custom structures для `beyond_the_clouds:beyond_the_clouds`.

Статус:

- Сделано: vanilla structure overrides напрямую не перенесены.
- Не сделано: custom аналоги vanilla structures пока не создавались.

## Группа 9. Прочее vanilla

Не переносить напрямую:

- animal variants;
- `adventuring_time`;
- biome tags для rabbits/foxes;
- vanilla taiga village NBT;
- прочие vanilla registry overrides.

Если нужно поведение для новых биомов:

- добавлять custom tags или точечные additions;
- не заменять vanilla resources.

Статус:

- Сделано: напрямую не переносилось.
- Не сделано: custom additions для animal variants/tags пока не создавались.

## Группа 10. Advancements и discoverability

Задачи:

- добавить новые биомы в `explore_clouds`;
- проверить, что advancement не требует недоступных биомов;
- проверить `/locate biome` и посещение биомов.

Статус:

- Сделано: новые биомы добавлены в `explore_clouds`.
- Частично: игровой тест идёт.

## Группа 11. Версионная адаптация 1.21.11

Проверить старые поля source pack и перенести их в формат текущего Beyond the Clouds.

Уже найдено и исправлено:

- `effects.sky_color` -> `attributes.minecraft:visual/sky_color`
- `effects.fog_color` -> `attributes.minecraft:visual/fog_color`
- `effects.water_fog_color` -> `attributes.minecraft:visual/water_fog_color`

Ещё проверить:

- music;
- ambient sound;
- mood sound;
- dry foliage color;
- animal variants;
- любые новые registry formats в 1.21.11.

Статус:

- Сделано: visual colors.
- Не сделано: audio/music/mood migration.
- Не сделано: полный аудит новых registry formats.

## Группа 12. Логи и warning'и

Уже исправлено:

- `Unbound values in registry` для `sky_islands:vanilla_adapted/*`;
- JSON formatting;
- visual colors в новых биомах.

Осталось разобрать:

- `Empty height range`;
- `Empty or non-existent pool: beyond_the_clouds:sky_village/hall`;
- возможные structure height warnings;
- возможные missing pool warnings;
- возможные spawn/weight warnings.

Статус:

- Datapack грузится.
- Идёт игровой тест.

## Порядок работ из исходного плана

1. Features core.
2. 10 native `sky_islands` биомов.
3. Surface rules + biome source.
4. Custom-копии vanilla-overridden биомов.
5. Малые структуры: `rocks`, `islands`, `sky_lake`.
6. Крупные структуры: lakes, ship, tower, lair, houses, monument.
7. Loot/NBT validation.
8. Финальная чистка неиспользуемого.

Фактический текущий этап:

- пункты 1-4 сделаны первично;
- пункт 5-6 скопированы и частично адаптированы, но требуют игрового теста;
- пункт 7 не завершён;
- пункт 8 впереди.

## Финальный тест

Проверить:

- все новые биомы через `/locate biome`;
- все новые структуры через `/locate structure`;
- surface generation;
- цвет неба/тумана/воды;
- деревья и растительность;
- руды и underground/deepslate features;
- loot;
- mob spawning;
- производительность генерации;
- отсутствие registry errors в `latest.log`.

## Финальная чистка

- удалить неиспользуемые leftovers;
- проверить, что `data/minecraft` содержит только нужные function tags;
- проверить JSON formatting;
- проверить, что `_source_packs` не участвует в финальном datapack;
- прогнать sanity-checks по ссылкам.

## Update 2026-06-23: vanilla overrides without Overworld overrides

Done:

- added custom copies of source vanilla structures under `sky_islands:vanilla_adapted/*`;
- added custom structure sets for villages, pillager outposts, ruined portals, mineshafts, igloos, woodland mansions, swamp huts, ancient cities, trail ruins, and trial chambers;
- kept source spacing for structure sets that the source pack changed: ancient cities, trail ruins, trial chambers;
- copied source-modified village/outpost template pools under `sky_islands:vanilla_adapted/*`;
- copied source-modified taiga village meeting point NBT under `sky_islands:vanilla_adapted/*`;
- added pool aliases so adapted villages/outposts use the custom template pools without overriding `minecraft:*`;
- added custom cold/warm chicken, cow, frog, and pig variants under `sky_islands:*_variant/*`;
- added custom wolf variants under `sky_islands:wolf_variant/*`, excluding default `pale`;
- added `replace: false` rabbit/fox biome tags with only custom sky biome values;
- ran JSON validation and registry link sanity-checks successfully.

Still intentionally not copied:

- `data/minecraft/dimension/overworld.json`;
- `data/minecraft/dimension_type/overworld.json`;
- `data/minecraft/worldgen/noise_settings/overworld.json`;
- `data/minecraft/worldgen/noise/continentalness.json`;
- `data/minecraft/worldgen/noise/temperature.json`;
- `data/minecraft/advancement/adventure/adventuring_time.json`;
- default/temperate animal variants with unconditional spawn conditions.
