--date:2007-3-6
--author:yanjun
--describe:header script of the killer hall mission!it's a dynamic mission template!
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
MISSION_ID = 34;									--MissionµÄID
TIMER_ID = 62;										--¼ÆÊ±Æ÷µÄID
LOG_ID = 205;										--µÇÂ½´¥·¢Æ÷ID
LOG_CUSTOM_ID = 3016;								--µÇÂ½´¥·¢Æ÷×Ô¶¨Òå±àºÅ
--=========================================================================================
MAX_PLAYER = 200;									--×î´óÈÝÄÉÈËÊý
BOSS1_NEEDED_TEAM_COUNT = 1;						--¶àË¢Ò»¸öÏãÖ÷ÐèÒªµÄ¶ÓÎéÊý
BOSS2_NEEDED_TEAM_COUNT = 1;						--¶àË¢Ò»¸ö¸±ÌÃÖ÷ÐèÒªµÄ¶ÓÎéÊý
BOSS3_NEEDED_TEAM_COUNT = 1;						--¶àË¢Ò»¸öÀî´ó×ìÐèÒªµÄ¶ÓÎéÊý
TEAM_MEMBER_COUNT = 8;								--Ò»Ö§¶ÓÎéÀïÃæ×î¶àÓÐ¶àÉÙÈË
--=========================================================================================
FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--Ã¿·ÖÖÓÓÎÏ·Ö¡Êý
--¶¨Òå¸÷¸ö½×¶ÎµÄ³ÖÐøÊ±¼ä£¬Ö»ÄÜÌî·Ç0ÕýÕûÊý==================================================
READY_TIME = 10;									--×¼±¸Ê±¼ä£¬10·ÖÖÓ
STARTED_TIME = PLAY_TIME;							--½øÐÐÊ±¼äÊ±¼ä£¬60·ÖÖÓ¡£
ENDING_TIME = 3;									--µÈ´ý½áÊøÊ±¼ä£¬3·ÖÖÓ
--¶¨Òå¸÷¸ö½×¶Î¼ÆÊ±Æ÷µÄ´¥·¢¼ä¸ô=============================================================
READY_TIMER_INTERVAL = 2;							--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»·ÖÖÓ
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS±äÁ¿=============================================================================

--MissionV±äÁ¿=============================================================================
MV_MISSION_STATE = 1;								--¼ÇÂ¼Mission×´Ì¬
MV_TIMER_LOOP = 2;									--¼ÇÂ¼¼ÆÊ±Æ÷µÄ¼ÆÊý
MV_MISSION_UID = 3;									--¼ÇÂ¼MissionµÄÎ¨Ò»ID
MV_PLAYER_ENTER_TIME = 4;							--¼ÇÂ¼Èë³¡ÈË´Î
--Mission×´Ì¬¼¯============================================================================
MS_STATE_IDEL = 0;									--³¡µØ¿ÕÏÐ
MS_STATE_READY = 1;									--×¼±¸½×¶Î
MS_STATE_STARTED = 2;								--¿ªÕ½½×¶Î
MS_STATE_ENDING = 3;								--µÈ´ý½áÊø½×¶Î
--=========================================================================================
tMissionTS =	--MissionTimeState£¬¶¨ÒåMission»îÔ¾Ê±¼ä
{
	[MS_STATE_READY]   = {{2100,2110}},	--×¼±¸Ê±¼äÇø¼ä
	[MS_STATE_STARTED] = {{2111,2210}},	--¿ªÊ¼Ê±¼äÇø¼ä
	[MS_STATE_ENDING]  = {{2211,2211}},	--µÈ´ý½áÊøÊ±¼äÇø¼ä
}
--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	local nCurState,nLeftMin,nTimeInterval = 0,0,0;
	if SETTING_DYNAMIC_MISSION == 1 then	--Èç¹ûÖ§³Ö¶¯Ì¬Mission
		nCurState,nLeftMin = mf_GetMissionCurState();
		if nCurState == MS_STATE_READY or nCurState == MS_STATE_IDEL then
			nTimeInterval = READY_TIMER_INTERVAL;
		elseif nCurState == MS_STATE_STARTED then
			nTimeInterval = STARTED_TIMER_INTERVAL;
		elseif nCurState == MS_STATE_ENDING then
			nTimeInterval = ENDING_TIMER_INTERVAL;
		end;
	else	--¾²Ì¬MissionµÄ³õÊ¼»¯
		nCurState = MS_STATE_READY;
		nLeftMin = READY_TIME - READY_TIMER_INTERVAL;	--ÕâÀïÒªÏÈ¼õÈ¥READY_TIMER_INTERVAL£¬²»È»»á¶àÒ»´ÎÑ­»·
		nTimeInterval = READY_TIMER_INTERVAL;
	end;
	local nLoop = floor(nLeftMin/nTimeInterval);
	SetMissionV(MV_MISSION_STATE,nCurState);
	SetMissionV(MV_TIMER_LOOP,nLoop);
	StartMissionTimer(MISSION_ID,TIMER_ID,nTimeInterval*FRAME_PER_MIN);
	if nCurState == MS_STATE_STARTED then --Èç¹ûÊÇ½øÐÐÖÐ
		if mod(nLoop,floor(5/STARTED_TIMER_INTERVAL)) == 0 then
			MS_CreateBoss(NPC_TYPE_XIANGZHU);
			MS_CreateBoss(NPC_TYPE_FUTANGZHU);
		end;
		if mod(nLoop,floor(15/STARTED_TIMER_INTERVAL)) == 0 then
			MS_CreateBoss(NPC_TYPE_LIDAZUI);
		end;
	end;
	KH_Clear_Map_Value();	--ÇåµØÍ¼±äÁ¿
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	local nNpcIdx1 = CreateNpc("Ch©n Tö §¬n","§­êng Minh §øc",885,1562,3188);
	SetNpcScript(nNpcIdx1,"\\script\\task\\killer_hall\\quest_npc.lua");
	WriteLog("[S¸t Thñ §­êng]: trËn Mission b¾t ®©u, MSUID lµ:"..nMSUID);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
	SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖÐøÊ±¼ä
	StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
	StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öÐÂµÄ¼ÆÊ±Æ÷
	MS_InitBoss();
end;
--Mission½áÊø
function MS_EndMission()
	ClearMapNpc(MAP_ID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);	--ÔÚmf_ClearMissionDataÒ²»áÇå£¬ÕâÀïÖ»ÊÇ×÷Ò»¸öÇ¿µ÷
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,0);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	local nBox1Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX1_COUNT);
	local nBox2Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX2_COUNT);
	local nBox3Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX3_COUNT);
	if nBox1Count > MAX_BOX1_COUNT then
		WriteLog("[S¸t Thñ §­êng lÇm lçi]: nBox1Count ®· v­ît qu¸ ph¹m vi, trÞ sè lµ:"..nBox1Count);
	end;
	if nBox2Count > MAX_BOX2_COUNT then
		WriteLog("[S¸t Thñ §­êng lÇm lçi]: nBox2Count ®· v­ît qu¸ ph¹m vi, trÞ sè lµ:"..nBox2Count);
	end;
	if nBox3Count > MAX_BOX3_COUNT then
		WriteLog("[S¸t Thñ §­êng lÇm lçi]: nBox3`Count ®· v­ît qu¸ ph¹m vi, trÞ sè lµ:"..nBox3Count);
	end;
	local nPlayerEnterTime = GetMissionV(MV_PLAYER_ENTER_TIME);
	WriteLog("[S¸t Thñ §­êng]: TrËn Mission kÕt thóc, MSUID lµ:"..nMSUID..". Sè ng­êi vµo trËn:"..nPlayerEnterTime..". Sè r­¬ng më:"..nBox1Count..", "..nBox2Count..", "..nBox3Count);
	mf_ClearMissionData();
	KH_Clear_Map_Value();
end;
--Àë¿ªMission
function MS_LeaveMission()
	MS_RestorePlayerState();
	local nPosIdx = random(1,getn(tExitPos));
	NewWorld(tExitPos[nPosIdx][1],tExitPos[nPosIdx][2],tExitPos[nPosIdx][3]);
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	gf_Msg2Team(GetName().."Vµo S¸t Thñ §­êng");
	MS_SetPlayerState();
	AddMSPlayer(MISSION_ID,nCamp)
	SetMissionV(MV_PLAYER_ENTER_TIME,GetMissionV(MV_PLAYER_ENTER_TIME)+1);	--¼ÇÂ¼Èë³¡ÈË´Î
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"C¸c vÞ ®¹i hiÖp chó ý: S¸t thñ cña S¸t Thñ §­êng ®· xuÊt hiÖn");
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Thêi gian S¸t thñ xuÊt hiÖn vÉn cßn"..(nLoop*READY_TIMER_INTERVAL).." phót ");
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
		Msg2MSAll(MISSION_ID,"MÆt n¹ nµy ®· bÞ hä ph¸t hiÖn råi, ph¶i ra tay th«i!");
		ClearMapNpc(MAP_ID);
		local lfFunc = function(tArg)
			Say("Ng­¬i lµ ai? Sao d¸m x«ng vµo ®©y?",
					1,
					"MÆt n¹ nµy ®· bÞ hä ph¸t hiÖn råi,/MS_Nothing");
		end;
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},0,MAP_ID);
		local nNpcIdx = CreateNpc("Giang hå tuÊn kiÖt","Nam nh©n thÇn bÝ",MAP_ID,1570,3190);
		SetNpcScript(nNpcIdx,"\\script\\task\\killer_hall\\entrance_npc.lua");
	else
		local nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount = MS_GetBossCount();
		if mod(nLoop,floor(5/STARTED_TIMER_INTERVAL)) == 0 then	--Ã¿5·ÖÖÓË¢Ò»´ÎÉ±ÊÖÌÃÏãÖ÷ºÍÉ±ÊÖÌÃ¸±ÌÃÖ÷
			MS_CreateBoss(NPC_TYPE_XIANGZHU,nXiangZhuCount);
			MS_CreateBoss(NPC_TYPE_FUTANGZHU,nFuTangZhuCount);
		end;
		if mod(nLoop,floor(15/STARTED_TIMER_INTERVAL)) == 0 then	--Ã¿15·ÖÖÓË¢Ò»´ÎÈËÍÀ¸«Àî´ó×ì
			MS_CreateBoss(NPC_TYPE_LIDAZUI,nLiDaZuiCount);
		end;
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Thêi gian hoµn thµnh nhiÖm vô S¸t Thñ §­êng cßn"..(nLoop*STARTED_TIMER_INTERVAL).." phót ");
		Msg2MSAll(MISSION_ID,"Sè ng­êi trong trËn:"..nPlayerCount..", sè l­îng S¸t thñ xuÊt hiÖn:"..nXiangZhuCount.."H­¬ng chñ, "..nFuTangZhuCount.."Phã §­êng chñ,"..nLiDaZuiCount.."Lý §¹i Chñy");
	end;
end;
--¼ÆËãµ±Ç°Ó¦¸Ã²úÉúµÄBOSSµÄÊýÁ¿
function MS_GetBossCount()
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,0);
	local nXiangZhuCount = ceil(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS1_NEEDED_TEAM_COUNT));
	local nFuTangZhuCount = ceil(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS2_NEEDED_TEAM_COUNT));
	local nLiDaZuiCount = floor(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS3_NEEDED_TEAM_COUNT));
	if nXiangZhuCount >= BOSS1_POS_COUNT then
		nXiangZhuCount = BOSS1_POS_COUNT;
	end;
	if nFuTangZhuCount >= BOSS2_POS_COUNT then
		nFuTangZhuCount = BOSS2_POS_COUNT;
	end;
	if nLiDaZuiCount >= BOSS3_POS_COUNT then
		nLiDaZuiCount = BOSS3_POS_COUNT;
	end;
	return nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C¸c vÞ ®¹i hiÖp néi trong"..(nLoop*ENDING_TIMER_INTERVAL).." phót ph¶i rêi khái S¸t Thñ §­êng");
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()
	MS_RestorePlayerState();
end;
--=====================================================================================
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = 0;
	nMSUID = tonumber(date("%y%m%d%H"));
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState()
	Say("V× mang mÆt n¹ nªn ch¼ng ai nhËn ra ng­¬i. ë ®©y thËt gi¶ trµ trén kh«ng dÔ dµng tin ®­îc.",0);
	SetTask(KH_TASK_MSUID,GetMissionV(MV_MISSION_UID));
	SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
	SetDeathPunish(0);
	SetPKFlag(2,1);
	ForbidChangePK(1);
	UseScrollEnable(0);
	ForbitTrade(1);
	StallEnable(0);
	SetFightState(1);
	UseMask(1,0);
	SetCreateTeam(1);	--½ûÖ¹×é¶Ó
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetTempRevPos(305,1584*32,2830*32);
	OpenFriendliness(0);	--²»Ôö¼ÓºÃ¸Ð¶È
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		gf_ForbidFactionSkill(1)	
	end
end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_RestorePlayerState()
	SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	SetLogoutRV(0)
	SetDeathPunish(1);
	ForbidChangePK(0);
	UseScrollEnable(1);
	ForbitTrade(0);
	StallEnable(1);
	SetPKFlag(0,0);
	SetFightState(0);
	UseMask(0,0);
	SetCreateTeam(0);
	--LeaveTeam();	--Õâ¸öÒª·ÅÔÚSetCreateTeam(0)Ö®ºó²ÅÓÐ×÷ÓÃ
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	SetTempRevPos(0,0,0);
	OpenFriendliness(1);	--»Ö¸´Ôö¼ÓºÃ¸Ð¶È
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		gf_ForbidFactionSkill(0)	
	end
end;
--´´½¨Boss
function MS_CreateBoss(nType,nNum)
	local tBossPos = tNpcRegion[nType];
	local nNpcIdx = 0;
	local sBossModel,sBossName,nLifeTime = tNpcInfo[nType][1],tNpcInfo[nType][2],tNpcInfo[nType][3];
	local nBasePosIdx = random(1,getn(tBossPos));	--Ëæ»úÒ»¸ö³õÊ¼Î»ÖÃË÷Òý
	for i=1,nNum do
		local nBossPosIdx = mod(nBasePosIdx+i-2,getn(tBossPos))+1;	--»ñµÃÒ»¸öË¢ÐÂBOSSµÄ·¿¼äµÄË÷Òý
		local nPosIdx = random(1,getn(tBossPos[nBossPosIdx]));	--»ñµÃBOSS·¿¼äÀïÃæµÄËæ»úÒ»¸öË¢ÐÂµã
		nNpcIdx = CreateNpc(sBossModel,sBossName,tBossPos[nBossPosIdx][nPosIdx][1],tBossPos[nBossPosIdx][nPosIdx][2],tBossPos[nBossPosIdx][nPosIdx][3]);
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\killer_hall\\npc_death.lua");
		SetNpcLifeTime(nNpcIdx,nLifeTime);
	end;
end;
--³õÊ¼»¯BOSSµÄÎ»ÖÃ£¬ÔÚÕý³£Ö´ÐÐRunMissionµÄÊ±ºòµ÷ÓÃ
function MS_InitBoss()
	local nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount = MS_GetBossCount();
	MS_CreateBoss(NPC_TYPE_XIANGZHU,nXiangZhuCount);
	MS_CreateBoss(NPC_TYPE_FUTANGZHU,nFuTangZhuCount);
	MS_CreateBoss(NPC_TYPE_LIDAZUI,nLiDaZuiCount);
	Msg2MSAll(MISSION_ID,"Sè ng­êi trong trËn:"..nPlayerCount..", sè l­îng S¸t thñ:"..nXiangZhuCount.."H­¬ng chñ, "..nFuTangZhuCount.."Phã §­êng chñ,"..nLiDaZuiCount.."Lý §¹i Chñy");
end;

function MS_Nothing()

end;