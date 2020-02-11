Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");

tStage_2 = {}
tStage_2 = gf_Inherit(tStageBase)
tStage_2.basePos = TStageBaseInfo[2]
tStage_2.tRulePoses = {
		{50,	50},	-- 1
		{50,	100},
		{50,	150},	-- 3
		{100,	50},
		{100,	100},	-- 5
		{100,	150},
		{150,	50},	-- 7
		{150,	100},
		{150,	150},	-- 9
		{200,	100},	--BOSS
		{100,	160},	--WAIT_1
		{100,	160},	--WAIT_2
		{190,	55},	--PASS
}
tStage_2.aid_cd = 30;	-- Ô®Öúcd
tStage_2.tFish = {
		tGroup = {},
		tModel = {
			NpcName[69],
			NpcName[70],
			NpcName[71],
			NpcName[72],
		},
		tPos = {POS_7, POS_8, POS_9},
		lifetime = 60,
		count = 8,
	}
tStage_2.tMyFish = {
		tGroup = {},
		tModel = {
			{NpcName[73][1], NpcName[73][2], ""},
			{NpcName[74][1], NpcName[74][2], ""},
			{NpcName[75][1], NpcName[75][2], ""},
			{NpcName[76][1], NpcName[76][2]	,""},
		},
		tPos = {POS_5},
		lifetime = 30,
	}
tStage_2.tWaitingNpc = {
		tGroup = {},
		tModel = {
			[NpcName[77][2]] = {NpcName[77][1], NpcName[77][2], POS_WAIT_1, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tFightModel = {
			[NpcName[77][2]] = {NpcName[77][1], NpcName[77][2], POS_WAIT_2, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
	}
tStage_2.tPassNpc = {
	tModel = {
		[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2], POS_PASS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
	}
}
tStage_2.passMsg = LSMsgToTeam[13][2]
tStage_2.tWelcome = LSMsgToTeam[14][2]
tStage_2.nEntryTrap = 2

function tStage_2:init()
	tStageBase.init(self)
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[15],LSStageName[2]));
end

function tStage_2:createMyFish(nType)
	local tPoses = self.tMyFish.tPos;
	local tModel = self.tMyFish.tModel[nType];
	local tPos = tPoses[1]
	local nNpcIdx = CreateNpc(tModel[1], tModel[2], self:getMapPos(tPos));
	SetNpcScript(nNpcIdx, tModel[3]);
	SetNpcLifeTime(nNpcIdx, self.tMyFish.lifetime);
	SetCampToNpc(nNpcIdx,CampPlaye);
	SetMissionV(MV_CREATE_MYFISH_TIME, GetTime());
end

function tStage_2:createWaitingNpc()
	local tModel = self.tWaitingNpc.tModel;
	for key, tNpc in tModel do
		local m,x,y = self:getMapPos(tNpc[3]);
		local nNpcIdx = CreateNpc(tNpc[1], tNpc[2], m, x, y, 6);
		AddUnitStates(nNpcIdx, 7, 0);
		AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));
		SetNpcScript(nNpcIdx, tNpc[4]);
	end
end
----
function tStage_2:OnTalk2Waiting()
	local name = "<color=green>"..GetTargetNpcName().."<color>";
	local state = GetMissionV(MV_STAGE_STATE);
	if state == SS_WAITING then
		Say(name..NpcSayInfo[7][1][1],getn(NpcSayInfo[7][1][2]),NpcSayInfo[7][1][2])
		return
	elseif state == SS_FIGHTING then
		local nLastTime = GetMissionV(MV_CREATE_MYFISH_TIME);
		if GetTime() - nLastTime < self.aid_cd then
			Talk(1, "", name..LSSysTalk[7])
			return
		end
		Say(name..NpcSayInfo[7][2][1],getn(NpcSayInfo[7][2][2]),NpcSayInfo[7][2][2]);
		return
	end
end
function tStage_2:getAid()
	local name = "<color=green>"..GetTargetNpcName().."<color>";
	Say(name..NpcSayInfo[7][3][1],getn(NpcSayInfo[7][3][2]),NpcSayInfo[7][3][2])
end
