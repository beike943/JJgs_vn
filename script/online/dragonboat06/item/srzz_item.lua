function OnUse()
	if DelItem(2,1,388,1) == 1 then
		CastState("state_move_speed_percent_add",20,5*60*18,1,1001);	--5·ÖÖÓÌá¸ßÒÆ¶¯ËÙ¶È20%
		Msg2Player("B¹n ®· ¨n 1 b¸nh Ýt nh©n thÞt, trong vßng 5 phót tèc ®é di chuyÓn t¨ng 20%");
		Msg2_LeiTai("B¸nh Ýt nh©n thÞt");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(23,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(29,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(30,GetName().."Sö dông 1	"..szItemName);
end;
