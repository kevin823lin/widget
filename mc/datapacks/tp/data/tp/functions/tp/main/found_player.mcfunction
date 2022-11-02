execute as @a if score @s id = $temp tp run tellraw @a [{"text":"傳送 "},{"selector":"@a[tag=tp]"},{"text":" 到 "},{"selector":"@s"}]
execute as @a if score @s id = $temp tp run tp @a[tag=tp] @s