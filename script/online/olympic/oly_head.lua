--headÎÄ¼ş
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\online\\olympic\\oly_award_table.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")

--»Øµ÷º¯ÊıÂ·¾¶
Oly_CallBack_Script = "\\script\\online\\olympic\\oly_head.lua";

OLY_ACTIVITY_DURATION = 1296000 --3600 * 24 * 15»î¶¯Ê±³¤

--»î¶¯¿ªÊ¼Ê±¼ä(¸ù¾İ¸ñÊ½µ÷Õû)!!!!!!!!!
--activity start time
--ACTIVITY_START_DATE = {2012,7,6} --{year£¬mouth£¬day}
ACTIVITY_START_DATE = {2013,7,12} --{year£¬mouth£¬day}

--»î¶¯¿ªÆôÊ±¼äÅĞ¶Ï
function oly_IsActivityOpen()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nEndTime = nStartTime + OLY_ACTIVITY_DURATION;
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		return 1;
	else
		return 0;
	end
end

--¼ÆËã»î¶¯ÒÑ¿ªÆôÌìÊı
function oly_GetActivityOpenDays()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nSpaceTimeSceconds = nCurrTime - nStartTime;
	return floor(nSpaceTimeSceconds / (3600 * 24)) + 1;
end

--µÈ¼¶Á÷ÅÉÏŞÖÆ
function oly_Is_LevelSkill()
	local nLevel = GetLevel();
	--if nLevel < 70 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
	--	Talk(1,"","Íæ¼Ò<color=green>70<color>¼¶ÒÔÉÏ¡¢ÒÑ¼ÓÈëÁ÷ÅÉÑ§»á<color=green>1<color>Ì×<color=green>55<color>¼¶¼¼ÄÜ²Å¿ÉÒÔ²Î¼Ó»î¶¯");
	if nLevel < 80 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("Ng­êi ch¬i cÊp <color=green>%d<color> trë lªn ®· gia nhËp hÖ ph¸i häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia ho¹t ®éng.", 80));
		return 0;
	end
	return 1;
end

--Âú×ãnNumÊıÁ¿µÄÊ¥»ğ
function oly_GetFlameNum(nKind,nNum)
	if GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) >= nNum then
		return 1;
	end
	return 0;
end

--IBºÏ³É
function begin_combining_1(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"","Sè l­îng Th¸nh Háa kh«ng ®ñ");
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	local nNum1 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_1_callback",0,min(nNum,nNum1),"H·y nhËp sè l­îng vµo");
end

function begin_combining_1_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"","Sè l­îng Th¸nh Háa kh«ng ®ñ");
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_1 then
		return 0;
	end
	local nNum2 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	if nNum2 < nNum * Compose_ShenShi_Num_1 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_1) == 1 and DelItem(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3],nNum * Compose_ShenShi_Num_1) == 1 then
		gf_AddItemEx2({2,1,30402,nNum}, "Ngò Th¸i Th¸nh Háa", szLogTitle, "GhĞp Th¸nh Háa", 0, 1);
	end
end

--Ãâ·ÑºÏ³É
function begin_combining_2(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"","Sè l­îng Th¸nh Háa kh«ng ®ñ");
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) / Compose_ShengHuo_Num_2;
	local nNum1 = floor(GetCash() / (Compose_Coin_Num_2 * 10000));
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_2_callback",0,min(nNum,nNum1),"H·y nhËp sè l­îng vµo");
end

function begin_combining_2_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"","Sè l­îng Th¸nh Háa kh«ng ®ñ");
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_2 then
		return 0;
	end
	local nNum2 = GetCash();
	if nNum2 < nNum * Compose_Coin_Num_2 * 10000 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_2) == 1 and Pay(Compose_Coin_Num_2 * 10000 * nNum) == 1 then
		gf_AddItemEx2({2,1,30402,nNum}, "Ngò Th¸i Th¸nh Háa", szLogTitle, "GhĞp Th¸nh Háa", 0, 1);
	end
end

--²ÂÊı×ÖÓÎÏ·
function oly_begin_guess()
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	--ÓÎÏ·¿ªÊ¼£¬Éú³ÉÄ¿±êÊı
	local nTarget = random(1,OLY_MAX_RAND);
	gf_SetTaskByte(VET_OLY_TASK,2,nTarget,TASK_ACCESS_CODE_OLYMPIC); --Éú³ÉµÄÊı
	gf_SetTaskByte(VET_OLY_TASK,3,0,TASK_ACCESS_CODE_OLYMPIC); --²ÂµÄ´ÎÊı
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC); --µİ¹é´ÎÊı
	oly_begin_guess_input();
end

function oly_begin_guess_input()
	gf_SetTaskByte(VET_OLY_TASK,4,gf_GetTaskByte(VET_OLY_TASK,4) + 1,TASK_ACCESS_CODE_OLYMPIC)
	AskClientForNumber("oly_begin_guess_Child1",1,OLY_MAX_RAND,"NhËp ch÷ sè c¸c h¹ ®o¸n tróng");
end

--ÁÙÊ±È«¾Ö»º´æ²ÂµÄÊı×Ö
function oly_begin_guess_Child1(nNum)
	local nTarget = gf_GetTaskByte(VET_OLY_TASK,2);
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,4);
	if nNum == nTarget then
		Talk(1,"",format("Chóc mõng c¸c h¹ ®· ®o¸n tróng råi!!!  \n Ch÷ sè may m¾n cña c¸c h¹ lµ<color=green>%d<color>, sè lÇn ®o¸n lµ<color=green>%d<color>",nTarget,nTimes));
		gf_SetTaskByte(VET_OLY_TASK,3,nTimes,TASK_ACCESS_CODE_OLYMPIC);
		gf_SetTaskByte(VET_OLY_TASK,4,Guess_Flag,TASK_ACCESS_CODE_OLYMPIC);
	else
		if nTimes >= OLY_MAX_GUESS then
			Talk(1,"",format("Sè lÇn ®o¸n qu¸<color=green>%d<color>lÇn, <color=red>®· ®o¸n sai<color>, Ch÷ sè may m¾n cña c¸c h¹ lµ<color=red>%d<color>.",OLY_MAX_GUESS,nTarget));
			return 0;
		end
		if nNum > nTarget then
			Talk(1,"oly_begin_guess_input",format("Ch÷ sè ®o¸n lÇn %d cña c¸c h¹ lµ<color=red>%d<color>, qu¸ lín råi, h·y ®o¸n sè nhá h¬n tİ.",nTimes,nNum));
		else
			Talk(1,"oly_begin_guess_input",format("Ch÷ sè ®o¸n lÇn %d cña c¸c h¹ lµ<color=red>%d<color>, qu¸ nhá råi, h·y ®o¸n sè lín h¬n tİ.",nTimes,nNum));
		end
	end
end

--²ÂÊı×Ö½±Àø
function oly_get_last_guess_award()
	if gf_GetTaskByte(VET_OLY_TASK,4) == 0 then
		Talk(1,"","HiÖn t¹i c¸c h¹ kh«ng cßn phÇn th­ëng ®Ó nhËn n÷a råi!")
		return 0;
	end
	if gf_GetTaskByte(VET_OLY_TASK,4) ~= Guess_Flag then
		Talk(1,"","LÇn tr­íc c¸c h¹ ®· ®o¸n sai, kh«ng thÓ nhËn phÇn th­ëng!")
		return 0;
	end
	local nNum = gf_GetTaskByte(VET_OLY_TASK1,1);
	if nNum >= OLY_MAX_AWARD_NUM then
		Talk(1,"","Sè lÇn nhËn phÇn th­ëng ®· qu¸ 3 lÇn, kh«ng thÓ nhËn thªm ®­îc n÷a.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
  	return 0
	end
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,3);--¾º²Â´ÎÊı
	if nTimes < 1 or nTimes > 5 then return 0; end
	--Áì½±
	gf_SetTaskByte(VET_OLY_TASK1,1,nNum + 1,TASK_ACCESS_CODE_OLYMPIC);
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC);
	gf_Modify("Exp",OLY_GUESS_AWARD_TABLE[nTimes][1]);
	gf_AddItemEx2(OLY_GUESS_AWARD_TABLE[nTimes][2], "Lam S¾c Th¸nh Háa", szLogTitle, "PhÇn th­ëng ®o¸n sè", 0, 1);
end

--·µ»Øµ±Ç°Ê±¼äs
function oly_GetDayCurrTime()
	local nHour = tonumber(date("%H"));
	local nMinute = tonumber(date("%M"));
	local nSecond = tonumber(date("%S"));
	return nHour * 3600 + nMinute * 60 + nSecond;
end

--»ñµÃÒÑ·¢³öÌìî¸ÁîÊıÁ¿
function oly_CallBack_GetTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- Ã»ÓĞ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_TGL_NUM,nFlag);
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--ÒÑ·¢³öÌìî¸ÁîÊıÁ¿+
function oly_CallBack_ModifyTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_ModifyTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nTglNum = gf_GetMyTaskByte(VET_OLY_TASK2,3,4);
	if nCount == 0 then
		-- Ã»ÓĞ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nTglNum);
		--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nFlag + nTglNum);
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--»ñÈ¡Ììî¸ÁîÀÛ¼ÆÊıÄ¿
function oly_GetAccumulatedTglNum()
	--ÀÛ¼ÆÌìî¸ÁîµÄÊıÄ¿
	--Îª0È¥¹²ÏíÊı¾İ¿âÈ¡
	ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_GetTGNum");
	local nDaysNum = oly_GetActivityOpenDays();
	nTgl = GetGlbValue(Glb_Oly_TGL_NUM) or 0;
	local nTglNum = nDaysNum * OLY_EXCHANGE_BASE - nTgl; --ÀÛ¼ÆÊıÄ¿
	if nTglNum < 0 or nTglNum > (OLY_ACTIVITY_DURATION / (3600 * 24)) * OLY_EXCHANGE_BASE then
		print("ERROE:oly_GetAccumulatedTglNum() TGL")
		return -1;
	end
	return nTglNum;
end

function oly_CreateDlgTable()
	local tbSay = {};
	local nDayTime = oly_GetDayCurrTime(); --µ±ÌìÊ±¼ä
--	print("nDayTime",nDayTime);
	--¿ÉÒÔ²ÂĞÒÔËÊı×Ö£¬ÏÔÊ¾ĞÒÔËÊı×Ö
	--0-21
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
			tinsert(tbSay,"Ch­a hoµn thµnh th¾p s¸ng 6 lÇn /do_nothing");
		else
			if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
				tinsert(tbSay,"NhËp ch÷ sè may m¾n vµo /input_luck_num_201207");
			else
				tinsert(tbSay,format("Ch÷ sè may m¾n h«m nay cña c¸c h¹ lµ%d/do_nothing",gf_GetMyTaskByte(VET_OLY_TASK1,2,3)));
			end
		end
	end
	--²»¿ÉÒÔ²ÂÊı×ÖÁË£¬ÏÔÊ¾ÖĞÃ»ÖĞ£¬ÖĞÁËÏÔÊ¾µÇ¼Ç
	--21:00-21:30
	if nDayTime >= OLY_TIME_START and nDayTime < OLY_TIME_MID then
		--È«¾ÖÁ¿Îª0£¬È¥¹²ÏíÊı¾İ¿âÈ¡
		--if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
		ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		--end
		local nRelayLuckNum = GetGlbValue(Glb_Oly_Luck_NUM) or 0;
		local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3) or 0;
		if nRelayLuckNum == nMyluckNum and nRelayLuckNum ~= 0 then
			if gf_GetTaskByte(VET_OLY_TASK1,4) ~= 1 then
				tinsert(tbSay,"Tróng th­ëng råi, t¹i h¹ muèn ®¨ng kı/register_mylucknum_201207");
			else
				tinsert(tbSay,"Tróng th­ëng råi, ®· ®­îc ®¨ng kı/do_nothing");
			end
		else
			tinsert(tbSay,"C¸c h¹ ®· kh«ng tróng th­ëng, h·y may m¾n lÇn sau/do_nothing");
		end
	end
	--²»¿ÉÒÔ²ÂÊı×ÖÁË£¬ÏÔÊ¾ÖĞÃ»ÖĞ£¬µÇ¼ÇÁËÏÔÊ¾Áì½±
	--21:30-22:00
	if nDayTime >= OLY_TIME_MID and nDayTime < OLY_TIME_END then
		--È«¾ÖÁ¿Îª0£¬È¥¹²ÏíÊı¾İ¿âÈ¡
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		local nRelayLuckNum = GetGlbValue(Glb_Oly_Luck_NUM) or 0;
		local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3) or 0;
		if nMyluckNum == 0 or nRelayLuckNum ~= nMyluckNum then
			tinsert(tbSay,"C¸c h¹ ®· kh«ng tróng th­ëng, h·y may m¾n lÇn sau/do_nothing");
		else
			if gf_GetTaskByte(VET_OLY_TASK1,4) == 1 then
				tinsert(tbSay,"Tróng th­ëng råi, t¹i h¹ muèn nhËn phÇn th­ëng/get_lucknum_award_201207");
			else
				tinsert(tbSay,"Tróng th­ëng råi, nh­ng ch­a ®¨ng kı hoÆc ®· nhËn phÇn th­ëng råi/do_nothing");
			end
		end
	end
	--22:00-24:00
	if nDayTime >= OLY_TIME_END then
		tinsert(tbSay,"Ngµy mai h·y ®Õn/do_nothing");
	end

	return tbSay;
end

--Relay¹²ÏíÊı¾İ¿â»Øµ÷º¯Êı
--Ã¿Ìì21µãµ÷ÓÃÒ»´Î
--Ã¿Ì¨gs¶¼Ö´ĞĞÒ»´ÎÒÔ×îºóËæ»úÊıÎª×¼
function oly_CallBack_Relay_Random(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_Callback_Relay_Random")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nRandom = random(1,OLY_MAX_LUCK_NUM);
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",nRandom);
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--»ñÈ¡ĞÒÔËÊı×Ö
--Glb_Oly_Luck_NUM
function oly_CallBack_GetLuckNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	--0µ½21µãÖ®¼ä
	local nDayTime = oly_GetDayCurrTime(); --µ±ÌìÊ±¼ä
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		SetGlbValue(Glb_Oly_Luck_NUM,0);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record2.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_Luck_NUM,nFlag);
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function do_nothing()
	--do nothing
end

--Ììî¸ÁîÀÛ¼ÆÊıÄ¿£¬ĞÒÔËÊı×Ö£¬Íæ¼ÒĞÒÔËÊı×Ö
function oly_GetBaseInfo()
	--Ììî¸ÁîÊıÄ¿
	local nTglNum = floor(oly_GetAccumulatedTglNum() / OLY_EXCHANGE_BASE);
	if nTglNum < 0 then
		print("ERROR:TGL Num is error");
		return 0,"",0;
	end
	--½ñÌìµÄĞÒÔËÊı×Ö
	local strNum = "";
	if oly_GetDayCurrTime() < OLY_TIME_START then
		strNum = "21:00 tèi nay më th­ëng, tr­íc 21:30 ®¨ng kı tróng th­ëng, tr­íc 22:00 nhËn th­ëng";
	else
		--ĞÒÔËÊı¾İÎª0£¬È¥¹²ÏíÊı¾İ¿âÈ¡
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		local nNumTemp = GetGlbValue(Glb_Oly_Luck_NUM);
		if nNumTemp ~= 0 then
			strNum = tostring(nNumTemp);
		else
			strNum = "21:00 tèi nay më th­ëng, tr­íc 21:30 ®¨ng kı tróng th­ëng, tr­íc 22:00 nhËn th­ëng";
		end
	end
	--ÎÒµÄĞÒÔËÊı×Ö
	local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3);
	return nTglNum,strNum,nMyluckNum;
end

--µÇ¼ÇÖĞ½±ÈËÊı+1
function oly_CallBack_Rigister(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Rigister")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- Ã»ÓĞ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0;
	--µÇ¼ÇÊıÁ¿²»³¬¹ı10
	if nFlag < MAX_WIN_NUM then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag + 1);
		--µÇ¼ÇÃû×Ö
		gf_SetTaskByte(VET_OLY_TASK1,4,1,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("C¸c h¹ ®· ®¨ng kı råi, tõ %d:%d®Õn%d:%dgiê h·y ®Õn nhËn phÇn th­ëng",floor(OLY_TIME_MID/3600),floor(mod(OLY_TIME_MID,3600)/60),floor(OLY_TIME_END/3600),floor(mod(OLY_TIME_END,3600)/60)));
	else
		Msg2Player(format("Sè lÇn ®¨ng kı ®· v­ît qua %d lÇn, kh«ng thÓ ®¨ng kı n÷a",MAX_WIN_NUM));
	end
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--µÇ¼ÇÖĞ½±ÈËÊı-1
function oly_CallBack_Rigister_Dec(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Rigister_Dec")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- Ã»ÓĞ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
		--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	--µÇ¼ÇÊıÁ¿²»Ğ¡ÓÚ0
	if nFlag > 0 then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag - 1);
	end
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--È¡ĞÒÔËÊı×ÖÁì½±
function oly_CallBack_GetLuckPersonNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckPersonNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0; --ÈËÊı
	--Áì½±¿©
	oly_GetLuckNumAward(nFlag);
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function oly_GetLuckNumAward(nFlag)
	if nFlag <= 0 or nFlag == nil then return 0; end
	local nTgl = oly_GetAccumulatedTglNum(); --Ììî¸ËéÆ¬ÊıÁ¿
	if nTgl <= 0 then return 0; end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0;
	end
	local nNum1 = floor(nTgl /OLY_EXCHANGE_BASE);
	if nNum1 == (nTgl /OLY_EXCHANGE_BASE) and (nNum1 /nFlag) == floor(nNum1 /nFlag) then
		--=======·¢Ììî¸
		gf_AddItemEx2({2,95,204,nNum1 /nFlag}, "Thiªn Cang LÖnh", szLogTitle, "NhËn th­ëng ch÷ sè may m¾n", 0, 1);
		--Msg2Global(format("¹§Ï²Íæ¼Ò%sÔÚ°ÂÔËĞÒÔË³é½±ÖĞ»ñµÃÌìî¸Áî*%d",GetName(),nNum1 /nFlag));
		Msg2Global(format("Chóc mõng ng­êi ch¬i %s ®· rót th­ëng ®­îc Thiªn Cang LÖnh*%d",GetName(),nNum1 /nFlag));
		--Áì½±±ê¼Ç
		gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
		--ÉèÖÃÁìÈ¡ÊıÁ¿
		gf_SetMyTaskByte(VET_OLY_TASK2,3,4,(nNum1 /nFlag) * OLY_EXCHANGE_BASE,TASK_ACCESS_CODE_OLYMPIC);
		--ÀÛ¼ÆÊıÁ¿+
		ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_ModifyTGNum");
	else
		--=======·¢ËéÆ¬
		gf_AddItemEx2({2,1,30390,floor(nTgl /nFlag)}, "M¶nh Thiªn Cang", szLogTitle, "NhËn th­ëng ch÷ sè may m¾n", 0, 1);
		--Msg2Global(format("¹§Ï²Íæ¼Ò%sÔÚ°ÂÔËĞÒÔË³é½±ÖĞ»ñµÃÌìî¸ËéÆ¬*%d",GetName(),floor(nTgl /nFlag)));
		Msg2Global(format("Chóc mõng ng­êi ch¬i %s ®· rót th­ëng ®­îc M¶nh Thiªn Cang*%d",GetName(),floor(nTgl /nFlag)));
		--Áì½±±ê¼Ç
		gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
		--ÉèÖÃÁìÈ¡ÊıÁ¿
		gf_SetMyTaskByte(VET_OLY_TASK2,3,4,floor(nTgl /nFlag),TASK_ACCESS_CODE_OLYMPIC);
		--ÀÛ¼ÆÊıÁ¿
		ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_ModifyTGNum");
	end
	--µÇ¼ÇÈËÊı¼õ1
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister_Dec");
end

--ĞÒÔËÊı×ÖÖµ0
function oly_CallBack_LuckNum_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_LuckNum_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",0);
	SetGlbValue(Glb_Oly_TGL_NUM,0);
	SetGlbValue(Glb_Oly_Luck_NUM,0);
	--ÕâÀïµÄRelayÊı¾İÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ıGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--µÇ¼ÇÊıÁ¿ÖÃ0
function oly_CallBack_Register_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Register_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
end

--»î¶¯½áÊøÇå³ş·¢³öÌìî¸ÁîÊıÄ¿
function oly_CallBack_TGL_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
end

--µã»ğ´ÎÊıÀÛ¼Æ½±Àø
function oly_Accumulate_FireNum()
	local nNum = gf_GetMyTaskByte(VET_OLY_TASK2,1,2) + 1;
	--´ÎÊı+1
	gf_SetMyTaskByte(VET_OLY_TASK2,1,2,nNum,TASK_ACCESS_CODE_OLYMPIC);
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] == nNum  then
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 1 then
				gf_AddItemEx2(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3], OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4], szLogTitle, "PhÇn th­ëng th¾p s¸ng céng dån ", OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][6], 1);
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 2 then
				gf_EventGiveCustomAward(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][1],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][2],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][3],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][4],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][5])
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 3 then
				if type(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]) == "string" then
					dostring(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]);
				end
			end
			--×ÔĞĞÀ©Õ¹
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4] == "Thiªn Cang LÖnh" then
				gf_SetMyTaskByte(VET_OLY_TASK2,1,2,0,TASK_ACCESS_CODE_OLYMPIC);
				Msg2Global(format("Chóc mõng %s ®¹t ®Õn sè lÇn th¾p s¸ng Th¸nh Háa §µn nhËn ®­îc Thiªn Cang LÖnh x 1",GetName()));
			end
			break
		end
	end
end

--Ëæ»úĞÇ¿Ì
function oly_XingKe_Award()
	gf_EventGiveRandAward(OLY_XINGKE_AWARD_TB, gf_SumRandBase(OLY_XINGKE_AWARD_TB), 1);
end

--Ëæ»úÌìÒÇ
function oly_TianYi_Award()
	gf_EventGiveRandAward(OLY_TIANYI_AWARD_TB, gf_SumRandBase(OLY_TIANYI_AWARD_TB), 1);
end

--Ê¦ÃÅ4Ì×
function oly_ShiMeng4_Award()
	MA_GiveFactionEquip4({1, nil, nil, 0}, szLogTitle);
end

--ÔÌÁé2
function oly_YunLing2_Award()
	MA_GiveLevel2WenShi({1, nil, 30, 0}, szLogTitle);
end

--¸ø½±Àø1
function oly_GiveAward1()
--	print("oly_GiveAward1")
--	gf_Modify("Exp",120000);
	gf_Modify("Exp",180000);
	gf_EventGiveRandAward(OLY_AWARD_1_TABLE,gf_SumRandBase(OLY_AWARD_1_TABLE),1,szLogTitle,"PhÇn th­ëng 1");
end

--¸ø½±Àø2
function oly_GiveAward2()
--	print("oly_GiveAward2")
--	gf_Modify("Exp",200000);
	gf_Modify("Exp",OLY_EXP_2);
	gf_EventGiveRandAward(OLY_AWARD_2_TABLE,gf_SumRandBase(OLY_AWARD_2_TABLE),1,szLogTitle,"PhÇn th­ëng 2");
end

--¸ø½±Àø3
function oly_GiveAward3()
--	print("oly_GiveAward3")
--	gf_Modify("Exp",300000);
	gf_Modify("Exp",OLY_EXP_3);
--	local nRand = gf_EventGiveRandAward(OLY_AWARD_3_TABLE,1000000,1,szLogTitle,"¸ø½±Àø3");
--	if nRand == 30 or nRand == 23 or nRand == 22 or nRand == 21 or nRand == 20  then
--		local strName = OLY_AWARD_3_TABLE[nRand][3];
--		if nRand == 30 then
--			strName = "7¼¶ÁéÊ¯";
--		end
--		Msg2Global(format("¹§Ï²Íæ¼Ò%sÔÚ°ÂÔË»î¶¯ÖĞ»ñµÃ%s*1",GetName(),strName));
--	end
	gf_EventGiveRandAward(OLY_AWARD_3_TABLE,gf_SumRandBase(OLY_AWARD_3_TABLE),1,szLogTitle,"Ho¹t ®éng Th¸nh Háa");
end

--¸øÊ¥»ğ
function oly_AddShengHuo(nNum,nIndex)
	if oly_IsActivityOpen() == 1 then
		AddItem(Flame_Table[nIndex][1],Flame_Table[nIndex][2],Flame_Table[nIndex][3],nNum);
		Msg2Player(format("C¸c h¹ nhËn ®­îc %s x %d",Flame_Table[nIndex][5],nNum));
	end
end

function oly_GetCountStep(nNum)
--	if nNum >= 0 and nNum < 50 then
--		return 50;
--	elseif nNum >= 50 and nNum < 100 then
--		return 100;
--	elseif nNum >= 100 and nNum < 150 then
--		return 150;
--	elseif nNum >= 150 and nNum < 300 then
--		return 300;
--	elseif nNum >= 300 and nNum < 600 then
--		return 600;
--	elseif nNum >= 600 and nNum < 800 then
--		return 800;
--	elseif nNum >= 800 and nNum < 1000 then
--		return 1000;
--	elseif nNum >= 1000 and nNum < 1200 then
--		return 1200;
--	end
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if nNum < OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] then
			return i;
		end
	end
end

function oly_StarEquip_Award()
	gf_EventGiveRandAward(OLY_STAREQUIP_AWARD_TB, gf_SumRandBase(OLY_STAREQUIP_AWARD_TB), 1, szLogTitle, "Ho¹t ®éng Th¸nh Háa");
end
