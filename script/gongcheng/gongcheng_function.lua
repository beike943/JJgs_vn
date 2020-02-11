--create date:07-04-10
--author:yanjun
--describe:¹¥³ÇÕ½Ïà¹Øº¯Êý¼¯ºÏ

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\gongcheng\\gongcheng_head.lua");

--»ñÈ¡Íæ¼ÒµÄ¹¥³ÇÕ½ÕóÓª£º¹¥³Ç·½»¹ÊÇÊØ³Ç·½
function GCZ_GetPlayerCamp()
	return GetTaskTemp(TEMP_CAMP);
end;
--»ñÈ¡µÐ·½ÕóÓªID
function GCZ_GetEnemyCamp()
	return GONGSHOU_ID - GetTaskTemp(TEMP_CAMP);
end;
--ÅÐ¶ÏÍæ¼ÒÊÇ²»ÊÇÄ³¸ö³ÇÊÐµÄ³ÉÔ±
function GCZ_IsCityMember(nCityMapID)
	if LIMIT_IGNORE == 1 then
		return 1;
	end;
	local _,_,nCityIdx = GCZ_GetCityInfo(nCityMapID);
	local szTongName = GetTongName();
	local szShouName = GCZ_GetCampNameFromRelay(nCityMapID,SHOU_ID)
	if szTongName == szShouName then
		return 1;
	else
		return 0;
	end;
end;
--µ±Ç°ÔÚÄÄ¸öÕ½³¡µØÍ¼,·µ»Ø0±íÊ¾²»ÔÚÕ½³¡µØÍ¼£¬123·Ö±ð±íÊ¾ÈªÖÝ³É¶¼ÏåÑô
function GCZ_InBattle()
	local nCityIdx = GetTaskTemp(TEMP_CITY_INDEX);
	return nCityIdx;
end;
--¼ì²éµ±Ç°×´¿ö(¹¥ÃÅºÍ¹¥³Ç½×¶Î)ÊÇ·ñ´ïµ½Ê¤ÀûÌõ¼þ
function GCZ_CheckWinCondition()
	local nCurFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	if nCurFlagCount >= FLAG_COUNT_WIN then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		SetMissionV(MV_WAR_RESULT,GONG_ID);	--ÉèÖÃ½á¹û
		local lfFunc = function(tArg)
			Say("Tr·i qua trËn chiÕn khèc liÖt, cuèi cïng bang héi <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color> ®· chiÕm lÜnh thµnh c«ng? (do bang héi <color=yellow>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> Thñ vÖ) thµnh <color=yellow>"..GetMissionS(MS_CITY_NAME).."<color>.",0);
			SetFightState(0);
			if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
				SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			else
				SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			end;
		end;
		local nBattleMapID = SubWorldIdx2ID(SubWorld);
		local szCityName,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID,nBattleMapID);
		SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
		Msg2Global("Tr·i qua trËn chiÕn khèc liÖt, cuèi cïng bang héi "..GetMissionS(MS_GONG_TONG_NAME).." chiÕm lÜnh thµnh c«ng? (do bang héi "..GetMissionS(MS_SHOU_TONG_NAME).." Thñ vÖ) -"..GetMissionS(MS_CITY_NAME));
		AddGlobalCountNews("Tr·i qua trËn chiÕn khèc liÖt, cuèi cïng bang héi <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color>chiÕm lÜnh thµnh c«ng? (do bang héi <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> Thñ vÖ) - <color=green>"..GetMissionS(MS_CITY_NAME).."<color>",1);
		PlayMusic("\\music\\themusicisnotexist.mp3",1);
		GCZ_PlaySound(GONG_ID,"¹¥³ÇÕ½Ê¤Àû.wav");
		GCZ_PlaySound(SHOU_ID,"¹¥³ÇÕ½Ê§°Ü.wav");
		WriteLog("[c«ng thµnh C«ng thµnh chiÕn]:"..GetMissionS(MS_GONG_TONG_NAME).." chiÕm lÜnh ®­îc? ("..nCurFlagCount.." kú ph­ín) do"..GetMissionS(MS_SHOU_TONG_NAME).." Thñ vÖ) -"..GetMissionS(MS_CITY_NAME)..". MSUID lµ "..GetMissionV(MV_MISSION_UID));
		return 1;
	else
		return 0;
	end;
end;
--´ÓRelay¹²ÏíÊý¾Ý¿â´¦»ñµÃ¹¥ÊØË«·½µÄ°ï»áµÄÃû×Ö
function GCZ_GetCampNameFromRelay(nCityMapID,nCamp)
	local szCityTong = GetCityWarInfo(nCityMapID, "base")
	local szGong,szShou = GetCityWarAD(nCityMapID)
	-- Èç¹ûÊØ³Ç·½ºÍÕ¼³Ç·½²»Ò»Ñù£¬»ù±¾ÉÏÊÇÓÉÓÚºÍÇøÔì³ÉµÄ£¬ÐÞ¸´Ò»ÏÂ£¬×¢Òâ£¬Èç¹û¿ªÆôÁË¶à¸ö¹¥³ÇÕ½£¬Ôò²»ÄÜÕâÑù×ö
	if szCityTong ~= nil and szCityTong ~= "" and szCityTong ~= szShou then
		if PlayerIndex > 0 then
			local szCityMap = tostring(nCityMapID)
			CustomDataSave("TongCitywar_Repair","sss",szCityMap,szGong,szCityTong)	-- ¼ÇÂ¼½«ÒªÐÞ¸ÄµÄ
			ClearRelayShareData("_TongCityWarAD",0,0,"\\script\\gongcheng\\gongcheng_function.lua","gongcheng_remove")
			szShou = szCityTong
		else																		-- ²»ÊÇÓÉPlayerµ÷ÓÃµÄ
			szShou = szCityTong
		end
	end
	
	if nCamp == GONG_ID then
		return szGong;
	elseif nCamp == SHOU_ID then
		return szShou;
	else
		return szGong,szShou;
	end;
end;

function gongcheng_remove(nResult)
	local szCityMap, szGong, szCityTong = CustomDataRead("TongCitywar_Repair")
	if nResult == 1 and szCityMap ~= nil then
		AddRelayShareData("_TongCityWarAD",0,0,"","",0,szCityMap,"ddss",0,0,szGong,szCityTong)
		CustomDataRemove("TongCitywar_Repair")
	end
end

--»ñÈ¡¹¥ÊØË«·½°ïÖ÷µÄÃû×Ö
function GCZ_GetTongHeaderName(nCamp)
	if nCamp == GONG_ID then
		return "S¬n TuyÒn N«ng Phu";
	elseif nCamp == SHOU_ID then
		return "Y Sa ¸i";
	else
		return "S¬n TuyÒn N«ng Phu","Y Sa ¸i";
	end;
end;
--»ñÈ¡³ÇÃÅÊØÎÀµÄÃû×Ö¡£²ÎÊý1£ºÕóÓª£¬²ÎÊý2£ºÃÅµÄÎ»ÖÃË÷Òý
function GCZ_GetGuardName(nCamp,nDoorIdx)
	local szEGuardName = GetName(GetMissionV(MV_GPIDX_EAST_DOOR+nCamp-1));
	local szSGuardName = GetName(GetMissionV(MV_GPIDX_SOUTH_DOOR+nCamp-1));
	local szWGuardName = GetName(GetMissionV(MV_GPIDX_WEST_DOOR+nCamp-1));
	if szEGuardName == "" then
		szEGuardName = "Ch­a";
	end;
	if szSGuardName == "" then
		szSGuardName = "Ch­a";
	end;
	if szWGuardName == "" then
		szWGuardName = "Ch­a";
	end;
	if nDoorIdx == 1 then	--ºÃÏñÐ´µÃÌ«ËÀÁË£¬Ã»°ì·¨£¬ÎªÁËÖ§³Ö·µ»ØÈý¸öÖµ
		return szEGuardName;
	elseif nDoorIdx == 2 then
		return szSGuardName;
	elseif nDoorIdx == 3 then
		return szWGuardName;
	else
		return szEGuardName,szSGuardName,szWGuardName;
	end;
end;
--»ñÈ¡³ÇÃÅÊØÎÀµÄPlayerIndex£¬²ÎÊýÍ¬GCZ_GetGuardName
function GCZ_GetGuardPlayerIndex(nCamp,nDoorIdx)
	local nEGuardIdx = GetMissionV(MV_GPIDX_EAST_DOOR+nCamp-1);
	local nSGuardIdx = GetMissionV(MV_GPIDX_SOUTH_DOOR+nCamp-1);
	local nWGuardIdx = GetMissionV(MV_GPIDX_WEST_DOOR+nCamp-1);
	if nDoorIdx == 1 then	--ºÃÏñÐ´µÃÌ«ËÀÁË£¬Ã»°ì·¨£¬ÎªÁËÖ§³Ö·µ»ØÈý¸öÖµ
		return nEGuardIdx;
	elseif nDoorIdx == 2 then
		return nSGuardIdx;
	elseif nDoorIdx == 3 then
		return nWGuardIdx;
	else
		return nEGuardIdx,nSGuardIdx,nWGuardIdx;
	end;	
end;
--¸ù¾ÝÄ³¸öÕ½³¡µØÍ¼ID»ñµÃËù¶ÔÓ¦µÄ³ÇÊÐÐÅÏ¢
function GCZ_GetCityInfo(nBattleMapID)
	for i,v in tCityInfo do
		if v[3] == nBattleMapID then
			return v[1],v[2],i;	--³ÇÊÐµØÍ¼Ãû×Ö£¬³ÇÊÐµØÍ¼ID£¬µØÍ¼Index
		end;
	end;
	return "",0,0;
end;
--¸ù¾Ý»ñÈ¡Ä³¸ö³ÇÊÐµÄµØÍ¼IDËù¶ÔÓ¦µÄÕ½³¡µØÍ¼ID
function GCZ_GetBattleMapID(nCityMapID)
	for i,v in tCityInfo do
		if v[2] == nCityMapID then
			return v[3];
		end;
	end;
	return 0;
end;
--³õÊ¼»¯ËùÓÐÄ¹µØµÄ×´Ì¬
function GCZ_InitGraveyard()
	SetMissionV(MV_GRAVEYARD_A1,GONG_ID);
	SetMissionV(MV_GRAVEYARD_A2,GONG_ID);
	SetMissionV(MV_GRAVEYARD_B1,NONE_ID);
	SetMissionV(MV_GRAVEYARD_B2,NONE_ID);
	SetMissionV(MV_GRAVEYARD_C1,NONE_ID);
	SetMissionV(MV_GRAVEYARD_C2,NONE_ID);
	SetMissionV(MV_GRAVEYARD_11,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_12,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_21,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_22,SHOU_ID);
end;
--ÉèÖÃÄ¹µØµÄ×´Ì¬
function GCZ_SetGraveyardStatus(nMSVID,nCamp,bEnable)
	local nCurStatus = GetMissionV(nMSVID);
	if nCurStatus == NONE_ID then
		if bEnable ~= 0 then
			SetMissionV(nMSVID,nCamp);
		end;
	elseif nCurStatus == ALL_ID then
		if bEnable == 0 then
			SetMissionV(nMSVID,GONGSHOU_ID-nCamp);
		end;	
	elseif nCurStatus == GONG_ID then
		if nCamp == GONG_ID and bEnable == 0 then
			SetMissionV(nMSVID,NONE_ID);
		elseif nCamp == SHOU_ID and bEnable ~= 0 then
			SetMissionV(nMSVID,ALL_ID);
		end;	
	elseif nCurStatus == SHOU_ID then
		if nCamp == GONG_ID and bEnable ~= 0 then
			SetMissionV(nMSVID,ALL_ID);
		elseif nCamp == SHOU_ID and bEnable == 0 then
			SetMissionV(nMSVID,NONE_ID);
		end;
	end;
end;
--³õÊ¼»¯Trapµã×´Ì¬
function GCZ_InitTrap()
	SetMissionV(MV_TRAP_EAST_DOOR,ALL_ID);
	SetMissionV(MV_TRAP_WEST_DOOR,ALL_ID);
	SetMissionV(MV_TRAP_SOUTH_DOOR,ALL_ID);
end;
--´´½¨Trapµã
function GCZ_CreateTrap(nMapID)
	for i=1,32 do	--Î÷ÃÅTRAPµã
		AddMapTrap(nMapID,(1056+i)*32,(2803+i)*32,"\\script\\gongcheng\\trap\\westdoor_trap.lua")
		AddMapTrap(nMapID,(1052+i)*32,(2802+i)*32,"\\script\\gongcheng\\trap\\westdoor_trap.lua")
	end;
	for i=1,31 do	--ÄÏÃÅTRAPµã
		AddMapTrap(nMapID,(1182+i)*32,(2868+i)*32,"\\script\\gongcheng\\trap\\southdoor_trap.lua");
		AddMapTrap(nMapID,(1182+i)*32,(2867+i)*32,"\\script\\gongcheng\\trap\\southdoor_trap.lua");
	end;
	for i=1,30 do	--¶«ÃÅTRAPµã
		AddMapTrap(nMapID,(1251+i)*32,(2996+i)*32,"\\script\\gongcheng\\trap\\eastdoor_trap.lua");
		AddMapTrap(nMapID,(1251+i)*32,(2995+i)*32,"\\script\\gongcheng\\trap\\eastdoor_trap.lua");
	end;
	for i=1,35 do	--Î÷ÃÅµ¥Ìô³¡µØTRAPµã
		AddMapTrap(nMapID,986*32,(2927-i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--¹¥·½
		AddMapTrap(nMapID,1044*32,(2755+i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--ÊØ·½
		AddMapTrap(nMapID,1416*32,(2950+i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--´«³ö
	end;
	for i=1,20 do	--ÄÏÃÅµ¥Ìô³¡µØTRAPµã
		AddMapTrap(nMapID,(1072+i)*32,2977*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
		AddMapTrap(nMapID,(1255+i)*32,2880*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
		AddMapTrap(nMapID,1369*32,(2999+i)*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
	end;
	for i=1,25 do	--¶«ÃÅµ¥Ìô³¡µØTRAPµã
		AddMapTrap(nMapID,(1161+i)*32,(3077+i)*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
		AddMapTrap(nMapID,(1296+i)*32,3022*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
		AddMapTrap(nMapID,1321*32,(3048+i)*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
	end;
	for i=1,22 do		--Î÷ÇÅTRAPµã
		AddMapTrap(nMapID,(1011+i)*32,(2870+i)*32,"\\script\\gongcheng\\trap\\bridge_west_trap.lua");
		AddMapTrap(nMapID,(1011+i)*32,(2871+i)*32,"\\script\\gongcheng\\trap\\bridge_west_trap.lua");	
	end;		
	for i=1,24 do		--ÄÏÇÅTRAPµã
		AddMapTrap(nMapID,(1143+i)*32,(2922+i)*32,"\\script\\gongcheng\\trap\\bridge_south_trap.lua");
		AddMapTrap(nMapID,(1143+i)*32,(2923+i)*32,"\\script\\gongcheng\\trap\\bridge_south_trap.lua");	
	end;
	for i=1,24 do		--¶«ÇÅTRAPµã
		AddMapTrap(nMapID,(1212+i)*32,(3050+i)*32,"\\script\\gongcheng\\trap\\bridge_east_trap.lua");
		AddMapTrap(nMapID,(1212+i)*32,(3051+i)*32,"\\script\\gongcheng\\trap\\bridge_east_trap.lua");		
	end;
end;
--´´½¨Õ½³¡Ïà¹ØNpc
function GCZ_CreateNpc(nMapID)
	local nNpcIdx = CreateNpc("V­¬ng An Th¹ch","C«ng thµnh Tham M­u",nMapID,1137,3145);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\gongchengcanmou_npc.lua");
	nNpcIdx = CreateNpc("V­¬ng An Th¹ch","Thñ thµnhTham m­u",nMapID,1450,2583);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\shouchengcanmou_npc.lua");
	nNpcIdx = CreateNpc("V­¬ng An Th¹ch","TËp kÕt quan",nMapID,1126,3144);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\chuansong_npc.lua");
	nNpcIdx = CreateNpc("V­¬ng An Th¹ch","TËp kÕt quan",nMapID,1458,2593);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\chuansong_npc.lua");	
	for i=1,getn(tChengMenJiGuanPos) do
		nNpcIdx = CreateNpc(tChengMenJiGuanPos[i][4],tChengMenJiGuanPos[i][3],nMapID,tChengMenJiGuanPos[i][1],tChengMenJiGuanPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\chengmenjiguan_death.lua");		
		SetMissionV(MV_EAST_JIGUAN_INDEX+i-1,nNpcIdx);
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
	GCZ_CreateNormalFlag(nMapID);
	GCZ_CreateReviviFlag(nMapID);
end;
--¼ì²éÍæ¼ÒÊÇ·ñÂú×ãËùÐèµÄÖ°Î»ºÍÌìÊýÒªÇó
--nTongJob:0£ºÎ´Èë°ï 1£º°ïÖ÷ 2£º¸±°ïÖ÷ 3£º³¤ÀÏ 4£ºÌÃÖ÷ 5£ºÏãÖ÷ 6£ºÆÕÍ¨³ÉÔ±
function GCZ_CheckPlayerRight(nTongJob,nDayCount)
	if LIMIT_IGNORE == 1 then
		return 1;
	end;
	local nCurJob = IsTongMember();
	if nCurJob == 0 then
		return 0;
	end;
	local nCurDayCount = GCZ_GetOnJobDayCount();
	if nCurJob <= nTongJob and nCurDayCount >= nDayCount then
		return 1;
	end;
	return 0;
end;
--»ñÈ¡¶ÓÎéÀïÃæÐÂµÄÔ®¾üµÄÊýÁ¿
function GCZ_GetTeamReinforcementCount(nCamp,nBattleMapID)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local nCounter = 0;
	local nNewCounter = 0;
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	local szCampName = GCZ_GetCampNameFromRelay(nCityMapID,nCamp);
	local nCurMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	if nTeamSize > 0 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			--Èç¹ûÊÇÍâÔ®
			if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
				nCounter = nCounter + 1;
				--Ö®Ç°Ã»½øÈ¥¹ý±¾ÕóÓªµÄÍâÔ®
				if GetTask(TNC_MUID) ~= nCurMUID or GetTask(TNC_CAMP) ~= nCamp then
					nNewCounter = nNewCounter + 1;
				end;
			end;
		end;
	else	--´¦ÀíÒ»ÏÂÃ»×é¶ÓµÄÇé¿ö
		--Èç¹ûÊÇÍâÔ®
		if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
			nCounter = nCounter + 1;
			--Ö®Ç°Ã»½øÈ¥¹ýµÄÍâÔ®
			if GetTask(TNC_MUID) ~= nCurMUID then
				nNewCounter = nNewCounter + 1;
			end;
		end;	
	end;
	PlayerIndex = nOldPlayerIdx;
	return nCounter,nNewCounter;
end;
--ÅÐ¶ÏÍæ¼ÒÊÇ²»ÊÇÄ³¸öÄ¿±êµØÍ¼ÉÏµÄÄ³¸öÕóÓªµÄÍâÔ®
function GCZ_IsReinforcement(nCamp,nBattleMapID)
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	local szCampName = GCZ_GetCampNameFromRelay(nCityMapID,nCamp);
	local szTongName = GetTongName();
	if szTongName ~= szCampName or GCZ_CheckPlayerRight(6,LEAST_STAY_DAY) == 0 then	--Èç¹û²»ÊÇµ±Ç°µØÍ¼°ï»á»òÈ¨Àû²»¹»µÄ»°¾ÍÊÇÍâÔ®
		return 1;
	end;
end;
--»ñµÃ¶ÓÎéÀïÃæÄ³¸öÂ·ÏßµÄÍæ¼ÒµÄÊýÁ¿
function GCZ_GetTeamRouteCount(nRoute)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local nCounter = 0;
	if nTeamSize > 0 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetPlayerRoute() == nRoute then
				nCounter = nCounter + 1;
			end;
		end;
	else	--´¦ÀíÒ»ÏÂÃ»×é¶ÓµÄÇé¿ö
		if GetPlayerRoute() == nRoute then
			nCounter = nCounter + 1;
		end;	
	end;
	PlayerIndex = nOldPlayerIdx;
	return nCounter;
end;
--¼ÓÈëÐÂµÄÕ½³¡µÄÊ±ºòËùÖ´ÐÐµÄº¯Êý£¬Ö÷ÒªÊÇÇå³ýÒ»Ð©Õ½³¡±äÁ¿
function GCZ_NewBattleClear()
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nCurMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	local nMyMUID = GetTask(TNC_MUID);
	if nMyMUID ~= nCurMUID then	--Èç¹ûMUID²»ÏàÍ¬¾Í±íÊ¾µ±Ç°Òª¼ÓÈëµÄÊÇÐÂµÄÕ½³¡
		for i=TNC_BEGIN,TNC_END do
			SetTask(i,0);
		end;
	end;
end;
--´´½¨²»¿ÉÖØÉúµÄÆì×Ó
function GCZ_CreateNormalFlag(nMapID)
	local nNpcIdx = 0;
	for i=1,getn(tNormalFlagPos) do
		nNpcIdx = CreateNpc(tNormalFlagPos[i][4],tNormalFlagPos[i][3],nMapID,tNormalFlagPos[i][1],tNormalFlagPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\flag_normal_death.lua");
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		SetMissionV(MV_NORMAL_FLAG1_OWNER+i-1,SHOU_ID);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
end;
--´´½¨¿ÉÖØÉúµÄÆì×Ó
function GCZ_CreateReviviFlag(nMapID)
	local nNpcIdx = 0;
	for i=1,getn(tReviviFlagPos) do
		nNpcIdx = CreateNpc(tReviviFlagPos[i][5],tReviviFlagPos[i][3].."(Phe Thñ thµnh)",nMapID,tReviviFlagPos[i][1],tReviviFlagPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\flag_revivi_death.lua");
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		SetMissionV(MV_REVIVI_FLAG1_OWNER+i-1,SHOU_ID);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
end;
--¸ù¾Ý¿ÉÖØÉúÆì×ÓµÄXY×ø±ê»ñµÃËüµÄË÷Òý
function GCZ_GetReviviFlagIndex(nNpcIdx)
	local nPosNum = getn(tReviviFlagPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--¸ù¾Ý²»¿ÉÖØÉúÆì×ÓµÄXY×ø±ê»ñµÃËüµÄË÷Òý
function GCZ_GetNormalFlagIndex(nNpcIdx)	
	local nPosNum = getn(tNormalFlagPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--¸ù¾Ý³ÇÃÅ»ú¹ØµÄXY×ø±ê»ñµÃËüµÄË÷Òý
function GCZ_GetChengMenJiGuanIndex(nNpcIdx)
	local nPosNum = getn(tChengMenJiGuanPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--»ñµÃÔÚÎ»µÄÌìÊý
function GCZ_GetOnJobDayCount()
	if LIMIT_IGNORE == 1 then
		return 8;
	end;
	local nAssignTime = GetLastAssignTime();
	if nAssignTime == 0 then	--Èç¹ûÃ»ÓÐ¼ÓÈë°ï»á
		return 0;
	end;
	local nDayCount = floor((GetTime()-nAssignTime)/(3600*24));
	return nDayCount;
end;
--»ñµÃ¼ÓÈë°ï»áµÄÌìÊý
function GCZ_GetJoinTongDayCount()
	if LIMIT_IGNORE == 1 then
		return LEAST_STAY_DAY;
	end;
	local nJoinTime = GetJoinTongTime();
	if nJoinTime == 0 then	--Èç¹ûÃ»ÓÐ¼ÓÈë°ï»á
		return 0;
	end;
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	return nDayCount;
end;
--»ñÈ¡Ä³Ò»·½µÄÈËÊýÐÅÏ¢¡£·µ»ØÖµ£º×ÜÈËÊý£¬Õý¹æ±øÈËÊý£¬ÍâÔ®ÈËÊý
function GCZ_GetCampPlayerCount(nCamp,nBattleMapID)
	local nNormalSoldier = mf_GetPlayerCount(MISSION_ID,nCamp,nBattleMapID) or 0;
	local nReinforcement = mf_GetPlayerCount(MISSION_ID,nCamp+2,nBattleMapID) or 0;
	return (nNormalSoldier+nReinforcement),nNormalSoldier,nReinforcement;
end;
--·â×°µÄMsg2MSGroup
function GCZ_Msg2Camp(szMsg,nCamp)
	if nCamp == ALL_ID then
		Msg2MSAll(MISSION_ID,szMsg);
	else
		Msg2MSGroup(MISSION_ID,szMsg,nCamp);
		Msg2MSGroup(MISSION_ID,szMsg,nCamp+2);
	end;
end;
--²¥·ÅÒ»¸öwavÎÄ¼þ
function GCZ_PlaySound(nCamp,szWavFileName)
	local lfFunc = function(tArg)
		PlaySound("\\sound\\"..%szWavFileName);
	end;
	if nCamp == ALL_ID then
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
	else
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp+2);	
	end;
end;
--¸øÄ³Ò»¸öÕóÓª²¥·ÅÒ»¸ömp3ÎÄ¼þ
function GCZ_PlayMusic(nCamp,szMusicFileName)
	local lfFunc = function(tArg)
		PlayMusic("\\music\\"..%szMusicFileName,1);
	end;
	if nCamp == ALL_ID then
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
	else
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp+2);
	end;
end;
--¸ù¾Ýµ±Ç°¹¥·½Õ¼ÁìµÄÆì×ÓÊýÁ¿ÉèÖÃ¹¥ÊØË«·½µÄ±³¾°ÒôÀÖ×´Ì¬
--·µ»ØÖµ£º-1£¬Á½¸ö¶¼²»²¥£¬0Á½¸ö¶¼²¥£¬1²¥¹¥·½£¬2²¥ÊØ·½
function GCZ_SetMusicState()
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	local nCurGongMusic = GetMissionV(MV_CUR_MUSIC_GONG);
	local nCurShouMusic = GetMissionV(MV_CUR_MUSIC_SHOU);
	local nNeedGongMusic = 0;
	local nNeedShouMusic = 0;
	if nFlagCount == 0 then	
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_WEIJI);
		nNeedGongMusic = MUSIC_WEIJI;
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_YOUSHI);	
		nNeedShouMusic = MUSIC_YOUSHI
	elseif nFlagCount <= 5 then	
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_JIANG);
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_JIANG);	
		nNeedGongMusic = MUSIC_JIANG;
		nNeedShouMusic = MUSIC_JIANG;
	else
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_YOUSHI);
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_WEIJI);	
		nNeedGongMusic = MUSIC_YOUSHI;
		nNeedShouMusic = MUSIC_WEIJI;
	end;
	if nCurGongMusic == nNeedGongMusic and nCurShouMusic == nNeedShouMusic then
		return NONE_ID;	--Ë«·½ÒôÀÖ¶¼Ã»¸Ä±ä
	elseif nCurGongMusic ~= nNeedGongMusic and nCurShouMusic == nNeedShouMusic then
		return GONG_ID;	--¹¥·½±äÁË£¬ÊØ·½Ã»±ä
	elseif nCurGongMusic == nNeedGongMusic and nCurShouMusic ~= nNeedShouMusic then
		return SHOU_ID;	--¹¥·½Ã»±ä£¬ÊØ·½±äÁË
	else
		return ALL_ID;	--Ë«·½¶¼±äÁË
	end;
end;
--¸ù¾Ýµ±Ç°Çé¿öÀ´²¥·ÅÏàÓ¦µÄ±³¾°ÒôÀÖ
function GCZ_PlayBackGroundMusic(nCamp)
	if nCamp == NONE_ID then
		return 0;
	end;
	if nCamp == ALL_ID then
		GCZ_PlayMusic(GONG_ID,tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG)]);
		GCZ_PlayMusic(SHOU_ID,tMusicFileName[GetMissionV(MV_CUR_MUSIC_SHOU)]);
	else
		GCZ_PlayMusic(nCamp,tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG+nCamp-1)]);
	end;
	return 1;
end;
--¼ì²éËùÓÐµÄ³ÇÃÅ»ú¹ØÊÇ·ñ±»ÆÆ»µ
function GCZ_CheckAllDoor()
	for i=MV_DESTROY_EAST_DOOR,MV_DESTROY_WEST_DOOR do
		if GetMissionV(i) == 0 then
			return 0;
		end;
	end;
	return 1;
end;
--×ªµ½¹¥ÃÅ½×¶Î
function GCZ_ComeToGongmeng()
		if GetMissionV(MV_MISSION_STATE) >= MS_STATE_GONGCHENG then
			return 0;
		end;
		SetMissionV(MV_MISSION_STATE,MS_STATE_GONGCHENG);
		SetMissionV(MV_TIMER_LOOP,GONGCHENG_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,GONGCHENG_TIMER_INTERVAL*FRAME_PER_MIN);
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);
		GCZ_PlaySound(ALL_ID,"¹¥ÃÅ½áÊø.wav");
		Msg2MSAll(MISSION_ID,"chuyÓn ®Õn giai ®o¹n C«ng thµnh ");
end;
--»Ö¸´ËùÓÐÉúÃüºÍÄÚÁ¦
function GCZ_RestoreAll()
	Restore();
	RestoreNeili();
	ClearColdDown();	--Çå³ýËùÓÐÒ©CD
end;
function nothing()

end;
