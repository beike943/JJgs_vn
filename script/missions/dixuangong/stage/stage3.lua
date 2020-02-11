--------------------------------------------------------------------
-- µØÐþ¹¬ µÚ3¹Ø
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------

Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
--Include("\\script\\master_prentice\\master_prentice_point.lua")
----2013Äê3ÔÂ»î¶¯Ìí¼Ó
--Include("\\script\\online\\2013\\camp03\\head.lua");
----2013Äê3ÔÂ»î¶¯Ìí¼Ó½áÊø
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\award_head.lua")

Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phase3_1 = gf_CopyInherit(tPhaseBase, {
--})

phase3_1 = {
	stepInterval = 1,
	stepLimit = 120,
};
phase3_2 = {
	stepInterval = 30,
	stepLimit = 600,
};
phase3_3 = {
	stepInterval = 3,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStage3 = {
	tPhases = {
		phase3_1,
		phase3_2,
		phase3_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1715, 3188},

		{1723, 3170},
		{1724, 3155},
		{1736, 3168},

		{1725, 3182},
		{1734, 3172},
		{1721, 3168},
		{1717, 3154},
		{1707, 3162},

		{1714, 3158},
		{1716, 3171},
		{1729, 3176},
		{1725, 3162},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"Minh Gi¸o Th¸m Tù §Þa", "Minh Gi¸o Th¸m Tö", 100},
		{"§Þa HuyÒn Cung Cung Chñ §Þa", "Cung Chñ §Þa HuyÒn Cung "},
		{"Ng­êi gç1", "Ng­êi Gç", 120},
		{"Ng­êi gç1", "Ng­êi Gç", 120},
		{"Cø Hån 1", "Cø Hån"},
		{"K×nh L«i 1", "Kinh L«i"},
		{"KÎ Cuång Thiªn ¢m ", "KÎ Cuång Thiªn ¢m "},
		{"yinbaoxiang", "R­¬ng B¹c", 180},
		{"tongbaoxiang", "R­¬ng §ång", 180},
		--{"Ïä×ÓÇ®", "ÌìÒõ¾«Á¦Ïä", 180},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStage3:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage3:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npc, npcMod[3]);
	end
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStage3:createBoss()
	self:createChar(3);
	self:createChar(4);
end

function tStage3:createJiguan()
	local rand1,rand2 = random(1,5), random(1,4)
	if rand1 == rand2 then
		rand1 = 5;
	end
	local npcMod = self.npcMod[5];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand1));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
	npcMod = self.npcMod[6];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand2));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
end

function tStage3:createDog()
	local npcMod = self.npcMod[7];
	for i = 1, 4 do
		local m, x, y = self:GetPos(i + 9);
		for i = 1, 4 do
			local npc = CreateNpc(npcMod[1], npcMod[2], m, x, y);
			SetNpcLifeTime(npc, 90);
		end
	end
end

function tStage3:createFish(npc)
	local m, x, y = GetNpcWorldPos(npc);
	local count = 5 + COUNT_RUNNER - GetMissionV(MV_KILLED_NPC) - GetMissionV(MV_LIVED_RUNNER);
	for i = 1, count do
		local xx, yy = x + random(-5, 5), y + random(-5, 5)
		local npc = CreateNpc("Giam CÇm Nh©n SÜ §Þa"..random(1,10),"§Ö tö bÞ giam cÇm", m, xx, yy);
		SetCampToNpc(npc, CampPlayer);
		SetNpcScript(npc, g_theMS.fileName);
		ModifyNpcData(npc, 0, 1000,0);
	end
end

function tStage3:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage3:onTimerOver()
	g_theMS:Close()
end
tStage3.rule["timerover"] = tStage3.onTimerOver;

function tStage3:giveAward(nNpcIdx, nBossCount)
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	create_dxg_box_gold(nNpcIdx, 1)
	for i = 1, 4 do
		create_box_yin(m,x,y,3)
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[8];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
	end
	create_box_tong(nNpcIdx, 3) --ÌìÒõÃÜÏä±äÍ­±¦Ïä
--	for i = 1, 2 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[9];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
--	--ÌìÒõ¾«Á¦Ïä
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[10];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = lv * lv * 40;
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS3) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS3, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		nExp = floor(nExp * 1.5)
--		gf_Modify("Exp", nExp);
--	end
	giveStageExpAward
	)
	
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 3)
end

-------µÈ´ý¿ªÆô½×¶Î------------------------------------------------------
function phase3_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
--	getStage():createChar(1)
	g_theMS:Msg2MSAll("Tæ ®éi cña ng­¬i ®· ®i vµo §Þa HuyÒn Cung HËu §iÖn");
	phase2_3_gogogo();
end

function phase3_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		g_theMS.msCamp[1]:turnPlayer(function ()
			SetFightState(0);
		end);
		local npc = getStage():createChar(2);
		getStage():createFish(npc);
		SetNpcActivator(npc);
	elseif nStep == 3 then
		local npc = findNpc("Cung Chñ §Þa HuyÒn Cung ");
		NpcChat(npc, "H©y h©y h©y! NPC mª ®å, ph¸t ra chÝnh lo¹n, Hång Ên Gi¸o Chñ!");
		local npc2 = findNpc("Nga My LiÔu Hiªn")
		local pos = getStage().resetPos;
		SetNpcPos(npc2, pos[1], pos[2]);
	elseif nStep == 4 then
		local npc = findNpc("Cung Chñ §Þa HuyÒn Cung ");
		NpcChat(npc, "LÊy danh nghÜa cña Hång Ên Gi¸o Chñ ph¶i chê tr¹ng th¸i ®Ó phôc sinh l¹i !");
		NpcCommand(npc, NPCCOMMAND.do_skill,1732*32,3160*32,65536*1+693);
		local npc2 = findNpc("Nga My LiÔu Hiªn")
		NpcCommand(npc2, NPCCOMMAND.do_beatdown, 8, 5 * 18);
		NpcChat(npc2, "A…Ta l¹i ~~~");
	elseif nStep == 6 then
		local npc = findNpc("Cung Chñ §Þa HuyÒn Cung ");
		NpcChat(npc, "Tin Hång Ên ®¾c b¨ng sinh!");
		ChangeNpc2Talk(npc);
		local npc2 = findNpc("Nga My LiÔu Hiªn")
		SetNpcLifeTime(npc2, 0);
	end
end

function phase3_1:onNpcDeath(npcIdx)
	local npcName = GetNpcName(npcIdx)
	if npcName == "§Ö tö bÞ giam cÇm" or npcName == "Vâ L©m Tinh Anh" then
		local m, x, y = GetNpcWorldPos(npcIdx);
		SetNpcLifeTime(npcIdx, 0);
		local npc = CreateNpc("C­¬ng Thi §Þa"..random(1,3), "C­¬ng Thi", m, x, y);
		SetCampToNpc(npc, CampEnemy);
	end
end

function phase3_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		Talk(1, "", "Khi ta cßn trÎ nh­ ng­¬i, còng nãng tÝnh nh­ vËy!");
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	local tSel = {
		"Nãi Ýt th«i, xem ®©y!/#stageAction('p1')",
	}
	Say("Tuæi cßn trÎ nh­ vËy sao l¹i tù s¸t chø, ta thÊy g©n cèt cña ng­¬i kú l¹ l¹i ®i hîp søc víi minh m«n chÝnh ®¹o, ®¸ng tiÕc ®¸ng tiÕc!, chi b»ng nhËn lÊy mËt tÞch nµy, b¸i ta lµm s­ phô ®i!", getn(tSel), tSel);
end
function info3()
	Talk(1, "", "Minh Gi¸o Th¸m Tö: HËu §iÖn lµ n¬i ë cña §Þa HuyÒn Cung Cung Chñ, Cung Chñ nghiªn cøu chÕ t¹o ra c¸c c¬ quan dòng m·nh dÞ th­êng, c¸c ng­¬i ph¶i cÈn thËn. ®¸nh b¹i Cung Chñ sÏ cã c¬ héi nhËn ®­îc R­¬ng Thiªn ¢m Th¸nh VËt hoÆc Thiªn ¢m MËt R­¬ng.");
end
function phase3_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------É±¹Ö½×¶Î-------------------------------------------------
function phase3_2:onInit()
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msCamp[1]:turnPlayer(function ()
		SetFightState(1);
	end);
	local npc = findNpc("Cung Chñ §Þa HuyÒn Cung ");
	NpcChat(npc, "LÊy danh nghÜa cña Hång Ên gi¸o chñ chê b¨ng sinh!");
	g_theMS:Msg2MSAll("§iÒu kiÖn qua ¶i: ®¸nh b¹i Cung Chñ")
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(npc, {{1732, 3160}});

	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh tr­ît thêi gian", self.stepLimit, 0);
	local pos = getStage().resetPos;
	g_theMS.msCamp[1]:turnPlayer(SetPos, pos[1], pos[2]);
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
end
function phase3_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

function phase3_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--Ã¿ÈÕÈÎÎñ-É±¹Ö
	local npcName = GetNpcName(npcIdx);
	if npcName == "Cung Chñ §Þa HuyÒn Cung " then
		g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 1, npcIdx);--Ã¿ÈÕÈÎÎñ-123¹ØÍ¨¹Ø
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		ClearMapNpc(g_theMS:getMapId(), nil);
		g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
		getStage():giveAward(npcIdx, nBossCount);
		stageAction('p2');
	elseif npcName == "§Ö tö bÞ giam cÇm" or npcName == "Vâ L©m Tinh Anh" then
		local m, x, y = GetNpcWorldPos(npcIdx);
		SetNpcLifeTime(npcIdx, 0);
		local npc = CreateNpc("C­¬ng Thi §Þa"..random(1,3), "C­¬ng Thi", m, x, y);
		SetCampToNpc(npc, CampEnemy);
	end
end
function phase3_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------±¾¹Ø½áÊø----------------------------------------------------
function phase3_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 3);
--	ds_DXG:AddStatValue(3,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Qua næ lùc hÕt m×nh, c¸c ng­¬i ®· v­ît qua ®­îc §Þa HuyÒn Cung, ")
--	local op = function()
--		if GetTask(TASKID_DXG_DAILY_TASK) == 1 then
--			SetTask(TASKID_DXG_DAILY_TASK, 2, TASK_ACCESS_CODE_DXG_MISSION);
--			Msg2Player("ÄúÍê³ÉÁË±¾ÈÕµÄµØÐþ¹¬ÈÎÎñ£¬È¥ÁìÈ¡½±Àø°É£¡");
--		end
--	end
--	g_theMS.msCamp[1]:turnPlayer(op);
	g_theMS:action("so");
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
	--Í¨¹ØÇ°Èý¹Ø´ÎÊýÍ³¼Æ
	AddRuntimeStat(1,8,0,1);
end

function phase3_3:onTimer(nStep)
	g_theMS:action("missionfinish")
end

--------------------------------------------------------------------

tStage3 = gf_CopyInherit(tStageBase, tStage3);
