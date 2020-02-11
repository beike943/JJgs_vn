--°ÂÔËÆßÏ¦µãµÆMission
--by vivi
--2008/07/18
Include("\\script\\online\\qixi08\\light\\light_head.lua")

--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_READY);
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(AOYUN_LIGHT_MISSION_UID,nMSUID);
	aoyun_light_InitFieldNpc(1);
	WriteLog("[ThÕ vËn héi th¾p ®Ìn]: Mission khu 1 b¾t ®Çu, MSUID lµ: "..nMSUID);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	local nGuanType = GetMissionV(AOYUN_LIGHT_GUAN_TYPE);
	if nGuanType == 3 or nGuanType == 5 then
		aoyun_light_InitFieldNpc(nGuanType);
	end
	Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Héi th¾p ®Ìn ¶i "..nGuanType.." chÝnh thøc b¾t ®Çu, h·y chó ý thøc tù ®Ìn cÇn th¾p.");
	local nBackStr = "";
	if nGuanType == 1 then
		nBackStr = aoyun_light_random(1,8,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);
	elseif nGuanType == 2 then
		nBackStr = aoyun_light_random(1,8,1);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 3 then
		nBackStr = aoyun_light_random(1,12,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 4 then
		nBackStr = aoyun_light_random(1,12,1);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 5 then
		nBackStr = aoyun_light_random(1,16,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	end	
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_DIANDENG);
end;
--Mission½áÊø
function MS_EndMission()
	local nMSUID = GetMissionV(AOYUN_LIGHT_MISSION_UID);
	mf_DelAllMSPlayer(AOYUN_LIGHT_MISSION_ID,0);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_IDEL);
	mf_ClearMissionData();
	WriteLog("[ThÕ vËn héi th¾p ®Ìn]: Mission khu 1 kÕt thóc, MSUID lµ: "..nMSUID);
end;
--Àë¿ªMission
function MS_LeaveMission()
	MS_RestorePlayerState();
	for i=1,getn(tMapId[2]) do
		if SubWorldID2Idx(tMapId[2][i][1]) ~= -1 then
			NewWorld(tMapId[2][i][1],tMapId[2][i][2],tMapId[2][i][3]);
			break
		end
	end
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState();
	AddMSPlayer(AOYUN_LIGHT_MISSION_ID,nCamp);
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(AOYUN_LIGHT_MISSION_ID);
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Thêi gian th¾p ®Ìn cßn "..tf_GetTimeString(nLoop*AOYUN_LIGHT_READY_TIMER_INTERVAL));
	end;
end;

--´¦ÀíÏµÍ³µãµÆ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessDiandengTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_STARTED);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"B¾t ®Çu th¾p ®Ìn, xin th¾p theo thø tù mµ hÖ thèng ®· th¾p.");
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
		local nLetter = strsub(GetMissionS(AOYUN_LIGHT_DENG_SEQ),strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ))+1-nLoop,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ))+1-nLoop);
		local nIdx = 0;
		for i=1,getn(tLetter) do
			if nLetter == tLetter[i] then
				nIdx = i;
				break;
			end
		end
		if nIdx ~= 0 then
			SetCurrentNpcSFX(GetMissionV(nIdx+10),909,2,0);
		end
	end
end

--´¦ÀíMission¿ªÊ¼ºóµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_ENDING);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Th¾p ®Ìn thÊt b¹i, b¹n kh«ng th¾p trong thêi gian quy ®Þnh. §éi ngò chuyÓn ra ngoµi ¶i sau 20 gi©y.");
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"KÕt thóc th¾p ®Ìn cßn "..tf_GetTimeString(nLoop*AOYUN_LIGHT_STARTED_TIMER_INTERVAL));
	end;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_CloseField();
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"H«n lÔ s¾p kÕt thóc, chØ cßn"..tf_GetTimeString(nLoop*AOYUN_LIGHT_ENDING_TIMER_INTERVAL));
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[ThÕ vËn héi th¾p ®Ìn]: Ng­êi ch¬i  "..GetName().." Rêi Mission kh«ng b×nh th­êng, ®ang trong qu¸ tr×nh xö lý ®¨ng nhËp.");
end;
--=====================================================================================
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState()
	local nMapID = gf_GetCurMapID();
	CreateTrigger(3,AOYUN_LIGHT_LOG_ID,AOYUN_LIGHT_LOG_CUSTOM_ID);
	SetFightState(1);	--Õ½¶·×´Ì¬
	SetPKFlag(1,1);	--PK×´Ì¬
	ForbidChangePK(1);	--½ûÖ¹×ª»»PK×´Ì¬
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	StallEnable(0);	--½ûÖ¹°ÚÌ¯
	SetDeathPunish(0);	--ÎÞËÀÍö³Í·£
	InteractiveEnable(0);	--½ûÖ¹»¥¶¯
	NewWorld(nMapID,tMapId[1][2],tMapId[1][3]);	
end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_RestorePlayerState()
	RemoveTrigger(GetTrigger(AOYUN_LIGHT_LOG_CUSTOM_ID));
	SetFightState(0);	--ºÍÆ½×´Ì¬
	ForbidChangePK(0);	--¿ÉÒÔ×ª»»PK×´Ì¬
	SetPKFlag(0,0);	--ÎÞPK×´Ì¬
	UseScrollEnable(1);	--ÔÊÐíÊ¹ÓÃ»Ø³Ç·û
	ForbitTrade(0);	--ÔÊÐí½»Ò×
	StallEnable(1);	--ÔÊÐí°ÚÌ¯
	SetDeathPunish(1);	--ÓÐËÀÍö³Í·£
	InteractiveEnable(1);	--ÔÊÐí»¥¶¯
end;



