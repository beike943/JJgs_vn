--½Å±¾Ãû³Æ£ºÁºÉ½¹Ø¿¨ÈÕ³£ÈÎÎñ
--½Å±¾¹¦ÄÜ£º³õÑÝÌôÕ½£ºÃ¿ÈÕµÚÒ»´ÎÍê³ÉÁºÉ½ÈºÐÛ»á1-4¹ØµÄÌôÕ½£¨ÔÚºÚ·çÕ¯»÷°ÜÁºÉ½ºÃºº£©£¬¿É»ñµÃ ¡­¡­
--½Å±¾¹¦ÄÜ£ºÖÒÓÂÌôÕ½£ºÃ¿ÈÕµÚÒ»´ÎÍê³ÉÁºÉ½ÈºÐÛ»á1-5¹ØµÄÌôÕ½£¨ÔÚ¾ÛÒåÌÃ»÷°ÜÁºÉ½ºÃºº£©£¬¿É»ñµÃ ¡­¡­
--½Å±¾¹¦ÄÜ£º¶á¾üÌôÕ½£ºÃ¿ÈÕ»÷°Ü¡°xx¡±£¨Àý£ºÅùö¨»ðÇØÃ÷£©£¬¿É»ñµÃ¡­¡­Ö»»áËæ»úµ½D£¬E¼¶boss¡£
--¹¦ÄÜ²ß»®£ºÐ»Ðì´º
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2010-01-18
--´úÂëÐÞ¸Ä¼ÇÂ¼
--===´å³¤2011-2-18¿ªÊ¼ÒÆÖ²
--Ö÷ÒªÐÞ¸Ä£º½±Àø¸ÅÂÊ¡¢¶Ô»°×ªÒÆ¡¢ÎïÆ·¸ñÊ½
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--½±ÀøÕæÆøµÄ½Ó¿Ú
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\meridian\\vet_jihuo_wuzun.lua")

--LiangShan_DailyTaskState ÁºÉ½ÈÕ³£ÈÎÎñ×´Ì¬
LS_DTS_TASK_NONE 	= 0;	-- »¹Ã»½ÓÈÎÎñ
LS_DTS_TASK_DOING	= 1;	-- ÕýÔÚÈÎÎñ ÒÑ½ÓÊÜÈÎÎñ
LS_DTS_TASK_DONE 	= 2;	-- ÒÑÍê³ÉÈÎÎñ
LS_DTS_AWARD_DONE	= 3;	-- ÒÑÁìÈ¡½±Àø

__t_free_award_no_stage ={
	n_other_group_rate = 100000,--Ëæ»úµ½ÔÓÎï×éµÄ¸ÅÂÊ
	n_equip_group_rate = 0,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
	n_daibi_group_rate = 0,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	t_daibi_group ={},
	t_equip_group = {},
}
__t_free_award_stage ={
	[1] = {
		t_other_group ={
			{ {"Ma §ao Th¹ch cÊp 1", {2,1,30428,1, 4}, nil,nil,{1, 100} }, 1500},
			{ {"ThiÕt Tinh cÊp 1", {2,1,30533,1, 4}, nil,nil,{1, 100} }, 3000},
			{ {"Båi Nguyªn §¬n", {2,1,30351,1, 4}, nil,nil,{1, 100} }, 4500},
			{ {"Thiªn Lý TruyÒn ¢m Phï ChØ", {2,1,3508,1, 4}, nil,nil,{1, 100} }, 500},
			{ {"ThiÕt Tinh cÊp 2", {2,1,30534,1, 4}, nil,nil,{1, 100} }, 500},
		},
	},
	[2] = {
		t_other_group ={
			{{MA_GiveMoney, {50000}}, 4000},
			{{MA_GiveMoney, {100000}}, 800},
			{{MA_GiveMoney, {400000}}, 100},
			{ {"Ma §¹o Th¹ch cÊp 2", {2,1,30429,1, 4}, nil,nil,{1, 100} }, 1000},
			{ {"ThiÕt Tinh cÊp 2", {2,1,30534,1, 4}, nil,nil,{1, 100} }, 2500},
			{ {"Thiªn th¹ch", {2,2,8,1, 4}, nil,nil,{1, 100} }, 700},
			{ {"b¸nh Ýt B¸c B¶o", {2,1,1125,1, 4}, nil,nil,{1, 100} }, 300},
			{ {"C©y B¸t Nh· nhá", {2,0,504,1, 4}, nil,nil,{1, 100} }, 600},
		},
	},
	[3] = {
		t_other_group ={
			{{MA_GivePopur, {1000}}, 2500},
			{{MA_GivePopur, {2000}}, 2500},
			{{MA_GivePopur, {4000}}, 5000},
			{ {"Ma §ao Th¹ch cÊp 3", {2,1,30430,1, 4}, nil,nil,{1, 100} }, 500},
			{ {"ThiÕt Tinh cÊp 3", {2,1,30535,1, 4}, nil,nil,{1, 100} }, 1500},
			{ {"Tø Linh Quy Nguyªn §¬n", {2,1,30352,1, 4}, nil,nil,{1, 100} }, 1000},
			{ {"C©y B¸t Nh·", {2,0,398,1, 4}, nil,nil,{1, 100} }, 500},
			{ {"B¨ng Tinh Th¹ch", {2,1,30554,1, 4}, nil,nil,{1, 100} }, 1000},
		},
	},
}

t_ls_daily_task_award = {
	t_free_award = 
	{
		sz_award_title = "L­¬ng S¬n v­ît ¶i nhiÖm vô h»ng ngµy",
		--¼¸´ÎÃ»ÓÐµÃµ½×°±¸Ê±±Ø³ö×°±¸
		t_equip_round = {},
		n_max_daibi_perday = 0,--Ò»Ìì×î¶à»ñµÃ¶àÉÙ´ú±Ò
		t_stage =
		{
			[1] = inherit(__t_free_award_no_stage, __t_free_award_stage[1]),
			[2] = inherit(__t_free_award_no_stage, __t_free_award_stage[2]),
			[3] = inherit(__t_free_award_no_stage, __t_free_award_stage[3]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "PhÇn th­ëng cè ®Þnh nhiÖm vô hµng ngµy L­¬ng S¬n",
		t_stage = {
        	[1] ={
        			{MA_GiveExp, {3000000}},
        			--{MA_GiveZhenQi, {100}},
        			{"Hu©n ch­¬ng anh hïng", {2,1,30499,1}, nil,nil, {1, 100}}
        		},
        	[2] ={
        			{MA_GiveExp, {4000000}},
        			--{MA_GiveZhenQi, {200}},
        			{"Hu©n ch­¬ng anh hïng", {2,1,30499,1}, nil,nil, {1, 100}}
        		},
        	[3] ={
        			{MA_GiveExp, {6000000}},
        			--{MA_GiveZhenQi, {300}},
        			{"Hu©n ch­¬ng anh hïng", {2,1,30499,1}, nil,nil, {1, 100}}
        		},
        },
	},
};
__t_free_award_no_stage=nil
__t_free_award_stage =nil

g_tDailyTasksInfo = {
	[1] = {
		szTitle	= LSTaskInfo[1][1],
		szInfo  = LSTaskInfo[1][2],
		nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1,
		tAward  = {
			{100,	LSTaskBag1[4], {LSTaskBag1[1],LSTaskBag1[2],LSTaskBag1[3],1}},
		},
	},
	[2] = {
		szTitle	= LSTaskInfo[2][1],
		szInfo  = LSTaskInfo[2][2],
		nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2,
		tAward  = {
			{100,	LSTaskBag2[4], {LSTaskBag2[1],LSTaskBag2[2],LSTaskBag2[3],1}},
		},
	},
	[3] = {
		szTitle	= LSTaskInfo[3][1],
		szInfo  = LSTaskInfo[3][2],
		szInfo2 = LSTaskInfo[3][3],
		nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3,
		tAward  = {
			{100,	LSTaskBag3[4], {LSTaskBag3[1],LSTaskBag3[2],LSTaskBag3[3],1}},
		},
		tBossInfo = {
			tLevel  = {4, 5},
			nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3_BOSS,
		},
	},
};
--ÎåÐÐÐþÊ¯IDÕûÀí
g_tDailyTaskBoxsInfo = {
	[1] = {
		szTitle = LSTaskBag1[4],
		tItemID = {LSTaskBag1[1],LSTaskBag1[2],LSTaskBag1[3]},
		tAward  = {
			nExp = 300000,
			tRand = {
				tItem  = {100},
				n      = 1,
			},
			tItem = {
				{60,	"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 3}	},
				{30,	"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 6}	},
				{5,		"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 9}	},
				{4,		"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 20}	},
				{1,		"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 66},	"%s më L­¬ng S¬n S¬ DiÔn Bao nhËn ®­îc 66 Ngò Hµnh HuyÒn Th¹ch!"},
			},
			tGold = {
			},
			tPopur = {
			},
		},
	},
	[2] = {
		szTitle = LSTaskBag2[4],
		tItemID = {LSTaskBag2[1],LSTaskBag2[2],LSTaskBag2[3]},
		tAward  = {
			nExp = 600000,
			tRand = {
				tItem  = {50},
				tGold  = {50},
				n      = 2,
			},
			tItem = {
				{98,	"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 6}},
				{2,		"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 77},"%s më L­¬ng S¬n S¬ DiÔn Bao nhËn ®­îc 77 Ngò Hµnh HuyÒn Th¹ch!"},
			},
			tGold = {
				{92,	10*100*100},
				{6,		20*100*100},
				{2,		200*100*100,"%s më L­¬ng S¬n Trung Dòng Bao nhËn ®­îc 200 vµng!"},
			},
		},
	},
	[3] = {
		szTitle = LSTaskBag3[4],
		tItemID = {LSTaskBag3[1],LSTaskBag3[2],LSTaskBag3[3]},
		tAward  = {
			nExp = 1000000,
			tRand = {
				tItem  = {50},
				tPopur = {50},
				n      = 2,
			},
			tItem = {
				{98,	"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 8}},
				{2,		"Ngò Hµnh HuyÒn Th¹ch",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 99},"%s më L­¬ng S¬n S¬ DiÔn Bao nhËn ®­îc 99 Ngò Hµnh HuyÒn Th¹ch!"},
			},
			tGold = {
			},
			tPopur = {
				{40,	1000,},
				{50,	2000,},
				{10,	4000,},
			},
		},
	},
};

function DailyTasksMenu()
	local tSay = {
		msg = "<color=green>"..NpcName[1][2].."<color>"..NpcSayInfo[14][1],
		sel = {
			{NpcSayInfo[14][2], T, },
			{NpcSayInfo[14][3], "nothing", },
		},
	};

	for nIdx, tTaskInfo in g_tDailyTasksInfo do
		local szBuff1 = format("@%s", tTaskInfo.szTitle);
		local szBuff2 = format("#DailyTasksSubMenu(%d)", nIdx);
		tinsert(tSay.sel, 1, {szBuff1, szBuff2});
	end

	temp_Talk(tSay);

end

function DailyTasksSubMenu(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];
	local nState, nTime = GetTaskState(nIdx);

	local tSay = {
		msg = "<color=green>"..NpcName[1][2].."<color>: "..tTaskInfo.szInfo,
		sel = {
			{NpcSayInfo[14][2], "DailyTasksMenu", },
			{NpcSayInfo[14][3], "nothing", },
		},
	};

	if nTime ~= tonumber(date("%Y%m%d")) and (nState ~= LS_DTS_TASK_DOING and nState ~= LS_DTS_TASK_DONE) then
		nState = LS_DTS_TASK_NONE;
	end

	if nState == LS_DTS_TASK_DOING then
		tSay.msg = tSay.msg.."\n                                        <color=green>"..NpcSayInfo[14][4].."<color>"
		tinsert(tSay.sel, 1, {NpcSayInfo[14][5], format("#QueryTask(%d)", nIdx)});
	elseif nState == LS_DTS_TASK_DONE then
		tSay.msg = tSay.msg.."\n                                        <color=green>"..NpcSayInfo[14][6].."<color>"
		tinsert(tSay.sel, 1, {NpcSayInfo[14][7], format("#TaskAward(%d)", nIdx)});
	elseif nState == LS_DTS_AWARD_DONE then
		tSay.msg = tSay.msg.."\n                                        <color=green>"..NpcSayInfo[14][8].."<color>"
	else
		tinsert(tSay.sel, 1, {NpcSayInfo[14][9], format("#GivenTask(%d)", nIdx)});
	end

	temp_Talk(tSay);

end

function TaskAward(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	if 1 ~= gf_Judge_Room_Weight(2+2, 0, format("<color=green>[%s]<color>:", tTaskInfo.szTitle)) then --+2Ô¤Áô¸ø»î¶¯½±Àø
		return 0;
	end
	----------------------- Chuçi nhiÖm vô ChuyÓn Sinh §¬n, l­u sè thø 8 vµ 9 ®Çu bªn ph¶i
	local nCSD_LS = floor(GetTask(TSK_CSD_COUNT_A) / 10000000)
	local nNumBK = mod(GetTask(TSK_CSD_COUNT_A),10000000)
	if mod(nCSD_LS, 100) < 30 and GetTask(TSK_CSD) == 1 then
		nCSD_LS = (nCSD_LS + 1) * 10000000 + nNumBK
		SetTask(TSK_CSD_COUNT_A, nCSD_LS)
	end
	---------------------------------
	-- Nhiªm vô ChuyÓn Sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2) < 60 then
		gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2) == 60 then
			TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh hoµn thµnh 60 lÇn ®i L­¬ng S¬n B¹c")
		end
	end
	-----------------------Chuçi nhiÖm vô ChuyÓn Sinh 6
	local nCS6_LS =  floor(GetTask(TSK_CS6_COUNTC)/10000)
	local nCS6_LS_Num = mod(GetTask(TSK_CS6_COUNTC),10000)
	if mod(nCS6_LS,100) < 15 and GetTask(TSK_CS6_TULINH) == 3 then
		nCS6_LS = (nCS6_LS + 1) * 10000 + nCS6_LS_Num
		SetTask(TSK_CS6_COUNTC, nCS6_LS)
	end
	-------------------------------
	
	--BoxAward_Item(tTaskInfo.tAward);
	AwardZhenQi_LiangShan(nIdx)--ÕæÆø½±Àø
	MissionAward_RandAward(nIdx, -1, t_ls_daily_task_award);
	MissionAward_FixAward(nIdx,t_ls_daily_task_award);
	
	runtime_stat_event(RUNTIME_STAT_SYS_LIANGSHAN, RUNTIME_STAT_EVENT_FINISH_TASK, nIdx, 1)--Í³¼ÆÊÂ¼þ

	SetTaskState(nIdx, LS_DTS_AWARD_DONE);
	-- nhiÖm vô lµm giµu
	if CFG_NhiemVuLamGiau == 1 then
		if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 4) == 0 and mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1), 10) == 3 and mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2), 10) == 3 and mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3), 10) == 3  then
			gf_SetTaskBit(TSK_LAMGIAU, 4, 1, 0)
			TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Hoµn thµnh 03 nhiÖm vô L­¬ng S¬n B¹c.")
		end
	end
	HoanThanhNhiemVuLuongSonBac()
	------------------------------
	--ÁºÉ½Ã¿ÈÕÈÎÎñµÄ»î¶¯µ÷ÓÃ
	vaf_liangshan_daily_task()
	_vjw_SetLs();
	Observer:onEvent(SYSEVENT_LIANGSHAN_TASK_AWARD, nIdx)
end

function GivenTask(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	if tTaskInfo.tBossInfo then
		local nBossID = RandomSelectedBoss(tTaskInfo.tBossInfo);
		SetTask(tTaskInfo.tBossInfo.nTaskID, nBossID);
	end
	SetTaskState(nIdx, LS_DTS_TASK_DOING);

	QueryTask(nIdx);
end

function QueryTask(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	local szMsg = tTaskInfo.szInfo;

	if tTaskInfo.tBossInfo then
		szMsg = format(tTaskInfo.szInfo2, tMission:getBossName(GetTask(tTaskInfo.tBossInfo.nTaskID)));		
	end

	Talk(1, "", format(LSSysTalk[14][1].."<color=green>%s<color>”. \n\n%s", tTaskInfo.szTitle, szMsg));
end

function RandomSelectedBoss(tBossInfo)
	local nMax = 0;

	for _, nLv in tBossInfo.tLevel do
		if tMission.tBoss[nLv] then
			nMax = nMax + getn(tMission.tBoss[nLv]);
		end
	end

	local nRand = random(1, nMax);

	for _, nLv in tBossInfo.tLevel do
		if tMission.tBoss[nLv] then
			if nRand - getn(tMission.tBoss[nLv]) <= 0 then
				return tMission.tBoss[nLv][nRand];
			else
				nRand = nRand - getn(tMission.tBoss[nLv]);
			end
		end
	end

	assert();
end

function SetTaskDone(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	local nState, nTime = GetTaskState(nIdx);
	if nState ~= LS_DTS_TASK_DOING then
		return 0;
	end

	SetTaskState(nIdx, LS_DTS_TASK_DONE);

	Msg2Player(format(LSMsgToPlayer[14],tTaskInfo.szTitle,NpcName[1][2]))
	Talk(1, "", format("<color=green>"..NpcName[1][2].."<color>: "..LSSysTalk[14][2], tTaskInfo.szTitle));
end

function LM_SetTaskDone(nIdx, tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funSetTaskDone = function(tbArg)
		SetTaskDone(%nIdx);
	end;
	gf_OperatePlayers(tbPlayer,funSetTaskDone,{});
end;

function OnUse(nIdx)
	local nItemIndex = tonumber(nIdx);
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex);
	local nBoxIdx = 0;

	for i, tBoxInfo in g_tDailyTaskBoxsInfo do
		if tBoxInfo.tItemID[1] == nGenre and tBoxInfo.tItemID[2] == nDetail and tBoxInfo.tItemID[3] == nParticular then
			nBoxIdx = i;
			break
		end
	end

	BoxAward(nBoxIdx);
end

function BoxAward(nIdx)
	if not g_tDailyTaskBoxsInfo[nIdx] then
		return 0;
	end

	local tBoxInfo = g_tDailyTaskBoxsInfo[nIdx];

	if 1 ~= gf_Judge_Room_Weight(2, 0, format("<color=green>[%s]<color>:", tBoxInfo.szTitle)) then
		return 0;
	end

	if 1 ~= DelItem(tBoxInfo.tItemID[1], tBoxInfo.tItemID[2], tBoxInfo.tItemID[3], 1) then
		return 0;
	end
	--ÏÈ¸ø¾­Ñé
	if tBoxInfo.tAward.nExp ~= nil then
		ModifyExp(tBoxInfo.tAward.nExp)
		Msg2Player(format(LSMsgToPlayer[16],tBoxInfo.tAward.nExp))
	end
	--ÔÙ´¦ÀíÆäËû
	local szKey = RandomSelected(tBoxInfo.tAward.tRand);
	if not g_tfunBoxAward[szKey] then
		return 0;
	end

	g_tfunBoxAward[szKey](tBoxInfo.tAward[szKey]);
end

function RandomSelected(tData)
	if not tData or 0 == getn(tData) then
		return 0;
	end

	local nMax = 0;
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nMax = nMax + tInfo[1];
		end
	end

	local nRand = random(1, nMax);
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nRand = nRand - tInfo[1];
			if nRand <= 0 then
				return idx;
			end
		end
	end

	assert();
end

function BoxAward_Item(tItem)
	local nSel = RandomSelected(tItem);

	if not tItem[nSel] then
		return 0;
	end

	gf_AddItemEx(tItem[nSel][3], tItem[nSel][2]);
	--Ô½ÄÏ°æÔö¼ÓÊÀ½çÏûÏ¢
	if tItem[nSel][4] ~= nil then
		Msg2Global(format(tItem[nSel][4],GetName()))
	end
end

function BoxAward_Gold(tGold)
	local nSel = RandomSelected(tGold);

	if not tGold[nSel] then
		return 0;
	end

	Earn(tGold[nSel][2]);
	--Ô½ÄÏ°æÔö¼ÓÊÀ½çÏûÏ¢
	if tGold[nSel][3] ~= nil then
		Msg2Global(format(tGold[nSel][3],GetName()))
	end
end

function BoxAward_Popur(tPopur)
	local nSel = RandomSelected(tPopur);

	if not tPopur[nSel] then
		return 0;
	end
	ModifyPopur(tPopur[nSel][2], 0);
	Msg2Player(format(LSMsgToPlayer[15], tPopur[nSel][2]));
end

function GetTaskState(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	local temp = GetTask(tTaskInfo.nTaskID);
	local nTime  = floor(temp / 10);
	local nState = mod(temp, 10);

	return nState, nTime;
end

function SetTaskState(nIdx, nState)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	if nState and nState >= 10 or nState < 0 then
		return 0;
	end

	local temp = tonumber(date("%Y%m%d")) * 10 + nState;
	SetTask(tTaskInfo.nTaskID, temp);
end

g_tfunBoxAward = {
	tItem  = BoxAward_Item,
	tGold  = BoxAward_Gold,
	tPopur = BoxAward_Popur,
};
