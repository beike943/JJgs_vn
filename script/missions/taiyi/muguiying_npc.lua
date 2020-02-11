Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\system_switch_config.lua")

g_szNpcName = "<color=green>Tiªn Phong Méc QuÕ Anh:<color>";

function main()
	if _check_subsystem_open(SYS_SWITCH_TAIYI, 2) ~= 1 then
		return 0;
	end
	local szName;
	local strTab = {
		format("Ta muèn tham gia Ph¹n Thiªn L©m-Anh Hïng (Tèn %s)/Talk_1", "Tinh Lùc*"..TYT_JOIN_COST_JINGLI[1][2]),
		format("Ta muèn tham gia Ph¹n Thiªn L©m-Anh Hïng (§éi tr­ëng tèn %s)/Talk_1_IB", TYT_JOIN_COST_ITEM[1][2][2].."*"..TYT_JOIN_COST_ITEM[1][2][1][4]),
		--format("ÎÒÒª²Î¼ÓÓ¢ÐÛÄÑ¶ÈµÄÌ«Ò»Ëþ(ÏûºÄ%s)/Talk_2", "¾«Á¦*"..TYT_JOIN_COST_JINGLI[2][2]),
		--format("ÎÒÒª²Î¼ÓÓ¢ÐÛÄÑ¶ÈµÄÌ«Ò»Ëþ(¶Ó³¤ÏûºÄ%s)/Talk_2_IB", TYT_JOIN_COST_ITEM[2][2][2].."*"..TYT_JOIN_COST_ITEM[2][2][1][4]),
		--"Ì«Ò»ËþÏµÁÐ¹Ø¿¨Ó¢ÐÛÄÑ¶È²Î¼ÓÌõ¼þ/Talk_5",
		"¶i Th¸i NhÊt Th¸p céng thªm s¸t th­¬ng/Talk_6",
		"Hñy bá/nothing",
	};
	
	if GetSex() == 1 then
		szName = "§¹i hiÖp";
	elseif GetSex() == 2 then
		szName = "N÷ hiÖp ";
	end
	Say(format(g_szNpcName.."TrËn chiÕn Kim Sa Than, D­¬ng LÖnh C«ng bÞ gian th©n Phan Mü b¸n ®øng nªn ®· d­íi tay cña qu©n liªu, vµ hi sinh n¬i ®Êt Liªu.Sau khi biÕt tin D­¬ng NghiÖp ®­îc an t¸ng t¹i n¬i cã tªn lµ Th¸i NhÊt Th¸p, th× ta vµ QuÐ Anh phông lÖnh x«ng vµo Th¸i NhÊt Th¸p ®Ó t×m hµi cèt vµ béi ®ao Hoang Háa L­u Kim cña LÖnh C«ng. Th¸i NhÊt Th¸p nµy c¬ quan trïng trïng, %s ®· s½n sµng ch­a?", szName), getn(strTab), strTab);
end

function Talk_1()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.HARD) then return 0; end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph¹n Thiªn L©m ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	SetGlbValue(GLB_TASKID, GetGlbValue(GLB_TASKID) + 1);
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 2, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 42, GetPlayerRoute(), 1);		
	end);
end

function Talk_1_IB()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.HARD) then return 0; end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph¹n Thiªn L©m ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	SetGlbValue(GLB_TASKID, GetGlbValue(GLB_TASKID) + 1);
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 3, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 42, GetPlayerRoute(), 1);		
	end);
end

function _checkOpenTime()
	--do return 1 end--Ìå·þ²ßÂÔ
	
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay~=3 and nWeekDay~=6 and nWeekDay~=0 then
		Talk(1, "", g_szNpcName..format("Th¸i NhÊt Th¸p_Anh Hïng më thø [%s] h»ng tuÇn", "Thø 4, thø 7, chñ nhËt"));
		return 0
	end
	return 1
end

function TY_ChargeTicket()
	SetTask(TASKID_TAIYI_TICKET, GetTask(TASKID_TAIYI_TICKET) - 1);
end

function Talk_2()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Th¸i NhÊt Th¸p ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_2_IB()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Th¸i NhÊt Th¸p ®ang rÊt chËt chéi, h·y quay l¹i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
end

function TY_Enter(nCamp)
	self.msOption:check(nCamp);
	local m,x,y = self.msPosition:getEntryPos(nCamp);
	CleanInteractive();--ÔÚNewWorldÇ°½âÉ¢Ë«ÈË»¥¶¯¶¯×÷
	NewWorld(nMapId, tPlayerPos[4][1], tPlayerPos[4][2]);
end

function Talk_6()
	local msg = "";
	tRouteList.n = nil;
	
	if 1 == _JX2WZ then
		for k,v in tRouteList do
			msg = msg..format("%-16s s¸t th­¬ng céng thªm: <color=yellow>%d%%<color>\n",tList[k], tRouteList[k][2][1]);
		end
	else
		for k,v in tRouteList do
			if k <= 21 or k == 31 or k == 32 or k == 23 then
				msg = msg..format("%-16s s¸t th­¬ng céng thªm: <color=yellow>%d%%<color>\n",tList[k], tRouteList[k][2][2]);
			end
		end
	end
	suTalk("main", g_szNpcName.."¶i Th¸i NhÊt Th¸p s¸t th­¬ng c¸c ph¸i céng thªm nh­ sau\n"..msg);
end

function Talk_5()
	suSay(g_szNpcName.."Trong Th¸i NhÊt Th¸p ch¾c cã c¬ quan trïng trïng, rÊt nguy hiÓm, ®¹i hiÖp ®· chuÈn bÞ s½n sµng ch­a? §iÒu kiÖn ®i vµo cöa ¶i bao gåm: \n	  cÇn tæ ®éi ®i vµo, thµnh viªn tæ ®éi lµ 4-8 ng­êi; \n	  sè l­u ph¸i tæ ®éi >= 4; \n	  ®¼ng cÊp tÊt c¶ gamer trong tæ ®éi >=90; \n	  tÊt c¶ gamer trong tæ ®éi ®· gia nhËp m«n ph¸i;", 2, "trë l¹i/main", "KÕt thóc/nothing");
end
