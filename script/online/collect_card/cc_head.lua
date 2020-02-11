Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

--»î¶¯Ê±¼ä
--acitivity time
CC_START_TIME = 2013060500
CC_END_TIME = 2013063000

CC_ACTIVITY_TASK_GROUP = TaskManager:Create(6,5);
CC_ACTIVITY_TASK_GROUP.DAYSEQ = 1; --¿çÌìÇåÀí±ê¼Ç
CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES = 2; --´ðÌâ´ÎÊý±ê¼Ç
CC_ACTIVITY_TASK_GROUP.QUESTION1 = 3;
CC_ACTIVITY_TASK_GROUP.QUESTION2 = 4;
CC_ACTIVITY_TASK_GROUP.QUESTION3 = 5;
CC_ACTIVITY_TASK_GROUP.CARD3_TIMES = 6;--ÉÏ½»µÚÈýÖÖ¿¨´ÎÊý
CC_ACTIVITY_TASK_GROUP.FLAG_BIT = 7; --°´Î»±ê¼Ç
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1 = 1; --¿ªÏä±ê¼Ç
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2 = 2;
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3 = 3;
CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4 = 4;
CC_ACTIVITY_TASK_GROUP.CON_TAG = 5;  --Á¬Ðø´ð¶Ô±ê¼Ç
CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD = 8; --×î¶àÁìÈ¡ÁéÃ¨¿¨ÊýÁ¿
CC_ACTIVITY_TASK_GROUP.CARD2_TIMES = 9; --ÉÏ½»µÚ¶þÖÖ¿¨´ÎÊý
CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT = 10; --×ÊÁÏÆ¬Àñ°ü»ñµÃ´ÎÊý

--»î¶¯ÊÇ·ñ¿ªÆô
function cc_activity_isopen()
	return gf_CheckEventDateEx2(CC_START_TIME, CC_END_TIME);
end

function cc_daily_clear()
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	--¿çÌìÇåÀí
	if CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.DAYSEQ) ~= zgc_pub_day_turn() then
		for i = 1, 10 do
			CC_ACTIVITY_TASK_GROUP:SetTask(i, 0);
		end
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.DAYSEQ, zgc_pub_day_turn());
	end
end

function cc_answer_question()
	--»î¶¯Ê±¼ä
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event vÉn ch­a khëi ®éng");
		return 0;
	end
	--²ÎÓëÌõ¼þ
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--±³°ü¿Õ¼ä
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end	
	local tTemp = {
		CC_ACTIVITY_TASK_GROUP.QUESTION1,
		CC_ACTIVITY_TASK_GROUP.QUESTION2,
		CC_ACTIVITY_TASK_GROUP.QUESTION3,
	}
	--¿çÌìÇåÀí
	cc_daily_clear();
	--ÊÇ·ñÊÇ³¬¹ý3ÌâÁË
	--ÌâÄ¿µÄË÷Òý
	local nIndex = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	if nIndex > CC_ANSWER_TIMES then 
		Talk(1,"","Sè lÇn tr¶ lêi c©u hái h«m nay ®· sö dông hÕt, ngµy mai h·y tiÕp tôc.")
		return 0;
	end
	--Ëæ»ú³öÈý¸öÌâÄ¿
	if nIndex == 1 then
		local tRand = gf_Random(1, getn(CC_QUESTION_LIB), getn(tTemp));
		for i = 1, getn(tRand) do
			CC_ACTIVITY_TASK_GROUP:SetTask(i + CC_ACTIVITY_TASK_GROUP.QUESTION1 - 1, tRand[i]);
		end
	end
	--³öÌâÄ¿
	local nTableIndex = CC_ACTIVITY_TASK_GROUP:GetTask(tTemp[nIndex]);
	local tSay = {};
	local tSubTable = CC_QUESTION_LIB[nTableIndex];
	if not tSubTable or getn(tSubTable) ~= 3 then  return 0; end
	for i = 1, getn(tSubTable[2]) do
		if i == tSubTable[3] then
			tinsert(tSay, tSubTable[2][i].."/cc_answer_question_succ")
		else
			tinsert(tSay, tSubTable[2][i].."/cc_answer_question_fail")
		end
	end
	tinsert(tSay, "\n rót lui/nothing");
	Say(CC_NPC..tSubTable[1]..format("<color=red> ( hiÖn t¹i ®ang tr¶ lêi lÇn thø %d) <color>", nIndex), getn(tSay), tSay);
end

function cc_answer_question_succ()
	local nAnswerTimes = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES, nAnswerTimes);
	local tAward = {
		[1] = 10000,
		[2] = 15000,
		[3] = 20000,	
	}
	if nAnswerTimes > 1 and nAnswerTimes <= getn(tAward) then 
		if CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG) == 0 then
			--Á¬Ðø´ð¶Ô½±Àø
			gf_Modify("Exp", tAward[nAnswerTimes]);
			cc_answer_item_award(nAnswerTimes);
		else
			--´ð¶Ô½±Àø
			gf_Modify("Exp", tAward[1]);
			cc_answer_item_award(1);
		end
	elseif nAnswerTimes == 1 then
		gf_Modify("Exp", tAward[1]);
		cc_answer_item_award(1);
	end
	--´ð¶ÔÁË
	CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG, 0);
	--¼ÌÐø´ðÌâ
	cc_answer_continue(nAnswerTimes);
end

function cc_answer_question_fail()
	local nAnswerTimes = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES) + 1;
	CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ANSWER_TIMES, nAnswerTimes);
	--´ð´íÁË
	CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.CON_TAG, 1);
	--Ê§°Ü½±Àø
	gf_Modify("Exp", 2500);
	--¼ÌÐø´ðÌâ
	Say(CC_NPC.."<color=red> thËt ®¸ng tiÕc, ng­¬i tr¶ lêi sai råi ! <color>", 2, "TiÕp tôc tr¶ lêi/#cc_answer_continue("..nAnswerTimes..")", "§îi mét l¸t råi nãi nhÐ/nothing");
end

function cc_answer_continue(nAnswerTimes)
	if nAnswerTimes < CC_ANSWER_TIMES then
		cc_answer_question();
	else
		Talk(1, "", "Sè lÇn tr¶ lêi c©u hái h«m nay ®· sö dông hÕt, ngµy mai h·y tiÕp tôc.");	
	end
end

function cc_answer_item_award(nKind)
	local tAward = {
		[1] = {
			{1, 85, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 75, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 25, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 70, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 25, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Miªu VËn", {2, 1, 30507, 1}, 0},
		},
	}
	cc_card_award_func({tAward, nKind, nKind, "KiÕn thøc vÊn ®¸p"});
end

function cc_get_award(nKind)
	--»î¶¯Ê±¼ä
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event vÉn ch­a khëi ®éng");
		return 0;
	end
	--²ÎÊý´íÎó
	if nKind < 1 and nKind > 3 then return 0; end
	--²ÎÓëÌõ¼þ
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--±³°ü¿Õ¼ä
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	--¿Û³ýÎïÆ·
	local tItemDel = {
		[1] = {
			{2,	1, 30505, 1, "L«i TÕ"},	
		},
		[2] = {
			{2,	1, 30505, 1, "L«i TÕ"},
			{2,	1, 30506, 1, "L¹c Hoa QuyÕt"},
		},
		[3] = {
			{2,	1, 30505, 1, "L«i TÕ"},
			{2,	1, 30507, 1, "Linh Miªu VËn"},
		},
	}
	for i = 1, getn(tItemDel[nKind]) do 
		if GetItemCount(tItemDel[nKind][i][1], tItemDel[nKind][i][2], tItemDel[nKind][i][3]) < tItemDel[nKind][i][4] then
			Talk(1,"",format("Trong hµnh trang kh«ng cã ®ñ %s", tItemDel[nKind][i][5]));
			return 0;
		end
	end
	for i = 1, getn(tItemDel[nKind]) do
		if DelItem(tItemDel[nKind][i][1], tItemDel[nKind][i][2], tItemDel[nKind][i][3], tItemDel[nKind][i][4]) ~= 1 then
			return 0;
		end
	end
	--¸ø¾­Ñé½±Àø
	local tExpAward = {
		[1] = 10000,
		[2] = 150000,
		[3] = 300000,	
	}
	gf_Modify("Exp", tExpAward[nKind]);
	--ÉÏ½»´ÎÊý
	if nKind == 2 then
		local nCard2Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES) + 1;
		if nCard2Times > CC_CARD2_MAX then
			return 0;
		end
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES, nCard2Times)
		--¸øÒ»¸ö×ÊÁÏÀñ°ü
		local nCount = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT);
		if mod(nCard2Times, 100) == 0 and nCount < CC_ZLP_PARK_MAX then
			gf_AddItemEx2({2, 1, 30540, 1}, "LÔ Bao Phiªn B¶n Míi", CC_LOG_TITLE, "Giao nép ThÎ L«i TÕ + ThÎ L¹c Hoa QuyÕt nhËn th­ëng ", 0, 1);
			CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.ZLPPARK_COUNT, nCount+1);
		end
		 gf_WriteLogEx(CC_LOG_TITLE, "nép thµnh c«ng", 1, "Nép L«i TÕ + Hoa QuyÕt lÇn thø "..nCard2Times)
	end
	if nKind == 3 then
		local nCard3Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD3_TIMES) + 1;
		CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.CARD3_TIMES, nCard3Times)
		--¸øÒ»¸öÐÂ×ÊÁÏÆ¬Àñ°ü
		if mod(nCard3Times, 100) == 0 then
			gf_AddItemEx2({2, 1, 30540, 1}, "LÔ Bao Phiªn B¶n Míi", CC_LOG_TITLE, "Giao nép ThÎ L«i TÕ + ThÎ Linh Miªu VËn nhËn th­ëng", 0, 1);
		end
		--¸øÒ»¸öÌìî¸Àñ°ü
		if mod(nCard3Times, 100) == 0 and mod(nCard3Times / 100, 2) == 0 then
			gf_AddItemEx2({2, 1, 30508, 1}, "LÔ bao Thiªn Cang LÖnh", CC_LOG_TITLE, "Giao nép ThÎ L«i TÕ + ThÎ Linh Miªu VËn nhËn th­ëng", 0, 1);
		end
		--¸øÒ»¸öÌìÃÅ½ðÁîÀñ°ü
		if mod(nCard3Times, 100) == 0 and mod(nCard3Times / 100, 3) == 0 then
			gf_AddItemEx2({2, 1, 30509, 1}, "LÔ bao Thiªn M«n Kim LÖnh", CC_LOG_TITLE, "Giao nép ThÎ L«i TÕ + ThÎ Linh Miªu VËn nhËn th­ëng", 0, 1);
		end
		gf_WriteLogEx(CC_LOG_TITLE, "nép thµnh c«ng", 1, "Nép L«i TÕ + Linh Miªu lÇn thø "..nCard3Times)
	end
	local tAwardTable = CC_CARD_AWARD[nKind];
	if tAwardTable then 
		gf_EventGiveRandAward(tAwardTable, gf_SumRandBase(tAwardTable), 1, CC_LOG_TITLE, "Giao nép ThÎ Bµi nhËn th­ëng",nil,1);
	end
end
---------------------------------------------------
function cc_tmz_award_succ()
	local tAward = {
		[1] = {
			{1, 80, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Miªu VËn", {2, 1, 30507, 1}, 0},
		},
	}
	cc_card_award_func({tAward, 1, 3, "Thiªn M«n trËn"});
end


function cc_tmz_award_fail()
	local tAward = {
		[1] = {
			{1, 80, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 20, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
	}
	cc_card_award_func({tAward, 1, 1, "Thiªn M«n trËn"});
end

function cc_wjz_award(nStep)
	local tTemp = {1,1,2,3};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[1], nStep, tTemp[nStep], "V¹n KiÕm Tròng"});
end

function cc_ttd_award(nStep)
	local tTemp = {1,1,2,2,3,3,4};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[2], nStep, tTemp[nStep], "Th«ng Thiªn HuyÔn C¶nh"});
end

function cc_ls_award(nStep)
	local tTemp = {1,1,1,1,1,1};
	if not tTemp or not tTemp[nStep] then return 0; end
	cc_card_award_func({CC_COPY_AWARD[3], nStep, tTemp[nStep], "Cöa ¶i L­¬ng S¬n "});
end
-------------------------------------------------------
--RelayË¢¹Ö
function cc_relay_call_boss(nRandomSeed)
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	if not nRandomSeed then return 0; end
	randomseed(nRandomSeed);
	local nNpcIndex = random(getn(CC_BOSS_INFO));
	local nMapIndex = random(getn(CC_MAP_ID));
	if not CC_MAP_ID[nMapIndex] then  return 0; end
	local tRandPos = CC_RAND_POS[CC_MAP_ID[nMapIndex][1]];
	if not tRandPos then return 0; end
	local nRandPos = random(getn(tRandPos));
	--¹ã²¥
	local strMsg = format("BOSS mang Hoµng Kim B¶o Bèi %s xuÊt hiÖn t¹i %s, c¸c vÞ anh hïng nhanh chãng ®i khiªu chiÕn!", CC_BOSS_INFO[nNpcIndex][2], CC_MAP_ID[nMapIndex][2]);
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
	--Õâ¸öµØÍ¼²»ÔÚÕâ¸ö·þÎñÆ÷¾Í²»Ë¢
	if SubWorldID2Idx(CC_MAP_ID[nMapIndex][1]) == -1 then
		return 0;
	end
	--Ë¢NPC
	local npcIdx = CreateNpc(CC_BOSS_INFO[nNpcIndex][1], CC_BOSS_INFO[nNpcIndex][2], CC_MAP_ID[nMapIndex][1], tRandPos[nRandPos][1], tRandPos[nRandPos][2]);
	if npcIdx > 0 then
		SetNpcDeathScript(npcIdx, "\\script\\online\\collect_card\\cc_boss_death.lua");
		SetNpcLifeTime(npcIdx, 60*30);
	end
end

function cc_get_allow_tag()
	--¿çÌìÇåÀí
	cc_daily_clear();
	local strTime = tonumber(date("%H%M"));
	if strTime >= 0830 and strTime < 1230 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1);
	elseif strTime >= 1230 and strTime < 1730 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2);
	elseif strTime >= 1730 and strTime < 2230 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3);
	elseif strTime > 2230 and strTime < 2359 then
		return CC_ACTIVITY_TASK_GROUP:GetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4);
	end  
end

function cc_set_allow_tag()
	--¿çÌìÇåÀí
	cc_daily_clear();
	local strTime = tonumber(date("%H%M"));
	if strTime >= 0830 and strTime < 1230 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_1, 1);
	elseif strTime >= 1230 and strTime < 1730 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_2, 1);
	elseif strTime >= 1730 and strTime < 2230 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_3, 1);
	elseif strTime > 2230 and strTime < 2359 then
		CC_ACTIVITY_TASK_GROUP:SetTaskBit(CC_ACTIVITY_TASK_GROUP.FLAG_BIT, CC_ACTIVITY_TASK_GROUP.BOSS_BOX_4, 1);
	end
end

function cc_box_award()
	--»î¶¯Ê±¼ä
	if cc_activity_isopen() ~= 1 then
		Talk(1,"","Event vÉn ch­a khëi ®éng");
		return 0;
	end
	--²ÎÓëÌõ¼þ
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	--±³°ü¿Õ¼ä
	if GetFreeItemRoom() < 5 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end	
	if cc_get_allow_tag() ~= 1 then
		cc_set_allow_tag();
		--Exp
		gf_Modify("Exp", 100000);
		--Item
		local nIndex = gf_GetRandItemByTable(CC_BOX_AWARD, gf_SumRandBase(CC_BOX_AWARD), 1);
		if tostring(CC_BOX_AWARD[nIndex][3]) == "Linh Miªu VËn" then
			local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
			if nTimes >= CC_BOX_MAX_LM_CARD then
				nIndex = random(1, max(1, nIndex-1));
			else
				CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + CC_BOX_AWARD[nIndex][4][4]);
			end
		end
		gf_EventGiveRandAward(CC_BOX_AWARD, gf_SumRandBase(CC_BOX_AWARD), 1, CC_LOG_TITLE, "Hoµng Kim B¶o Bèi", nIndex);
	else
		Talk(1,"","Ng­¬i ®· nhËn phÇn th­ëng råi, kh«ng thÓ nhËn thªm n÷a.");	
	end
end

function cc_card_award_func(t)
	if cc_activity_isopen() ~= 1 then
		return 0;
	end
	--t = {tAward, nKind, nCount, log_title};
	if not t or type(t) ~= "table" or getn(t) ~= 4 then
		return 0;
	end
	if gf_CheckBaseCondition(80,1) ~= 1 then
		return 0;
	end
	local tAward = t[1];
	local tAwardSub = tAward[t[2]];
	if not tAwardSub then  return 0; end
	for i = 1, t[3] do
		if GetFreeItemRoom() < 1 then
			Msg2Player("Kh«ng gian kh«ng ®ñ kh«ng thÓ nhËn lÊy ThÎ Tù");
			return 0;
		end
		if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
			Msg2Player("Kh«ng gian kh«ng ®ñ kh«ng thÓ nhËn lÊy ThÎ Tù");
			return 0;
		end	
		
		local nIndex = gf_GetRandItemByTable(tAwardSub, gf_SumRandBase(tAwardSub), 1);
		if tostring(tAwardSub[nIndex][3]) == "Linh Miªu VËn" then
			local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
			if nTimes >= CC_BOX_MAX_LM_CARD then
				nIndex = random(1, max(1, nIndex - 1));
			else
				CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + tAwardSub[nIndex][4][4]);
			end
		end
		gf_EventGiveRandAward(tAwardSub, gf_SumRandBase(tAwardSub), 1, CC_LOG_TITLE, t[4], nIndex);
	end
end


