function beyond_the_clouds:testing/cleanup

say [t15b] Вход вверх с элитрой, но БЕЗ планирования. Контрольный опыт к t15.

gamemode creative
execute in minecraft:overworld run tp @s 1000 490 1000
item replace entity @s armor.chest with minecraft:elytra
gamemode survival
effect give @s minecraft:levitation 1 39 true

say Элитра на мне, но я не планирую - поднимаюсь левитацией и ничего не нажимаю.
say Ожидаю: появление на Y около -28 и заметное зависание на три секунды.
say Если здесь левитация работает, а в t15 нет - значит дело именно в планировании.
