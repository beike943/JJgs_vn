--=============================================
--create by baiyun 2009.11.25
--describe:Ô½ÄÏ°æ12ÔÂ·ÝÊ¥µ®½Ú»î¶¯±ùÀäÎ×Ê¦missionº¯Êý
--=============================================
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission ®· b¾t ®Çu, MSUID:"..nMSUID);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
end;
--Mission½áÊø
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission ®· kÕt thóc, MSUID:"..nMSUID);
end;
--Àë¿ªMission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--´¦ÀíMission¿ªÊ¼ºóµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nShengDanShuIndex = GetGlbValue(1026);
                local nMapId, nMapX, nMapY = GetNpcWorldPos(nShengDanShuIndex);
		for i = 1, 50 do
                    local nNewNpcIndex = CreateNpc("Event gi¸ng sinh VN", "Hép quµ gi¸ng sinh", nMapId, nMapX + random(-30, 30), nMapY + random(-30, 30));
                    SetNpcLifeTime(nNewNpcIndex, 150);
                    SetNpcScript(nNewNpcIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
		end
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

end;
--=====================================================================================
--×ª»»Missionµ±Ç°×´Ì¬
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊý
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
		SetMissionV(MV_TIMER_LOOP,floor(GetGlbValue(1018)/STARTED_TIMER_INTERVAL)-1);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖÐøÊ±¼ä
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öÐÂµÄ¼ÆÊ±Æ÷
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState()

end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_RestorePlayerState()

end;
