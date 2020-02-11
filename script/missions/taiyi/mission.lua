Include("\\script\\missions\\taiyi\\head.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\script\\lib\\floyd.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage00.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage01.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage02.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage03.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage04.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage05.lua");
Include("\\script\\missions\\taiyi\\stage\\tstage06.lua");

function OnTrap(nTrapId)
	if 1 == nTrapId then
		tStage06_2:OnTrap(nTrapId);
	end
end

--太一塔定义
-----------------------------------------------------------------
tPhaseDriver.phases = {tStage00, tStage01, tStage02, tStage03, tStage04, tStage05, tStage06};	

tPhaseDriver.name = "PhaseDriver";

function tPhaseDriver:onTimeout()
	this:Msg2MSAll("K誸 th骳 秈!");
	TY_ReviveAll(0);
	TY_ConfirmClose();
end

function tPhaseDriver:GetPhase()
	local nLevel = GetMissionV(self.curPhaseLv);
	local curPhase = self.phases[nLevel];
	if not curPhase then
		WriteLog(format("[Th竔 Nh蕋 Th竝] [tPhaseDriver:GetPhase] [nLevel = %s, tStage = %s]", tostring(nLevel), tostring(curPhase)));
		return nil;
	end
	return curPhase;
end

tTY = gf_CopyInherit(missionBase, tTY);

tTY.msOption.bSetPkFlag = 1; --练功模式
tTY.msOption.bSetPkCamp = 1;
tTY.msOption.szInitDeahScript = thisFile;

tTY.msPosition.entryPos = tPlayerPos[0];

tTY.msPosition.exitPos = tExitPos;

tTY.msPhases[1] = tPhaseDriver;

function TY_SelectStartPhase(nMapId, nStageId)
	local nOldSubWorldIdx = SubWorld;
	SubWorld = SubWorldID2Idx(nMapId);
	tPhaseDriver:setPhase(8);	--直接跳到第4关(太一塔的第一关)
	SubWorld = nOldSubWorldIdx;
end

--设置进入时的位置
function TY_SetBeginPos(tPos)
	tTY.msPosition.entryPos = tPos;
end

function TY_SetPKFlag(Val1, Val2)
	tTY.msOption.bSetPkFlag = Val1;
	tTY.msOption.bSetPkCamp = Val2;
end

--重写base里的onLeave,使玩家回到对应进入前的地图
function tTY:onLeave()
	self.msOption:restoreState();
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 1, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 1, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 0, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 0, 1);
	local nMapId = GetMissionV(MV_RETURN_MAP_ID);
	local x, y = self.msPosition.exitPos[nMapId][1], self.msPosition.exitPos[nMapId][2];
	DelItem(2, 95, 1510, GetItemCount(2, 95, 1510));
	SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 1);
	TY_ClearAllGodState();
	if NewWorld(nMapId, x, y) == 1 then
		SetLogoutRV(0);	-- NewWorld成功后才置0, 因为玩家有可能下线来leave
	end
end

this = tTY;