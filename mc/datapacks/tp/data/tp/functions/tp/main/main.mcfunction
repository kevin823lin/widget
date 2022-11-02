scoreboard players operation $temp tp = @s tp

execute if score $temp tp = @s id run scoreboard players set $temp self 1
execute if score $temp self matches 1 run function tp:tp/main/self

execute unless score $temp self matches 1 as @a if score @s id = $temp tp run scoreboard players set $temp found_player 1

execute if score $temp found_player matches 1 run function tp:tp/main/found_player
execute unless score $temp self matches 1 unless score $temp found_player matches 1 run function tp:tp/main/non-found_player