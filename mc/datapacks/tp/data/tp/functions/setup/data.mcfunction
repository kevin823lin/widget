data modify storage tp help_success set value {"text":'[{"text":"點此","clickEvent":{"action":"suggest_command","value":"/trigger tp set "},"hoverEvent":{"action":"show_text","value":"/trigger tp set "},"color":"green"},{"text":"或輸入「/trigger tp set 」，並填上玩家編號以進行傳送","color":"white"}]'}
data modify storage tp help_fail set value {"text":'{"text":"沒有其他在線的玩家","color":"red"}'}
data modify storage tp tp_fail set value {"text":'{"text":"找不到此玩家","color":"red"}'}
data modify storage tp self set value {"text":'{"text":"不能 tp 自己","color":"red"}'}