Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		CastState("state_receive_half_damage",50,15*18,1,290000);	--ÉËº¦¼õ°ë¸ÅÂÊ50%£¬³ÖÐø15Ãë
		Msg2Player("S¸t th­¬ng gi¶m 50% trong 15 gi©y");
		Msg2_LeiTai("B¸nh Trung Thu ¤ Mai");
	end;
end;