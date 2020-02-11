Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online_activites\\tiaozhansilingboss\\string.lua")
MISSION_ID = 51;									--Mission的ID
TIMER_ID = 80;										--计时器的ID
LOG_ID = 3002;										--登陆触发器ID
LOG_CUSTOM_ID = 2501;								--登陆触发器自定义编号
MAP_ID = {
    [1] = {106,1466,3071}, --龙泉村
    [2] = {151,1481,2961}, --云梦泽
    [3] = {205,1670,3015}, --汴京府东
    [4] = {105,1553,3098}, --泉州西
    [5] = {108,1448,3097}, --泉州北
}								--随机地图的ID
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，只能填非0正整数==================================================
STARTED_TIME = 60;									--进行时间时间，60分钟
ENDING_TIME = 3;									--等待结束时间，3分钟
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 1;
READY_TIMER_COUNT = 1;
STARTED_TIMER_INTERVAL = 1;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = 1;
--MissionS变量=============================================================================

--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开战阶段
MS_STATE_ENDING = 3;								--等待结束阶段
--=========================================================================================

MS_MAX_NUM_TANXIANGMU = 200
VET_201008_SILING_EVENT_NUMBER = 12
--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
    --print("enter MS_InitMission--------------------------------")
    mf_ClearMissionData();
    SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为准备状态
    SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置计时器总计时次数
    StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器
    local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
    SetMissionV(MV_MISSION_UID,nMSUID);	
    AddGlobalCountNews(format(VET_201008_02_TB_STR_LIST[1],VET_201008_02_STR_CITY_NAME[GetGlbValue(1033)]),2)
end;
--Mission开始
function MS_StartMission()
    --print("enter MS_StartMission--------------------------------")
    SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
    SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置开始状态的持续时间
    StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
    StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
end;
--Mission结束
function MS_EndMission()
    --print("enter MS_EndMission--------------------------------")
    local nNpcIndex = GetGlbValue(1032)
    local nRandom = GetGlbValue(1033)
    SetNpcLifeTime(nNpcIndex,0)
    SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
    StopMissionTimer(MISSION_ID,TIMER_ID);
    StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
    mf_ClearMissionData(MAP_ID[nRandom][1]);
    --SetGlbValue(1001,0)
end;


--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
    --print("enter MS_ProcessReadyTimer--------------------------------")
    local nLoop = GetMissionV(MV_TIMER_LOOP);
    if nLoop == 0 then
        RunMission(MISSION_ID);
    else
        SetMissionV(MV_TIMER_LOOP,nLoop-1);
        AddTanMuXiang()
    end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
    --print("enter MS_ProcessStartedTimer--------------------------------")
    local nLoop = GetMissionV(MV_TIMER_LOOP);
    if nLoop == 0 then
        SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
	SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
        local nNpcIndex = GetGlbValue(1032)
        local nNpcState = GetUnitCurStates(nNpcIndex,1)-1
        if nNpcState == nil or nNpcState < MS_MAX_NUM_TANXIANGMU then
            AddGlobalCountNews(VET_201008_02_TB_STR_LIST[2],2)
        else
            AddGlobalCountNews(format(VET_201008_02_TB_STR_LIST[3],VET_201008_02_STR_CITY_NAME[GetGlbValue(1033)]),2)
        end
    else
	SetMissionV(MV_TIMER_LOOP,nLoop-1);
        AddTanMuXiang()
    end;
end;

--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
    --print("enter MS_ProcessEndingTimer--------------------------------")
   --Msg2SubWorld("MS_ProcessEndingTimer")
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
	    CloseMission(MISSION_ID);
            local nNpcIndex = GetGlbValue(1032)
            local nNpcState = GetUnitCurStates(nNpcIndex,1)-1
            local nRandMap = GetGlbValue(1033)
            if nNpcState >= MS_MAX_NUM_TANXIANGMU then
                local nRandom = random(1,4)
                Msg2Global(VET_201008_02_TB_STR_LIST[21])
                --print("//////////////*******************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
                nNpcIndex = CreateNpc(VET_201008_02_TB_BOSS_LIST[nRandom][1],VET_201008_02_TB_BOSS_LIST[nRandom][2],MAP_ID[nRandMap][1],MAP_ID[nRandMap][2],MAP_ID[nRandMap][3])
                SetNpcLifeTime(nNpcIndex,3600)
                SetNpcDeathScript(nNpcIndex,VET_201008_02_TB_BOSS_LIST[nRandom][3])
                --AddUnitStates(nNpcIndex,1,nRandom)
            end
	else
	    SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--登陆触发器函数
function OnLogin()
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;

function AddSiLingDing(nRandMap)
    local nNpcIndex = CreateNpc(VET_201008_02_TB_NPC_LIST[1][1],VET_201008_02_TB_NPC_LIST[1][2],MAP_ID[nRandMap][1],MAP_ID[nRandMap][2],MAP_ID[nRandMap][3],-1,1,1,100)
    SetNpcScript(nNpcIndex,VET_201008_02_TB_NPC_LIST[1][3])
    SetGlbValue(1032,nNpcIndex)
    --AddUnitStates(nNpcIndex,1,0) --记录npc处交檀香木的数量
    --print("nNpcIndex **************"..nNpcIndex)
end

function AddTanMuXiang()
    local nRandMap = GetGlbValue(1033)
    local nNpcIndex = 0
    local nMapID, nWx, nWy = MAP_ID[nRandMap][1], MAP_ID[nRandMap][2], MAP_ID[nRandMap][3]
    local nAddX = 0
    local nAddY = 0
    Msg2Global(VET_201008_02_TB_STR_LIST[19])
    --DoFireworks(871, 1)
    for i = 1, 68 do
        nAddX = random(-30, 30)
	nAddY = random(-30, 30)
        nNpcIndex = CreateNpc(VET_201008_02_TB_NPC_LIST[2][1],VET_201008_02_TB_NPC_LIST[2][2],nMapID,nWx+nAddX,nWy+nAddY)
        SetNpcScript(nNpcIndex,VET_201008_02_TB_NPC_LIST[2][3])
        SetNpcLifeTime(nNpcIndex, 55)
    end
end

