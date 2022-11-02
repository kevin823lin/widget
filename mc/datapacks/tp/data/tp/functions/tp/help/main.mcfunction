execute store result score $temp online_player if entity @a

execute if score $temp online_player matches 2.. run function tp:tp/help/other
execute unless score $temp online_player matches 2.. run function tp:tp/help/non-other