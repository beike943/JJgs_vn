Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\vip_card\\vc_define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

function vc_IsVipCardOpen()
	return IsActivatedVipCard(VC_CURRENT_ID);
end

function vc_GetMainTitle()
	local szTitle = "LÖnh bµi VIP vâ l©m"
	local nRemainTime = GetVipCardRemainTime();
	local nState = -1;
	if nRemainTime > 0 then
		szTitle = szTitle.."("..format("Cßn %d ngµy", ceil(nRemainTime / (24 * 3600)))..")";
		nState = 1;
	elseif vc_HaveValueAward() ~= 0 then
		szTitle = szTitle.."(".."Ch­a nhËn phÇn th­ëng cèng hiÕn"..")";
		nState = 2;
	else
		szTitle = szTitle.."(".."Ch­a kÝch ho¹t"..")";
		nState = 0;
	end
	szTitle = szTitle..format("/#vc_MainFunction(%d)", nState);
	return szTitle
end

function vc_MainFunction(nState)
	local nKind = tonumber(nState)
	if 0 == nKind then
		vc_Activating();
	elseif 1 == nKind then
		vc_JoinFunction();
	elseif 2 == nKind then
		vc_GetValueAward();
	end
end

function vc_Activating()
	if IsActivatedVipCard(VC_CURRENT_ID) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID)).."TÝnh n¨ng t¹m ®ãng");
		return
	end
	local nDate = tonumber(date("%Y%m%d"))
	DebugOutput("nDate =", nDate)
	if nDate < GetVipCardStartTime(VC_CURRENT_ID) or nDate > GetVipCardEndTime(VC_CURRENT_ID) then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID)).."HiÖn t¹i kh«ng ph¶i thêi gian kÝch ho¹t")
		return
	end
	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {
		format("\nLËp tøc kÝch ho¹t %s/vc_ActivatingNow", szCardName),
		format("\nXem phÇn th­ëng %s/vc_LookForAward", szCardName),
		"\n rót lui/nothing"
	}
	Say(format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Ng­¬i ch­a kÝch ho¹t %s.Gamer cÊp 80 trë lªn cã thÓ mua thÎ VIP vâ l©m vµ tiÕn hµnh kÝch ho¹t.", szCardName), getn(tSay), tSay);
end

function vc_ActivatingNow(bTag)
	local szCardName = GetVipCardName(VC_CURRENT_ID);
	local nRemainTime = GetVipCardRemainTime();
	if not bTag and nRemainTime > 0 then
		Say(format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("%s sÏ mÊt hiÖu lùc, x¸c nhËn sÏ kÝch ho¹t kh«ng?", GetVipCardName(GetVipCardIndex())), 2, "\n vÉn kÝch ho¹t/#vc_ActivatingNow(1)", "\n vÒ sau xem l¹i/nothing");
		return 0;
	end
	if vc_HaveValueAward() ~= 0 then
		Talk(1,"",format("Ch­a nhËn xong gi¶i th­ëng %s ®é cèng hiÕn, kh«ng thÓ kÝch ho¹t %s", GetVipCardName(GetVipCardIndex()), szCardName));
		return 0;
	end
	if GetLevel() < 80 and gf_GetPlayerRebornCount() <= 0 then
		Talk(1,"",format("§¼ng cÊp nh©n vËt kh«ng ®ñ cÊp %d, kh«ng thÓ kÝch ho¹t %s", 80, szCardName));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local nRet = ActivatingVipCard(VC_CURRENT_ID);
	if nRet ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Trong tói kh«ng cã %s, kÝch ho¹t thÊt b¹i", szCardName))
		return 0;
	end
	SetTask(TASKID_VC_VALUE_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	vc_DailyTaskReset();
	local nRet, nIndex = AddItem(0,200,40,1,4) --¸øÉñÐÐ±¦µä
	if nRet == 1 then
		SetItemExpireTime(nIndex, 30 * 24 * 3600)
	end
	Msg2Player(msg);
	local msg = format("Vâ L©m VIP LÖnh %s ®· kÝch ho¹t thµnh c«ng", szCardName);
	Talk(1,"vc_JoinFunction",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..msg);
end

function vc_LookForAward()
	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {};
	tSay.msg = format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Ng­êi ch¬i kÝch ho¹t %s, sÏ nhËn ®­îc phÇn th­ëng sau:\nKhi kÝch ho¹t sÏ nhËn ®­îc 1 ThÇn Hµnh B¶o §iÓn, phÇn th­ëng cña L­¬ng S¬n, §Þa HuyÒn Cung, V¹n KiÕm Tròng, chiÕn tr­êng lín nhá, Thiªn M«n TrËn, ChiÕn Tr­êng Liªn Server sÏ ®­îc céng thªm\nPhÇn th­ëng ®é cèng hiÕn: H»ng ngµy hoµn thµnh nhiÖm vô Vâ L©m Treo Th­ëng sÏ nhËn ®­îc ®é cèng hiÕn, ®¹t ®é cèng hiÕn nhÊt ®Þnh sÏ nhËn ®­îc Hu©n Ch­¬ng Anh Hïng vµ L«i Hæ Tinh Ph¸ch", szCardName);
	tSay.sel = {
		{"Ra khái", "nothing"},
	};
	temp_Talk(tSay);
end

function vc_JoinFunction()
	local tMsg = {
		[0] = "Ch­a l·nh ", 
		[1] = "§· l·nh ",
	}
	local msg = tMsg[gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31)] or tMsg[1];
	local tSay = {
		format("Xem phÇn th­ëng %s/vc_LookForAward", GetVipCardName(GetVipCardIndex())),
		"NhiÖm vô h«m nay/vc_DailyTask",
		format("ThÓ lùc h«m nay (%s)/vc_DailyEnergy", msg),
		"PhÇn th­ëng ®é cèng hiÕn/vc_GetValueAward",
		"\n rót lui/nothing"
	}
	local nCurID = GetVipCardIndex();
	if nCurID ~= VC_CURRENT_ID then
		local nDate = tonumber(date("%Y%m%d"))
		DebugOutput("nDate =", nDate)
		if nDate >= GetVipCardStartTime(VC_CURRENT_ID) and nDate <= GetVipCardEndTime(VC_CURRENT_ID) then
			tinsert(tSay, 1, format("kÝch ho¹t %s/vc_Activating", GetVipCardName(VC_CURRENT_ID)));
		end
	end
	local nDays = GetVipCardTime(nCurID);
	local nTime = GetVipCardActivateTime();
	local nY, nM, nD = GmTime(nTime);
	local nStartTime = nM.."/"..nD.."/"..nY;
	nY, nM, nD = GmTime(nTime + nDays * 24 * 3600);
	local nEndTime = nM.."/"..nD.."/"..nY;
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("§· kÝch ho¹t thµnh c«ng %s, h¹n sö dông %s-%s", GetVipCardName(GetVipCardIndex()), nStartTime, nEndTime), getn(tSay), tSay)
end

function vc_GetValueAward()
	local tMsg = {
		[1] = "§· nhËn",
		[2] = "Ch­a nhËn",
		[3] = "Ch­a ®¹t ®­îc",
	}
	local tSay = {};
	local nIndex = 0;
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[nCardIndex];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) == 1 then
			nIndex = 1;
		else
			if nValue >= tAward[i][1] then
				nIndex = 2;
			else
				nIndex = 3;
			end		
		end
		if tAward[i][2] == 1 then
			tinsert(tSay, format("%d %s*%d(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][4], tAward[i][3][4], tMsg[nIndex], nIndex, i));
		elseif tAward[i][2] == 2 then
			tinsert(tSay, format("%d %d%s(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][3], tAward[i][4], tMsg[nIndex], nIndex, i));
		elseif tAward[i][2] == 3 then
			tinsert(tSay, format("%d %s(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][4], tMsg[nIndex], nIndex, i));
		end
	end
	tinsert(tSay, "Ra khái/nothing");
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("§é cèng hiÖn hiÖn t¹i lµ <color=green>%d<color>. Mçi mèc cèng hiÕn chØ ®­îc nhËn th­ëng 1 lÇn. Sau khi dïng thÎ th¸ng míi sÏ kh«ng thÓ nhËn phÇn th­ëng ®é cèng hiÕn cña thÎ th¸ng cò. H·y nhËn kÞp thêi", nValue), getn(tSay), tSay)
end

function vc_GetValueAwardFinish(nTag, nIndex)
	if 1 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."B¹n ®· nhËn phÇn th­ëng nµy råi ");
		return
	end
	if 3 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Ch­a ®¹t ®é cèng hiÕn, kh«ng thÓ nhËn phÇn th­ëng nµy");
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[nCardIndex];
	if not tAward then return 0; end
	local tCell = tAward[nIndex]
	if not tCell then
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_VALUE_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	if tCell[2] == 1 then
		gf_AddItemEx2(tCell[3], tCell[4], GetVipCardName(GetVipCardIndex()), "PhÇn th­ëng ®é cèng hiÕn", 0, 1);
	elseif tCell[2] == 2 then
		gf_Modify("Exp", tCell[3]);
	elseif tCell[2] == 3 then
		dostring(tCell[3]);
	end
end

--ÅÐ¶Ï¹±Ï×½±ÀøÊÇ·ñÎªÁìÈ¡
function vc_HaveValueAward()
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[nCardIndex];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if nValue >= tAward[i][1] then
			if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) ~= 1 then
				return 1;
			end
		end
	end
	return 0;
end

function vc_DailyTaskReset()
	SetTask(TASKID_VC_DAILY_TASK_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_1, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_2, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_3, 0, TASK_ACCESS_CODE_VIP_CARD);
end

function vc_GetServerIndex(tCell)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	if not tCell.Content then
		return 1;
	end
	return mod(wDay, getn(tCell.Content)) + 1;
end

function vc_GetContentIndex(tCell, bGenerate)
	local nContentIndex = gf_GetTaskByte(tCell.TaskIndex, tCell.ByteIndex);
	if bGenerate then
		if nContentIndex <= 0 or nContentIndex > getn(tCell.Content) then
			if tCell.RandType == 1 then
				nContentIndex = vc_GetServerIndex(tCell);
			elseif tCell.RandType == 2 then
				nContentIndex = random(getn(tCell.Content));
			end
			gf_SetTaskByte(tCell.TaskIndex, tCell.ByteIndex, nContentIndex, TASK_ACCESS_CODE_VIP_CARD);
		end
	end
	return nContentIndex;
end

function vc_DailyTask()
	local tSay = {}
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	for i = 1, getn(tTaskTable) do
		local tCell = tTaskTable[i];
		DebugOutput("tCell =", tCell);
		local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte);
		DebugOutput("nFinishTimes =", nFinishTimes);
		local cIndex = vc_GetContentIndex(tCell, 1);
		DebugOutput("cIndex =", cIndex);
		tinsert(tSay, format("%s(%d/%d)/#vc_DailyTaskDetail(%d, %d)", tCell.Content[cIndex][1], 
			min(nFinishTimes, tCell.Content[cIndex][2]), tCell.Content[cIndex][2], i, cIndex));
	end
	tinsert(tSay, "Ra khái/nothing")
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."NhiÖm vô Vâ L©m Treo Th­ëng kh«ng cÇn nhËn, chØ cÇn trong ngµy hoµn thµnh ®iÒu kiÖn sÏ cã thÓ hoµn thµnh, nh­ng phÇn th­ëng ph¶i tù nhËn. Cã thÓ nép Thiªn Kiªu LÖnh ®Ó tù ®éng hoµn thµnh nhiÖm vô, mçi lÇn tù ®éng hoµn thµnh th× sè l­îng Thiªn Kiªu LÖnh tiªu hao ngµy cµng nhiÒu.", getn(tSay), tSay)
end

function vc_DailyTaskDetail(nIndex, cIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	local tSay = {}
	local msg = format("<color=yellow>[%s*%d]<color>", tSub[1], tSub[2])..tSub[3];
	local bIsFinish = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex);
	if bIsFinish ~= 0 then
		msg = msg.."<color=green>(§· hoµn thµnh môc nµy)<color>"
	else
		if nFinishTimes <= 0 then
			tinsert(tSay, format("\nNhËn nhiÖm vô/#vc_DailyTaskDetail_GetTask(%d)", nIndex));
			tinsert(tSay, format("\nTù ®éng hoµn thµnh/#vc_DailyTaskDetail_AotoFinish(%d)", nIndex));
		elseif nFinishTimes >= tSub[2] then
			tinsert(tSay, format("\n NhËn phÇn th­ëng/#vc_DailyTaskDetail_GetTaskAward(%d)", nIndex));
		end
	end
	tinsert(tSay, "\n rót lui/nothing");
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..msg, getn(tSay), tSay);
end

function vc_DailyTaskDetail_GetTask(nIndex)
	DebugOutput("vc_DailyTaskDetail_GetTask", nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("Mau ®i hoµn thµnh nhiÖm vô h»ng ngµy <color=green>%s<color>!", tSub[1]));
end

function vc_DailyTaskDetail_GetTaskAward(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Môc nµy ®· hoµn thµnh (Mçi ngµy chØ ®­îc hoµn thµnh 1 lÇn");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	dostring(tCell.Award);
end

function vc_DailyTaskDetail_AotoFinish(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Môc nµy ®· hoµn thµnh (Mçi ngµy chØ ®­îc hoµn thµnh 1 lÇn");
		return
	end
	local nAutoFinishTimes = GetTask(TASKID_VC_AUTO_FINISH_TIMES);
	local nCostNum = (nAutoFinishTimes * 2 + 1) * tCell.AutoFinish[4];
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("H«m nay ®· dïng <color=red>%d<color> lÇn tù ®éng hoµn thµnh, lÇn nµy cÇn tiªu hao <color=yellow>%s<color>*%d", 
		nAutoFinishTimes, tCell.AutoFinish[5], nCostNum), 2, 
		format("\nX¸c nhËn/#vc_DailyTaskDetail_AotoFinish_Ensure(%d, %d, %d, %d, %d)", tCell.AutoFinish[1], tCell.AutoFinish[2], 
			tCell.AutoFinish[3], nCostNum, nIndex), "\n rót lui/nothing");
end

function vc_DailyTaskDetail_AotoFinish_Ensure(nG, nD, nP, nNum, nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	DebugOutput("vc_GetContentIndex(tCell) =", vc_GetContentIndex(tCell))
	local tSub = tCell.Content[vc_GetContentIndex(tCell)];
	if not tSub then return end
	if DelItem(tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("Sè l­îng %s trong tói kh«ng ®ñ %d c¸i", tCell.AutoFinish[5], nNum));
		return
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum})
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, GetTask(TASKID_VC_AUTO_FINISH_TIMES) + 1, TASK_ACCESS_CODE_VIP_CARD);
	gf_SetTaskByte(tCell.Task, tCell.Byte, tSub[2], TASK_ACCESS_CODE_VIP_CARD);
	vc_DailyTaskDetail_GetTaskAward(nIndex);
end

function vc_DailyEnergy()
	local nRet = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31);
	local tMsg = {
		[0] = "Ch­a l·nh ", 
		[1] = "§· l·nh ",
	}
	local msg = tMsg[nRet];
	local tMsg2 = {
		[0] = "§óng",
		[1] = "§ång ý",
	}
	local tFunc = {
		[0] = "vc_DailyEnergy_do",
		[1] = "nothing",
	}
	local tSay = {
		format("%s/%s", tMsg2[nRet], tFunc[nRet]),
		"\n rót lui/nothing",
	}
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("H«m nay cã thÓ nhËn trùc tiÕp %d ®iÓm tinh lùc, ng­¬i h«m nay %s", 120, msg), getn(tSay), tSay);
end

function vc_DailyEnergy_do()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("HiÖn t¹i nhËn ®­îc %d ®iÓm tinh lùc, ®ång ý nhËn kh«ng?", min(nCanGive, 120)), 2, "\nX¸c nhËn/vc_DailyEnergy_do_ensure", "\n hñy bá/nothing");
end

function vc_DailyEnergy_do_ensure()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	ModifyEnergy(min(nCanGive, 120), 1);
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31, 1, TASK_ACCESS_CODE_VIP_CARD);
	return 1;
end

--Ëæ»ú3-4ÐÇ»ÕÕÂ
function vc_Rand_3_4_JS_badge()
	local tAward = {
		{1, 88000, "Huy Ch­¬ng Ngäc ChÕ", {0, 153, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch­¬ng Kim ChÕ ngò hµnh", {0, 153, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch­¬ng Méc ChÕ ngò hµnh", {0, 153, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0, 153, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch­¬ng Háa ChÕ ngò hµnh", {0, 153, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0, 153, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0, 153, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "Huy Ch­¬ng Du HiÖp", {0, 153, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "Huy Ch­¬ng ThiÕt HuyÕt", {0, 153, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "Huy Ch­¬ng V©n Du", {0, 153, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "Huy ch­¬ng 3-4 sao ngÉu nhiªn")
end

--Ëæ»ú3-4ÐÇ¹ÒÒÂ
function vc_Rand_3_4_JS_cape()
	local tAward = {
		{1, 88000, "¸o Choµng Háa V©n", {0, 152, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "¸o Choµng Ngò Hµnh Kim ChÕ", {0, 152, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "¸o Choµng Ngò Hµnh Méc ChÕ", {0, 152, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "¸o Choµng Ngò Hµnh Thñy ChÕ", {0, 152, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "¸o Choµng Ngò Hµnh Háa ChÕ", {0, 152, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "¸o Choµng Ngò Hµnh Thæ ChÕ", {0, 152, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "¸o Choµng Ngò Hµnh ¢m ChÕ", {0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "¸o Choµng Du HiÖp", {0, 152, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "¸o Choµng ThiÕt HuyÕt", {0, 152, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "¸o Choµng V©n Du", {0, 152, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "¸o choµng 3-4 sao ngÉu nhiªn")
end

--Ëæ»ú3-4ÐÇÐ¬
function vc_Rand_3_4_JS_foot()
	local tAward = {
		{1, 88000, "Bè ChÕ Cao §ång Ngoa", {0, 154, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "ChiÕn Hµi Kim ChÕ ngò hµnh", {0, 154, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "ChiÕn Hµi Méc ChÕ ngò hµnh", {0, 154, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "ChiÕn Hµi Thñy ChÕ ngò hµnh", {0, 154, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "ChiÕn Hµi Háa ChÕ ngò hµnh", {0, 154, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "ChiÕn Hµi Thæ ChÕ ngò hµnh", {0, 154, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "ChiÕn Hµi ¢m ChÕ ngò hµnh", {0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "Tr­êng Hµi Du HiÖp", {0, 154, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "ChiÕn Hµi ThiÕt HuyÕt", {0, 154, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "§¹o Hµi V©n Du", {0, 154, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "GiÇy 3-4 sao ngÉu nhiªn")
end

--Ëæ»ú2-4¼¶±¦Ê¯¼¸ÂÊ
function vc_Rand_2_4_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 18, "HuyÕtTrÝchTh¹ch Lv2", {2, 22, 102, 1, 4}, 0},
		{1, 18, "NguyÖtB¹chTh¹ch Lv2", {2, 22, 202, 1, 4}, 0},
		{1, 18, "Hæ Ph¸ch Th¹ch CÊp 2", {2, 22, 302, 1, 4}, 0},
		{1, 18, "H¾c DiÖu Th¹ch CÊp 2", {2, 22, 402, 1, 4}, 0},
		{1, 6, "HuyÕtTrÝchTh¹ch Lv3", {2, 22, 103, 1, 4}, 0},
		{1, 6, "NguyÖtB¹chTh¹ch Lv3", {2, 22, 203, 1, 4}, 0},
		{1, 6, "Hæ Ph¸ch Th¹ch CÊp 3", {2, 22, 303, 1, 4}, 0},
		{1, 6, "H¾c DiÖu Th¹ch CÊp 3", {2, 22, 403, 1, 4}, 0},
		{1, 1, "HuyÕtTrÝchTh¹ch Lv4", {2, 22, 104, 1, 4}, 1},
		{1, 1, "NguyÖtB¹chTh¹ch Lv4", {2, 22, 204, 1, 4}, 1},
		{1, 1, "Hæ Ph¸ch Th¹ch CÊp 4", {2, 22, 304, 1, 4}, 1},  
		{1, 1, "H¾c DiÖu Th¹ch CÊp 4", {2, 22, 404, 1, 4}, 1},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "§¸ quý cÊp 2-4", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2Global(format("[%s] trong ThÎ VIP Vâ L©m ®æi ®iÓm cèng hiÕn nhËn ®­îc phÇn th­ëng %s*%d", GetName(), tAward[nIndex][3], tonumber(nNum)))
	end
end

--½±Àø------------------------------------------------------
--Ë«×Ó¿¨
function vc_AwardCopy()
	AddVipCardValue(20);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardPlant()
	AddVipCardValue(20);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardTmz()
	AddVipCardValue(20);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardBattle()
	AddVipCardValue(20);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardEquip()
	AddVipCardValue(20);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

--¾ÞÐ·¿¨
--Ê¨×Ó¿¨
--´¦Å®¿¨
--ÌìÐ«¿¨
function vc_Award_2_1()
	AddVipCardValue(60);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 60, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu©n ch­¬ng anh hïng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_2()
	AddVipCardValue(40);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 40, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu©n ch­¬ng anh hïng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_3()
	AddVipCardValue(50);
	Msg2Player(format("NhËn ®­îc %d ®iÓm [%s] cèng hiÕn", 50, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu©n ch­¬ng anh hïng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

--¸÷¹¦ÄÜÊµÏÖ½Ó¿Ú---------------------------------------------
--VipCard ID£¬VC_DAILY_TASK×ÓÏîË÷Òý£¬×Ó×ÓË÷Òý
function _vc_DailyTaskFinishOnce(nID, nIndex, cTag)
	--ÎäÁÖvip¹¦ÄÜÒÑ¹Ø±Õ
	if IsActivatedVipCard(nID) ~= 1 then
		return
	end
	--µ±Ç°¼¤»îµÄID
	if GetVipCardIndex() ~= nID then
		return
	end
	--Î´¼¤»îÎäÁÖvip¹¦ÄÜ
	if GetVipCardRemainTime() <= 0 then
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[nCardIndex];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	if cTag ~= cIndex then
		return
	end
	local tSub = tCell.Content[cIndex];
	if not tSub then return end;
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	if nFinishTimes >= tSub[2] then
		return
	end
	gf_SetTaskByte(tCell.Task, tCell.Byte, nFinishTimes + 1, TASK_ACCESS_CODE_VIP_CARD);
	Msg2Player(format("Hoµn thµnh [%s] nhiÖm vô h»ng ngµy %s %d/%d", GetVipCardName(nID), tSub[1], nFinishTimes + 1, tSub[2]))
end

--ÁºÉ½Í¨8¹Ø
function _vc_LS_Pass_8()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 1);
end

--µØÐþ¹¬Í¨7¹Ø
function _vc_DXG_Pass_7()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 2);
end

--Íò½£Ú£Í¨4¹Ø
function _vc_WJZ_Pass_4()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 3);
end

--ÆÕÍ¨Ì«Ò»ËþÈ«Í¨
function _vc_TYT_AllPass()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 4);
end

--ÌìÃÅÕóÈ¡Ê¤
function _vc_TMZ_Win()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 1);
	end
end

--²ÎÓëÌìÃÅÕó
function _vc_JoinOnceTMZ()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 2);
	end
end

--²ÎÓëÑãÃÅ¹Ø´óÕ½³¡²¢ÁìÈ¡½±Àø
function _vc_JoinBigbattle()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 3);
	end
end

--²ÎÓëÈÎÒâÐ¡Õ½³¡²¢ÁìÈ¡½±Àø
function _vc_JoinSmallBattle()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 4);
	end
end

--²Î¼Ó¶÷Ô¹Ì¨²¢È¡µÃÊ¤Àû
function _vc_JoinEytBattle_Win()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 2, 5);
end

--×°±¸Ç¿»¯
function _vc_EnhanceOnce(bIsSucc, enhLevel)
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 1);
	end
end

--×°±¸Ñø³É
function _vc_Equip_Evolution(bIsSucc)
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 2);
	end
end

--ÖÖÖ²Ð¡°ãÈôÊ÷
function _vc_PlantSmallBanRuo()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 3);
	end
end

--ÖÖÖ²°ãÈôÊ÷
function _vc_PlantBigBanRuo()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 4);
	end
end

--´ò¿ªÖÖ×Ó°ü
function _vc_OpenSeedBag()
	local nId = GetVipCardIndex()
	if nId == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 3);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 5);
	end
end