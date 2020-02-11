Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
Include("\\script\\newbattles\\mainbattle\\position.lua");

function InitMission()
	BT_InitBattle();
	local sCampName1,sCampName2 = "Tèng","Liªu";
	local sModelName1,sModelName2 = "Tèng T­íng Qu©n","Vâ t­íng Liªu_®èi tho¹i";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "Liªu";
		sCampName2 = "Tèng";
		sModelName1 = "Vâ t­íng Liªu_®èi tho¹i";
		sModelName2 = "Tèng T­íng Qu©n";
	end;
	local npcIndex = CreateNpc(sModelName1,sCampName1.."Chñ so¸i",MAPID,1534,3745);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."Chñ so¸i",MAPID,1961,3735);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName1.."Qu©n nhu quan",MAPID,1512,3754);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName2.."Qu©n nhu quan",MAPID,1985,3746);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1571,3735);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\soldier_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1924,3725);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\soldier_npc.lua");
	--==================ÒÔÏÂÊÇ½Ý¾¶µÄTRAPµã====================================================
	for i=0,45 do	--×ó±ßµÄTRAPµã
		AddMapTrap(MAPID,1669*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
		AddMapTrap(MAPID,1670*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
	end;
	for i=0,40 do	--ÓÒ±ßµÄTRAPµã
		AddMapTrap(MAPID,1828*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
		AddMapTrap(MAPID,1829*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
	end;
	--========================================================================================
	SetMissionV(MV_MID_TRAP_SONG,1);	--¿ÉÒÔ×ßÖÐÓª
	SetMissionV(MV_MID_TRAP_LIAO,1);
	local nEmplacementCamp = GetGlbValue(GLB_EMPLACEMENT);
	if nEmplacementCamp == SONG_ID then
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nEmplacementCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
	end;
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th¸m tö håi b¸o, ®Þch ph­¬ng ®· hµnh ®éng, t­íng sÜ phe ta nhanh chãng vµo trong chuÈn bÞ t¸c chiÕn.");
	
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,LIAO_ID);
	
	local nVillageCamp = GetGlbValue(GLB_VILLAGE);
	local nEmplacementCamp = GetGlbValue(GLB_EMPLACEMENT);
	local nResourceCamp = GetGlbValue(GLB_RESOURCE);
	WriteLog("[ChiÕn tr­êng]: ChiÕn tr­êng chÝnh ®· b¾t ®Çu, kÕt qu¶ phô: Th«n trang ("..nVillageCamp.."), Th¶o cèc ("..nResourceCamp.."), Ph¸o ®µi ("..nResourceCamp..")");
	Create_Emplacement(ALL_ID,nEmplacementCamp);	--¹«¹²ÅÚÌ¨ÊôÓÚÅÚÌ¨Õ½Ó®µÄÒ»·½£¨Æ½ÊÖ¾ÍÊÇ¹«¹²µÄÀ²£©
	if GetGlbValue(RANDOM_PLACE) == 1 then
		Create_Emplacement(SONG_ID,LIAO_ID);
		Create_Emplacement(LIAO_ID,SONG_ID);
	else
		Create_Emplacement(SONG_ID,SONG_ID);
		Create_Emplacement(LIAO_ID,LIAO_ID);	
	end;
	
	SetMissionV(MV_HERO_DEATH,1);	--³õÊ¼»¯ÍÁÃñÊ×ÁìºÍÆæÈËÒìÊ¿ÊýÄ¿
	SetMissionV(MV_HEADER_DEATH,1);

	Create_VillagerHeader(nVillageCamp);
	Create_Villager(nVillageCamp);
	Create_Refugee(SONG_ID,REFUGEE_COUNT);
	Create_Refugee(LIAO_ID,REFUGEE_COUNT);
	Create_Refugee_Receiver(SONG_ID);
	Create_Refugee_Receiver(LIAO_ID);
	--Create_Assistant_Hirer(SONG_ID);
	--Create_Assistant_Hirer(LIAO_ID);
	Create_Box();
	Create_Nonaligned_Hero();
	Create_ArrowBuilding();
	
	StartMissionTimer(MISSION_ID,INJURE_TIMER_ID,INTERVAL_TIME);
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--ÉèÖÃÎª½áÊø×´Ì¬£¬ÔÚÕâÀïÉèÖÃÊÇÎªÁË·½±ã²âÊÔÊ±Ö±½ÓÓÃCloseMission½áÊøÕ½³¡
	--ÕâÀïÒª¸ù¾ÝMV_WHO_WINµÄMission±äÁ¿ÖµÀ´¼ÇÂ¼Õâ³¡Õ½ÕùµÄÊ¤¸ºÇé¿ö£¬Ê¹ÓÃ·þÎñÆ÷±äÁ¿
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == ALL_ID then
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, Tèng-Liªu ®«i bªn bÊt ph©n th¾ng b¹i t¹i Nh¹n M«n Quan-chiÕn dÞch chÝnh!");
	elseif nWhoWin == SONG_ID then
		Msg2SubWorld("Qua nh÷ng håi giao tranh ¸c liÖt, phe Tèng giµnh th¾ng lîi chung cuéc t¹i Nh¹n M«n Quan-chiÕn dÞch chÝnh!");
	else
		Msg2SubWorld("ChiÕn dÞch chÝnh Nh¹n M«n Quan: phe Liªu giµnh th¾ng lîi chung cuéc!");
	end;
	SetGlbValue(GLB_MAINBATTLE,GetMissionV(MV_WINNER));
	StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nDeathSong = GetMissionV(MV_DEATH_COUNT_SONG);
	local nDeathLiao = GetMissionV(MV_DEATH_COUNT_LIAO);
	local nHelpRefugeeSong = GetMissionV(MV_HELP_REFUGEE_COUNT_SONG);
	local nHelpRefugeeLiao = GetMissionV(MV_HELP_REFUGEE_COUNT_LIAO);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddddddd",nWhoWin,nPubPointSong,nPubPointLiao,nHelpRefugeeSong,nHelpRefugeeLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
	BT_BattleAllOver();
end;

function OnLeave(RoleIndex)	--×¢Òâ¶ÔÔÚ´òÕÌ¹ý³ÌÖÐÀëÏßµÄ´¦Àí
	PlayerIndex = RoleIndex;
	local nCamp = BT_GetCamp();
	local nRefugeeModel = {"N¹n d©n Tèng","N¹n d©n Liªu"};
	BT_ShowDebugInfor("TrÞ GetMissionV(MS_BATTLE_STATE):"..GetMissionV(MS_BATTLE_STATE));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then	--ÔÚÕ½Õù½øÐÐÊ±Àë¿ª
		BT_ShowDebugInfor("TrÞ BT_GetTempData(PTT_FOLLOWER):"..BT_GetTempData(PTT_FOLLOWER));
		if BT_GetTempData(PTT_FOLLOWER) == 1 then
			local szNpcName = "";
			if nCamp == SONG_ID then
				szNpcName = "N¹n d©n Tèng";
			else
				szNpcName = "N¹n d©n Liªu";
			end;	
			local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],szNpcName,GetWorldPos());
			SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle\\refugee_talk_npc.lua");
			BT_ShowDebugInfor("LËp 1 n¹n d©n, h­íng dÉn:"..nRefugeeIndex)
			BT_SetData(PT_HAVE_REFUGEE,1)
		end;
		BT_ShowDebugInfor("ë ®©y xãa theo sau ®Êy!!!!!")
		KillFollower()	--ÄÑÃñµôÂä
		BT_SetTempData(PTT_FOLLOWER,0);	--Àë¿ªµÄÊ±ºòÇåµô¾Í¶ÔÀ²
	end;
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE or BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--Èç¹ûÔÚµ¥ÌôµÄÊ±ºòÀë¿ªÁËÕ½³¡,ÕâÀïÊ¹ÓÃÁ½¸öÌõ¼þ×÷±£Ö¤
		local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
		local sName = GetName();
		local nEnemyCamp = 3 - nCamp;
		local nOffset1 = (nRoomIndex-1)*2+nCamp-1;	
		local nOffset2 = (nRoomIndex-1)*2+nEnemyCamp-1;
		local nDeathRank = abs(BT_GetData(PT_CURRANK));	--ÍË³ö¾Íµ±ÊÇ±»É±ËÀÁË
		if nDeathRank == 0 then
			nDeathRank = 1;
		end;
		local nRankPoint = tKillPlayerPoint[nDeathRank];
		if GetMissionV(MV_FIGHTER_GROUP1_1+nOffset1) ~= 0 or GetMissionV(MV_FIGHTER_GROUP1_1+nOffset2,0) ~= 0 then	--µÚÒ»¸öÍË³öµÄ
			BT_SetData(PT_SINGLE_LOSE,BT_GetData(PT_SINGLE_LOSE)+1);
			BT_DecPersonalPoint(2*ceil(nRankPoint/3));	--¿Û³ý¸öÈË»ý·Ö2/3µÄÏàÓ¦¸öÈË»ý·Ö
			
			PlayerIndex = GetMissionV(MV_FIGHTER_GROUP1_1+nOffset2);	--ÁôÔÚ³¡ÉÏµÄÈË»ñÊ¤
			BT_SetData(PT_SINGLE_WIN,BT_GetData(PT_SINGLE_WIN)+1);
			SetRankPoint(RANK_SINGLE_FIGHT,BATTLE_OFFSET+PT_SINGLE_WIN,0);
			BT_EmperorAward(3);	--µ¥ÌôÊ¤ÕßÓÐ£³£¥µÄ»ú»á»ñµÃ»ÊµÛ¼Î½±
			BT_AddPersonalPoint(2*nRankPoint);	--¸øÓèÉ±ÊÖÒ»¶¨µÄË«±¶¸öÈË»ý·Ö
			BT_AddMissionPoint(BT_GetCamp(),2*nRankPoint);		--¸øÓèÉ±ÊÖ·½Ò»¶¨µÄ¹«¹²»ý·Ö
			
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_END);	
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_END);
			Say(sName.." tho¸t khái trß ch¬i, phÇn th¾ng ®¬n ®Êu thuéc vÒ b¹n!",0);
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),14);
			SetFightState(0);
			Restore();
			RestoreNeili();
			
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset1,0);	--µÚÒ»¸öÈËÍË³öµÄÊ±ºò°ÑÁ½¸ö±äÁ¿¶¼Çå0,ÕâÑù¾Í¿ÉÒÔÍæ¼ÒÅÐ¶ÏÊÇ²»ÊÇµÚ¶þ¸öÈËÍË³ö
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset2,0);
		else
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);	--µÚ¶þ¸öÍË³öµÄÊ±ºòÒª°Ñ·¿¼ä±ê¼ÇÎª¿ÕÏÐ×´Ì¬ÒÔ±ãºóÀ´ÈË½øÈë
		end;
	end;
	PlayerIndex = RoleIndex;
	BT_LeaveBattle();
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;