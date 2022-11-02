execute as @a[scores={kill=-1}] run function kill:kill/main/main
execute as @a[scores={kill=..-2}] run function kill:kill/help/main
execute as @a[scores={kill=1..}] run function kill:kill/help/main

scoreboard players set @a kill 0
scoreboard players enable @a kill