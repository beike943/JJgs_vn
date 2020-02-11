Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[10][2],tMoonCake[10][3],tMoonCake[10][4],1) == 1 then
		CastState("state_receive_half_damage",30,15*18,1,290000);	--ÉËº¦¼õ°ë¸ÅÂÊ30%£¬³ÖÐø15Ãë
		Msg2Player("S¸t th­¬ng gi¶m 30% trong 15 gi©y");
		Msg2_LeiTai("B¸nh Trung Thu Xoµi Giang S¬n");
	end;
end;