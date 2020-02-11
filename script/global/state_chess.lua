Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\date.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\global_task\\gtask_data.lua");
Include("\\script\\online_activites\\award.lua")

--Ìõ¼þ¼ì²é----------------------------------------
function scCheckLevel()
	if GetLevel() < 80 then
		return 0
	end
	return 1
end

function scCheckTask()
	if tGtTask:check_task() ~= 1 then
		return 0
	end
	if tGtTask:_CheckRoomWeight("3;50") ~= 1 then
		return 0
	end
	return 1
end

--Ã¿´ÎÍ¶Èû×ÓÐèÒªÏûºÄ-----------------------------
--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scCostResources()
	local nRet, nMax = ModifyEnergy(-4, 1);
	if nRet == -1 then
		return 0;
	end
	return 1;
end

--ÈÎÎñ------------------------------------------
function scAcceptTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 1 then
		return 1
	end
	return OpenGTask(nTaskID)
end

function scFinishTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--Ìõ¼þ¼ì²â
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ý
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	
	--´ÓmanageÖÐÒÆ³ý
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--½áÊø¶¯×÷
	--ÌØÐ§
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	Msg2Player(format("§· hoµn thµnh nhiÖm vô: %s", tGtNpcInfo[nTaskID].name))
	
	--¸øÓë½±Àø
	tGtTask:DoPrize(nTaskID)
	tGtNpcMain:ShowAward(nTaskID)
	
	--»î¶¯
	vaf_get_prize_item_30709(2, 1);
	
	return 1
end

function scConfirmPassTask(nTaskID)
--manageÖÐÊÇ·ñ½ÓÁË,Ã»½ÓµÄ»°Ö±½Ó·µ»ØPass³É¹¦
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	local strTab = {
		format("\n§ång ý tiªu hao %s nh¶y qua nhiÖm vô nµy/StateChessPassTask", "Hu©n ch­¬ng anh hïng"),
		"\nKh«ng, muèn tù tay hoµn thµnh nhiÖm vô/nothing",
	};
	Say(format("Nh¶y qua nhiÖm vô (NhËn ®­îc phÇn th­ëng nhiÖm vô), cÇn tiªu hao <color=red>%d<color> %s", 2, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

function scPassTask(nTaskID)
	--manageÖÐÊÇ·ñ½ÓÁË,Ã»½ÓµÄ»°Ö±½Ó·µ»ØPass³É¹¦
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--Ìõ¼þ¼ì²â
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver == 1 then
		Talk(1,"","NhiÖm vô ®· hoµn thµnh, kh«ng thÓ bá qua!")
		return 2
	end
	
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("Sè l­îng [%s] kh«ng ®ñ <color=red>%d<color> c¸i", "Hu©n ch­¬ng anh hïng", 2))
		return 3;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 4;
	end
	Msg2Player(format("§· tiªu hao %s*%d", "Hu©n ch­¬ng anh hïng", 2));
	
	--½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ý
	tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10])

	--É¾³ý´¥·¢Æ÷
	tGtTask:remove_trigger(nTaskID);
	
	--½áÊø¶¯×÷
	--ÌØÐ§
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	--´ÓmanageÖÐÒÆ³ý
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--¸øÓë½±Àø
	tGtTask:DoPrize(nTaskID)
	tGtNpcMain:ShowAward(nTaskID)
	
	--»î¶¯
	vaf_get_prize_item_30709(2, 1);
	
	return 1
end

function scDeleteTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	return tGtTaskManage:DeleteTask(nTaskID)
end

--ÈÕÖ¾--------------------------------------------------
function scDailyLogDataModify(nRound, nCell, nValue)
	WriteLog(format("[Tr­îng KiÕm Thiªn Nhai] [NhiÖm vô biÕn hãa] [Nh©n vËt: %s, tµi kho¶n: %s] [Sè vßng: %d, vÞ trÝ: %d, biÕn l­îng: %d]", GetName(), GetAccount(), nRound, nCell, nValue))
end

--½øÈëÏÂÒ»È¦ÏûºÄ-----------------------------------------
function scConfirmRoundOver(nRound)
	local strTab = {
		format("\n§ång ý tiªu hao %s ®Ó b­íc vµo vßng tiÕp theo/StateChessRoundOver", "Hu©n ch­¬ng anh hïng"),
		"\nT¹m thêi kh«ng cÇn/nothing",
	};
	Say(format("Chóc mõng, ®· hoµn thµnh vßng <color=green>%d<color>, b­íc vµo vßng tiÕp theo cÇn tiªu hao <color=red>%d<color> %s", nRound, 4 + (nRound - 1) * 4, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

--½øÈëÏÂÒ»È¦ÏûºÄ
--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scRoundOver(nRound)
	local nValue = 4 + (nRound - 1) * 4;
	if GetItemCount(2, 1, 30499) < nValue then
		Talk(1,"",format("Sè l­îng [%s] kh«ng ®ñ <color=red>%d<color> c¸i", "Hu©n ch­¬ng anh hïng", nValue))
		return 0;
	end
	if DelItem(2, 1, 30499, nValue) ~= 1 then
		return 0;
	end
	Msg2Player(format("§· tiªu hao %s*%d", "Hu©n ch­¬ng anh hïng", nValue));
	return 1;
end

--ÊÇ·ñÏûºÄÒø„»»ñÈ¡ºÃÔËµØÍ¼½±Àø--------------------------
function scConfirmFinishGl(nType)
	local strTab = {
		format("\n§ång ý tiªu hao %s nhËn phÇn th­ëng/StateChessFinishGl", "Hu©n ch­¬ng anh hïng"),
		"\nT¹m thêi kh«ng cÇn/nothing",
	};
	Say(format("Chµo mõng ®Õn víi <color=green>b¶n ®å may m¾n<color>, tham gia cÇn tiªu hao <color=red>%d<color> %s", 2, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scFinishGl(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("Sè l­îng [%s] kh«ng ®ñ <color=red>%d<color> c¸i", "Hu©n ch­¬ng anh hïng", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("§· tiªu hao %s*%d", "Hu©n ch­¬ng anh hïng", 2));
	return 1;
end

--ÊÇ·ñÏûºÄÒø„»»ñÈ¡Ëæ»úµØÍ¼½±Àø--------------------------
function scConfirmFinishEv(nType)
	local strTab = {
		format("\n§ång ý tiªu hao %s nhËn phÇn th­ëng/StateChessFinishEv", "Hu©n ch­¬ng anh hïng"),
		"\nT¹m thêi kh«ng cÇn/nothing",
	};
	Say(format("Chµo mõng ®Õn víi <color=green>b¶n ®å sù kiÖn ngÉu nhiªn<color>, tham gia cÇn tiªu hao <color=red>%d<color> %s", 2, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scFinishEv(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("Sè l­îng [%s] kh«ng ®ñ <color=red>%d<color> c¸i", "Hu©n ch­¬ng anh hïng", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("§· tiªu hao %s*%d", "Hu©n ch­¬ng anh hïng", 2));
	return 1;
end


--ºÃÔËµØÍ¼½±Àø------------------------------------------
function scGoodLuck(nValue)
	--print("nValue =", nValue)
	if 1 == nValue then
		local tAward = {
			{3, 5, 50000, 1},
			{3, 30, 100000, 1},
			{3, 30, 150000, 1},
			{3, 20, 200000, 1},
			{3, 5, 250000, 1},
			{3, 5, 300000, 1},
			{3, 2, 500000, 1},
			{3, 1, 600000, 1},
			{3, 1, 800000, 1},
			{3, 1, 2000000, 1},
		}
		local nRand = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Tr­îng KiÕm Thiªn Nhai", "MiÕu ThÇn Tµi", nRand)
		Talk(1,"",format("B¹n nhËn ®­îc <color=green>%d %s<color>", tAward[nRand][3]/10000, "Vµng"))
		return 1;
	elseif 2 == nValue then
		if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
			return 0;
		end
		local tAward = {
			{1, 20},
			{2, 20},
			{3, 20},
			{4, 15},
			{5, 15},
			{6, 5},
			{8, 2},
			{10, 1},
			{12, 1},
			{16, 1},
		}
		local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
		local tGem = {
			{2,	22, 101, "HuyÕtTrÝchTh¹ch Lv1"},
			{2,	22, 201, "NguyÖtB¹chTh¹ch Lv1"},
			{2,	22, 301, "Hæ Ph¸ch Th¹ch CÊp 1"},
			{2,	22, 401, "H¾c DiÖu Th¹ch CÊp 1"},
		}
		local nRand = random(getn(tGem));
		gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tAward[nIndex][1]}, tGem[nRand][4], "Tr­îng KiÕm Thiªn Nhai", "TiÒn trang", 0, 1);
		Talk(1,"",format("Ng­¬i nhËn ®­îc <color=green>%dc¸i%s<color>", tAward[nIndex][1], tGem[nRand][4]))
		return 1;
	elseif 3 == nValue then
		local tAward = {
			{38, 5, 10, 1},
			{38, 10, 15, 1},
			{38, 20, 20, 1},
			{38, 40, 25, 1},
			{38, 15, 30, 1},
			{38, 5, 35, 1},
			{38, 2, 40, 1},
			{38, 1, 45, 1},
			{38, 1, 50, 1},
			{38, 1, 60, 1},
		}
		local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Tr­îng KiÕm Thiªn Nhai", "TiÖm thuèc", nIndex)
		Talk(1,"",format("Ng­¬i nhËn ®­îc <color=green>%d®iÓm%s<color>", tAward[nIndex][3], "Tinh Lùc"))
		return 1;
	end
	return 0;
end

--Ëæ»úÊÂ¼þ½±Àø------------------------------------------
function scEvent(nValue)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local tAward = {
		{2, 1500, 10000000,1},
		{2, 1000, 20000000, 1},
		{2, 500,  40000000, 1},
		{3, 500,  100000, 1},
		{3, 1300, 150000, 1},
		{3, 1000, 200000, 1},
		{3, 100,  300000, 1},
		{31, 1583, "sc_GetEventGemAward(1)", 0},
		{31, 800, "sc_GetEventGemAward(2)", 0},
		{31, 200, "sc_GetEventGemAward(4)", 0},
		{1, 1000, "HuyÒn Viªm ThiÕt", {2, 1, 30670, 1}, 0},
		{1, 300, "HuyÒn Viªm ThiÕt", {2, 1, 30670, 2}, 0},
		{1, 100, "HuyÒn Viªm ThiÕt", {2, 1, 30670, 4}, 0},
		{1, 100, "HuyÒn Viªm ThiÕt", {2, 1, 30670, 8}, 0},
		{1, 1, "Linh §å §ao", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Tr­îng", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Thñ", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Ch©m", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å KiÕm", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å §µn", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Thñ", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å C«n", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å KiÕm", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Bót", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Th­¬ng", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Cung", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å §ao", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Tr¶o", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å KiÕm", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å PhiÕn", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å §Þch", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Tr­îng KiÕm Thiªn Nhai", "B¶n ®å ngÉu nhiªn", nIndex);
	if tAward[nIndex][1] == 1 then
		Talk(1,"",format("Ng­¬i nhËn ®­îc <color=green>%dc¸i%s<color>", tAward[nIndex][4][4], tAward[nIndex][3]))
	elseif tAward[nIndex][1] == 2 then
		Talk(1,"",format("B¹n nhËn ®­îc <color=green>%d %s<color>", tAward[nIndex][3], "Kinh nghiÖm"))
	elseif tAward[nIndex][1] == 3 then
		Talk(1,"",format("B¹n nhËn ®­îc <color=green>%d %s<color>", tAward[nIndex][3]/10000, "Vµng"))
	end
	return 1;
end

function sc_GetEventGemAward(nNum)
	local tGem = {
		{2,	22, 101, "HuyÕtTrÝchTh¹ch Lv1"},
		{2,	22, 201, "NguyÖtB¹chTh¹ch Lv1"},
		{2,	22, 301, "Hæ Ph¸ch Th¹ch CÊp 1"},
		{2,	22, 401, "H¾c DiÖu Th¹ch CÊp 1"},
	}
	local nRand = random(getn(tGem));
	gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tonumber(nNum) or 1}, tGem[nRand][4], "Tr­îng KiÕm Thiªn Nhai", "B¶n ®å ngÉu nhiªn", 0, 1);
	Talk(1,"",format("Ng­¬i nhËn ®­îc <color=green>%dc¸i%s<color>", nNum, tGem[nRand][4]))
end

function scCheckFreeRoom()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	return 1;
end

--Ã¿È¦½±Àø----------------------------------------------
function scDoPrize(nExp, nBagCount, nBagCountEx)
	--print("scDoPrize =", nExp, nBagCount, nBagCountEx)
	gf_ModifyExp(nExp);
	local nTotal = nBagCount;
	gf_AddItemEx2({2, 1, 30703, nBagCount}, "Bao Tr­îng KiÕm Thiªn Nhai", "Tr­îng KiÕm Thiªn Nhai", "PhÇn th­ëng mçi vßng", 0, 1);
	if nBagCountEx > 0 then
		gf_AddItemEx2({2, 1, 30703, nBagCountEx}, "Bao Tr­îng KiÕm Thiªn Nhai", "Tr­îng KiÕm Thiªn Nhai", "PhÇn th­ëng mçi vßng", 0, 1);
		nTotal = nTotal + nBagCountEx;
	end
	Say(format("NhËn ®­îc phÇn th­ëng mçi vßng cña Tr­îng KiÕm Thiªn Nhai: <color=green>EXP: %d, Bao Tr­îng KiÕm Thiªn Nhai*%d<color>", nExp, nTotal), 0);
	WriteLog(format("[Tr­îng KiÕm Thiªn Nhai] [PhÇn th­ëng mçi vßng] [Nh©n vËt: %s, tµi kho¶n: %s] [Kinh nghiÖm: %d, Bao Tr­îng KiÕm Thiªn Nhai: %d]", GetName(), GetAccount(), nExp, nTotal))
end

--ÕÌ½£ÌìÑÄ°ü
function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2,1,30670,1}, "Viªm HuyÒn ThiÕt", "Tr­îng KiÕm Thiªn Nhai", "Bao Tr­îng KiÕm Thiªn Nhai");
	Earn(40000);
	local tAward = {
		{2, 1000, 2000000, 1},
		{2, 1000, 5000000, 1},
		{2, 500, 10000000, 1},
		{3, 1000, 10000, 1},
		{3, 500, 50000, 1},
		{3, 400, 100000, 1},
		{3, 100, 300000, 1},
		{1, 1500, "Viªm HuyÒn ThiÕt", {2, 1, 30670, 1}, 0},
		{1, 1000, "Viªm HuyÒn ThiÕt", {2, 1, 30670, 2}, 0},
		{1, 500, "Viªm HuyÒn ThiÕt", {2, 1, 30670, 4}, 0},
		{1, 500, "Viªm HuyÒn ThiÕt", {2, 1, 30670, 8}, 0},
		{1, 500, "C©y B¸t Nh·", {2, 0, 398, 1, 4}, 0},
		{1, 600, "C©y B¸t Nh· nhá", {2, 0, 504, 1, 4}, 0},
		{1, 500, "C©y Tø Linh", {2, 1, 30269, 1, 4}, 0},
		{1, 383, "Tói h¹t gièng", {2, 1, 30087, 1, 4}, 0},
		{1, 1, "Linh §å §ao", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Tr­îng", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Thñ", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Ch©m", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å KiÕm", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å §µn", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Thñ", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å C«n", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å KiÕm", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Bót", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Th­¬ng", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Cung", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å §ao", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å Tr¶o", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å KiÕm", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å PhiÕn", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Linh §å §Þch", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Tr­îng KiÕm Thiªn Nhai", "Bao Tr­îng KiÕm Thiªn Nhai")
end
