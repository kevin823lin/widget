execute as @a unless score @s id matches -2147483648..2147483647 run function tp:id/add
execute as @a[scores={tp=1}] run function tp:tp/help/main
tag @a[scores={tp=..-1}] add tp
tag @a[scores={tp=2..}] add tp
execute as @a[tag=tp] run function tp:tp/main/main


scoreboard players set @a tp 0
scoreboard players enable @a tp
scoreboard players set $temp self 0
scoreboard players set $temp found_player 0
tag @a remove tp