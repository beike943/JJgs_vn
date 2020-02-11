--神行符：流水五分钟
function OnUse()

--赋一个加速魔法给玩家（"魔法字符串",速度增长,持续时间）
CastState("state_move_speed_percent_add",60,5400,1);
DelItem(2,0,143,1,1);

end;
