--=============================================
--create by baiyun 2009.4.9
--describe:Ô½ÄÏ°æ4ÔÂ·ÝÖÖÊ÷»î¶¯
--=============================================
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

--------------------------------------
--main()
--Ö÷º¯Êý
--------------------------------------
function main()
	local nPlantTimePassed = 0;
	local nWaterTimePassed = 0;
	local npcIdx, npcModel, npcName = GetTriggeringUnit();--»ñµÃµ±Ç°´¥·¢Æ÷ÀïµÄNPCË÷Òý£¬Ä£°åID£¬ÏÔÊ¾Ãû×Ö
	if npcIdx == 0 then
		WriteLog("[Ho¹t ®éng trång c©y th¸ng 4  sai sãt]:"..GetName().."Trong lóc t­íi c©y, GetTriggeringUnit thø nhÊt sÏ trë vÒ 0");
		return 0;
	end
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName, 1, nNameLen) then --ÓÃÃû×ÖÀ´ÅÐ¶ÏÊÇ²»ÊÇÍæ¼ÒµÄÊ÷
		bJudgeByName = 1;
	end
	local bIsTree = 0;
	for i = 1, getn(TREE_TYPE) do
		if npcModel == TREE_TYPE[i][1] then
			bIsTree = 1;
			break;
		end
	end
	if bIsTree == 0 then
		SetNpcScript(npcIdx, "");
		WriteLog("[Lçi khi trång c©y th¸ng 4]:NPC:"..npcName.."Lçi files gèc");
		return 0;
	end
	local npcTreeIndex = GetTargetNpc(); --»ñÈ¡Íæ¼ÒµÄ¶¯×÷¶ÔÏóNpc
	if npcTreeIndex == 0 then
		WriteLog("[Ho¹t ®éng trång c©y th¸ng 4  sai sãt]:"..GetName.."Khi t­íi n­íc, GetTargetNpc trÞ quay l¹i lµ 0");
		return 0;
	end;
	if bJudgeByName == 0 then
		if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
			Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
			return 0;
		end
	end
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	nPlantTimePassed = GetTime() - GetTask(TASK_PLANT_TREE_TIME);
	nWaterTimePassed = GetTime() - GetTask(TASK_WATER_TREE_TIME);
	
	local sSysSth = "";
	local selTab = {};
	--Èç¹ûÊÇ²»ËÀÊ÷
	if GetTask(TASK_PLANT_TREE_TYPE) == 2 then
		if nPlantTimePassed < 240 then
			Talk(1, "", "C©y BÊt Tö vÉn ch­a tr­êng thµnh, b©y giê kh«ng thÓ thu ho¹ch ®­îc, ®îi <color=yellow>" .. 240 - nPlantTimePassed .. " gi©y<color> h·y tiÕp tôc thu ho¹ch");
			return 0;
		else
			tinsert(selTab, "B©y giê thu ho¹ch /getTree");
			tinsert(selTab, "§îi mét lóc h·y thu ho¹ch tiÕp/doNothong");
			sSaySth = "C©y ®· tr­ëng thµnh, muèn thu ho¹ch b©y giê? NÕu nh­<color=yellow>" .. 300 - nPlantTimePassed .. "<color> gi©y sau kh«ng thu ho¹ch, c©y sÏ tù ®éng chÕt ®i";
		end
	else
		if nTreeGrow == 1 then
			if nPlantTimePassed	< TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "CÇn ph¶i ®îi thªm <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi©y míi cã thÓ t­íi n­íc, cã ®iÒu ®õng cã ch¹y ®i qu¸ xa, nÕu nh­ <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi©y sau kh«ng t­íi n­íc, c©y thiÕu n­íc sÏ chÕt ®i."
				);	
				return 0;
			end
		end
		if nTreeGrow < 6 and nTreeGrow ~= 1 then
			if nPlantTimePassed > TREE_PARAM[nTreeGrow - 1][3] and nPlantTimePassed	<= TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "CÇn ph¶i ®îi thªm <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi©y míi cã thÓ t­íi n­íc, cã ®iÒu ®õng cã ch¹y ®i qu¸ xa, nÕu nh­ <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi©y sau kh«ng t­íi n­íc, c©y thiÕu n­íc sÏ chÕt ®i."
				);	
				return 0;
			end
		end
		if nTreeGrow == 6 then
			if nPlantTimePassed < TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", TREE_TYPE[GetTask(TASK_PLANT_TREE_TYPE)][2] .. "VÉn ch­a tr­ëng thµnh, nªn kh«ng thÓ thu ho¹ch b©y giê ®­îc<color=yellow>" ..TREE_PARAM[nTreeGrow][3] - nPlantTimePassed .. " gi©y<color> h·y tiÕp tôc thu ho¹ch");
				return 0;
			end
			tinsert(selTab, "B©y giê thu ho¹ch /getTree");
			tinsert(selTab, "§îi mét lóc h·y thu ho¹ch tiÕp/doNothong");
			sSaySth = "C©y ®· tr­ëng thµnh, muèn thu ho¹ch b©y giê? NÕu nh­<color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi©y sau kh«ng thu ho¹ch, c©y sÏ tù ®éng chÕt ®i";
		else
				tinsert(selTab, "T­íi n­íc (cÇn " .. TREE_PARAM[nTreeGrow + 1][4] .. " phÇn Lé Thñy)/giveWater");
				tinsert(selTab, "Sau nµy h·y t­íi./doNothing");
				sSaySth = TREE_TYPE[nTreeGrow][2] .. " ®ang cÇn t­íi Lé Thñy, cã muèn t­íi kh«ng? NÕu sau <color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi©y sau kh«ng t­íi n­íc, c©y thiÕu n­íc sÏ chÕt ®i.";
		end
	end
	
	Say(sSaySth, getn(selTab), selTab);
end

--------------------------------------
--giveWater()
--¸øÊ÷½½Ë®
--------------------------------------
function giveWater()
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	local npcTreeIndex = GetTask(TASK_TREE_INDEX);
	if npcTreeIndex == 0 then
		WriteLog("[Ho¹t ®éng trång c©y th¸ng 4  sai sãt]:" .. GetName() .. "Lóc t­íi n­íc, nhiÖm vô biÕn l­îng TASK_TREE_INDEX lµ 0");
		return 0;
	end
	if DelItem(2, 0, 351, TREE_PARAM[nTreeGrow][4]) ~= 1 then
		Talk(1, "", "Kh«ng ®ñ Lé Thñy!");
		return 0;
	end

	SetNpcLifeTime(npcTreeIndex, TREE_PARAM[nTreeGrow + 1][2] - (GetTime() - GetTask(TASK_PLANT_TREE_TIME)));
	SetTask(TASK_TREE_GROW, nTreeGrow + 1);
	SetTask(TASK_WATER_TREE_TIME, GetTime());
	Talk(1, "", "T­íi n­íc thµnh c«ng!");
end

--------------------------------------
--getTree()
--°ÎÊ÷
--------------------------------------
function getTree()

-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(4, 20, "Xin lçi, ") == 0 then
		return 0
	end
	
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		WriteLog("[Ho¹t ®éng trång c©y th¸ng 4  sai sãt]:" .. GetName() .. "Lóc nhæ c©y, GetTargetNpc trÞ quay l¹i lµ 0");
		return 0;
	end
	local nTreeType = GetTask(TASK_PLANT_TREE_TYPE);
	if nTreeType ~= 1 and nTreeType ~= 2 and nTreeType ~= 3 and nTreeType ~= 4 and nTreeType ~= 5 then
		WriteLog("[Ho¹t ®éng trång c©y th¸ng 4  sai sãt]:" .. GetName() .. "Trong lóc thu ho¹ch thu ®­îc lo¹i c©y kh«ng ®óng");
		return 0;
	end

	SetNpcScript(npcTreeIndex, "");
	SetNpcLifeTime(npcTreeIndex, 0);
	SetTask(TASK_TREE_INDEX, 0);
	SetTask(TASK_TREE_GROW, 0);
	SetTask(TASK_WATER_TREE_TIME, 0);
	
	Give_Zhongzi2_Award();
			
-----¸ø¾­Ñé½±Àø----------------------
	local nRand = 0;
	local nExp = 0;
	if nTreeType == 1 then			--¿Ý¸ÉÊ÷
		nExp = 100000;
	elseif nTreeType == 2 then	--²»ËÀÊ÷
		nExp = 200000;	
	elseif nTreeType == 3 then	--°×ÒøÊ÷
		nRand = PlantTree_GetRandItem(WHITE_SILVER_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_SILVER_TREE_EXP_REWARD_PARAM[nRand][1];
	elseif nTreeType == 4 then	--»Æ½ðÊ÷
		nRand = PlantTree_GetRandItem(YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
	else 												--°×½ðÊ÷
		nRand = PlantTree_GetRandItem(WHITE_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
	end
	
	ModifyExp(nExp);
	Msg2Player("B¹n nhËn ®­îc " .. nExp.." ®iÓm kinh nghiÖm");
	WriteLog("[Ho¹t ®éng trång c©y th¸ng 04]:" .. GetName() .. "NhËn ®­îc " .. nExp.. " ®iÓm kinh nghiÖm");
	

-----¸øÎïÆ·½±Àø£¬Ö»ÓÐ»Æ½ðÊ÷ºÍ°×½ðÊ÷²Å¸ø
	if nTreeType == 4 or nTreeType == 5 then
		local nMainType = 0;
		local nSecondryType = 0;
		local nDetailType = 0;
		local nCount = 1;
		local sItemName = "";
		local nLimitFlag = 0;
		local nLimitTime = 0;
		local nItem = 0;
		local nproperty = 0;
		local nReturn = 0;
		local nIndex = 0;
		
		if nTreeType == 4 then										-- »Æ½ðÊ÷
			nItem = PlantTree_GetRandItem(GOLDEN_TREE_REWARD_ITEM_PARAM);
			nMainType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][6];
		elseif nTreeType == 5 then								--°×½ðÊ÷
			nItem = PlantTree_GetRandItem(WHITE_TREE_REWARD_ITEM_PARAM);
			nMainType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = WHITE_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = WHITE_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = WHITE_TREE_REWARD_ITEM_PARAM[nItem][6];
			if nItem >= 1 and nItem <= 5 then
				nproperty = 1;
			end
		end
		
		if nproperty == 1 then
			nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount, 1, -1, -1, -1, -1, -1, -1);
		else
			nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
		end
		
		if nReturn == 1 then
			if nLimitTime ~= 0 then
				SetItemExpireTime(nIndex, nLimitTime);
			end
			Msg2Player("B¹n nhËn ®­îc " .. nCount .. "c¸i" .. sItemName);
			WriteLogEx("Hoat dong thang 4",TREE_TYPE[nTreeType][2],nCount,sItemName)
		end
	end
	
-----°×ÒøÊ÷¸øÐ£ÆìÏä½±Àø
	if nTreeType == 3 then
		nRand = random(1, 100);
		if nRand > 0 and nRand <= 40 then
			if AddItem(2, 1, 30079, 100) == 1 then
				Msg2Player("B¹n nhËn ®­îc " .. "100" .. "c¸i" .. "R­¬ng HiÖu Kú");
				WriteLogEx("Hoat dong thang 4","C©y B¹ch Ng©n",100,"R­¬ng HiÖu Kú")
			end
		elseif nRand > 40 and nRand <= 50 then
			if AddItem(2, 1, 30079, 200) == 1 then
				Msg2Player("B¹n nhËn ®­îc " .. "200" .. "c¸i" .. "R­¬ng HiÖu Kú");
				WriteLogEx("Hoat dong thang 4","C©y B¹ch Ng©n",200,"R­¬ng HiÖu Kú")
			end			
		end
	end
	
end