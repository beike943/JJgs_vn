--=============================================
--create by baiyun 2009.8.31
--describe:Ô½ÄÏ°æ9ÔÂ·ÝÖÐÇï»î¶¯×ß¾üµÆÁýmissionº¯Êý
--=============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

t_denglong_sets20101201 = {
	[0] = {"ThiÕu L©m", {204, 1526, 3269}},--ÐÇÆÚÈÕ
	[1] = {"Nga My", {303, 1552, 3232}},--ÐÇÆÚÒ»
	[2] = {"§­êng M«n", {305, 1530, 2921}},--ÐÇÆÚ¶þ
	[3] = {"C¸i Bang", {209, 1515, 3265}},--ÐÇÆÚÈý
	[4] = {"Vâ §ang", {312, 1707, 3477}},--ÐÇÆÚËÄ
	[5] = {"Ngò §éc", {407, 1555, 3286}},--ÐÇÆÚÎå
	[6] = {"D­¬ng M«n", {219, 1655, 3301}},--ÐÇÆÚÁù
};


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
		local nMapId = GetGlbValue(1015);
		local nMapX = GetGlbValue(1016);
		local nMapY = GetGlbValue(1017);
		local nDengLongIndex = GetGlbValue(1014);
		
		--local tBossParam = {
        --   	[1] = {"Thá MËp", 70, "Thá MËp", "\\script\\online\\viet_event\\200909\\2\\death_pangtuzi.lua", 10, 600},
        --    	[2] = {"chicken_viet", 10, "Gµ MËp", "\\script\\online\\viet_event\\200909\\2\\death_ji.lua", 10, 600},
        --    	[3] = {"dark_viet",  10, "VÞt MËp", "\\script\\online\\viet_event\\200909\\2\\death_ya.lua", 10, 600},
        --    	[4] = {"ship_viet", 10, "Dª MËp", "\\script\\online\\viet_event\\200909\\2\\death_yang.lua", 10, 600},
            	--[5] = {"§¹i Niªn Thó", 10, "§¹i Niªn Thó", "\\script\\online\\viet_event\\200909\\2\\death_niansou.lua", 10, 3600},                	            	        	
        --	};
		
		-- tham sè 5: sè l­îng boss,
		-- tham sè 6: ®iÓm HP
		local tBossParam = {
			    [1] = {"Thá MËp", 25, "Thá MËp", "\\script\\online\\viet_event\\200909\\2\\death_pangtuzi.lua", 10, 600},   --24
            	[2] = {"chicken_viet", 25, "Gµ MËp", "\\script\\online\\viet_event\\200909\\2\\death_ji.lua", 10, 600},  --24
            	[3] = {"dark_viet",  25, "VÞt MËp", "\\script\\online\\viet_event\\200909\\2\\death_ya.lua", 10, 600},  --24
            	[4] = {"ship_viet", 25, "Dª MËp", "\\script\\online\\viet_event\\200909\\2\\death_yang.lua", 10, 600},  --24
            	
            	-- [5] = {"§¹i Niªn Thó", 96, "§¹i Niªn Thó", "\\script\\online\\viet_event\\200909\\2\\death_niansou.lua", 1, 30 * 60}   	 -- 4
		}		
        
        local tGoldBossParam = {        	
        		[2] = {"TiÓu kª", "Gµ MËp Hoµng Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 600},
        		[3] = {"TiÓu ¸p", "VÞt MËp Hoµng Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 600},
        		[4] = {"TiÓu d­¬ng", "Dª MËp Hoµng Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 600},
        	}
        	
       	local nBossRand = gf_GetRandItemByTable(tBossParam,100,1)        	
        local nDay = tonumber (date("%w"))
        
        	
		--ÕâÀï´´½¨ÅÖÍÃ×Ó
		-- xuÊt hiÖn 10 con boss con
		for i = 1, tBossParam[nBossRand][5] do
			local nNpcIndex = CreateNpc(tBossParam[nBossRand][1], tBossParam[nBossRand][3], nMapId, nMapX, nMapY);
			SetNpcLifeTime(nNpcIndex, tBossParam[nBossRand][6]);   					--- thiet lap th¬i gian tån t¹i
			SetNpcDeathScript(nNpcIndex, tBossParam[nBossRand][4]);
			
		end
		
		-- boss hßang kim
		if nBossRand >=  2 and nBossRand <= 4 then
			for i = 1, tGoldBossParam[nBossRand][4] do
				local nNpcIndex = CreateNpc(tGoldBossParam[nBossRand][1], tGoldBossParam[nBossRand][2], nMapId, nMapX, nMapY);
				SetNpcLifeTime(nNpcIndex, tGoldBossParam[nBossRand][5]);
				SetNpcDeathScript(nNpcIndex, tGoldBossParam[nBossRand][3]);
			end
		end
		local nState = GetUnitCurStates(nDengLongIndex, 4)
		AddUnitStates(nDengLongIndex, 4, (0 - nState));--°Ñ´Ë×´Ì¬Çå0
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
