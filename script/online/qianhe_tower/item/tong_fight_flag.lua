--∞Ô≈…’Ω∆Ï π”√Ω≈±æ
Include("\\settings\\static_script\\online\\qianhe_tower\\qht_define.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
function OnUse(nItem)
	local nG, nD, nP = GetItemInfoByIndex(nItem);
	local nBangName = GetTongName()
	if nBangName == nil then
		return 0
	end
	--∞Ô≈…’Ω∆Ï
	if nG == 2 and nD == 1 and nP == 30573 then
		local nMapID, nX, nY = GetWorldPos();
		if gf_MapIsAllow({200, 300, 350, 100, 150, 500}, nMapID) ~= 1 or QHT_MAP_NAME[nMapID] == nil then
			Talk(1,"","B∂n ÆÂ nµy kh´ng cho ph–p sˆ dÙng chi’n k˙ bang ph∏i");
			return 0;
		end
		if IsTongMember() == 0 or GetTime() - GetJoinTongTime() < 24 * 3600 then
			Talk(1,"","Ng≠¨i ch≠a gia nhÀp bang hÈi ho∆c gia nhÀp bang thÍi gian ch≠a ÆÒ 1 ngµy n™n kh´ng th” sˆ dÙng chi’n k˙");
			return 0;
		end
		if DelItemByIndex(nItem, 1) == 1 then	
			local npcIndex = CreateNpc("Hoa Æ®ng3", nBangName, GetWorldPos());
			SetNpcScript(npcIndex, "\\script\\online\\qianhe_tower\\npc\\tong_fight_flag_npc.lua");
			SetNpcLifeTime(npcIndex, 6*3600);
			AddUnitStates(npcIndex, 0, 1);
			Msg2Player("Vµo 1")
		end
		local strMsg = format("%s Bang ph∏i %s khÎi chi’n k˙ bang ph∏i, thµnh vi™n nµy c„ th” nhÀn th≠Îng, %s bang ph∏i trÀn r t lÓi hπi.", GetTongName(), QHT_MAP_NAME[nMapID], GetTongName());
		Msg2Global(strMsg);
		AddLocalNews(strMsg);
	end
	--Ã˙—™∞Ô≈…’Ω∆Ï
	if nG == 2 and nD == 1 and nP == 30574 then
		local nMapID, nX, nY = GetWorldPos();
		if gf_MapIsAllow({200, 300, 350, 100, 150, 500}, nMapID) ~= 1 or QHT_MAP_NAME[nMapID] == nil then
			Talk(1,"","B∂n ÆÂ nµy kh´ng cho ph–p sˆ dÙng chi’n k˙ bang ph∏i");
			return 0;
		end
		if IsTongMember() == 0 or GetTime() - GetJoinTongTime() < 24 * 3600 then
			Talk(1,"","Ng≠¨i ch≠a gia nhÀp bang hÈi ho∆c gia nhÀp bang thÍi gian ch≠a ÆÒ 1 ngµy n™n kh´ng th” sˆ dÙng chi’n k˙");
			return 0;
		end
		if DelItemByIndex(nItem, 1) == 1 then
			--local npcIndex = CreateNpc("QxTiexueqi", GetTongName(), nMapID, nX, nY);
			local npcIndex = CreateNpc("Hoa Æ®ng3", nBangName, GetWorldPos());
			SetNpcScript(npcIndex, "\\script\\online\\qianhe_tower\\npc\\tong_fight_flag_npc.lua");
			SetNpcLifeTime(npcIndex, 6*3600);
			AddUnitStates(npcIndex, 0, 2);
		end
		local strMsg = format("%s Bang ph∏i %s khÎi l™n chi’n k˙ thi’t huy’t bang ph∏i, thµnh vi™n nµy sœ Æ≠Óc th≠Îng hÀu h‹nh, %s Bang ph∏i trÀn mπnh mœ v´ cÔng!!!", GetTongName(), QHT_MAP_NAME[nMapID], GetTongName());
		Msg2Global(strMsg);
		AddLocalNews(strMsg);
	end
end