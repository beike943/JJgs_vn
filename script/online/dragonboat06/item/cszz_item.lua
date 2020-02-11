function OnUse(nItemIndex)
	if DelItemByIndex(nItemIndex,1) ~= 0 then
		CastState("state_p_attack_percent_add",20,120*60*18,1,1009);
		CastState("state_m_attack_percent_add",20,120*60*18,1,1010);	--120·ÖÖÓÌá¸ßÄÚÍâ¹¥20£¥
		CastState("state_move_speed_percent_add",10,120*60*18,1,1001);	--120·ÖÖÓÌá¸ßÒÆ¶¯ËÙ¶È10%
		Msg2Player("Lùc ®¸nh t¨ng 20%, tèc ®é di chuyÓn t¨ng 10% duy tr× 2h")
		Msg2_LeiTai("B¸nh İt n­íng");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(23,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(29,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(30,GetName().."Sö dông 1	"..szItemName);
end;
