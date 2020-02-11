--作者：严军
--创建日期：07年11月13日14:50
--师门关卡公共函数脚本文件
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction_back_room\\back_room_head.lua");
Include("\\script\\task\\faction_back_room\\route_function.lua");
--获得秘室地图ID、索引与加载次数，没有多余地图时返回0,0,0
function BR_FindIdleRoom_test(nFaction)
	return TB_BACKROOM[nFaction],0,0;
end;
function BR_FindIdleRoom(nFaction,nType)
	if UNCOMPLETED_VERSION == 1 then
		return BR_FindIdleRoom_test(nFaction);
	end;
	local nCount = 0;
	local nMaxRoomNum = 0;
	if nType == 1 then
		nCount = BR_GetRouteDynamicMapCount(nFaction);
		nMaxRoomNum = MAX_ROUTE_ROOM_COUNT;
	elseif nType == 2 then
		nCount = BR_GetShareDynamicMapCount();
		nMaxRoomNum = MAX_ROOM_COUNT;
	end;
	if nCount >= nMaxRoomNum then
		return 0,0,0;
	end;
	local nMapID,nMapIdx = DynamicLoadMap(TB_BACKROOM[nFaction]);
	return nMapID,nMapIdx,nCount;
end;
--获得当前服务器已经动态加载了多少张师门关卡的地图
function BR_GetDynamicMapCount()
	local nCount = 0;
	for i=1,getn(TB_BACKROOM) do
		nCount = nCount + GetMapLoadCount(TB_BACKROOM[i]);
	end;
	return nCount;
end;
--获取某个流派当前已用地图数量
function BR_GetRouteDynamicMapCount(nFaction,nRoute)
	local tbMapID = gf_GetDataTable(GetSameMaps(TB_BACKROOM[nFaction]));
	local nCount = 0;
	local nMapID = 0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if mf_GetMissionV(MISSION_ID,MV_MAP_TYPE,nMapID) == nRoute then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;
--获取共享地图已使用数量
function BR_GetShareDynamicMapCount()
	local nCount = 0;
	for i=1,7 do	--7个门派
		nCount = BR_GetRouteDynamicMapCount(i,0) + nCount;
	end;
	return nCount;
end;
--删除某一门派的令牌
function BR_DelLingPai(nFaction,nCount)
	return DelItem(TB_LINGPAI[nFaction][1],TB_LINGPAI[nFaction][2],TB_LINGPAI[nFaction][3],nCount);
end;
--临时变量初始化
function BR_ClearTempTask()
	for i=TTSK_BEGIN,TTSK_END do
		SetTaskTemp(i,0);
	end;
end;
--任务变量清0
function BR_ClearNCTask()
	for i=TSK_NC_BEGIN,TSK_NC_END do
		SetTask(i,0);
	end;
end;
--地图变量清0
function BR_ClearMapTask(nMapID)
	for i=MAP_TSK_BEGIN,MAP_TSK_END do
		SetMapTaskTemp(nMapID,i,0);
	end;
end;
--开始下一关
function BR_NextStage()
	local nMapID = BR_GetCurMapID();
	BR_ClearMapNpcSafe(nMapID);
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nCurStage == 1 or nCurStage == 5 or nCurStage == 9 then
		if BR_EnterNextStageCheck(nCurDiff,nCurStage,nPIdx) == 0 then
			Say2SomeOne(nPIdx,"B筺 hi謓 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈 ? Ti誴 d蒼 m藅 th蕋 s? m玭.",0);
			Msg2MSAll(MISSION_ID,"B筺 hi謓 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈 ? Ti誴 d蒼 m藅 th蕋 s? m玭.");
			BR_ChangeMSState(MS_STATE_END_WAITING);
			BR_CreateDisciple();
			return 0;
		end;
	end;
	BR_InitStage(nCurDiff,nCurStage);
	BR_RestorePlayer();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nCurStage == 1 then	--如果是第一关
		SetTask(TSK_ENTER_TYPE,0, 0, nPIdx);	--进入类型清为0
		SetMissionV(MV_TOTAL_TIME,0);	--累计时间清0
	end;
	Msg2MSAll(MISSION_ID,""..TB_DIFF_NAME[nCurDiff].."第"..nCurStage.."关开启!");
	if DEBUG_VERSION == 1 then
		BR_CreateDisciple();
	end;
end;
--暂停关卡
function BR_PauseStage()
	BR_ChangeMSState(MS_STATE_READY);
	BR_CreateDisciple();
end;
--结束某一关、过关
function BR_EndStage()
	BR_UnInitStageEven(nCurDiff,nCurStage);
	local nCurDiff,nCurStage = 0,0;
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	local nNextDiff,nNextStage = nCurDiff,nCurStage+1;
	local nUseTime = GetTime() - GetMissionV(MV_BEGIN_TIME) + GetMissionV(MV_TOTAL_TIME); --计算本循环总用时
	SetMissionV(MV_TOTAL_TIME,nUseTime);
	local nEnterType = GetTask(TSK_ENTER_TYPE,nPIdx);
	if nEnterType == 1 then
		Msg2MSAll(MISSION_ID,"呃呃呃 "..TB_DIFF_NAME[nCurDiff].."的 "..nCurStage..",呃呃呃 ");
	else
		Msg2MSAll(MISSION_ID,"您闯过了"..TB_DIFF_NAME[nCurDiff].."第"..nCurStage.."关,总花费时间: "..tf_GetTimeString(nUseTime)..".");
	end;
	if nCurStage == MAX_STAGE then	--如果是循环内最后一关
		nNextDiff = nCurDiff + 1;	--进入下一循环
		nNextStage = 1;				--回归第1关
		if nBeginTime ~= 0 then
			if nEnterType == 1 then
				Msg2MSAll(MISSION_ID,"Ch骳 m鮪g b筺  vt qua 秈 "..TB_DIFF_NAME[nCurDiff]..", 產ng c d? li謚,  kh? n祔 kh玭g ghi l筰 th阨 gian");
				WriteLog(LOG_HEADER..",  kh?: "..nCurDiff..", 秈  "..nCurStage..". T猲: "..GetName(nPIdx)..", c蕄:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", th阨 gian: ng c s? li謚, kh玭g ghi l筰 th阨 gian");			
			else
				Msg2MSAll(MISSION_ID,"Ch骳 m鮪g b筺  vt qua 秈 "..TB_DIFF_NAME[nCurDiff]..", th阨 gian: "..tf_GetTimeString(nUseTime));
				if BR_UpDateTimeRecord(nCurDiff,nUseTime,nPIdx) == 1 then		--提交时间
					Msg2MSAll(MISSION_ID,"Ch骳 m鮪g b筺  chi課 th緉g b秐 th﹏ "..TB_DIFF_NAME[nCurDiff].."Vt 秈 v韎 th祅h t輈h nhanh nh蕋");
				end;
				WriteLog(LOG_HEADER..",  kh?: "..nCurDiff..", 秈  "..nCurStage..". T猲: "..GetName(nPIdx)..", c蕄:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", th阨 gian: "..nUseTime);			
			end;
		end;
	end;
	if nCurStage == 4 or nCurStage == 8 or nCurStage == 9 then
		BR_CreateAwardBox(nCurDiff,nCurStage,nPIdx);	--创建宝箱
		if GetTask(TSK_WC_FAIL_TIMES,nPIdx) >= MAX_FAILURE_TIMES then	--失败超过一定次数后自动存档
			BR_SaveRecord(nNextDiff,nNextStage,nPIdx);
		end;
	end;
	BR_SetCurDiff(nNextDiff);	--设置下一关
	BR_SetCurStage(nNextStage);	--设置下一关
	if nCurDiff == MAX_DIFFICULTY_LEVEL and nCurStage == MAX_STAGE then	--如果是最后循环最后关卡
		local szFactionName = gf_GetFactionName(GetMissionV(MV_FACTION));
		Msg2MSAll(MISSION_ID,"Ch骳 m鮪g b筺  vt qua to祅 b? kh秓 nghi謒, x鴑g ng l?  t? xu蕋 s綾 c馻 "..szFactionName..", xin h穣 i m閠 l竧, s? l藀 t鴆 chuy觧 b筺 ra ngo礽")
		BR_FinalEndStage();
		return 0;
	end;
	if nCurStage == MAX_STAGE or nCurStage == floor(MAX_STAGE/2) or nCurStage == MAX_STAGE-1 then	--打完4,8,9关后
		BR_PauseStage();	--补给阶段
	else	--进入短暂休息期
		--以结束某一关卡作为关卡之间的分界点
		BR_ChangeMSState(MS_STATE_SHORT_PAUSE);
	end;
end;
--通全关
function BR_FinalEndStage()
	BR_ChangeMSState(MS_STATE_END_WAITING);
	BR_CreateDisciple();
end;
--创建接引弟子
function BR_CreateDisciple()
	local nFaction = GetMissionV(MV_FACTION);
	local nMapID = BR_GetCurMapID();
	local nMapX = TB_ENTRY_POS[nFaction][1];
	local nMapY = TB_ENTRY_POS[nFaction][2];
	local nNpcIdx = CreateNpc("王安石","接引人",nMapID,nMapX,nMapY);
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_disciple.lua");
end;
--创建关卡NPC
function BR_CreateStageNpc(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	local nFaction = GetMissionV(MV_FACTION);
	local nNpcModelName = TB_STAGE_INFO[nRoute][0][1][1]..nDiff;
	local nNpcName = TB_STAGE_INFO[nRoute][0][1][2];
	local nNpcCount = TB_STAGE_INFO[nRoute][nDiff][1][nStage];
	local nMapID = BR_GetCurMapID();
	local nMapX,nMapY = 0,0;
	local nNpcIdx = 0;
	local nPosSize = getn(TB_NPC_POS[nFaction]);
	local nPosIdx = 0;
	for i=1,nNpcCount do
		nPosIdx = mod(i-1,nPosSize)+1;
		nMapX,nMapY = TB_NPC_POS[nFaction][nPosIdx][1],TB_NPC_POS[nFaction][nPosIdx][2];
		nNpcIdx = BR_CreateNpc(nNpcModelName,nNpcName,nMapID,nMapX,nMapY);
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\faction_back_room\\death_npc.lua");
		SetMissionV(MV_NPC_INDEX_BEGING+i-1,nNpcIdx);
	end;
end;
--创建BOSS
function BR_CreateBoss(nDiff)
	local nRoute = GetMissionV(MV_ROUTE);
	local nFaction = GetMissionV(MV_FACTION);
	local nNpcModelName = TB_STAGE_INFO[nRoute][0][2][1]..nDiff;
	local nNpcName = TB_STAGE_INFO[nRoute][0][2][2];
	local nMapID = BR_GetCurMapID();
	local nMapX,nMapY = TB_BOSS_POS[nFaction][1],TB_BOSS_POS[nFaction][2];
	local nNpcIdx = BR_CreateNpc(nNpcModelName,nNpcName,nMapID,nMapX,nMapY);
	SetMissionV(MV_NSC_BOSS_INDEX,nNpcIdx);
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\faction_back_room\\death_npc.lua");	
end;
--检查当前状况是否过关
function BR_CheckWinCondition(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nCurKillCount = GetMissionV(MV_NSC_KILL_NPC_COUNT);
	local nNeedKillCount = GetMissionV(MV_NSC_NEED_KILL_NUMBER);
	if nCurKillCount >= nNeedKillCount then
		return 1;
	else
		return 0;
	end;
end;
--一周一清
function BR_WeeklyClear()
	local nWeek = tonumber(date("%y%W"));
	if GetTask(TSK_ATTEND_WEEK) < nWeek then
		for i=TSK_WC_BEGIN,TSK_WC_END do
			SetTask(i,0);
		end;
	end;
end;
--把时间（单位秒）转换为循环次数
function BR_TransformTime2Loop(nState,nSec)
	local nLoop = 0;
	if nState == MS_STATE_READY then
		nLoop = floor((nSec/60)/READY_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_STARTED then
		nLoop = floor((nSec/60)/STARTED_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_SHORT_PAUSE then
		nLoop = floor((nSec/60)/SHORT_PAUSE_TIMER_COUNT)-1;
	elseif nState == MS_STATE_END_WAITING then
		nLoop = floor((nSec/60)/ENDING_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_IDEL then
		nLoop = 0;
	end;
	return nLoop;
end;
--设置循环总数
function BR_SetStageTimerLoop(nLoop)
	SetMissionV(MV_TIMER_LOOP,nLoop);
end;
--获取当前循环总数
function BR_GetStageTimerLoop()
	return GetMissionV(MV_TIMER_LOOP);
end;
--获取当前难度
function BR_GetCurDiff()
	return GetMissionV(MV_CUR_DIFF);
end;
--设置当前难度
function BR_SetCurDiff(nDiff)
	SetMissionV(MV_CUR_DIFF,nDiff);
end;
--获取当前是第几关
function BR_GetCurStage()
	return GetMissionV(MV_CUR_STAGE);
end;
--设置当前是第几关
function BR_SetCurStage(nStage)
	SetMissionV(MV_CUR_STAGE,nStage);
end;
--获取Mission当前状态
function BR_GetMSCurState()
	return GetMissionV(MV_MISSION_STATE);
end;
--获取计时器当前状态
function BR_GetTimerState()
	return GetMissionV(MV_MISSION_STATE);
end;
--设置计时器当前状态
function BR_SetTimerState(nState)
	SetMissionV(MV_MISSION_STATE,nState);
end;
--检查当前地图ID是否合法
function BR_CheckMap()
	return 1;
end;
--获得某关信息
function BR_GetStageInfo(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if DEBUG_VERSION == 1 then
		if nStage == MAX_STAGE then
			return 180,1;
		else
			return 180,nDiff;
		end;
	end;
	if nStage == MAX_STAGE then	
		return TB_STAGE_INFO[nRoute][0][3][1],TB_STAGE_INFO[nRoute][0][3][2];	--总时间，要杀NPC数量
	else
		return TB_STAGE_INFO[nRoute][nDiff][2][nStage],TB_STAGE_INFO[nRoute][nDiff][3][nStage];	--总时间，要杀NPC数量
	end;
end;
--提交时间到数据库
function BR_UpDateTimeRecord(nDiff,nTime,nPIdx)
	local nRoute = GetMissionV(MV_ROUTE);
	local nTaskID = TSK_BEST_RECORD_BEGIN+nDiff-1;
	local nBestRecord = GetTask(nTaskID,nPIdx);
	if nBestRecord == 0 then
		nBestRecord = nTime;
	end;
	SetMissionV(MV_TOTAL_TIME,0);
	if nTime <= nBestRecord then
		SetTask(nTaskID,nTime, 0, nPIdx);
		AddRelayShareData(BACKROOM_RELAY_KEY,nRoute,nDiff,"","",1,GetName(nPIdx),"d",nTime);
		return 1;
	else
		return 0;
	end;
end;
--初始化关卡
function BR_InitStage(nDiff,nStage)
	local nCurTime = GetTime();
	SetMissionV(MV_BEGIN_TIME,nCurTime);	--开始计时
	SetMissionV(MV_NSC_KILL_NPC_COUNT,0);
	if nDiff == 8 or nDiff == 9 then --20080825 加入8、9循环不能更换装备限制
		BR_LockEquipment(1);
	end
	if nStage == MAX_STAGE then
		BR_CreateBoss(nDiff);
	else
		BR_CreateStageNpc(nDiff,nStage);	
	end;
	BR_ChangeMSState(MS_STATE_STARTED);
	local nTime,nNpcCount = BR_GetStageInfo(nDiff,nStage);
	local nLoop = BR_TransformTime2Loop(MS_STATE_STARTED,nTime);
	BR_SetStageTimerLoop(nLoop);
	BR_InitStageEven(nDiff,nStage);
	BR_StartTimeGuage("T鎛g th阨 gian  ",nTime,0,0);
	SetMissionV(MV_NSC_NEED_KILL_NUMBER,nNpcCount);
	Msg2MSAll(MISSION_ID,"您还有:"..tf_GetTimeString(nTime)..".本关需要击杀守卫数量: "..nNpcCount);
end;
--转换Mission当前状态
function BR_ChangeMSState(nState)
	SetMissionV(MV_MISSION_STATE,nState);
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置开始状态的持续时间
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	elseif nState == MS_STATE_SHORT_PAUSE then
		SetMissionV(MV_TIMER_LOOP,SHORT_PAUSE_TIMER_COUNT);	--设置开始状态的持续时间
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,SHORT_PAUSE_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	elseif nState == MS_STATE_END_WAITING then
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--恢复玩家状态
function BR_RestorePlayer()
	local nOldPIdx = PlayerIndex;
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	Restore();
	RestoreNeili();
	ClearColdDown();	--清除所有药CD
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	PlayerIndex = nOldPIdx;
end;
--创建宝箱
function BR_CreateAwardBox(nDiff,nStage,nPIdx)
	local nFaction = GetMissionV(MV_FACTION);
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nMapID,nMapX,nMapY = GetWorldPos();
	local nNpcIdx = CreateNpc("箱子钱",""..TB_DIFF_NAME[nDiff].."第"..nStage.."关宝箱",nMapID,nMapX,nMapY);
	gf_SetUnitCurState(nNpcIdx,1,nDiff);
	gf_SetUnitCurState(nNpcIdx,2,nStage);
	gf_SetUnitCurState(nNpcIdx,3,0);	--设置为未拾取
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_box.lua");
	PlayerIndex = nOldPIdx;
end;
--初始化关卡设置。统一入口函数
function BR_InitStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_INIT_STAGE_FUN[nRoute] ~= nil then
		TB_INIT_STAGE_FUN[nRoute](nDiff,nStage);
	end;
end;
--执行关卡事件。统一入口函数
function BR_ProcStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_PROC_STAGE_EVEN_FUN[nRoute] ~= nil then
		TB_PROC_STAGE_EVEN_FUN[nRoute](nDiff,nStage);
	end;
end;
--反初始化关卡设置。统一入口函数
function BR_UnInitStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_UNINIT_STAGE_FUN[nRoute] ~= nil then
		TB_UNINIT_STAGE_FUN[nRoute](nDiff,nStage);
	end;
	BR_CastPlayerState("");
	BR_ClearNSCValue();
	local nMapID = BR_GetCurMapID();
	BR_ClearMapNpcSafe(nMapID);
	BR_StopTimeGuage(-2);
	if DEBUG_VERSION == 1 then
		BR_CreateDisciple();
	end;
end;
--检查MS_STATE_STARTED阶段计时器当前位置
--参数1表示时间，参数2为0时表示判断当前计时器是否在参数1所填的时间点上
--参数2为1时表示当前计时器是否在以参数1为间隔的时间点上，参数2默认值为1
--如输入参数为10,0时，则在计时器时间为10秒时函数返回1,其它时间返回0；
--如输入参数为10,1时，则计时器时间为10,20,30,40......时返回1,其它时间返回0
--如果参数1的数值不是计时器时间间隔的整数倍，则向下对齐
function BR_CheckTimerPosition(nStartTime,nTime,bInterval)
	bInterval = bInterval or 1;
	local nLoop = floor(nTime/(STARTED_TIMER_INTERVAL*60));
	local nStartLoop = floor(nStartTime/(STARTED_TIMER_INTERVAL*60));
	local nCurLoop = BR_GetStageTimerLoop();
	local nDiff = BR_GetCurDiff();
	local nStage = BR_GetCurStage();
	local nTime = BR_GetStageInfo(nDiff,nStage);
	local nTotalLoop = BR_TransformTime2Loop(MS_STATE_STARTED,nTime);
	if nTotalLoop - nCurLoop < nStartLoop then
		return 0;
	end;
	nCurLoop = nCurLoop + nStartLoop;
	if bInterval == 1 then
		if mod(nTotalLoop - nCurLoop + 1,nLoop) == 0 then
			return 1;
		else
			return 0;
		end;
	else
		if nTotalLoop - nCurLoop + 1 == nLoop then
			return 1;
		else
			return 0;
		end;
	end;
end;
--给玩家加状态，如果参数１为""则移除玩家身上所有临时状态
function BR_CastPlayerState(szState,nValue,nTime,bForceInstead,nID)
	local nOldPIdx = PlayerIndex
	nValue = nValue or 0;
	nTime = nTime or -1;
	bForceInstead = bForceInstead or 1;
	nID = nID or 0;
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	if szState == "" then
		gf_RemoveTempState();
	else
		CastState(szState,nValue,nTime*18,bForceInstead,TEMP_STATE_BEGIN+nID);
	end;
	PlayerIndex = nOldPIdx;
end;
--获得当前地图ID
function BR_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;
--获得场地的MSUID
function BR_GetMSUID()
	return GetMissionV(MV_MISSION_UID);
end;
--清除用来记录NPC索引的Mission变量
function BR_ClearNpcIndex()
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		SetMissionV(i,0);
	end;
end;
--用来清除NSC(New-Stage-Clear)变量,包括记NPC索引的变量
function BR_ClearNSCValue()
	for i=MV_NSC_BEGIN,MV_NSC_END do
		SetMissionV(i,0);
	end;
	BR_ClearNpcIndex();
end;
--移除一个NPC索引
function BR_RemoveNpcIndex(nNpcIdx)
	nNpcIdx = tonumber(nNpcIdx);
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		if GetMissionV(i) == nNpcIdx then
			SetMissionV(i,0);
			return 1;
		end;
	end;
	gf_ShowDebugInfor("BR_RemoveNpcIndex nh薾 nNpcIdx kh玭g ? bi課 lng k? l鬰 trong Mission");
	WriteLog(LOG_ERR_HEADER.."BR_RemoveNpcIndex nh薾 nNpcIdx kh玭g ? bi課 lng k? l鬰 trong Mission");
	return 0;
end;
--获得一个可用的MissionV变量，这个变量用来记录NPC索引
function BR_GetNPCMissionV()
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		if GetMissionV(i) == 0 then
			return i;
		end;
	end;
	return 0;
end;
--创建一组NPC，随机位置，可指定阵营，可设置生存时间
function BR_CreateFellow(szModelName,szNpcName,nCount,nCamp,tbPos,nLifeTime)
	local nNpcIdx = 0;
	local nMapID = BR_GetCurMapID();
	local nPosIdx = 0;
	local nPosSize = getn(tbPos);
	local tbTemp = gf_CopyTable(tbPos);	--复制一个新的table
	local tbNpcIdx = {};
	for i=1,nCount do
		nPosIdx = random(1,getn(tbTemp));
		nMapX = tbTemp[nPosIdx][1];
		nMapY = tbTemp[nPosIdx][2];
		nNpcIdx = BR_CreateNpc(szModelName,szNpcName,nMapID,nMapX,nMapY,nCamp);
		tinsert(tbNpcIdx,nNpcIdx);
		if nLifeTime ~= nil then
			SetNpcLifeTime(nNpcIdx,nLifeTime);
		end;
		tremove(tbTemp,nPosIdx);
	end;
	return tbNpcIdx;
end;
--保存进度
function BR_SaveRecord(nDiff,nStage,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex
	if nDiff > MAX_DIFFICULTY_LEVEL then	--如果是最后循环最后关卡就不存档了
		SetTask(TSK_WC_LAST_RECORD,0);	--通全关后清档
		SetTask(TSK_WC_FAIL_TIMES,GetTask(TSK_WC_FAIL_TIMES)+1);
		Msg2MSAll(MISSION_ID,"Х xo? d? li謚, y l? l莕 xo? th? "..GetTask(TSK_WC_FAIL_TIMES).." trong tu莕 c馻 b筺 ");
		return 0;
	end;
	local nRecord = nDiff*100+nStage;
	SetTask(TSK_WC_LAST_RECORD,nRecord);
	Msg2MSAll(MISSION_ID,"保存进度: "..TB_DIFF_NAME[nDiff].."第"..nStage.."关.");
	PlayerIndex = nOldPIdx;
end;
--获得进度保存信息
function BR_GetSaveRecord()
	local nRecord = GetTask(TSK_WC_LAST_RECORD);
	local nDiff = floor(nRecord/100);
	local nStage = mod(nRecord,100);
	return nDiff,nStage;
end;
--关闭关卡
function BR_CloseStage()
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	CloseMission(MISSION_ID);
	if UNCOMPLETED_VERSION ~= 1 then
		local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMap也会调用CloseMisssion
		if nRetCode ~= 0 then
			WriteLog(LOG_ERR_HEADER.."FreeDynamicMap ph竧 sinh l鏸, nRetCode:"..nRetCode);
		end;
	end;
end;
--修改NPC血量，参数1：NPC索引，参数2：血量值，参数3：增量值还是绝对值（1为增，0为绝），参数4：是否为百分比，1表示是，0表示不是（默认是1）
function BR_ModifyNpcLife(nNpcIdx,nValue,nFlag,bPercent)
	bPercent = bPercent or 1;
	if bPercent == 0 then	--如果不是百分比
		ModifyNpcData(nNpcIdx,0,nValue,nFlag);
		return 0;
	end;
	local nNpcMaxLife = GetUnitCurStates(nNpcIdx,1);	
	local nDamage = floor(nNpcMaxLife*nValue/100);	--根据百分比来计算改变的血量
	ModifyNpcData(nNpcIdx,0,nDamage,nFlag);
end;
--检查地图是不是正确的
function BR_CheckMissionName()
	local nMSUID = BR_GetMSUID();
	if GetMissionS(MS_MISSION_NAME) == MISSION_NAME..nMSUID then
		return 1;
	else
		return 0;
	end;
end;
--封装的CreateNpc
function BR_CreateNpc(szModelName,szName,nMapID,nMapX,nMapY,nCamp)
	nCamp = nCamp or CAMP_ENEMY;	--默认为敌对阵营
	local nNpcIdx = CreateNpc(szModelName,szName,nMapID,nMapX,nMapY);	
	SetCampToNpc(nNpcIdx,TB_CAMP_NAME[nCamp]);
	return nNpcIdx;
end;
--安全删除地图上的所有NPC
function BR_ClearMapNpcSafe(nMapID)
	if BR_CheckMissionName() == 1 then
		ClearMapNpc(nMapID);
		return 1;
	else
		WriteLog(LOG_ERR_HEADER.."H祄 s? BR_ClearMapNpcSafe ph竧 sinh l鏸 khi ki觤 tra b秐 ");
		return 0;
	end;
end;
--开启时间进度条
function BR_StartTimeGuage(szInfo,Duration,bRepeat,nCustomID)
	local nOldPIdx = PlayerIndex
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	StartTimeGuage(szInfo,Duration,bRepeat,nCustomID);
	PlayerIndex = nOldPIdx;
end;
--停止时间进度条
function BR_StopTimeGuage(nCustomID)
	local nOldPIdx = PlayerIndex
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	StopTimeGuage(nCustomID);
	PlayerIndex = nOldPIdx;
end;

--检查地图是否为合法的可进入秘室的地图
function BR_CheckEntryMapID(nMapID)
	for i,v in TB_EXIT_POS do
		if i == nMapID then
			return 1;
		end;
	end;
	return 0;
end;
--检查当前地图是不是城市地图
function BR_CheckCityMapID()
	local nMapID = GetWorldPos();
	local tb = {100,150,200,300,350,400,500};	--七大城市。应该不会再增加了吧？
	for i=1,getn(tb) do
		if nMapID == tb[i] then
			return 1;
		end;
	end;
	return 0;
end;
--安全可靠的传送
function BR_SafeTransmission()
	for i,v in TB_EXIT_POS do
		if SubWorldID2Idx(i) ~= -1 then	--如果这张地图在当前服务器有被加载
			NewWorld(i,TB_EXIT_POS[i][1],TB_EXIT_POS[i][2]);
		end;
	end;
end;
--拾取宝箱获得奖励
function BR_GetBoxAward(nDiff,nStage)
	local tbDropInfo = TB_DROP_INFO[nDiff][nStage];
	local nFaction = GetPlayerFaction();
	for i=1,getn(tbDropInfo) do
		local nCount = tbDropInfo[i];
		local nRand = 0;
		if nCount > 0 then
			if nCount >= 2 then	--数值大于等于2的物品掉落有30%几率掉落数量减1，有30%几率掉落数量加1，另40%几率不变
				nRand = random(1,100);
				if nRand <= 30 then
					nCount = nCount - 1;
				elseif nRand <= 60 then
					nCount = nCount + 1;
				end;
			end;
			AddItem(TB_TOTEM_INFO[nFaction][i][1],TB_TOTEM_INFO[nFaction][i][2],TB_TOTEM_INFO[nFaction][i][3],nCount);
			Msg2Player("您获得"..nCount.."个"..TB_TOTEM_INFO[nFaction][i][4]);
		end;
	end;
	local nExp = 0;
	local nGongXian = 0;
	if IB_VERSION == 1 then	--免费区
		nExp = 160000;
		nGongXian = 25;
	else	--收费区
		nExp = 250000;
		nGongXian = 40;	
	end;
	ModifyExp(nExp);
	Msg2Player("您获得"..nExp.."经验值");
	local nCurGongXian = GetTask(336);
	if nCurGongXian > 12500 then
		Msg2Player("您额外获得12500经验值奖励");
	else
		SetTask(336,nCurGongXian+nGongXian);
		Msg2Player("B筺 nh薾 頲 "..nGongXian.." 甶觤 c鑞g hi課 S? M玭 ");
	end;
	Msg2Player("您获得了"..TB_DIFF_NAME[nDiff].."第"..nStage.."关宝箱.");
	WriteLog(LOG_HEADER..GetName().." nh薾  kh?"..nDiff.."th?"..nStage..".	");
end;
--进入每关前的检测
function BR_EnterNextStageCheck(nDiff,nStage,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	if PlayerIndex == 0 then
		return 0;
	end;
	if BR_CheckLevel(nDiff,nStage) == 0 then
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	if BR_CheckTitle(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	if BR_CheckEquipment(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	if BR_CheckRouteFeature(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	PlayerIndex = nOldPIdx;
	return 0;
end;
function BR_CheckLevel(nDiff,nStage)
	local nLevel = GetLevel();
	local tbLevelNeed = {50,50,50,50,50,70,70,85,85};
	if nLevel < tbLevelNeed[nDiff] then
		return 0;
	end;
end;
--检测称号
function BR_CheckTitle(nDiff,nStage)
	local nTitleID1,nTitleID2 = GetCurTitle();
	if nDiff <= 5 then
		return 1;
	end;
	if nDiff == 8 or nDiff == 9 then  --8、9难度不判断
		return 0;
	end;
	local tbTitleNeed = 	--定义所有称号信息
	{
		[1] = {{30,11},{30,5}},	--将军
		[2] = {{30,12},{30,6}},	--元帅
		[3] = {{51,1},{51,2},{51,5},{51,6},{51,9},{51,10}},	--城主
		[4] = {{51,3},{51,7},{51,11}},	--军师
		[5] = {{51,4},{51,8},{51,12}},	--名捕
		[6] = {{30,4},{30,10}},	--先锋
		[7] = {{30,3},{30,9}},	--都统
	}
	local tbCheck = 	--定义各难度所要检查的称号类型
	{
		[1] = nil,
		[2] = nil,
		[3] = nil,
		[4] = nil,
		[5] = nil,
		[6] = {1,2,3,4,5,6,7},
		[7] = {1,2,3,4,5,6,7},
		[8] = {1,2,3},
		[9] = {1,2,3},
	}
	local tbTitleInfo = tbCheck[nDiff];
	if tbTitleInfo == nil then
		return 1;
	end;
	local nTitleType = 0;
	for i=1,getn(tbTitleInfo) do
		nTitleType = tbTitleInfo[i];
		for j=1,getn(tbTitleNeed[nTitleType]) do
			if nTitleID1 == tbTitleNeed[nTitleType][j][1] and nTitleID2 == tbTitleNeed[nTitleType][j][2] then
				return 1;
			end;
		end;	
	end;
	return 0;
end;
--检测装备
function BR_CheckEquipment(nDiff,nStage)
	if nDiff <= 5 then
		return 1;
	end;
	if (BR_CheckYanDiEquip() == 1 or BR_CheckHuangDiEquip() == 1 or BR_CheckTDXHEquip() == 1) and nDiff ~= 8 and nDiff ~= 9 then --8、9关只能穿师门第4套
		return 1;
	end;
	if nDiff == 6 or nDiff == 7 then
		if BR_CheckFactionEquip(3,2) == 1 or BR_CheckFactionEquip(4,2) == 1 or BR_CheckFactionEquip(5,3) == 1 then
			return 1;
		end;
	end;
	if nDiff == 8 or nDiff == 9 then
		if BR_CheckFactionEquip(4,6) == 1 then
			return 1;
		end;	
	end;
	return 0;
end;
--检查炎帝装
function BR_CheckYanDiEquip()
	local nSuitID1 = GetEquipSuitID(GetPlayerEquipIndex(0));
	local nSuitID2 = GetEquipSuitID(GetPlayerEquipIndex(1));
	local nSuitID3 = GetEquipSuitID(GetPlayerEquipIndex(3));
	local nBody = GetBody();
	if (nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 80000+nBody) or (nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 80064+nBody) then
		return 1;
	else
		return 0;
	end;
end;
--检查黄帝
function BR_CheckHuangDiEquip()
	local nRoute = GetPlayerRoute();
	local nSuitID1 = GetEquipSuitID(GetPlayerEquipIndex(2));
	local nSuitID2 = GetEquipSuitID(GetPlayerEquipIndex(4));
	local nSuitID3 = GetEquipSuitID(GetPlayerEquipIndex(5));
	local nCheckRetCode,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRetCode ~= 1 then
		return 0;
	end;
	if nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 88000+nRoutePos then
		return 1;
	else
		return 0;
	end;
end;
--检查天地玄黄
function BR_CheckTDXHEquip()
	local nEquipIdx1 = GetPlayerEquipIndex(0);	--头
	local nEquipIdx2 = GetPlayerEquipIndex(1);	--衣
	local nEquipIdx3 = GetPlayerEquipIndex(2);	--武器
	local nEquipIdx4 = GetPlayerEquipIndex(3);	--裤子
	local nID1,nID2,nID3 = 0,0,0;
	local nBody = GetBody();
	local tbTDXHWeapon = 
	{
		{0,3,67},{0,8,100},{0,0,17},{0,1,56},{0,2,39},{0,10,78},{0,0,17},
		{0,5,43},{0,2,39},{0,9,89},{0,6,111},{0,4,122},{0,11,15},{0,7,15},
	}
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx1);	--头
	if nID1 ~= 0 or nID2 ~= 103 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx2);--衣
	if nID1 ~= 0 or nID2 ~= 100 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx3);--武器
	local bWeaponCheck = 0;
	for i=1,getn(tbTDXHWeapon) do
		if nID1 == tbTDXHWeapon[i][1] and nID2 == tbTDXHWeapon[i][2] and nID3 == tbTDXHWeapon[i][3] then
			bWeaponCheck = 1;
		end;
	end;
	if bWeaponCheck == 0 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx4);--裤子
	if nID1 ~= 0 or nID2 ~= 101 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	return 1;
end;
--检查师门装备,参数nGen表示第几套，nNum是最低检查件数
function BR_CheckFactionEquip(nGen,nNum)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nFaction = GetPlayerFaction();
	local nSuitID = nRoute*1000+(nGen-1)*10+nBody;
	if nFaction == 3 then	--如果是峨嵋
		nSuitID = nSuitID - 2;
	end;
	local nCheckNum = 0;
	local nEquipIdx = 0;
	for i=1,6 do	--检查头衣裤武器首饰1首饰2
		nEquipIdx = GetPlayerEquipIndex(i-1);
		if GetEquipSuitID(nEquipIdx) == nSuitID then
			nCheckNum = nCheckNum + 1;
		end;
	end;
	if nCheckNum >= nNum then
		return 1;
	else
		return 0;
	end;
end;
--检查流派特色
function BR_CheckRouteFeature(nDiff,nStage)
	if gf_CheckPlayerRoute() == 0 then
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	if nDiff <= 5 then
		return 1;
	end;
	if nDiff == 8 or nDiff == 9 then  --8、9难度不判断
		return 0;
	end;	
	local nLL = GetAllStrength() - GetStrength();		--力量1
	local nSF = GetAllDexterity() - GetDexterity();		--身法2
	local nNG = GetAllEnergy() - GetEnergy();			--内功3
	local nDC = GetAllObserve() - GetObserve();			--洞察4
	local nGG = GetAllVitality() - GetVitality();		--根骨5
	local tbPro = {nLL,nSF,nNG,nDC,nGG};
	local tbRouteFeature = 
	{	--{{属性1,属性2},{45循环限制数值,67循环限制数值,89循环限制数值}}
		 [0] = {},
		 [1] = {},	
		 [2] = {{{1,5},{225,275,400}}},	--少林俗家
		 [3] = {{{3,5},{210,255,380}}},	--少林禅僧
		 [4] = {{{3,5},{200,245,370}}},	--少林武僧
		 [5] = {},			--唐门
		 [6] = {{{1,2},{180,225,350}},{{2,3},{160,215,340}}},	--唐门
		 [7] = {},			--峨嵋
		 [8] = {{{3,5},{200,245,370}}},	--峨嵋佛家
		 [9] = {{{2,3},{165,215,340}},{{3,5},{185,230,350}}},	--峨嵋俗家
		[10] = {},			--丐帮
		[11] = {{{1,5},{220,265,390}}},--丐帮净衣
		[12] = {{{2,4},{110,155,280}},{{1,2},{160,205,330}}},--丐帮污衣
		[13] = {},			--武当
		[14] = {{{3,4},{170,215,340}},{{2,3},{150,195,320}}},--武当道家
		[15] = {{{2,4},{110,155,280}},{{1,4},{160,205,330}}},--武当俗家
		[16] = {},			--杨门
		[17] = {{{1,5},{220,265,390}}},--杨门枪骑
		[18] = {{{1,2},{180,225,370}}},--杨门弓骑
		[19] = {},			--五毒
		[20] = {{{1,2},{180,225,370}}},--五毒邪侠
		[21] = {{{3,4},{160,205,330}},{{4,5},{150,195,320}}},--五毒蛊师
	}
	local nIndex = 0;
	if nDiff == 4 or nDiff == 5 then
		nIndex = 1;
	elseif nDiff == 6 or nDiff == 7 then	--080505修改：67难度改为与45难度一样
		nIndex = 1;
	elseif nDiff == 8 or nDiff == 9 then
		nIndex = 3;
	end;
	local tbInfo = {};
	for i=1,getn(tbRouteFeature[nRoute]) do
		tbInfo = tbRouteFeature[nRoute][i];
		if tbPro[tbInfo[1][1]]+tbPro[tbInfo[1][2]] >= tbInfo[2][nIndex] then
			return 1;
		end;
	end;
	return 0; 
end;
--给NPC播放特效
function BR_SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat)
	nPos = nPos or 2;	--默认在头部播
	bRepeat = bRepeat or 0;	--默认不循环
	if IsNpcDeath(nNpcIdx) == 0 then	--如果NPC还活着就播放特效
		SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat);
	end;
end;
--给玩家播放特效
function BR_SetCurrentPlayerSFX(nEffectID,nPos,bRepeat)
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nPIdx == 0 then
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nNpcIdx = PIdx2NpcIdx(nPIdx);	--此指令要在PlayerIndex有效的情况下才能起作用
	BR_SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat);
	PlayerIndex = nOldPIdx;
	return 1;
end;
--锁定与解锁装备
function BR_LockEquipment(bLock)
	local tbEquipPos = {0,1,2,3,4,5};
	for i=1,getn(tbEquipPos) do
		ForbidEquipSolt(tbEquipPos[i],bLock);
	end;
end;
--===================================================================================
function BR_KnowLimit()
	local selTab = {
			". 6, 7 tu莕 ho祅 (n c蕄 70)/backroom_know_limit_2",
			". 8, 9 tu莕 ho祅 (n c蕄 85)/backroom_know_limit_3",
			"* Quay l筰/main",
			". K誸 th骳 i tho筰/nothing",
			}
	Say(g_szInforHeader.."1, 2, 3, 4, 5 tu莕 ho祅, n c蕄 50 c? th? tham gia.",getn(selTab),selTab);
end;

function backroom_know_limit_2()
	Talk(2,"backroom_know_limit_2_1","Ph秈  t? c竎h 1 trong nh鱪g 甶襲 ki謓 b猲 di: \nDanh hi謚: m閠 trong b蕋 k? danh hi謚 tng qu﹏, nguy猲 so竔, ti猲 phong,  th鑞g, th祅h ch? qu﹏ s?, danh b閈nTrang b?: m閠 trong b蕋 k?  b? vi猰 ,  thien chi vi猰 , ho祅g , thi猲 a huy襫 ho祅g, 2 m鉵 s? m玭 b? 3 tr? l猲, 2 m鉵 s? m玭 b? 4 tr? l猲\n    Thi誹 L﹎ t鬰 gia: trang b?, tr筺g th竔 c飊g v韎 h? ph竔 c? t蕋 c? c竎 tr? s? s鴆 m筺h g﹏ c鑤 c閚g l筰 h琻 225\n    Thi誹 L﹎ v? t╪g:  trang b?, tr筺g th竔 c飊g  c竎 thu閏 t輓h t鎛g n閕 c玭g v? g﹏ c鑤 c閚g l筰 ph秈 h琻 200 甶觤","    Thi誹 L﹎ thi襫 t╪g: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g g﹏ c鑤, n閕 c玭g t鎛g c閚g h琻 210 甶觤\n    Л阯g M玭: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, s鴆 m筺h t鎛g c閚g h琻 180 甶觤 ho芻 t╪g th﹏ ph竝, n閕 c玭g t鎛g c閚g h琻 160 甶觤\n    Nga My ph藅 gia: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g g﹏ c鑤, n閕 c玭g t鎛g c閚g h琻 200 甶觤\n    Nga My t鬰 gia: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, n閕 c玭g t鎛g c閚g h琻 165 甶觤 ho芻 t╪g g﹏ c鑤, n閕 c玭g t鎛g c閚g h琻 185 甶觤");

end;

function backroom_know_limit_2_1()
	Talk(2,"BR_KnowLimit","    C竔 Bang t辬h y: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g g﹏ c鑤, s鴆 m筺h t鎛g c閚g h琻 220 甶觤\n    C竔 Bang ? y: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, nhanh nh裯 t鎛g c閚g h琻 110 甶觤 ho芻 t╪g th﹏ ph竝, s鴆 m筺h t鎛g c閚g h琻 160 甶觤\n    V? ng o gia: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g n閕 c玭g, nhanh nh裯 t鎛g c閚g h琻 170 甶觤 ho芻 t╪g n閕 c玭g, th﹏ ph竝 t鎛g c閚g h琻 150 甶觤\n    V? ng t鬰 gia: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g nhanh nh裯, th﹏ ph竝 t鎛g c閚g h琻 110 甶觤 ho芻 t╪g nhanh nh裯, s鴆 m筺h t鎛g c閚g h琻 160 甶觤","    Dng M玭 thng k?: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g s鴆 m筺h, g﹏ c鑤 t鎛g c閚g h琻 220 甶觤\n    Dng M玭 cung k?: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, s鴆 m筺h t鎛g c閚g h琻 180 甶觤\n    Ng? чc t? hi謕: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, s鴆 m筺h t鎛g c閚g h琻 180 甶觤\n    Ng? чc c? s?: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g nhanh nh裯, n閕 c玭g t鎛g c閚g h琻 160 甶觤 ho芻 nhanh nh裯, g﹏ c鑤 t鎛g c閚g h琻 150 甶觤");
end;

function backroom_know_limit_3()
--	Talk(2,"backroom_know_limit_3_1","以下所有条件满足任何一种即可：\n称号：现出将军，元帅，都统，先锋，城主，军师，名捕任何一种\n装备：穿戴炎帝全套，黄帝全套，天地玄黄全套，师门第3套4件极其以上，师门第4套4件极其以上任何一种\n    少林俗家：装备,状态以及流派额外属性加成所加的力量根骨总值大于400点","    少林武僧：装备，状态以及流派额外属性加成的内功根骨总值大于370点\n    少林禅僧：装备，状态以及流派额外属性加成的内功根骨总值大于380点\n    唐门：装备，状态以及流派额外属性加成的身法力量总值大于350点或者身法内功总值大于340点\n    峨嵋佛家：装备，状态以及流派额外属性加成的内功根骨总值大于370点\n    峨嵋俗家：装备，状态以及流派额外属性加成的内功身法总值大于340点或者内功根骨总值大于350点");
	Talk(1,"BR_KnowLimit","8, 9 tu莕 ho祅, ch? c? th? m芻 b? trang b? s? m玭 4, trong qu? tr譶h vt 秈 kh玭g 頲 thay i trang b?.")
end;

function backroom_know_limit_3_1()
	Talk(2,"BR_KnowLimit","    C竔 Bang t辬h y: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g s鴆 m筺h, g﹏ c鑤 t鎛g c閚g h琻 390 甶觤\n    C竔 Bang ? y: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, nhanh nh裯 t鎛g c閚g h琻 280 甶觤 ho芻 t╪g th﹏ ph竝, s鴆 m筺h t鎛g c閚g h琻 330 甶觤\n    V? ng o gia: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g n閕 c玭g, nhanh nh裯 t鎛g c閚g h琻 340 甶觤 ho芻 n閕 c玭g, th﹏ ph竝 t鎛g c閚g h琻 320 甶觤\n    V? ng t鬰 gia: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g nhanh nh裯, th﹏ ph竝 t鎛g c閚g h琻 280 甶觤 ho芻 t╪g nhanh nh裯, s鴆 m筺h t鎛g c閚g h琻 330 甶觤","    Dng M玭 thng k?: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g s鴆 m筺h, g﹏ c鑤 t鎛g c閚g h琻 390 甶觤\n    Dng M玭 cung k?: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, s鴆 m筺h t鎛g c閚g h琻 370 甶觤\n    Ng? чc t? hi謕: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g th﹏ ph竝, s鴆 m筺h t鎛g c閚g h琻 370 甶觤\n    Ng? чc c? s?: trang b?, tr筺g th竔, thu閏 t輓h l璾 ph竔 t╪g nhanh nh裯, n閕 c玭g t鎛g c閚g h琻 330 甶觤 ho芻 t╪g nhanh nh裯, g﹏ c鑤 t鎛g c閚g h琻 320 甶觤");
end;

function nothing()

end;