Include("\\script\\task\\faction_back_room\\back_room_function.lua");

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	SetMissionS(MS_MISSION_NAME,MISSION_NAME..nMSUID);	--记录Mission的名字
	SetMissionS(MS_MISSION_STRING,"秈 s? m玭");
	WriteLog(LOG_HEADER.."Mission  b総 u, MSUID:"..nMSUID);
end;
--Mission开始
function MS_StartMission()
	BR_ChangeMSState(MS_STATE_STARTED);
end;
--Mission结束
function MS_EndMission()
	BR_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--从Mission里面删除所有的玩家
	local nMapID = SubWorldIdx2ID(SubWorld);
	BR_ClearMapNpcSafe(nMapID);
	WriteLog(LOG_HEADER.."Mission  k誸 th骳, MSUID:"..nMSUID);
	mf_ClearMissionData();
end;
--离开Mission
function MS_LeaveMission()
	local nFaction = GetMissionV(MV_FACTION);
	local nDesMapID = GetMissionV(MV_ENTRY_MAPID);
	if DEBUG_VERSION == 1  then
		NewWorld(100,1456,2789);
	else
		if BR_CheckEntryMapID(nDesMapID) == 1 then
			NewWorld(nDesMapID,TB_EXIT_POS[nDesMapID][1],TB_EXIT_POS[nDesMapID][2]);
		else
			BR_SafeTransmission();	--安全的传送
		end;
	end;
	MS_RestorePlayerState();
end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	local nFaction = GetPlayerFaction();
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nMapX = TB_ENTRY_POS[nFaction][1];
	local nMapY = TB_ENTRY_POS[nFaction][2];
	NewWorld(nMapID,nMapX,nMapY);
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		BR_ChangeMSState(MS_STATE_STARTED);	--根本就不需要RunMission
		Msg2MSAll(MISSION_ID,"Th阨 gian chu萵 b? k誸 th骳, b総 u vt 秈...");
		BR_NextStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"下一关开始时间:"..tf_GetTimeString((nLoop*READY_TIMER_INTERVAL)*60));
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nCurDiff = BR_GetCurDiff();
	local nCurStage= BR_GetCurStage();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"Vt 秈 th蕋 b筰 ......");
		BR_UnInitStageEven(nCurDiff,nCurStage);
		BR_ChangeMSState(MS_STATE_END_WAITING);
		BR_CreateDisciple();
		WriteLog(LOG_HEADER.."Vt 秈 th蕋 b筰. ч kh?: "..nCurDiff..", 秈  "..nCurStage..". T猲: "..GetName(nPIdx)..", c蕄:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", nguy猲 nh﹏: vt qu? th阨 gian cho ph衟");
	else
		BR_ProcStageEven(nCurDiff,nCurStage);
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,6) == 0 then
			Msg2MSAll(MISSION_ID,"闯关总剩余时间:"..tf_GetTimeString(60*nLoop*STARTED_TIMER_INTERVAL));
		end;
	end;
end;
--处理过关短暂等待的计时器函数
function MS_ProcessShortPauseTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"关卡挑战现在开始...");
		BR_NextStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nSec = 60*nLoop*SHORT_PAUSE_TIMER_INTERVAL;
		Msg2MSAll(MISSION_ID,"闯关准备时间:"..tf_GetTimeString(nSec));
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,", b﹜ gi? xin m阨 r阨 秈...");
		BR_CloseStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Giai 畂筺 k誸 th骳, th阨 gian c遪 "..tf_GetTimeString(60*nLoop*ENDING_TIMER_INTERVAL));
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_RestorePlayerState();
	WriteLog(LOG_HEADER.."Ngi ch琲 "..GetName().." R阨 Mission kh玭g b譶h thng, 產ng trong qu? tr譶h x? l? ng nh藀.");
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = BR_GetCurMapID();	--用地图ID来标识，虽然不能作唯一标识，不过也够用了
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()
	local nWeek = tonumber(date("%y%W"));
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nMapID = SubWorldIdx2ID(SubWorld);
	BR_ClearTempTask();	--临时变量清0
	BR_ClearNCTask();	--NC变量清0
	BR_ClearMapTask(nMapID);	--地图变量清0
	SetTask(TSK_ATTEND_WEEK,nWeek);
	SetTask(TSK_WC_ATTEND_TIMES,GetTask(TSK_WC_ATTEND_TIMES)+1);
	SetMissionV(MV_FACTION,nFaction);
	SetMissionV(MV_ROUTE,nRoute);
	SetMissionV(MV_PLAYERINDEX,PlayerIndex);
	--===================================================================
	SetPKFlag(1,1);
	ForbidChangePK(1);
	SetFightState(1);
	SetDeathScript("\\script\\task\\faction_back_room\\death_player.lua");
	SetLogoutRV(1);
	UseScrollEnable(0);
	StallEnable(0);	--禁止摆摊(下线后会被清掉)
	LeaveTeam();	--离开队伍
	SetDeathPunish(0);	--无死亡惩罚
	SetCreateTeam(1);	--关闭组建队伍(下线后会被清掉)
	ForbitTrade(1);	--禁止交易
	InteractiveEnable(0);	--关闭交互	必须在NewWorld之后执行才有效
	SetPlayerScript("");
	SetMomentumBoundSwitch(1);	--不可增加杀气值
	CreateTrigger(3,LOGIN_ID,LOGIN_TRIGGER_ID);
	Msg2Player("你进入了挑战地图,战斗模式已转换.");	
	SetCampToPlayer(TB_CAMP_NAME[CAMP_PLAYER]);
	UseDummy(0,1);	--清除替身符效果
	RemoveState(9900);	--清除城市奖章换的状态
	MonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_EVIL]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_ENEMY]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_EVIL]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_PLAYER]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_PLAYER]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_ENEMY]);
	gf_ForbidFactionSkill(1);	--屏蔽镇派
	RemvoeTempEffect();
	BR_RestorePlayer();
	BR_PauseStage();
end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()
	ForbidChangePK(0);
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetLogoutRV(0);
	UseScrollEnable(1);
	StallEnable(1);	
	LeaveTeam();
	SetDeathPunish(1);
	SetCreateTeam(0);
	ForbitTrade(0);
	SetMomentumBoundSwitch(0);
	InteractiveEnable(1);
	SetPlayerScript("");
	RemoveTrigger(GetTrigger(LOGIN_TRIGGER_ID));
	SetCampToPlayer("");
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_EVIL]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_ENEMY]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_EVIL]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_PLAYER]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_PLAYER]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_ENEMY]);
	gf_ForbidFactionSkill(0);
	BR_ClearTempTask();
	BR_ClearNCTask();
	BR_StopTimeGuage(-2);
	BR_LockEquipment(0);
end;