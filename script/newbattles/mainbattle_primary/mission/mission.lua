Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");
Include("\\script\\newbattles\\mainbattle_primary\\position.lua");

function InitMission()
	BT_InitBattle();
	local sCampName1,sCampName2 = "Tèng","Liªu";
	local sModelName1,sModelName2 = "Tèng T­íng Qu©n","Vâ t­íng Liªu_®èi tho¹i";
	local npcIndex = CreateNpc(sModelName1,sCampName1.."Chñ so¸i",MAPID,1534,3745);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle_primary\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."Chñ so¸i",MAPID,1961,3735);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle_primary\\maingeneral_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName1.."Qu©n nhu quan",MAPID,1512,3754);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("R­¬ng ®å Trung Nguyªn",sCampName2.."Qu©n nhu quan",MAPID,1985,3746);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1571,3735);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle_primary\\soldier_npc.lua");
	npcIndex = CreateNpc("VÖ binh thµnh m«n","Binh sÜ",MAPID,1924,3725);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle_primary\\soldier_npc.lua");
	--==================ÒÔÏÂÊÇ½İ¾¶µÄTRAPµã====================================================
	for i=0,45 do	--×ó±ßµÄTRAPµã
		AddMapTrap(MAPID,1669*32,(3650+i)*32,"\\script\\newbattles\\mainbattle_primary\\trap_royal_road.lua");
		AddMapTrap(MAPID,1670*32,(3650+i)*32,"\\script\\newbattles\\mainbattle_primary\\trap_royal_road.lua");
	end;
	for i=0,40 do	--ÓÒ±ßµÄTRAPµã
		AddMapTrap(MAPID,1828*32,(3650+i)*32,"\\script\\newbattles\\mainbattle_primary\\trap_royal_road.lua");
		AddMapTrap(MAPID,1829*32,(3650+i)*32,"\\script\\newbattles\\mainbattle_primary\\trap_royal_road.lua");
	end;
	--========================================================================================
	SetMissionV(MV_MID_TRAP_SONG,1);	--¿ÉÒÔ×ßÖĞÓª
	SetMissionV(MV_MID_TRAP_LIAO,1);
	local nEmplacementCamp = GetGlbValue(GLB_EMPLACEMENT);
	if nEmplacementCamp == SONG_ID then
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nEmplacementCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
	end;
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"Th¸m tö håi b¸o, ®Şch ph­¬ng ®· hµnh ®éng, t­íng sÜ phe ta nhanh chãng vµo trong chuÈn bŞ t¸c chiÕn.");
	
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,LIAO_ID);
	
	local nVillageCamp = 0;	--³õ¼¶Õ½³¡²»µ¼ÈëĞ¡Õ½³¡½á¹û
	local nEmplacementCamp = 0;
	local nResourceCamp = 0;

	Create_Emplacement(ALL_ID,nEmplacementCamp);	--¹«¹²ÅÚÌ¨ÊôÓÚÅÚÌ¨Õ½Ó®µÄÒ»·½£¨Æ½ÊÖ¾ÍÊÇ¹«¹²µÄÀ²£©
	Create_Emplacement(SONG_ID,SONG_ID);
	Create_Emplacement(LIAO_ID,LIAO_ID);	
	
	SetMissionV(MV_HERO_DEATH,1);	--³õÊ¼»¯ÍÁÃñÊ×ÁìºÍÆæÈËÒìÊ¿ÊıÄ¿
	SetMissionV(MV_HEADER_DEATH,1);

	Create_VillagerHeader(nVillageCamp);
	Create_Villager(nVillageCamp);
	Create_Refugee(SONG_ID,REFUGEE_COUNT);
	Create_Refugee(LIAO_ID,REFUGEE_COUNT);
	Create_Refugee_Receiver(SONG_ID);
	Create_Refugee_Receiver(LIAO_ID);
	Create_Box();
	Create_Nonaligned_Hero();
	Create_ArrowBuilding();
	
	StartMissionTimer(MISSION_ID,INJURE_TIMER_ID,INTERVAL_TIME);
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--ÉèÖÃÎª½áÊø×´Ì¬£¬ÔÚÕâÀïÉèÖÃÊÇÎªÁË·½±ã²âÊÔÊ±Ö±½ÓÓÃCloseMission½áÊøÕ½³¡
	--ÕâÀïÒª¸ù¾İMV_WHO_WINµÄMission±äÁ¿ÖµÀ´¼ÇÂ¼Õâ³¡Õ½ÕùµÄÊ¤¸ºÇé¿ö£¬Ê¹ÓÃ·şÎñÆ÷±äÁ¿
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == ALL_ID then
		Msg2SubWorld("Tèng Liªu qua nh÷ng håi giao tranh quyÕt liÖt, cuèi cïng trong "..tBattleName[PRIMARY_MAINBATTLE_ID].." bÊt ph©n th¾ng b¹i");
	elseif nWhoWin == SONG_ID then
		Msg2SubWorld("Tèng Liªu qua nh÷ng håi giao tranh quyÕt liÖt, phe Tèng trong "..tBattleName[PRIMARY_MAINBATTLE_ID].." giµnh chiÕn th¾ng chung cuéc");
	else
		Msg2SubWorld("Tèng Liªu qua nh÷ng håi giao tranh quyÕt liÖt, cuèi cïng phe Liªu trong "..tBattleName[PRIMARY_MAINBATTLE_ID].." giµnh chiÕn th¾ng chung cuéc");
	end;
	SetGlbValue(GLB_MAINBATTLE,GetMissionV(MV_WINNER));
	StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
	ClearGroup(ARROWBUILDING_GROUP_SONG);
	ClearGroup(ARROWBUILDING_GROUP_LIAO);
	BT_EndBattle();
	BT_BattleAllOver();	--Èç¹û¸ßµÍÁ½¸öÕ½³¡ÔÚÍ¬Ò»¸ö·şÎñÆ÷¿ªµÄ»°£¬¾ÍÒª±£Ö¤ÕâÁ½¸öÕ½³¡ÒªÍ¬Ê±½áÊø
end;

function OnLeave(RoleIndex)	--×¢Òâ¶ÔÔÚ´òÕÌ¹ı³ÌÖĞÀëÏßµÄ´¦Àí
	PlayerIndex = RoleIndex;
	local nCamp = BT_GetCamp();
	local nRefugeeModel = {"N¹n d©n Tèng","N¹n d©n Liªu"};
	BT_ShowDebugInfor("TrŞ GetMissionV(MS_BATTLE_STATE):"..GetMissionV(MS_BATTLE_STATE));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then	--ÔÚÕ½Õù½øĞĞÊ±Àë¿ª
		BT_ShowDebugInfor("TrŞ BT_GetTempData(PTT_FOLLOWER):"..BT_GetTempData(PTT_FOLLOWER));
		if BT_GetTempData(PTT_FOLLOWER) == 1 then
			local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],tCampNameZ[nCamp].." _n¹n d©n",GetWorldPos());
			SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
			BT_ShowDebugInfor("LËp 1 n¹n d©n, h­íng dÉn:"..nRefugeeIndex)
			BT_SetData(PT_HAVE_REFUGEE,1)
		end;
		BT_ShowDebugInfor("ë ®©y xãa theo sau ®Êy!!!!!")
		KillFollower()	--ÄÑÃñµôÂä
		BT_SetTempData(PTT_FOLLOWER,0);	--Àë¿ªµÄÊ±ºòÇåµô¾Í¶ÔÀ²
	end;
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE or BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--Èç¹ûÔÚµ¥ÌôµÄÊ±ºòÀë¿ªÁËÕ½³¡,ÕâÀïÊ¹ÓÃÁ½¸öÌõ¼ş×÷±£Ö¤
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
			BT_SetData(PTNC_SINGLE_LOSE,BT_GetData(PTNC_SINGLE_LOSE)+1);
			BT_DecPersonalPoint(2*ceil(nRankPoint/3),1);	--¿Û³ı¸öÈË»ı·Ö2/3µÄÏàÓ¦¸öÈË»ı·Ö
			PlayerIndex = GetMissionV(MV_FIGHTER_GROUP1_1+nOffset2);	--ÁôÔÚ³¡ÉÏµÄÈË»ñÊ¤
			local nPlayerCamp = BT_GetCamp();
			local nGotPoint = 0;
			BT_EmperorAward(3,1);	--µ¥ÌôÊ¤ÕßÓĞ£³£¥µÄ»ú»á»ñµÃ»ÊµÛ¼Î½±
			nGotPoint = BT_AddPersonalPoint(2*nRankPoint,0,1);	--¸øÓèÉ±ÊÖÒ»¶¨µÄË«±¶¸öÈË»ı·Ö
			BT_DecMissionPoint(nPlayerCamp,nGotPoint);	--°Ñ¹«¹²»ı·Ö¿Û»ØÈ¥	
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_END);	
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_END);
			Say(sName.." tho¸t khái trß ch¬i, phÇn th¾ng ®¬n ®Êu thuéc vÒ b¹n!",0);
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),14);
			SetFightState(0);
			Restore();
			RestoreNeili();			
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset1,0);	--µÚÒ»¸öÈËÍË³öµÄÊ±ºò°ÑÁ½¸ö±äÁ¿¶¼Çå0,ÕâÑù¾Í¿ÉÒÔÍæ¼ÒÅĞ¶ÏÊÇ²»ÊÇµÚ¶ş¸öÈËÍË³ö
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset2,0);
		else
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);	--µÚ¶ş¸öÍË³öµÄÊ±ºòÒª°Ñ·¿¼ä±ê¼ÇÎª¿ÕÏĞ×´Ì¬ÒÔ±ãºóÀ´ÈË½øÈë
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