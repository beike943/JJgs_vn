--ÃèÊö£º×°±¸½Å±¾£¬ÓÒ¼üÊ¹ÓÃ×°±¸Ê±µ÷ÓÃÒ»¸ö¼¼ÄÜ£¬¿ÉÒÔÉèÖÃ¼¼ÄÜµÈ¼¶ºÍÀäÈ´Ê±¼ä
g_tbWeapon = 
{	--		ID1,ID2,ID3,SkillID,SkillLevel,CDTime
	[1] = {	0,	102,	8013,		911,		5,		5*60},
	[2] = {	0,	102,	8014,		911,		5,		5*60},
	[3] = {	0,	102,	8015,		911,		5,		5*60},
	[4] = {	0,	102,	8016,		911,		5,		5*60},
	[5] = {	0,	102,	8017,		912,		5,		5*60},
	[6] = {	0,	102,	8018,		912,		5,		5*60},
	[7] = {	0,	102,	8019,		912,		5,		5*60},
	[8] = {	0,	102,	8020,		912,		5,		5*60},
	[9] = {	0,	102,	8022,		913,		3,		5*60},
}
function OnUse(nItemIdx)
	local nSkill,nLevel,nTime = get_item_infor(nItemIdx);
	if nSkill == 0 then
		return 0
	end
	
	if can_use_item(nItemIdx) == 1 then
		return 0
	end
	
	local nPlace = GetItemPlace(nItemIdx);
	if nPlace == 1 then
		if DoFireworks(nSkill,nLevel) == 1 then
			SetItemUseLapse(nItemIdx,nTime*18);
		end
		return 1;
	end
	return 0;
end

function get_item_infor(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbWeapon) do
		if nID1 == g_tbWeapon[i][1] and nID2 == g_tbWeapon[i][2] and nID3 == g_tbWeapon[i][3] then
			return g_tbWeapon[i][4],g_tbWeapon[i][5],g_tbWeapon[i][6];
		end;
	end;
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end

function can_use_item(nItemIdx)
	local nGenre = GetItemGenre(nItemIdx);
	local nDetail = GetItemDetail(nItemIdx);
	local nParticular = GetItemParticular(nItemIdx);

	if in_taishou_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 1) > 0 or IsTitleExist(51, 2) > 0 or IsTitleExist(51, 5) > 0 or IsTitleExist(51, 6) > 0 or IsTitleExist(51, 9) > 0 or IsTitleExist(51, 10) > 0 then
			return 0
		end
		Msg2Player("B¹n ch­a cã x­ng hiÖu t­¬ng øng, kh«ng thÓ sö dông vËt nµy!")
		return 1
	elseif in_shiye_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 3) > 0 or IsTitleExist(51, 7) > 0 or IsTitleExist(51, 11) > 0 then
			return 0
		end
		Msg2Player("B¹n ch­a cã x­ng hiÖu t­¬ng øng, kh«ng thÓ sö dông vËt nµy!")
		return 1
	elseif in_tixia_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 4) > 0 or IsTitleExist(51, 8) > 0 or IsTitleExist(51, 12) > 0 then
			return 0
		end
		Msg2Player("B¹n ch­a cã x­ng hiÖu t­¬ng øng, kh«ng thÓ sö dông vËt nµy!")
		return 1
	end
	return 0	--·µ»Ø·Ç1±íÊ¾ÄÜÓÒ¼ü×°±¸¡£·µ»Ø1±íÊ¾²»ÄÜ×°±¸
end

function CanEquip(nItemIdx)
	local nGenre = GetItemGenre(nItemIdx);
	local nDetail = GetItemDetail(nItemIdx);
	local nParticular = GetItemParticular(nItemIdx);

	if in_taishou_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 1) > 0 or IsTitleExist(51, 2) > 0 or IsTitleExist(51, 5) > 0 or IsTitleExist(51, 6) > 0 or IsTitleExist(51, 9) > 0 or IsTitleExist(51, 10) > 0 then
			return 0
		end
		Msg2Player("B¹n ch­a cã x­ng hiÖu t­¬ng øng, kh«ng thÓ trang bÞ vËt nµy!")
		return 1
	elseif in_shiye_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 3) > 0 or IsTitleExist(51, 7) > 0 or IsTitleExist(51, 11) > 0 then
			return 0
		end
		Msg2Player("B¹n ch­a cã x­ng hiÖu t­¬ng øng, kh«ng thÓ trang bÞ vËt nµy!")
		return 1
	elseif in_tixia_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 4) > 0 or IsTitleExist(51, 8) > 0 or IsTitleExist(51, 12) > 0 then
			return 0
		end
		Msg2Player("B¹n ch­a cã x­ng hiÖu t­¬ng øng, kh«ng thÓ trang bÞ vËt nµy!")
		return 1
	end
	return 0	--·µ»Ø·Ç1±íÊ¾ÄÜÓÒ¼ü×°±¸¡£·µ»Ø1±íÊ¾²»ÄÜ×°±¸
end

function in_taishou_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 101 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 103 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 102 and nParticular >= 8013 and nParticular <= 8020 then
		return 1
	end
	return 0
end

function in_shiye_item(nDetail, nParticular)
	if nDetail == 102 and nParticular >= 8021 and nParticular <= 8022 then
		return 1
	end
	return 0
end

function in_tixia_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 101 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 103 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8023 and nParticular <= 8026 then
		return 1
	end
	return 0
end
