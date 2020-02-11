--2014´º½Ú»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\spring2014\\sp_define.lua")
Include("\\script\\lib\\npccmdhead.lua")

SP_TASK_GROUP = TaskManager:Create(3, 11);
SP_TASK_GROUP.DaySeq = 1;
SP_TASK_GROUP.DayAcc = 2; --ÀÛ¼Æ°ÝÁË¼¸´Î
SP_TASK_GROUP.TargetNpc = 3; --¼ÇÂ¼°ÝÄênpcµÄTableIndex
SP_TASK_GROUP.IsAward = 4;  --ÊÇ·ñÁì½±
SP_TASK_GROUP.MaxUse = 5; --Ã¿Ìì×î¶àÊ¹ÓÃ
SP_TASK_GROUP.UseTimes = 6; --´òÄêÊÞÌìÊý
SP_TASK_GROUP.DropBox = 7; --ÊÇ·ñµôÂä±¦Ïä
SP_TASK_GROUP.ThsDrop = 8; --ÌÒ»¨Ê÷µôÂä
SP_TASK_GROUP.ThsChickTime = 9; --ÌÒ»¨Ê÷µã»÷Ê±¼ä¼ä¸ô

function sp_IsOpenActivity()
	if not SP_SWITCH or SP_SWITCH ~= 1 then
		return 0;
	end
	return gf_CheckEventDateEx2(SP_START_TIME, SP_END_TIME);
end

function sp_CreateTalkTrigger()
	if not SP_SWITCH or SP_SWITCH ~= 1 then
		if GetTrigger(3111*2) > 0 then
			RemoveTrigger(GetTrigger(3111*2))
		end 
		return 0;
	end
	if sp_IsOpenActivity() == 1 then
		if GetTrigger(3111*2) <= 0 then
			CreateTrigger(4, 3111, 3111*2);
		end
	else
		if GetTrigger(3111*2) > 0 then
			RemoveTrigger(GetTrigger(3111*2))
		end
	end
end

function sp_IsTargetNpc()
	if sp_IsOpenActivity() ~= 1 then
		return 0, 0;
	end
	local nIndex = 0;
	local nMapId = GetWorldPos();
	for i = 1, getn(SP_CITY_TABLE) do
		if nMapId == SP_CITY_TABLE[i][1] then
			nIndex = i;
			break;
		end
	end
	if nIndex == 0 then
		return 0, 0;
	end
	local bIsComplete = sp_GetIsComplete(nIndex);
	if bIsComplete == 1 then
		return 0, 0;
	end
	local nSubIndex = sp_GetWhichNpc(nIndex);
	if nSubIndex < 1 or nSubIndex > 5 then
		return 0, 0;
	end
	local npcIndex = GetTargetNpc();
	local npcName = GetNpcName(npcIndex);
	if npcName ~= SP_TARGER_NPC_TABLE[nIndex][nSubIndex] then
		return 0, 0;
	end
	return nIndex, npcIndex;
end

function sp_InteractiveToNpc()
	local nIndex, npcIndex = sp_IsTargetNpc();
	if nIndex == 0 or npcIndex == 0 then
		return 0;
	end
	local npcName = GetNpcName(npcIndex);
	NpcChat(PIdx2NpcIdx(), format("%s, N¨m Míi Vui VÎ, V¹n Sù Nh­ ý!", npcName));
	NpcChat(npcIndex, format(SP_NPC_TABLE[random(5)], gf_GetPlayerSexName()));
	sp_SetIsComplete(nIndex, 1);
	Msg2Player(format("H­íng vÒ %s chóc tÕt hoµn thµnh", npcName));
	return 1;
end

--must return 1
function sp_NpcTalk()
	local nIndex, npcIndex = sp_IsTargetNpc();
	if nIndex == 0 or npcIndex == 0 then
		return 1;
	end
	local npcName = GetNpcName(npcIndex);
	Msg2Player(format("H·y ch¾p tay h­íng vÒ %s ®Ó chóc TÕt! ", npcName));
	Talk(1,"",format("H·y ch¾p tay h­íng vÒ %s ®Ó chóc TÕt! ", npcName))	
	return 0;
end

function sp_DailyReset()
	local bNeedRandom = nil;
	if SP_TASK_GROUP:GetTask(SP_TASK_GROUP.DaySeq) ~= zgc_pub_day_turn() then
		SP_TASK_GROUP:SetTask(SP_TASK_GROUP.DaySeq, zgc_pub_day_turn());
		SP_TASK_GROUP:SetTask(SP_TASK_GROUP.TargetNpc, 0);
		SP_TASK_GROUP:SetTask(SP_TASK_GROUP.MaxUse, 0);
		SP_TASK_GROUP:SetTask(SP_TASK_GROUP.DropBox, 0);
		SP_TASK_GROUP:SetTask(SP_TASK_GROUP.IsAward, 0);
		SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsDrop, 0);
		bNeedRandom = 1;
	end
	if bNeedRandom then
		for i = 1, 7 do
			sp_SetWhichNpc(i, random(5));
		end
	end
end

function sp_GetWhichNpc(nIndex)
	if nIndex < 1 or nIndex > 7 then
		print("UDERROR:sp_GetWhichNpc(nIndex) nIndex < 1 or nIndex > 7");
		return 0;
	end
	return SP_TASK_GROUP:GetMyTaskBit(SP_TASK_GROUP.TargetNpc, 4*(nIndex-1)+1, 4*(nIndex-1)+3);
end


function sp_SetWhichNpc(nIndex, nValue)
	if nIndex < 1 or nIndex > 7 then
		print("UDERROR:sp_SetWhichNpc(nIndex, nValue) nIndex < 1 or nIndex > 7");
		return 0;
	end
	return SP_TASK_GROUP:SetMyTaskBit(SP_TASK_GROUP.TargetNpc, 4*(nIndex-1)+1, 4*(nIndex-1)+3, nValue);
end

function sp_GetIsComplete(nIndex)
	if nIndex < 1 or nIndex > 7 then
		print("UDERROR:sp_GetIsComplete(nIndex) nIndex < 1 or nIndex > 7");
		return 0;
	end
	return SP_TASK_GROUP:GetTaskBit(SP_TASK_GROUP.TargetNpc, 4*nIndex);
end

function sp_SetIsComplete(nIndex, nValue)
	if nIndex < 1 or nIndex > 7 then
		print("UDERROR:sp_SetIsComplete(nIndex, nValue) nIndex < 1 or nIndex > 7");
		return 0;
	end
	return SP_TASK_GROUP:SetTaskBit(SP_TASK_GROUP.TargetNpc, 4*nIndex, nValue);
end

--Relay call
function sp_RealyCreateNianShou(nRandSeed)
	if sp_IsOpenActivity() ~= 1 then
		return 0;
	end
	randomseed(nRandSeed);
	local nIndex = random(getn(SP_NIANSHOU_POS));
	--¹ã²¥
	local strMsg = format("Niªn Thó xuÊt hiÖn t¹i %s, ®¹i hiÖp nhanh ch©n ®i ®uæi Niªn Thó ®i!", SP_NIANSHOU_POS[nIndex][4]);
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
	Msg2Global("N¨m Míi Vui VÎ! Kim S¬n ch­ëng m«n ë T­¬ng D­¬ng ®· trang trÝ nhiÒu Hoa §µo t¹i ®­êng phè xung quanh, c¸c ®¹i hiÖp nhanh chãng ®i xem Hoa §µo ®i, bÊm vµo Hoa §µo cã c¬ héi nhËn ®­îc gi¶i th­ëng!");
	--Õâ¸öµØÍ¼²»ÔÚÕâ¸ö·þÎñÆ÷¾Í²»Ë¢
	if SubWorldID2Idx(SP_NIANSHOU_POS[nIndex][1]) == -1 then
		return 0;
	end
	--Ë¢NPC
	local npcIdx = CreateNpc("Niªn Thó TiÕt Xu©n", "Niªn thó", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_AI_POS[SP_NIANSHOU_POS[nIndex][1]][1][1],SP_NIANSHOU_AI_POS[SP_NIANSHOU_POS[nIndex][1]][1][2]);
	if npcIdx > 0 then
		SetNpcLifeTime(npcIdx, 60*60);
		g_NpcAI:setAI(npcIdx, AT_SM_PATROL, 1)
		g_NpcAI:setWayPoint(npcIdx, SP_NIANSHOU_AI_POS[SP_NIANSHOU_POS[nIndex][1]], 1);
		npcIdx = CreateNpc("C©y Tø Linh 4", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3]);
		SetNpcLifeTime(npcIdx, 60*60);
		local nNum, tNpcIndex = CreateNpc("Hoa hång vµng", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3], 6,8,2,10);
		for k, v in tNpcIndex do
			SetNpcLifeTime(v, 60*60);
		end
		nNum, tNpcIndex = CreateNpc("Hoa hång tr¾ng", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3], 6,16,2,30);
		for k, v in tNpcIndex do
			SetNpcLifeTime(v, 60*60);
		end
		nNum, tNpcIndex = CreateNpc("Hoa hång ®á", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3], 6,32,2,50);
		for k, v in tNpcIndex do
			SetNpcLifeTime(v, 60*60);
		end
	end
end


function sp_CreateDecorate()
	if sp_IsOpenActivity() ~= 1 then
		return 0;
	end
	if SubWorldID2Idx(200) ~= -1 then
		local tPos = {
			{200,1380,2815},{200,1339,2887},
			{200,1399,2831},{200,1326,2868},
			{200,1418,2849},{200,1346,2849},
			{200,1432,2866},{200,1362,2830},
			{200,1420,2879},{200,1224,2687},
			{200,1408,2892},{200,1212,2699},
			{200,1392,2908},{200,1550,3024},
			{200,1375,2923},{200,1540,3036},
			{200,1355,2904},{200,1221,3019},
			{200,1229,3028},           
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(150) ~= -1 then
		local tPos = {
			{150,1689,3112},{150,1783,3211},
			{150,1645,3155},{150,1774,3220},
			{150,1686,3194},{150,1758,3035},
			{150,1728,3152},{150,1767,3046},
			{150,1606,3004},{150,1602,3222},
			{150,1595,3015},{150,1596,3212},
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(500) ~= -1 then
		local tPos = {
			{500,1757,3088},{500,1826,3264},
			{500,1814,3131},{500,1833,3254},
			{500,1757,3195},{500,1627,3060},
			{500,1703,3139},{500,1640,3046},
			{500,1635,3258},{500,1870,3002},
			{500,1643,3266},{500,1877,3010},
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	--ÏåÑô
	if SubWorldID2Idx(350) ~= -1 then
		--12
		for i = 0, 20 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1427-i*4, 2770+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		--34
		for i = 0, 3 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1432-i*4, 2780+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		--56
		for i = 0, 2 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1404-i*4, 2815+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		--78
		for i = 0, 5 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1379-i*4, 2841+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		--49
		for i = 1, 2 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1416+i*4, 2796+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		--10 11
		for i = 0, 4 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1436+i*4, 2822+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		--12 13
		for i = 0, 5 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1463+i*4, 2849+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		--5 14
		for i = 1, 19 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1404+i*4, 2815+i*4);
			SetNpcScript(npcIndex, "\\script\\online\\spring2014\\sp_npc_ths.lua");
		end
		local tPos = {
			{350,1437,3022},	{350,1402,2995},
			{350,1490,2971},	{350,1422,3015},
			{350,1478,2957},	{350,1548,2871},
			{350,1455,2933},	{350,1540,2864},
			{350,1444,2926},	{350,1346,3094},
			{350,1423,2938},	{350,1337,3084},
			{350,1403,2960},	{350,1325,2868},
			{350,1390,2978},	{350,1336,2857},
			{350,1545,3083},  {350,1536,3090},        
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(300) ~= -1 then
		local tPos = {
			{300,1736,3489},{300,1656,3711},	
			{300,1698,3532},{300,1641,3696},	
			{300,1809,3559},{300,1668,3464},	
			{300,1792,3544},{300,1681,3451},	
			{300,1919,3443},{300,1915,3692},	
			{300,1909,3431},{300,1926,3680},	
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(100) ~= -1 then
		local tPos = {
			{100,1384,2978},{100,1427,3023},	
			{100,1400,2960},{100,1412,3012},	
			{100,1416,2943},{100,1395,2995},	
			{100,1427,2934},{100,1545,2880},	
			{100,1443,2949},{100,1530,2866},	
			{100,1460,2964},{100,1331,2887},	
			{100,1473,2979},{100,1345,2873},	
			{100,1463,2990},{100,1585,3126},	
			{100,1446,3005},{100,1576,3135},	
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
end