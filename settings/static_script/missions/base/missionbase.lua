Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

-----------------------------------------------------------------------------
-- called by OpenMission
function InitMission(mapID, mapIndex, mapReturnID)
	this:onInit(mapID, mapIndex, mapReturnID);
end
-- called by CloseMission
function EndMission()
	this:Close();
end;
-- called by RunMission
function RunMission()
end;
-- called by JoinMission
function JoinMission()
end
-- called by DelMSPlayer, NewWorld, LeaveGame
function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	this:onLeave();
	PlayerIndex = RoleIndex;
end;
-- called by timer
function OnTimer()
--	if GetMSPlayerCount(this.missionID) == 0 then
--		this:Close();
--	else
--		print("sizeof(this.msPhases) = ", getn(this.msPhases));
--		print("sizeof(this.msPhases[1].phases) = ", getn(this.msPhases[1].phases));
--		print("this.msPhases[1].name = ", this.msPhases[1].name);
		if not this.nInit then
			for k, v in this.msPhases do
				if v.resetFather then
					v:resetFather();
				end
			end
		end
		local oldPIdx = PlayerIndex;
		local nPId, nPIndex = GetNextPlayer(this.missionID,0,0);
		PlayerIndex = nPIndex;
		for k,v in this.msPhases do
			v:onTimer();
		end
		PlayerIndex = oldPIdx;
--	end
end

-------------------------------------------------------------------------------
msCamp = {
	campType = {CampPlayer, CampEnemy, CampNeutral},
}
function msCamp:addPlayer(missionID, nCamp)
--	print("msCamp:addPlayer")
	AddMSPlayer(missionID, nCamp);
	if self.campType[nCamp] then
		SetCampToPlayer(self.campType[nCamp]);
	end
end
function msCamp:removePlayer(missionID, nCamp)
	DelMSPlayer(missionID, nCamp);
end
function msCamp:removeAllPlayer(missionID, nCamp)
	local total = self:getCount(missionID,nCamp);
	local oldPidx = PlayerIndex;
	local nPId, nPIndex = 0, 0;
	for i = 1,total do
		nPId, nPIndex = GetNextPlayer(missionID,0,nCamp);
		PlayerIndex = nPIndex;
		if PlayerIndex > 0 then
--			print("remove", PlayerIndex, GetName());
			self:removePlayer(missionID, nCamp);
		end
	end
	PlayerIndex = oldPidx;
end
function msCamp:getCount(missionID,nCamp)
	return GetMSPlayerCount(missionID, nCamp or 0);
end
function msCamp:reflash(nCamp)
	self.players = {};
	tIndex = self.players;
	local nTotalPlayerNum = GetMSPlayerCount(this.missionID,nCamp);
	local nPId, nPIndex = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			nPId, nPIndex = GetNextPlayer(this.missionID,nPId,nCamp);
			if nPIndex > 0 then
				tIndex[i] = nPIndex;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[Toµn bé hµm sè b¸o lçi]: trong hµm sè ms_GetMSPlayerIndex nhËn ®­îc sè ng­êi cña phe nµo ®ã so víi getn(tIndex) kh«ng ®ång nhÊt. Sè ng­êi:"..nTotalPlayerNum..", getn(tIndex) chªnh lÖch lµ:"..getn(tIndex));
	end;
--	self.lastReflashTime = GetTime()
	return self.players;
end
function msCamp:turnPlayer(nCamp,funOper, ...)
	self:reflash(nCamp);
	local oldPlayerIdx = PlayerIndex;
	for i, p in self.players do
		PlayerIndex = p;
		funOper(gf_UnPack(arg));
	end
	PlayerIndex = oldPlayerIdx;
end
-------------------------------------------------------------------------------
msOption = {
	--½øÈë²Ù×÷
	nInitFightState = 1,	--³õÊ¼Õ½¶·×´Ì¬£¨½øÈëMissionÊ±µÄÕ½¶·×´Ì¬£©
	szInitDeahScript = "",	--³õÊ¼ËÀÍö½Å±¾£¨½øÈëMissionÊ±µÄËÀÍö½Å±¾£©

	bSetPkFlag = 1,      --ÉèÖÃÁ·¹¦Ä£Ê½
	bSetPkCamp = 1,      --ÉèÖÃpkÄ£Ê½
	bForbidChangePK = 1,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹×ª»»PK×´Ì¬
	bUseScrollEnable = 0,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñÔÊĞíÊ¹ÓÃ»Ø³Ç·û
	bForbitTrade = 1,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹½»Ò×
	bStallEnable = 0,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñÔÊĞí°ÚÌ¯
	bOpenFriendliness = 0,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñ¿ÉÒÔÔö¼ÓºÃ¸Ğ¶È
	bDeathPunish = 0,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñÓĞËÀÍö³Í·£
	bClearMomentum = 1,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñÒªÇå¿ÕÉ±ÆøÖµ
	bInteractiveEnable = 0,	--½øÈë¹Ø¿¨Ê±ÊÇ·ñÔÊĞí×ö»¥¶¯¶¯×÷
	bForbitTeam = 1,		--½øÈë¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹¶ÓÎé²Ù×÷
	bLeaveTeam = 0,			--½øÈë¹Ø¿¨Ê±ÊÇ·ñÒªÀë¿ª¶ÓÎé
	bForbitMomentum = 1,	--²»¿ÉÔö¼ÓÉ±ÆøÖµ
	bForbitSuperSkill = 0,	--ÆÁ±ÎÕòÅÉ

	--Àë¿ª²Ù×÷
	nRestoreFightState = 0,	--Àë¿ªÊ±Òª»Ö¸´µÄÕ½¶·×´Ì¬£¨Àë¿ªMissionÊ±µÄÕ½¶·×´Ì¬£©
	szRestoreDeahScript = "",	--Àë¿ªMissionÊ±Òª¹ÒµÄËÀÍö½Å±¾

	bRestoreSetPkFlag = 0,      --ÉèÖÃÁ·¹¦Ä£Ê½
	bRestoreSetPkCamp = 0,      --ÉèÖÃpkÄ£Ê½
	bRestoreForbidChangePK = 0,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹×ª»»PK×´Ì¬
	bRestoreUseScrollEnable = 1,	--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÔÊĞíÊ¹ÓÃ»Ø³Ç·û
	bRestoreForbitTrade = 0,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹½»Ò×
	bRestoreStallEnable = 1,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÔÊĞí°ÚÌ¯
	bRestoreOpenFriendliness = 1,	--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ¿ÉÒÔÔö¼ÓºÃ¸Ğ¶È
	bRestoreDeathPunish = 1,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÓĞËÀÍö³Í·£
	bRestoreClearMomentum = 0,		--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÒªÇå¿ÕÉ±ÆøÖµ
	bRestoreInteractiveEnable = 1,	--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÔÊĞí×ö»¥¶¯¶¯×÷
	bRestoreForbitTeam = 0,			--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñ½ûÖ¹¶ÓÎé²Ù×÷
	bRestoreLeaveTeam = 0,			--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÒªÍË¶Ó
	bRestoreTempEffect = 1,			--Àë¿ª¹Ø¿¨Ê±ÊÇ·ñÇå³ıÁÙÊ±×´Ì¬
}
function msOption:check(nCamp)
	return 1;
end
function msOption:OnPlayerJoin(nCamp)
end
function msOption:OnPlayerLeave(nCamp)
end
function msOption:setState(nCamp)
--	print("µ÷ÕûÍæ¼Ò×´Ì¬...");
	nCamp = nCamp or 1;
	
	if self.bLeaveTeam == 1 then
		LeaveTeam();		--Àë¿ª¶ÓÎé
	end;

	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
--	CreateTrigger(3,self.tbLogTrigger.nID,self.tbLogTrigger.nCustomID);	--´´½¨µÇÂ½´¥·¢Æ÷
	if self.nInitFightState then
		SetFightState(self.nInitFightState);	--Õ½¶·×´Ì¬
	end
	SetDeathScript(self.szInitDeahScript);	--ËÀÍö½Å±¾
	ForbidChangePK(0);
	SetPKFlag(self.bSetPkFlag, nCamp);
	ForbidChangePK(self.bForbidChangePK);	--×ª»»PK×´Ì¬
	UseScrollEnable(self.bUseScrollEnable);	--Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(self.bForbitTrade);	--½»Ò×
	StallEnable(self.bStallEnable);	--°ÚÌ¯
	OpenFriendliness(self.bOpenFriendliness);	--ºÃ¸Ğ¶È
	SetDeathPunish(self.bDeathPunish);	--ËÀÍö³Í·£
	InteractiveEnable(self.bInteractiveEnable);	--»¥¶¯
	SetCreateTeam(self.bForbitTeam);
	SetMomentumBoundSwitch(self.bForbitMomentum);	--¿ÉÔö¼ÓÉ±ÆøÖµ
	gf_ForbidFactionSkill(self.bForbitSuperSkill);	--ÆÁ±ÎÕòÅÉ
	
	if self.bClearMomentum == 1 then
		SetMomentum(0);		--Çå³ıÉ±ÆøÖµ
	end;

	ResetToNpcDamage(0);
	ResetToPlayerDamage(0);
	StopTimeGuage(-2);	--Çå³ı½çÃæ¼ÆÊ±Æ÷

	if self.bSetRebornPos == 1 then
		self:SetRandomRebornPos(nCamp);
	end;
	self:OnPlayerJoin(nCamp);
end
function msOption:restoreState()
--	print("»Ö¸´Íæ¼Ò×´Ì¬, ÕıÔÚ»Ø¹é...");

	local nClosingState = GetMissionV(MV_MISSION_STATUS);
	if self.bRestoreLeaveTeam == 1 or nClosingState ~= 1 then
		LeaveTeam();	--Àë¿ª¶ÓÎé
	end;
	
--	SetLogoutRV(0);	--ÉèÖÃµÇÂ½µãÎªÏÂÏß×ø±ê
--	RemoveTrigger(GetTrigger(msOption.tbLogTrigger.nCustomID));	--É¾³ıµÇÂ½´¥·¢Æ÷
	if self.nRestoreFightState then
		SetFightState(self.nRestoreFightState);	--Õ½¶·×´Ì¬
	end
	SetDeathScript(self.szRestoreDeahScript);	--ËÀÍö½Å±¾

	ForbidChangePK(self.bRestoreForbidChangePK);	--PK×´Ì¬
	SetPKFlag(self.bRestoreSetPkFlag,self.bRestoreSetPkCamp); --ÉèÖÃpkÄ£Ê½;
	UseScrollEnable(self.bRestoreUseScrollEnable);	--»Ø³Ç·û
	ForbitTrade(self.bRestoreForbitTrade);	--½ûÖ¹½»Ò×
	StallEnable(self.bRestoreStallEnable);	--½ûÖ¹°ÚÌ¯
	OpenFriendliness(self.bRestoreOpenFriendliness);	--²»Ôö¼ÓºÃ¸Ğ¶È
	SetDeathPunish(self.bRestoreDeathPunish);	--ËÀÍö³Í·£
	InteractiveEnable(self.bRestoreInteractiveEnable);	--»¥¶¯
	SetCreateTeam(self.bRestoreForbitTeam);
	if self.bRestoreClearMomentum == 1 then
		SetMomentum(0);		--Çå³ıÉ±ÆøÖµ
	end;
	SetMomentumBoundSwitch(0);	--²»¿ÉÔö¼ÓÉ±ÆøÖµ
	gf_ForbidFactionSkill(0);	--ÆÁ±ÎÕòÅÉ

	SetTempRevPos(0,0,0);	--ÁÙÊ±ÖØÉúµãÇå³ı
	SetCampToPlayer("");	--Çå³ıÕ½¶·ÕóÓª
	StopTimeGuage(-2);	--Çå³ı½çÃæ¼ÆÊ±Æ÷
	ResetToNpcDamage(0);
	ResetToPlayerDamage(0);

	if IsPlayerDeath() == 1 then	--Èç¹ûËÀÁË
		RevivePlayer(0);	--Ô­µØ¸´»î
	end;
	if self.bRestoreTempEffect == 1 then
		RemvoeTempEffect(); --Çå³ıÍæ¼ÒÉíÉÏµÄËùÓĞÁÙÊ±×´Ì¬
	end
	self:OnPlayerLeave(nCamp);
end
-------------------------------------------------------------------------------
msPosition = {}
function msPosition:getMapID()
	return GetMissionV(MV_MAP_ID);
end
function msPosition:getMapIdx()
	return GetMissionV(MV_MAP_INDEX)
end
function msPosition:getTemplateMapID()
	return GetMapTemplate(self:getMapIdx());
end

function msPosition:getEntryPos(nCamp)
	local pos = self.entryPos;
	if type(pos[1]) == "table" then
		pos = pos[nCamp] or pos[1];
	end
	if type(pos) == "table" and type(pos[1]) == "table" then
		pos = pos[random(getn(pos))];
	end
	return self:getMapID(), gf_UnPack(pos);
end

function msPosition:getExitPos()
	local test = self.exitPos[1]
	if type(test) == "table" then
		return gf_UnPack(self.exitPos[random(getn(self.exitPos))]);
	elseif type(test) == "number" then
		return gf_UnPack(self.exitPos);
	end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
missionBase = {
	msCamp = msCamp,
	msOption = msOption,
	msPosition = msPosition,
	msPhases = {},
}
missionBase = inherit(missionHead, missionBase);
this = missionBase;

function missionBase:_Enter(nCamp)
	--print(GetMissionV(MV_MISSION_OPEN_STATE))
	if GetMissionV(MV_MISSION_OPEN_STATE) ~= 1 then
		local mapID, mapIdx = GetMissionV(MV_MAP_ID), GetMissionV(MV_MAP_INDEX);
		self:log(format("[Enter lçi] [name=%s, missioniD=%d, mapiD=%d, mapidx=%d]", self.name, self.missionID, mapID, mapIdx));
		return 0;
	end
	self.msOption:check(nCamp);
	local m,x,y = self.msPosition:getEntryPos(nCamp);
--	Msg2Player("½øÈë¹Ø¿¨",m,x,y);
	--print(m,x,y)
	CleanInteractive();--ÔÚNewWorldÇ°½âÉ¢Ë«ÈË»¥¶¯¶¯×÷
	local oldsbwd = SubWorld;
	if NewWorld(m,x,y) == 1 then
		self:onJoin(nCamp);
	end
	SubWorld = oldsbwd;
end

function missionBase:_TeamEnter(nCamp)
	gf_TeamOperate(self._Enter, self, nCamp);
end

function missionBase:Close()
--	print("missionBase:Close")
	self.msCamp:removeAllPlayer(self.missionID, 0);
	ClearMapNpc(self.msPosition:getMapID());
	for k,v in self.msPhases do
--		print("self.missionID, v.timerID",self.missionID, v.timerID)
--		print("v.second,v.step",v.second,v.step)
		StopMissionTimer(self.missionID, v.timerID);
--		v.second = 0;
--		v.step = 0;
	end
	StopTimeGuage(-1);
	local mapID, mapIdx = GetMissionV(MV_MAP_ID), GetMissionV(MV_MAP_INDEX);
--	print("mapID, mapIdx =",mapID, mapIdx)
	self:clearData();
	if self.dynamicMap ~= 0 and mapID ~= 0 and mapIdx ~= 0 then
		FreeDynamicMap(mapID, mapIdx);
		if self.onMissionClose and type(self.onMissionClose) == "function" then
			self:onMissionClose();
		end
		self:log(format("[mission ®ãng] [name=%s, missionID=%d, mapID=%d, mapIdx=%d]", self.name, self.missionID, mapID, mapIdx));
	end
end

-------------------------------------------------------------------------------
function missionBase:onInit(mapID, mapIndex, mapReturnID)
--	print("missionBase:onInit")
--	ClearMapNpc(self.msPosition:getMapID(),nil);
--	self:clearData();
--	print("mapID, mapIndex, mapReturnID =", mapID, mapIndex, mapReturnID)
	if mapID and mapIndex and mapReturnID then
		SetMissionV(MV_MAP_ID, mapID);
		SetMissionV(MV_MAP_INDEX, mapIndex);
		SetMissionV(MV_RETURN_MAP_ID, mapReturnID);
	end
	SetMissionV(MV_MISSION_OPEN_STATE,1);
	for k,v in self.msPhases do
--		print("v",type(v))
--		print("v.timerID",v.timerID)
--		print("self.missionID,self.name",self.missionID,self.name)
		v:onInit()
		StartMissionTimer(self.missionID, v.timerID, v.frequency);
	end
	if self.onMissionInit and type(self.onMissionInit) == "function" then
		self:onMissionInit();
	end
end
function missionBase:onJoin(nCamp)
--	print("missionBase:onJoin")
	self.msCamp:addPlayer(self.missionID, nCamp);
	self.msOption:setState(nCamp);
	for k,v in self.msPhases do
		v:addTimeGuage();
	end 
end

function missionBase:onLeave()
--	print("missionBase:onLeave")
	self.msOption:restoreState();
	local m,x,y = this.msPosition:getExitPos();
--	print("Àë¿ª¹Ø¿¨",m,x,y);
	if NewWorld(m,x,y) == 1 then
		SetLogoutRV(0)	-- NewWorld³É¹¦ºó²ÅÖÃ0, ÒòÎªÍæ¼ÒÓĞ¿ÉÄÜÏÂÏßÀ´leave	
	end
end
-------------------------------------------------------------------------------
function missionBase:clearData()
	for i = 1, 100 do
		SetMissionV(i, 0);
	end
	for i = 1, 10 do
		SetMissionS(i, "");
	end
end

function missionBase:Msg2MSAll(msg)
	Msg2MSAll(self.missionID, msg)
end
----------------------------------------------------------------
function missionBase:onEvent(event, data)
	local nRet;
	for _, v in self.msPhases do
		nRet = v:onEvent(event, data);
	end
	return nRet;
end

function main(id)
	if not id then
		this:onEvent("Talk");
	else
		this:onEvent("Trap", id);
	end
end

function onPlayerDeath(killer)
--	Msg2Player("ÄãËÀÁË");
	local nRet = this:onEvent("PlayerDeath", killer);
	return nRet;
end

function onNpcDeath(npcIdx, f, x)
	local nRet = this:onEvent("NpcDeath", {npcIdx, f, x});
	return nRet;
end

function OnDeath(id, f, x)
	--print("============OnDeath",PlayerIndex, id, f, x)
	local nRet;
	if f == nil then
		nRet = onPlayerDeath(id);
	else
		if x then
			SubWorld = f;
		end
		local oldPIdx = PlayerIndex;
		if not PlayerIndex or PlayerIndex <= 0 then
			local nPId, nPIndex = GetNextPlayer(this.missionID,0,0);
			PlayerIndex = nPIndex;
		end
		onNpcDeath(id, f, x);
		PlayerIndex = oldPIdx;
	end
	return nRet;
end

function onTrap(id)
	this:onEvent("Trap", id);
end

function OnRemove(npcIdx)
	SetNpcRemoveScript(npcIdx,"");
	local m = GetNpcWorldPos(npcIdx);
	local nOld = SubWorld;
	SubWorld = SubWorldID2Idx(m);
	this:onEvent("NpcRemove", npcIdx);
	SubWorld = nOld;
end

function OnRevive()
	--print("OnRevive()")
	local nRet = this:onEvent("OnRevive");
	return nRet;
end