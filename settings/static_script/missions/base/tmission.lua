----------------------------------------------------
-- mission base class
-- by windle
-- 2010-2-25 12:09
----------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\mem.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\define.lua")
---------------------------------------------
tMissionBase = {
	MissionId = 0,
	MapId = 0,
	realMapId = 0,

	msOption = nil,
	msTimer = nil,
	stages = nil,
	rule = nil,

	bDynamicMap = 1,

	entryPos = {1600, 3200},
--	entryPos = {
--		[1] = {1600, 3200},
--		[2] = {1600, 2300},
--	},
--	entryPos = {
--		{ {1600, 3200}, {1600, 2300} };
--	},
	exitPos = {300, 1646, 3549},
--	exitPos = {
--		[100] = {x, y},
--		[300] = {x, y},
--	}
--	exitPos = {	{x, y}, {x, y} },
}

function tMissionBase:Open()
	local nMapId, nMapIdx;
	if self.bDynamicMap == 1 then
		nMapId, nMapIdx = DynamicLoadMap(self.realMapId);
	end
	if not nMapId then return end

	self:setSubWorld(nMapId);
	OpenMission(self.MissionId);
	self:SetMissionV(MV_MAP_ID, nMapId);
	self:SetMissionV(MV_MAP_INDEX,nMapIdx);
	self:SetMissionV(MV_RETURN_MAP_ID, GetWorldPos());
	self:resetSubWorld();
	return nMapId;
end
function tMissionBase:Run()
	RunMission(self.MissionId);
end
function tMissionBase:Close()
	CloseMission(self.MissionId);
end
function tMissionBase:Join(nMapId, nCamp)
	if nMapId then
		self:setSubWorld(nMapId);
		JoinMission(PlayerIndex, nCamp);
		self:resetSubWorld();
	end
end
function tMissionBase:TeamJoin(nMapId, nCamp)
	gf_TeamOperate(self.Join, self, nMapId, nCamp);
end
----------------------------------------------
-- api callBack
function InitMission()
	g_theMS:onInit();
end;

function RunMission()
	g_theMS:onStart();
end;

function EndMission()
	g_theMS:onClose();
end;

function JoinMission(RoleIndex,nCamp)
--	PlayerIndex = RoleIndex;
	g_theMS:onJoin(nCamp);
--	PlayerIndex = RoleIndex;
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	g_theMS:onLeave();
	PlayerIndex = RoleIndex;
	if GetMSPlayerCount(g_theMS.MissionId) == 0 then
		g_theMS:Close();
	end
end;

function OnTimer()
	g_theMS:onTimer()
end

-----------------------------------------------
tMissionOption = {
	--½øÈë²Ù×÷
	nInitFightState = 1,	--³õÊ¼Õ½¶·×´Ì¬£¨½øÈëMissionÊ±µÄÕ½¶·×´Ì¬£©
	szInitDeahScript = "",	--³õÊ¼ËÀÍö½Å±¾£¨½øÈëMissionÊ±µÄËÀÍö½Å±¾£©

	bForbidChangePK = 1,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹×ª»»PK×´Ì¬
	bUseScrollEnable = 0,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñÔÊÐíÊ¹ÓÃ»Ø³Ç·û
	bForbitTrade = 1,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹½»Ò×
	bStallEnable = 0,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñÔÊÐí°ÚÌ¯
	bOpenFriendliness = 0,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñ¿ÉÒÔÔö¼ÓºÃ¸Ð¶È
	bDeathPunish = 0,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñÓÐËÀÍö³Í·£
	bClearMomentum = 1,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñÒªÇå¿ÕÉ±ÆøÖµ
	bInteractiveEnable = 0,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñÔÊÐí×ö»¥¶¯¶¯×÷
	bForbitTeam = 1,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹¶ÓÎé²Ù×÷
	bLeaveTeam = 0,			--½øÈë¹Ø¿¨Ê±ÊÇ·ñÒªÀë¿ª¶ÓÎé
	bForbitMomentum = 1,	--²»¿ÉÔö¼ÓÉ±ÆøÖµ
	bForbitSuperSkill = 0,	--ÆÁ±ÎÕòÅÉ

	--Àë¿ª²Ù×÷
	nRestoreFightState = 0,	--Àë¿ªÊ±Òª»Ö¸´µÄÕ½¶·×´Ì¬£¨Àë¿ªMissionÊ±µÄÕ½¶·×´Ì¬£©
	szRestoreDeahScript = "",	--Àë¿ªMissionÊ±Òª¹ÒµÄËÀÍö½Å±¾

	bRestoreForbidChangePK = 0,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹×ª»»PK×´Ì¬
	bRestoreUseScrollEnable = 1,	--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÔÊÐíÊ¹ÓÃ»Ø³Ç·û
	bRestoreForbitTrade = 0,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹½»Ò×
	bRestoreStallEnable = 1,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÔÊÐí°ÚÌ¯
	bRestoreOpenFriendliness = 0,	--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ¿ÉÒÔÔö¼ÓºÃ¸Ð¶È
	bRestoreDeathPunish = 1,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÓÐËÀÍö³Í·£
	bRestoreClearMomentum = 0,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÒªÇå¿ÕÉ±ÆøÖµ
	bRestoreInteractiveEnable = 1,	--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÔÊÐí×ö»¥¶¯¶¯×÷
	bRestoreForbitTeam = 0,			--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹¶ÓÎé²Ù×÷
	bRestoreLeaveTeam = 0,			--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÒªÍË¶Ó
}
-----------------------------------------------
-- OnXXX
function tMissionBase:onInit()
	self:clearData()
	self:action("s0");
end
function tMissionBase:onStart()
	self:action("start");
end
function tMissionBase:onClose()
	if self.bDynamicMap == 1 then
		local nMapId, nMapIdx = SetMissionV(MV_MAP_ID), SetMissionV(MV_MAP_INDEX);
		ClearMapNpc(nMapIdx);
		FreeDynamicMap(nMapId, nMapIdx);
	end

	for i = 1, getn(self.msCamp) do
		self.msCamp[i]:turnPlayer(msCamp.delPlayer, self.msCamp[i]);
	end
	self:clearData()
end
function tMissionBase:onJoin(nCamp)
	nCamp = nCamp or 1;
	local m, x, y = self:getEntryPos(nCamp);
	if NewWorld(m, x, y) ~= 1 then return end

	msOption = self.msOption;
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
--	CreateTrigger(3,self.tbLogTrigger.nID,self.tbLogTrigger.nCustomID);	--´´½¨µÇÂ½´¥·¢Æ÷
	SetFightState(msOption.nInitFightState);	--Õ½¶·×´Ì¬
	SetDeathScript(msOption.szInitDeahScript);	--ËÀÍö½Å±¾

	ForbidChangePK(msOption.bForbidChangePK);	--×ª»»PK×´Ì¬
	UseScrollEnable(msOption.bUseScrollEnable);	--Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(msOption.bForbitTrade);	--½»Ò×
	StallEnable(msOption.bStallEnable);	--°ÚÌ¯
	OpenFriendliness(msOption.bOpenFriendliness);	--ºÃ¸Ð¶È
	SetDeathPunish(msOption.bDeathPunish);	--ËÀÍö³Í·£
	InteractiveEnable(msOption.bInteractiveEnable);	--»¥¶¯
	SetCreateTeam(msOption.bForbitTeam);
	SetMomentumBoundSwitch(msOption.bForbitMomentum);	--¿ÉÔö¼ÓÉ±ÆøÖµ
	gf_ForbidFactionSkill(msOption.bForbitSuperSkill);	--ÆÁ±ÎÕòÅÉ
	if msOption.bLeaveTeam == 1 then
		LeaveTeam();		--Àë¿ª¶ÓÎé
	end;
	if msOption.bClearMomentum == 1 then
		SetMomentum(0);		--Çå³ýÉ±ÆøÖµ
	end;

	ResetToNpcDamage(0);
	ResetToPlayerDamage(0);
	StopTimeGuage(-2);	--Çå³ý½çÃæ¼ÆÊ±Æ÷

	if msOption.bSetRebornPos == 1 then
		msOption:SetRandomRebornPos(nCamp);
	end;
	self.msCamp[nCamp]:addPlayer()
end
function tMissionBase:onLeave()
	if self.beforeLeave then
		self:beforeLeave();
	end
	msOption = self.msOption;
	SetLogoutRV(0);	--ÉèÖÃµÇÂ½µãÎªÏÂÏß×ø±ê
--	RemoveTrigger(GetTrigger(msOption.tbLogTrigger.nCustomID));	--É¾³ýµÇÂ½´¥·¢Æ÷
	SetFightState(msOption.nRestoreFightState);	--Õ½¶·×´Ì¬
	SetDeathScript(msOption.szRestoreDeahScript);	--ËÀÍö½Å±¾

	ForbidChangePK(msOption.bRestoreForbidChangePK);	--PK×´Ì¬
	UseScrollEnable(msOption.bRestoreUseScrollEnable);	--»Ø³Ç·û
	ForbitTrade(msOption.bRestoreForbitTrade);	--½ûÖ¹½»Ò×
	StallEnable(msOption.bRestoreStallEnable);	--½ûÖ¹°ÚÌ¯
	OpenFriendliness(msOption.bRestoreOpenFriendliness);	--²»Ôö¼ÓºÃ¸Ð¶È
	SetDeathPunish(msOption.bRestoreDeathPunish);	--ËÀÍö³Í·£
	InteractiveEnable(msOption.bRestoreInteractiveEnable);	--»¥¶¯
	SetCreateTeam(msOption.bRestoreForbitTeam);
	if msOption.bRestoreClearMomentum == 1 then
		SetMomentum(0);		--Çå³ýÉ±ÆøÖµ
	end;
	SetMomentumBoundSwitch(0);	--²»¿ÉÔö¼ÓÉ±ÆøÖµ
	gf_ForbidFactionSkill(0);	--ÆÁ±ÎÕòÅÉ

	SetTempRevPos(0,0,0);	--ÁÙÊ±ÖØÉúµãÇå³ý
	SetCampToPlayer("");	--Çå³ýÕ½¶·ÕóÓª
	StopTimeGuage(-2);	--Çå³ý½çÃæ¼ÆÊ±Æ÷
	ResetToNpcDamage(0);
	ResetToPlayerDamage(0);

	local nClosingState = self:GetMissionV(MV_MISSION_STATUS);
	if msOption.bRestoreLeaveTeam == 1 or nClosingState ~= 1 then
		LeaveTeam();	--Àë¿ª¶ÓÎé
	end;
	if IsPlayerDeath() == 1 then	--Èç¹ûËÀÁË
		RevivePlayer(0);	--Ô­µØ¸´»î
	end;
end
function tMissionBase:onTimer()
	local nStep = self:GetMissionV(MV_TIMER_STEP) + 1;
	self:SetMissionV(MV_TIMER_STEP, nStep);
	getStage(g_theMS):onTimer(nStep);
end

----------------------------------------------
-- Timer
msTimer = {
	MissionId = 0,
	nTimerId = 0,
}
--function newTimer(MissionId, TimerId)
--	local t = new(msTimer);
--	t.MissionId = MissionId;
--	t.TimerId = TimerId;
--	return t;
--end
function msTimer:start(nTimerInterval)
	StartMissionTimer(g_theMS.MissionId, self.nTimerId, nTimerInterval * 18);
end
function msTimer:stop()
	StopMissionTimer(g_theMS.MissionId, self.nTimerId);
end
function msTimer:setInterval(nTimerInterval)
	self:stop();
	self:start(nTimerInterval);
end
-------------------------------------------------------
-- camp
msCamp = {
	CampId = 0;
}
function msCamp:addPlayer(nPlayerIndex)
	local OldPlayerIdx = PlayerIndex;
	if nPlayerIndex then
		PlayerIndex = nPlayerIndex;
	end

	AddMSPlayer(self.MissionId, self.CampId);
	SetCampToPlayer(self.CampType or "");
	PlayerIndex = OldPlayerIdx;
end

function msCamp:delPlayer(nPlayerIndex)
	local OldPlayerIdx = PlayerIndex;
	if nPlayerIndex then
		PlayerIndex = nPlayerIndex;
	end
	DelMSPlayer(self.MissionId, self.CampId);
	NewWorld(g_theMS:getExitPos());

	PlayerIndex = OldPlayerIdx;
end

function msCamp:getCount(nCampId)
	return GetMSPlayerCount(self.MissionId, nCampId or self.CampId);
end
function msCamp:reflash(bForce)
	self.players = {};
	tIndex = self.players;
	local nTotalPlayerNum = GetMSPlayerCount(self.MissionId,self.CampId);
	local nPId, nPIndex = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			nPId, nPIndex = GetNextPlayer(self.MissionId,nPId,self.CampId);
			if nPIndex > 0 then
				tIndex[i] = nPIndex;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[Toµn bé hµm sè b¸o lçi]: trong hµm sè ms_GetMSPlayerIndex nhËn ®­îc sè ng­êi cña phe nµo ®ã so víi getn(tIndex) kh«ng ®ång nhÊt. Sè ng­êi:"..nTotalPlayerNum..", getn(tIndex) chªnh lÖch lµ:"..getn(tIndex));
	end;
--	self.lastReflashTime = GetTime()
end
function msCamp:turnPlayer(funOper, ...)
	self:reflash();
	local oldPlayerIdx = PlayerIndex;
	for i, p in self.players do
		PlayerIndex = p;
		funOper(gf_UnPack(arg));
	end
	PlayerIndex = oldPlayerIdx;
end
--------------------------------------------------------
-- Auxiliary
function tMissionBase:setSubWorld(nMapId)
	if self.oldSubWorld then
		print("[Error] [tMissionBase:setSubWorld] [set vµ reset kh«ng t­¬ng thÝch !!!]");
		return
	end

	local newSubWorld = SubWorldID2Idx(nMapId);
	if newSubWorld < 0 then
		print(format("[Error] [tMissionBase:setSubWorld] [nMapId=%s bÞ lçi]", tostring(nMapId)));
		return
	end;

	self.oldSubWorld = SubWorld;
	SubWorld = newSubWorld;
end

function tMissionBase:resetSubWorld()
	SubWorld = self.oldSubWorld;
	self.oldSubWorld = nil;
end

function tMissionBase:clearData()
	for i=1,10 do
		SetMissionS(i,"");
	end;
	for i=1,100 do
		SetMissionV(i,0);
	end;
end

--------------------------------------------------
-- MissionV, MissionS
function tMissionBase:GetMissionV(nVId)
	return GetMissionV(nVId);
end

function tMissionBase:SetMissionV(nVId, nVal)
	return SetMissionV(nVId, nVal);
end

function tMissionBase:GetMissionS(nVId)
	return GetMissionS(nVId);
end

function tMissionBase:SetMissionS(nVId, sVal)
	return SetMissionS(nVId, sVal);
end

---------------------------------------------------------------
function tMissionBase:Msg2MSAll(msg)
	return Msg2MSAll(self.MissionId, msg);
end
function tMissionBase:Msg2MSGroup(msg, group)
	return Msg2MSGroup(self.MissionId, msg, group);
end
function tMissionBase:Msg2MSPlayer(msg, pid)
	return Msg2MSPlayer(self.MissionId, msg, pid);
end
---------------------------------------------------------------
function tMissionBase:action(act)
	local p = self.rule[act];
	if not p then
		print(format("[dixuangong:action] [error Action] [act=%s]", tostring(act)));
		return
	end
	if type(p) == "function" then
		return p(self, act);
	end
	setStage(p);
end

---------------------------------------------------------------
function newMission(base)
	if g_theMS then
		print("[error] [redefine g_theMS]");
		return g_theMS;
	end
	g_theMS = gf_CopyInherit(tMissionBase, base);
	return g_theMS;
end


----------------------------------------------------------------
function main()
	getStage():onTalk();
end

function onPlayerDeath(killer)
--	Msg2Player("ÄãËÀÁË");
end

function onNpcDeath(npcIdx, f, x)
	getStage():onNpcDeath(npcIdx);
end

function OnDeath(id, f, x)
	if f == 1 then
		onPlayerDeath(id);
	else
		if x then
			SubWorld = f;
		end
		local oldPIdx = PlayerIndex;
		if not PlayerIndex or PlayerIndex <= 0 then
			local nPId, nPIndex = GetNextPlayer(g_theMS.MissionId,0,0);
			PlayerIndex = nPIndex;
		end
		onNpcDeath(id, f, x);
		PlayerIndex = oldPIdx;
	end
end

function onTrap(id)
	getStage():onTrap(id);
end


---------------------------------------------------
function tMissionBase:getEntryPos(nCamp)
	local pos;
	nCamp = nCamp or 1;
	if type(self.entryPos[nCamp]) ~= "table" then
		pos = self.entryPos;
	else
		pos = self.entryPos[nCamp];
	end
	if not pos then
		print(format("[tMissionBase:getEntryPos] [error entry pos] [nCamp = %s]", tostring(nCamp)));
		return
	end
	local nMapId = self:GetMissionV(MV_MAP_ID);
	return nMapId, self:getAPos(pos);
end
function tMissionBase:getExitPos(nCamp)
--	local pos;
--	nCamp = nCamp or 1;
--	if type(self.entryPos[nCamp]) ~= "table" then
--		pos = self.exitPos;
--	else
--		pos = self.exitPos[nCamp];
--	end
--	if not pos then
--		print(format("[tMissionBase:getEntryPos] [error entry pos] [nCamp = %s]", tostring(nCamp)));
--		return
--	end
--	local nMapId = self:GetMissionV(MV_EXIT_MAP_ID);
--	return nMapId, self:getAPos(pos);
	return gf_UnPack(self.exitPos);
end
function tMissionBase:getAPos(pos)
	if type(pos[1]) == "table" then
		pos = pos[random(1, getn(pos))];
	end
	return pos[1], pos[2];
end

function tMissionBase:getMapId()
	return self:GetMissionV(MV_MAP_ID), self:GetMissionV(MV_MAP_INDEX);
end
