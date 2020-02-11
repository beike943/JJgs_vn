Include("\\script\\lib\\missionfunctions.lua");
MISSION_ID = 46;									--MissionµÄID
TIMER_ID = 75;										--¼ÆÊ±Æ÷µÄID
LOG_ID = 3001;										--µÇÂ½´¥·¢Æ÷ID
LOG_CUSTOM_ID = 2501;								--µÇÂ½´¥·¢Æ÷×Ô¶¨Òå±àºÅ
HUASHAN_MAP_ID = 969								--»ªÉ½µØÍ¼µÄID
--=========================================================================================
FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--Ã¿·ÖÖÓÓÎÏ·Ö¡Êý
--¶¨Òå¸÷¸ö½×¶ÎµÄ³ÖÐøÊ±¼ä£¬Ö»ÄÜÌî·Ç0ÕýÕûÊý==================================================
READY_TIME = 30;									--×¼±¸Ê±¼ä£¬30·ÖÖÓ
STARTED_TIME = 60;									--½øÐÐÊ±¼äÊ±¼ä£¬60·ÖÖÓ
ENDING_TIME = 0.5;									--µÈ´ý½áÊøÊ±¼ä£¬0.5·ÖÖÓ
--¶¨Òå¸÷¸ö½×¶Î¼ÆÊ±Æ÷µÄ´¥·¢¼ä¸ô=============================================================
READY_TIMER_INTERVAL = 2;							--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»·ÖÖÓ
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 2;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 0.5;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS±äÁ¿=============================================================================

--MissionV±äÁ¿=============================================================================
MV_MISSION_STATE = 1;								--¼ÇÂ¼Mission×´Ì¬
MV_TIMER_LOOP = 2;									--¼ÇÂ¼¼ÆÊ±Æ÷µÄ¼ÆÊý
MV_MISSION_UID = 3;									--¼ÇÂ¼MissionµÄÎ¨Ò»ID
MV_TEAM_NUM = 4;									--¼ÇÂ¼½øÈëMissionµÄ¶ÓÎé×ÜÊý
MV_BOX_NPC_INDEX = 5;								--¼ÇÂ¼»ªÉ½±¦ÏäµÄË÷Òý
MV_HUASHAN_NPC_INDEX = 6;							--¼ÇÂ¼»ªÉ½npcµÄË÷Òý
MV_OPENBOX_FLAG = 7;								--¼ÇÂ¼»ªÉ½±¦ÏäÒÑ±»¶áÈ¡
--Mission×´Ì¬¼¯============================================================================
MS_STATE_IDEL = 0;									--³¡µØ¿ÕÏÐ
MS_STATE_READY = 1;									--×¼±¸½×¶Î
MS_STATE_STARTED = 2;								--¿ªÕ½½×¶Î
MS_STATE_ENDING = 3;								--µÈ´ý½áÊø½×¶Î
--=========================================================================================

--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	mf_ClearMissionData();

	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊý
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
end;
--Mission¿ªÊ¼
function MS_StartMission()
--	SetNpcLifeTime(GetMissionV(MV_HUASHAN_NPC_INDEX),0)--É¾È¥ÍË³öNpc
	Msg2MSAll(MISSION_ID,"Ho¹t ®éng bang héi tinh anh ®· b¾t ®Çu, c¸c vÞ bang ph¸i ã thÓ ®i ®o¹t b¶o r­¬ng.");
	mf_Talk2Camp(MISSION_ID,0,"Ho¹t ®éng bang héi tinh anh ®· b¾t ®Çu, c¸c vÞ bang ph¸i ã thÓ ®i ®o¹t b¶o r­¬ng.");

	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
	SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖÐøÊ±¼ä
	StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
	StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öÐÂµÄ¼ÆÊ±Æ÷
	MS_SetPlayerState(2);
end;
--Mission½áÊø
function MS_EndMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	local nMSUID = GetMissionV(MV_MISSION_UID);
--	mf_DelAllMSPlayer(MISSION_ID,0);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	mf_ClearMissionData();
	SetGlbValue(1001,0)
end;
--Àë¿ªMission
function MS_LeaveMission()
	local i = 0;
	local nOldPlayer = 0;
	local nDeaNum = 0;
	local nCamptainState = 0;
	local TeamMemberTab = {};
	
	if GetMissionV(MV_MISSION_STATE) < 3 and GetMissionV(MV_MISSION_STATE) > 0 then
		nDeaNum = 0;
		nCamptainState = 0;
		if PlayerIndex == GetTeamMember(0) then
			nOldPlayer = PlayerIndex;
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 then
					if IsPlayerDeath() ~= 0 then
						nDeaNum = nDeaNum + 1;
					end
					tinsert(TeamMemberTab,GetTeamMember(i))
				end
			end
			
			if nDeaNum == GetTeamSize() then
				nCamptainState = 1;
			end

			for i=1,getn(TeamMemberTab) do
				PlayerIndex = TeamMemberTab[i];
				if PlayerIndex > 0 then
					if PlayerIndex ~= nOldPlayer then						
						if nCamptainState ~= 1 then
							Msg2Player("Do ®éi tr­ëng rêi khái trËn ®Þa, tÊt c¶ ®éi viªn sÏ bÞ chuyÓn ra khái ®Êu tr­êng!");
						else
							Msg2Player("Do v× tÊt c¶ mäi ng­êi trong ®éi ®· chÕt nªn tæ ®éi cña b¹n sÏ chuyÓn ra khu vùc.");
						end
						DelMSPlayer(MISSION_ID,0);
					end
				end
			end
			PlayerIndex = nOldPlayer;
			if nCamptainState ~= 1 then
				Msg2Player("Do ®éi tr­ëng rêi khái trËn ®Þa, tÊt c¶ ®éi viªn sÏ bÞ chuyÓn ra khái ®Êu tr­êng!");
			else
				Msg2Player("Do v× tÊt c¶ mäi ng­êi trong ®éi ®· chÕt nªn tæ ®éi cña b¹n sÏ chuyÓn ra khu vùc.");
			end
		end
	end
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end

	MS_SetPlayerState(3);
	NewWorld(100,1420,2989);

end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState(1);
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("Cßn %d phót n÷a chÝnh thøc b¾t ®Çu ho¹t ®éng bang héi tinh anh ", (nLoop*READY_TIMER_INTERVAL)));
	end;
end;
--´¦ÀíMission¿ªÊ¼ºóµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		
--		SetNpcLifeTime(GetMissionV(MV_BOX_NPC_INDEX),0)--É¾È¥»ªÉ½±¦Ïä
		Msg2MSAll(MISSION_ID,"Ho¹t ®éng bang héi tinh anh ®· kÕt thóc ");
		mf_Talk2Camp(MISSION_ID,0,"Ho¹t ®éng bang héi tinh anh ®· kÕt thóc ");
	else
		if GetMissionV(MV_OPENBOX_FLAG) == 1 then		--¶áÈ¡±¦ÏäºóÑÓÊ±ÍË³ö
			CloseMission(MISSION_ID);
		end
		
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("Cßn %d phót n÷a kÕt thóc ho¹t ®éng bang héi tinh anh ", (nLoop*STARTED_TIMER_INTERVAL)));
	end;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()
	MS_SetPlayerState(3);
end;
--=====================================================================================
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;

--ÉèÖÃÍæ¼Ò²»Í¬Ìõ¼þÏÂµÄ×´Ì¬
function MS_SetPlayerState(nMissionState)
	if nMissionState == 1 then					--×¼±¸½×¶Î½ÇÉ«×´Ì¬´¦Àí
		CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
		SetLogoutRV(1);							--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
		SetDeathPunish(0);						--ÎÞËÀÍö³Í·£
		SetCreateTeam(1);						--¹Ø±Õ×é¶Ó¹¦ÄÜ
		ForbitTrade(1);							--½ûÖ¹½»Ò×
		SetFightState(1);						--Õ½¶·×´Ì¬
  		InteractiveEnable(0);					--½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
  		CleanInteractive();						--½âÉ¢Ç£ÊÖ×´Ì¬
  		StallEnable(0); 						--°ÚÌ¯¿ª¹Ø		  
		UseScrollEnable(0);						--»Ø³Ì·û¿ª¹Ø			
		SetPKFlag(2,0);							--ÍÀÉ±Ä£Ê½
		ForbidChangePK(1);						--½ûÖ¹×ª»»PK×´Ì¬
--		SetTempRevPos(100,1420,2989);			--ËÀÍöÖØÉúµã
		SetDeathScript("");

	elseif nMissionState == 2 then				--Õ½¶·½×¶Î½ÇÉ«×´Ì¬´¦Àí
		SetFightState(1);

	elseif nMissionState == 3 then				--±ÈÈü½áÊø½×¶Î½ÇÉ«×´Ì¬´¦Àí
		RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
		SetLogoutRV(0);
		SetFightState(0);
		SetDeathPunish(1);
		ForbidChangePK(0);
		ForbitTrade(0);
		SetCreateTeam(0);
		SetPKFlag(0,0)							--¹Ø±ÕPK¿ª¹Ø
  		InteractiveEnable(1);
  		StallEnable(1);
  		UseScrollEnable(1);
  		UseSkillEnable(1);
--		SetTempRevPos(0,0,0);					--É¾³ýÁÙÊ±ÖØÉúµã
		RemvoeTempEffect();
  		SetDeathScript("");
	end
end

