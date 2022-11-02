tellraw @s [{"storage":"tp","nbt":"help_success.text","interpret": true}]
execute as @a unless score @s tp matches 1 run function tp:tp/main/insert