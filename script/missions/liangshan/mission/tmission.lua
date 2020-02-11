
tMissionBase = {
}

function tMissionBase:InitMission()
end

function tMissionBase:RunMission()
end

function tMissionBase:EndMission()
end

function tMissionBase:OnJoin(RoleIndex,nCamp)
end

function tMissionBase:OnLeave(RoleIndex)
end

function tMissionBase:OnTimer()
end

function tMissionBase:OnPlayerDeath(Killer)
end

function tMissionBase:OnNpcDeath(npcIndex)
end

tMission = {}
--boss分段信息
tMission.tBoss = g_objLSRule:GetNumTable(IniMissionKey,"BossStep")
--BOSS模板信息
tMission.tBossModel = {
	[1  ] = {NpcName[2 ][1], NpcName[3 ][1], NpcName[4 ][1]},
	[2  ] = {NpcName[5 ][1], NpcName[6 ][1], NpcName[7 ][1]},
	[3  ] = {NpcName[8 ][1], NpcName[9 ][1], NpcName[10][1]},
	[4  ] = {NpcName[11][1], NpcName[12][1], NpcName[13][1]},
	[5  ] = {NpcName[14][1], NpcName[15][1], NpcName[16][1]},
	[6  ] = {NpcName[17][1], NpcName[18][1], NpcName[19][1]},
	[7  ] = {NpcName[20][1], NpcName[21][1], NpcName[22][1]},
	[8  ] = {NpcName[23][1], NpcName[24][1], NpcName[25][1]},
	[9  ] = {NpcName[26][1], NpcName[27][1], NpcName[28][1]},
	[10 ] = {NpcName[29][1], NpcName[30][1], NpcName[31][1]},
	[11 ] = {NpcName[32][1], NpcName[33][1], NpcName[34][1]},
	[12 ] = {NpcName[35][1], NpcName[36][1], NpcName[37][1]},
	[13 ] = {NpcName[38][1], NpcName[39][1], NpcName[40][1]},
	[14 ] = {NpcName[41][1], NpcName[42][1], NpcName[43][1]},
	[15 ] = {NpcName[44][1], NpcName[45][1], NpcName[46][1]},
	[16 ] = {NpcName[47][1], NpcName[48][1], NpcName[49][1]},
	[17 ] = {NpcName[50][1], NpcName[51][1], NpcName[52][1]},
	[18 ] = {NpcName[53][1], NpcName[54][1], NpcName[55][1]},
}
--boss创建概率
tMission.BossRate = g_objLSRule:GetNumTable(IniMissionKey,"BossRate")
function tMission:isBossKilled(id)
	local bossDeathFlag = GetMissionV(MV_BOSSDEATH_FLAG);
	local nFlag = GetBit(bossDeathFlag, id);
	return nFlag;
end

function tMission:killBoss(id)
	local bossDeathFlag = GetMissionV(MV_BOSSDEATH_FLAG);
	SetMissionV(MV_BOSSDEATH_FLAG, SetBit(bossDeathFlag, id, 1));
end

function tMission:chooseBoss(nLevel, bSkip)
	bSkip = bSkip or 0;
	local tRate = self.BossRate[nLevel];
		if nLevel == 2 then
		if PlayerIndex then
			local nLastJuyiling = GetTask(VET_MS_TASKID_JUYILING)
			if nLastJuyiling < 100 then
				tRate = self.BossRate[3];
--			elseif nLastJuyiling >= 600 then
--				tRate = self.BossRate[4];
			end
		end
	end
	local bossType = getRate(tRate);
	local tCurBossTurn = {}
	while bossType <= getn(self.tBoss) do
		for _, id in self.tBoss[bossType] do
			if self:isBossKilled(id) == 0 then
				tCurBossTurn[getn(tCurBossTurn)+1] = id;
			end
		end
		if getn(tCurBossTurn) > 0 then
			break
		else
			bossType = bossType + 1;
		end
	end
	if bossType == 1 then
		SetTask(VET_MS_TASKID_JUYILING, 0);
	end
	assert(getn(tCurBossTurn) > 0)
	return tCurBossTurn[random(1, getn(tCurBossTurn))];
end

function tMission:createBoss(bosslevel, nMapId, nX, nY, script, camp)
	local bossId = self:chooseBoss(bosslevel);
	local tNpc = self.tBossModel[bossId];
	assert(tNpc)
	local nNpcIdx = CreateNpc(tNpc[1],tNpc[1], nMapId, nX, nY);
	SetNpcDeathScript(nNpcIdx, script);
	SetCampToNpc(nNpcIdx, camp);
	NpcChat(nNpcIdx, LSNpcChat[1][tNpc[1]][random(getn(LSNpcChat[1][tNpc[1]]))]);
	for i = 2, 3 do
		local npcIndex = CreateNpc(tNpc[i], tNpc[i], nMapId, nX-3+random(0,6), nY-3+random(0,6));
		SetCampToNpc(npcIndex, camp);
	end
	return bossId;
end
function tMission:getBossName(bossId)
	local tBoss = self.tBossModel[bossId];
	if tBoss then
		return tBoss[1]
	end
end
function tMission:getBossLv(bossId)
	for lv = 1, getn(self.tBoss) do
		for _, id in self.tBoss[lv] do
			if id == bossId then
				return lv;
			end
		end
	end
end
--------------奖励-------------------
function tMission:dropBox(npcIdx, nIB)
	local m, x, y = GetNpcWorldPos(npcIdx);
	x = x - 3 + random(0, 6);
	y = y - 3 + random(0, 6);

	nIB = nIB or 0;
	if nIB == 2 then
		return
	end
	local nChestIndex = CreateNpc(NpcName[56+nIB][1],NpcName[56+nIB][2], m, x, y)
	for _, i in {3,4,5} do
		local nState = GetUnitCurStates(nChestIndex, i)
		AddUnitStates(nChestIndex, i, -nState)
	end
	if nIB == 0 then
		SetNpcScript(nChestIndex, "\\script\\missions\\liangshan\\npc\\box.lua");
	elseif nIB == 1 then
		SetNpcScript(nChestIndex, "\\script\\missions\\liangshan\\npc\\box_ib.lua");
	elseif nIB == 2 then
		SetNpcScript(nChestIndex, "\\script\\missions\\liangshan\\npc\\box_ib2.lua");
	end
end

function tMission:dropBox2(m, x, y, nIB, nRate, bRandomPos)
	bRandomPos = bRandomPos or 1;
	if 1 == bRandomPos then
		x = x - 3 + random(0, 6);
		y = y - 3 + random(0, 6);
	else
		x = x + 4;
	end

	nRate = nRate or 1;
	local bSkip = (2 == nRate and 1) or 0;
	local newBossId = self:chooseBoss(nRate, bSkip);
	--根据不同的IB状态进行不同的处理
	nIB = nIB or 0;
	local nChestIndex = CreateNpc(NpcName[56+nIB][1],NpcName[56+nIB][2], m, x, y)
	for _, i in {3,4,5} do
		local nState = GetUnitCurStates(nChestIndex, i)
		AddUnitStates(nChestIndex, i, -nState)
	end
	if nIB ~= 2 then
		AddUnitStates(nChestIndex, 5, newBossId);
	end
	if nIB == 0 then
		SetNpcScript(nChestIndex, "\\script\\missions\\liangshan\\npc\\box.lua");
	elseif nIB == 1 then
		SetNpcScript(nChestIndex, "\\script\\missions\\liangshan\\npc\\box_ib.lua");
	elseif nIB == 2 then
		SetNpcScript(nChestIndex, "\\script\\missions\\liangshan\\npc\\box_ib2.lua");
	end
end
-----------------------------------------------------------------------------------

function getRate(tRate)
	assert(type(tRate) == "table");
	assert(getn(tRate) > 0);
	local nMax = 0;
	for i = 1, getn(tRate) do
		nMax = nMax + tRate[i];
	end
	assert(nMax > 0);
	local rnd = random(1, nMax)
	for i = 1, getn(tRate) do
		rnd = rnd - tRate[i];
		if rnd <= 0 then
			return i;
		end
	end
	assert(nil);
end

--------------------------------------------------------------------------------------

function tMission:showBossState()
	local msg = LSSysTalk[6].."\n";
	for i = 1, getn(self.tBossModel) do
		local color = "<color=green>";
		if self:isBossKilled(i) == 1 then
			color = "<color=red>";
		end
		msg = msg .. format("%s%-20s", color, self.tBossModel[i][1]);
		if mod(i, 3) == 0 then
			msg = msg .. "\n";
		else
			msg = msg .. "\t";
		end
	end
	Talk(1, "", msg);
end

function tMission:CheckTargetNpc(nNpcIdx)
	nNpcIdx = nNpcIdx or 0;
	if nNpcIdx == GetTargetNpc() then
		return 1;
	end
	Talk(1, "", format("<color=green>%s<color>:%s", GetTargetNpcName(), LSSysTalk[5][random(1, getn(LSSysTalk[5]))]));
	return 0;
end
