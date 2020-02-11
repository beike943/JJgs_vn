Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\system_switch_config.lua")

g_szNpcName = "<color=green>Tiªn Phong D­¬ng T«n B¶o:<color>";

function main()
	if _check_subsystem_open(SYS_SWITCH_TAIYI, 2) ~= 1 then
		return 0;
	end
	local szName;
	local strTab = {
		format("Ta muèn tham gia Ph¹n Thiªn L©m-Th­êng (Tèn %s)/Talk_1_1", "Tinh Lùc*"..TYT_JOIN_COST_JINGLI[1][1]),
		format("Ta muèn tham gia Ph¹n Thiªn L©m-Th­êng (§éi tr­ëng tèn %s)/Talk_1_1_IB", TYT_JOIN_COST_ITEM[1][1][2].."*"..TYT_JOIN_COST_ITEM[1][1][1][4]),
		--format("ÎÒÒª²Î¼ÓÆÕÍ¨ÄÑ¶ÈµÄÌ«Ò»Ëþ(ÏûºÄ%s)/Talk_1_2", "¾«Á¦*"..TYT_JOIN_COST_JINGLI[2][1]),
		--format("ÎÒÒª²Î¼ÓÆÕÍ¨ÄÑ¶ÈµÄÌ«Ò»Ëþ(¶Ó³¤ÏûºÄ%s)/Talk_1_2_IB", TYT_JOIN_COST_ITEM[2][1][2].."*"..TYT_JOIN_COST_ITEM[2][1][1][4]),
		--"¹Ø¿¨Ê×Í¨½±ÀøÁìÈ¡/Talk_1_6",
		"Hñy bá/nothing",
	};
	
	if GetSex() == 1 then
		szName = "§¹i hiÖp";
	elseif GetSex() == 2 then
		szName = "N÷ hiÖp ";
	end
	Say(format(g_szNpcName.."TrËn chiÕn Kim Sa Than, D­¬ng LÖnh C«ng bÞ gian th©n Phan Mü b¸n ®øng nªn ®· d­íi tay cña qu©n liªu, vµ hi sinh n¬i ®Êt Liªu.Sau khi biÕt tin D­¬ng NghiÖp ®­îc an t¸ng t¹i n¬i cã tªn lµ Th¸i NhÊt Th¸p, th× ta vµ QuÐ Anh phông lÖnh x«ng vµo Th¸i NhÊt Th¸p ®Ó t×m hµi cèt vµ béi ®ao Hoang Háa L­u Kim cña LÖnh C«ng. Th¸i NhÊt Th¸p nµy c¬ quan trïng trïng, %s ®· s½n sµng ch­a?", szName), getn(strTab), strTab);
end

function Talk_1_1()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph¹n Thiªn L©m ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 2, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey»î¶¯
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
end

function Talk_1_1_IB()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph¹n Thiªn L©m ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 3, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey»î¶¯
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
end

function Talk_1_2()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph¹n Thiªn L©m ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_2_IB()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph¹n Thiªn L©m ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_6()
	local strTab = {
		"NhËn lÊy phÇn th­ëng./Talk_1_6_1",
		"Hñy bá/nothing",
	};
	local msg = "§Ó bµy tá lßng biÕt ¬n ®èi víi nh÷ng hiÖp sÜ ®Çu tiªn v­ît qua Th¸i NhÊt Th¸p-Anh Hïng ®Ó ®o¹t l¹i tro cèt cña Gia Gia, tÊt c¶ ng­êi ch¬i trªn cÊp 80 ®Òu nhËn ®­îc 1 phÇn th­ëng LÇn §Çu Qua ¶i";
	msg = msg..""
	Say(g_szNpcName..msg, getn(strTab), strTab);
end

function Talk_1_6_1()
--	local nDate = tonumber(date("%Y%m%d"));
--	local szGroupName = GetRelayGroup();
--	if 1 == _JX2WZ then
--		szGroupName = "wz"..szGroupName;
--	elseif 1 == _JX2PAY then
--		szGroupName = "pay"..szGroupName;
--	elseif 1 == _JX2IB then
--		szGroupName = "free"..szGroupName;
--	end
--	
--	if nDate < 20120331 or nDate > 20120405 then
--		Talk(1, "", g_szNpcName.."Ê×Í¨¼ÍÄî½±ÀøÁìÈ¡Ê±¼äÎª2012Äê3ÔÂ31ÈÕ-2012Äê4ÔÂ05ÈÕ¡£");
--		return 0;
--	end
--
--	if GetLevel() < 80 then
--		Talk(1, "", "Ö»ÓÐ80¼¶ÒÔÉÏµÄÍæ¼Ò²ÅÄÜÁìÈ¡£¡");
--		return 0;
--	end
--	
--	local tSpecGroup = {
--		["wz1-1"] = 1,
--		["wz3-1"] = 1,
--		["free100-8"] = 1,
--		["pay1-3"] = 1,
--	};
--	if 0 == GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
--		if tSpecGroup[szGroupName] then
--			if 1 ~= gf_Judge_Room_Weight(13, 100, g_szNpcName) then
--				return 0;
--			end
--		else
--			if 1 ~= gf_Judge_Room_Weight(7, 100, g_szNpcName) then
--				return 0;
--			end
--		end
--	end
--	
--	if 0 ~= GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
--		Talk(1, "", g_szNpcName.."´Ë½±ÀøÄãÒÑÁìÈ¡¡£");
--		return 0;
--	end
--	SetTask(TASKID_TAIYI_SHOUTUI_PRIZE, nDate);
--	
--	WriteLog(format("[Ì«Ò»ËþÊ×ÍÆ½±Àø] [%s ÁìÈ¡½±Àø, Account:%s]", GetName(), GetAccount()));
--	if tSpecGroup[szGroupName] then
--		gf_Modify("Exp", (10000000 + 1000000*(GetLevel()-80)) * 2);
--		gf_AddItemEx({2, 95, 1506, 10, 4}, "ºé»ÄËéÆ¬");
--		gf_AddItemEx({2, 0, 553, 2, 4}, "´óÈË²Î¹û");
--		gf_AddItemEx({2, 1, 270, 10, 4}, "°×¾ÔÍè");
--	else
--		gf_Modify("Exp", 10000000 + 1000000*(GetLevel()-80));
--		gf_AddItemEx({2, 95, 1506, 5, 4}, "ºé»ÄËéÆ¬");
--		gf_AddItemEx({2, 0, 553, 1, 4}, "´óÈË²Î¹û");
--		gf_AddItemEx({2, 1, 270, 5, 4}, "°×¾ÔÍè");
--	end
end
