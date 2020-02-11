Include("\\script\\online\\qixi06\\qixi06_head.lua");
function OnTimer()
	local nState = GetMissionV(MV_STATE);
	if nState == MS_STATE_BEGIN then
	
	elseif nState == MS_STATE_WALK then
		Process_Walk_Timer();
	elseif nState == MS_STATE_MEETING then
		Process_Meeting_Timer();
	elseif nState == MS_STATE_LEAVING then
		Process_Leaving_Timer();
	elseif nState == MS_STATE_END then
	
	end;
end;

function Process_Walk_Timer()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local npcIndex = 0;
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		SetMissionV(MV_STATE,MS_STATE_MEETING);
		StartMissionTimer(MISSION_ID,TIMER_ID,TIMER_MEETING_TIME);
		SetMissionV(MV_TIMER_LOOP,TIMER_MEETING_LOOP);
		npcIndex = CreateNpc("Ng­u Lang","Ng­u Lang",nMapID,1631,3222);
		SetNpcLifeTime(npcIndex,24*60*60);
		SetNpcScript(npcIndex,"\\script\\online\\qixi06\\niulang_zhinv_npc.lua");
		npcIndex = CreateNpc("Chøc N÷","Chøc N÷",nMapID,1634,3222);
		SetNpcLifeTime(npcIndex,24*60*60);
		SetNpcScript(npcIndex,"\\script\\online\\qixi06\\niulang_zhinv_npc.lua");
	else
		local nStep = TIMER_WALK_LOOP-nLoop+1;
		npcIndex = CreateNpc("Chim kh¸ch tr¸i"," ",nMapID,1585+nStep*5,3215);
		SetNpcLifeTime(npcIndex,30*60);
		npcIndex = CreateNpc("Chim kh¸ch ph¶i"," ",nMapID,1680-nStep*5,3215);
		SetNpcLifeTime(npcIndex,30*60);
		if nLoop ~= 1 then
			npcIndex = CreateNpc("Chim kh¸ch tr¸i"," ",nMapID,1585+nStep*5,3222);
			SetNpcLifeTime(npcIndex,30*60);
			npcIndex = CreateNpc("Chim kh¸ch ph¶i"," ",nMapID,1680-nStep*5,3222);
			SetNpcLifeTime(npcIndex,30*60);	
		end;
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;	
end;

function Process_Meeting_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		SetMissionV(MV_STATE,MS_STATE_LEAVING);
		StartMissionTimer(MISSION_ID,TIMER_ID,TIMER_LEAVING_TIME);
		SetMissionV(MV_TIMER_LOOP,TIMER_LEAVING_LOOP);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;

function Process_Leaving_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_STATE,MS_STATE_END);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;