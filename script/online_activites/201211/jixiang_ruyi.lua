Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_ACTIVITY_JIXIANG_RUYI = 78

VET_ACTIVITY_JIXIANG_RUYI_TASK = TaskManager:Create(6,4)
VET_ACTIVITY_JIXIANG_RUYI_TASK.Count = 1;
VET_ACTIVITY_JIXIANG_RUYI_TASK.DaySeq = 2;

TABLE_JIXIANG_RUYI = {
		"Mua TiÓu Nh­ ý (cÇn 1 Xu vËt phÈm)/Buy_XiaoRuYi",
		"Dïng TiÓu Nh­ ý ®æi th­ëng (tiªu hao 10 TiÓu Nh­ ý + 3 Xu vËt phÈm)/Use_XiaoRuYi_Deal",
		"Dïng C¸t T­êng Th¹ch ®æi gi¶i th­ëng n¨m míi 2013/Use_JiXiangShi",
		"T¹i h¹ chØ xem qua th«i/nothing",
};

TABLE_XIAORUYI_AWARD  = {
    {1, 2222, "Méc R­¬ng", {2, 1, 30340, 1}, 0},
    {1, 279, "C¸t t­êng th¹ch", {2, 1, 30015, 1}, 0},
    {2, 1000, 100000, 1},
    {2, 1000, 200000, 1},
    {2, 1000, 500000, 1},
    {3, 2200, 10000, 1},
    {4, 850, 5, 1},
    {5, 850, 5, 1},
    {28, 599, 1, 1},
};

TABLE_JIXIANG_AWARD = {
		{1, "Ma §ao Th¹ch cÊp 1", {2, 1, 30428, 1, 1}, 4, 30 * 24 * 3600, "(H¹n sö dông 30 ngµy, cã thÓ giao dÞch)"},
		{1, "Ma §¹o Th¹ch cÊp 2", {2, 1, 30429, 1, 1}, 6, 30 * 24 * 3600, "(H¹n sö dông 30 ngµy, cã thÓ giao dÞch)"},	
		{1, "Ma §ao Th¹ch cÊp 3", {2, 1, 30430, 1, 1}, 9, 30 * 24 * 3600, "(H¹n sö dông 30 ngµy, cã thÓ giao dÞch)"},
		{1, "C­êng hãa quyÓn 12", {2, 1, 30424, 1, 1}, 39, 30 * 24 * 3600, "(H¹n sö dông 30 ngµy, cã thÓ giao dÞch)"},
		{1, "C­êng hãa quyÓn 13", {2, 1, 30425, 1, 1}, 60, 30 * 24 * 3600, "(H¹n sö dông 30 ngµy, cã thÓ giao dÞch)"},
		{1, "C­êng hãa quyÓn 14", {2, 1, 30426, 1, 1}, 99, 30 * 24 * 3600, "(H¹n sö dông 30 ngµy, cã thÓ giao dÞch)"},
		{1, "C­êng hãa quyÓn 15", {2, 1, 30427, 1, 1}, 79, 30 * 24 * 3600, "(H¹n sö dông 30 ngµy, cã thÓ giao dÞch)"},
		{1, "b¸nh Ýt B¸c B¶o", {2, 1, 1125, 10, 4}, 66, 0, "(Kh«ng thÓ giao dÞch)"},
		{2, "Niªn thó", {0, 105, 33, 1, 4, -1, -1, -1, -1, -1, -1}, 18, 7 * 24 * 3600, "(H¹n sö dông 7 ngµy, kh«ng thÓ giao dÞch)"},
		{2, "Niªn thó", {0, 105, 33, 1, 3, -1, -1, -1, -1, -1, -1}, 888, 0, "(VÜnh viÔn, cã thÓ giao dÞch)"},
		{3, "1.800.000.000Exp", 1800000000, 2003, 0, " "},
		{4, "88.000 ®iÓm qu©n c«ng", 88000, 1989, 0, " "},
};

function Buy_XiaoRuYi()
		local nNum1 = GetItemCount(2, 1, 30230);
		local nNum2 = GetFreeItemRoom() * 999;
		AskClientForNumber("Buy_XiaoRuYi_Deal", 1, min(nNum1, nNum2), "NhËp sè l­îng","");
end

function Buy_XiaoRuYi_Deal(nNum)
		if GetFreeItemRoom() < ceil(nNum/999) then
			Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
			return
		end
		if nNum > GetItemCount(2, 1, 30230) then
			Talk(1,"",format("Sè l­îng Xu vËt phÈm kh«ng ®ñ <color=red>%d<color>",nNum));
			return
		end
		if DelItem(2, 1, 30230, nNum) == 1 then
			AddItem(2, 1, 30030, nNum);
			gf_WriteLogEx("NIEN THU NHU Y", "mua  thµnh c«ng", nNum, "TiÓu Nh­ ý")
		end
end

function Use_XiaoRuYi()
	Say("X¸c ®Þnh dïng 10 TiÓu Nh­ ý vµ 3 Xu vËt phÈm ®æi th­ëng?", 2, "§ång ý/Use_XiaoRuYi_Deal", "T¹i h¹ chØ xem qua th«i/nothing");
end

function Use_XiaoRuYi_Deal()
	if GetFreeItemRoom() < 4 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end
	if GetItemCount(2, 1, 30030) < 10 then
		Talk(1,"","Sè l­îng TiÓu Nh­ ý kh«ng ®ñ <color=red>10<color>");
		return
	end
	if GetItemCount(2, 1, 30230) < 3 then
		Talk(1,"",format("Sè l­îng Xu vËt phÈm kh«ng ®ñ <color=red>%d<color>",3));
		return
	end
	if VET_ACTIVITY_JIXIANG_RUYI_TASK:GetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_ACTIVITY_JIXIANG_RUYI_TASK:SetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.DaySeq, zgc_pub_day_turn());
		VET_ACTIVITY_JIXIANG_RUYI_TASK:SetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count, 0);
	end
	if VET_ACTIVITY_JIXIANG_RUYI_TASK:GetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count) >= 100 then
		Talk(1,"","Mçi ng­êi mçi ngµy cã thÓ ®æi tèi ®a 100 lÇn");
		return
	end
	if DelItem(2, 1, 30030, 10) == 1 and DelItem(2, 1, 30230, 3) == 1 then
		gf_Modify("Exp", 2500000);
		gf_EventGiveRandAward(TABLE_XIAORUYI_AWARD, 10000, 1, "NIEN THU NHU Y", "PhÇn th­ëng TiÓu Nh­ ý");
		VET_ACTIVITY_JIXIANG_RUYI_TASK:SetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count, VET_ACTIVITY_JIXIANG_RUYI_TASK:GetTask(VET_ACTIVITY_JIXIANG_RUYI_TASK.Count) + 1);
	end
end

function Use_JiXiangShi()
	local tSayTable = {}
	local strTemp = ""
	for i = 1, getn(TABLE_JIXIANG_AWARD) do
		if TABLE_JIXIANG_AWARD[i][1] == 1 or TABLE_JIXIANG_AWARD[i][1] == 2 then
			strTemp = format("Dïng %d C¸t T­êng Th¹ch ®æi %sx%d%s/#Use_JiXiangShi_Deal(%d)", TABLE_JIXIANG_AWARD[i][4], TABLE_JIXIANG_AWARD[i][2], TABLE_JIXIANG_AWARD[i][3][4], TABLE_JIXIANG_AWARD[i][6], i);
		else
			strTemp = format("Dïng %d C¸t T­êng Th¹ch ®æi %s/#Use_JiXiangShi_Deal(%d)", TABLE_JIXIANG_AWARD[i][4], TABLE_JIXIANG_AWARD[i][2], i);
		end
		tinsert(tSayTable, strTemp);
	end
	tinsert(tSayTable, "T¹i h¹ chØ xem qua th«i/nothing");
	Say("C¸c h¹ x¸c ®Þnh dïng C¸t T­êng Th¹ch ®æi phÇn th­ëng n¨m míi 2013?", getn(tSayTable), tSayTable);
end

function Use_JiXiangShi_Deal(nIndex)
	local tAward = TABLE_JIXIANG_AWARD[nIndex];
	if not tAward or not tAward[3] then return end
--	if GetFreeItemRoom() < 2 then  	-- type(tAward[3]) == table and 
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end
	if GetItemCount(2, 1, 30015) < tAward[4] then
		Talk(1,"",format("Sè l­îng C¸t T­êng Th¹ch kh«ng ®ñ <color=red>%d<color>", tAward[4]));
		return
	end
	if DelItem(2, 1, 30015, tAward[4]) ~= 1 then
		return
	end
	if tAward[1] == 1 then
		--»ñµÃµÀ¾ß
		local nRet, nIndex = AddItem(tAward[3][1], tAward[3][2], tAward[3][3], tAward[3][4], tAward[3][5]);
		if tAward[5] ~= 0 then
			SetItemExpireTime(nIndex, tAward[5]);
		end
	elseif tAward[1] == 2 then
		--»ñµÃ×°±¸
		local nRet, nIndex = AddItem(tAward[3][1], tAward[3][2], tAward[3][3], tAward[3][4], tAward[3][5], tAward[3][6], tAward[3][7], tAward[3][8], tAward[3][9], tAward[3][10], tAward[3][11]);
		if tAward[5] ~= 0 then
			SetItemExpireTime(nIndex, tAward[5]);
		end
	elseif tAward[1] == 3 then
		--»ñµÃ¾­Ñé
		gf_Modify("Exp", tAward[3]);
	elseif tAward[1] == 4 then
		--»ñµÃ¾ü¹¦
		if GetTask(701) >= 0 then
    			SetTask(701, GetTask(701) + tAward[3])
	  	else
	  		SetTask(701, GetTask(701) - tAward[3])
	  	end
	  	local szMsg2Player = format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", tAward[3])
    		Msg2Player(szMsg2Player);        
	end 
	gf_WriteLogEx("NIEN THU NHU Y", "nhËn thµnh c«ng", 1, "NhËn th­ëng 2013: "..tAward[2])	
end
