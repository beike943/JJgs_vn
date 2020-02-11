-- ³õÊ¼µÈ´ı½×¶Î
Include("\\script\\missions\\dixuangong\\daily_task.lua")

tStage0 = {
	stepInterval = 1,
	stepLimit = 120,

	pos = {
		{1644, 3257},
	},
	resetPos = {1644, 3257},
	npcMod = {
		{"TuÇn La L©u §Şa", "L©u La Th¸m Tö"},
	},
}

--------------------------------------------------------------------
function tStage0:onInit()
	g_theMS.msTimer:setInterval(1)
end

function tStage0:createMapTrap()
	local MapId = g_theMS:getMapId();
	for i = 1, 13 do
		AddMapTrap(MapId,(1657+i)*32,(3229+i)*32, g_theMS.Trap1);
		AddMapTrap(MapId,(1656+i)*32,(3229+i)*32, g_theMS.Trap1);
	end
	for i = 1, 13 do
		AddMapTrap(MapId,(1692+i)*32,(3188+i)*32, g_theMS.Trap2);
		AddMapTrap(MapId,(1691+i)*32,(3188+i)*32, g_theMS.Trap2);
	end
end

function tStage0:createChar()
	local npcMod = self.npcMod[1];
	local npcIdx = CreateNpc(npcMod[1], npcMod[2], self:GetPos(1));
	ChangeNpc2Talk(npcIdx);
	SetNpcScript(npcIdx, g_theMS.fileName);
	return npcIdx;
end
function tStage0:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage0:onTimer(nStep)
	if nStep == 1 then
		g_theMS:Msg2MSAll("Tæ ®éi cña ng­¬i ®· ®i vµo TiÒn §iÖn §Şa HuyÒn Cung, ®éi tr­ëng cã thÓ tiÕn hµnh ®èi tho¹i víi Thiªn ¢M Gi¸o L©u La cña TuÇn La ®Ó më ¶i");
		g_theMS.msTimer:setInterval(self.stepInterval)
		g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thêi gian chuÈn bŞ", self.stepInterval * self.stepLimit, 0);
		self:createMapTrap();
		local npc = self:createChar();
		NpcChat(npc, "Cung Chñ gäi ta ®Õn TuÇn S¬n L©u, Ca Ca ta kh«ng cã thêi gian ®Ó ®i");
	end
	local stepRun = GetMissionV(MV_STEP_XX_RUN)
	if stepRun > 0 and nStep - stepRun == 5 then
		local npcIdx = findNpc("L©u La Th¸m Tö");
		self:onNpcDeath(npcIdx, 0);
	end
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

--------------------------------------------------------------------
function tStage0:onTalk()
	if PlayerIndex ~= GetTeamMember(0) then
		Talk(1, "", "Hõm! H¹ng ng­êi nh­ ng­¬i còng ®Õn ®©y ®Ó nãi chuyÖn víi L·o Gia ta sao! Noi th¸nh ®Şa nµy ®¸m ng­êi c¸c ng­¬i cßn d¸m ë l¹i ®©y, cßn kh«ng cót ®i th× ®õng tr¸ch ta ®éc ¸c!");
		return
	end
	Say(format("<color=green> Thiªn ¢m Gi¸o L©u La cña TuÇn La <color>: ¸i chµ, %s nµy tr«ng còng rÊt ®­îc ®Êy? §em ®i cho Cung Chñ ¾t cã träng th­ëng, ha ha ha !", ((GetSex() == 1 and "TiÓu Ca") or "TiÓu TØ")),
		2,
		--"´òÉÍÄã5¸öÍ¨ÌìÁî£¬´øÎÒÈ¥´óµî/tStage0_speEnter",
		"Cã m¾t kh«ng trßng, tiÕp chiªu ®©y!/tStage0_norEnter",
		"Th¨m dß tin tøc/tStage0_info");
end

function tStage0_speEnter()
--	if GetItemCount(ITEM_DXG_TONGTIANLING[1],ITEM_DXG_TONGTIANLING[2],ITEM_DXG_TONGTIANLING[3]) < 5 then
--		Msg2Player("ÄúÉíÉÏÃ»ÓĞ5¸öÍ¨ÌìÁî");
--		return
--	end
--	if DelItem(ITEM_DXG_TONGTIANLING[1],ITEM_DXG_TONGTIANLING[2],ITEM_DXG_TONGTIANLING[3],5) ~= 1 then return end
	SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + N_JOIN_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	local npc = GetTargetNpc();
	g_theMS:Msg2MSAll("Sau khi c¸c ng­¬i vµo TiÒn §iÖn nghe lĞn th«ng tin mËt cña §Şa HuyÒn Cung, lµm cho Cung Chñ nçi giËn råi !");
	g_theMS:action("sx");
	--×ßºóÃÅ´ÎÊıÍ³¼Æ
	AddRuntimeStat(1,7,0,1);
	--µØĞş¹¬ÏûºÄÍ¨ÌìÁîÅÆÊıÁ¿Í³¼Æ
	AddRuntimeStat(1,13,0,N_JOIN_TIANJIAOLING_NEED);
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(4)
	
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 1, npcIdx);--Ã¿ÈÕÈÎÎñ-123¹ØÍ¨¹Ø
end

function tStage0_norEnter()
	self = tStage0;
	local npc = GetTargetNpc();
	NpcChat(npc, "Xin l·o gia tha m¹ng, tiÓu nh©n kh«ng cè ı! Ng­êi ®©u, Cung Chñ cøu t«i!");
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	local pos = {
		{1660, 3241},
	}
	g_NpcAI:setWayPoint(npc, pos);
	SetNpcDeathScript(npc, g_theMS.fileName);
	SetMissionV(MV_STEP_XX_RUN, GetMissionV(MV_TIMER_STEP));
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(1)
end

function tStage0_info()
	Talk(1, "", "<color=green> Thiªn ¢m Gi¸o L©u La cña TuÇn La <color>: TiÓu ®Ö ng­¬i thËt biÕt ®iÒu, kh«ng giÊu g× ng­¬i. §Şa HuyÒn Cung nµy, tæng céng cã 3 phßng, phßng thø nhÊt luyÖn ch­ëng c­íc, phßng thø 2 c¬ quan mËt, phßng thø 3 ®ang lµm mËt phßng. Ha ha ha Ph¸p S­ §¹i Nh©n ®Ó cho tiÓu nh©n ®i ra TuÇn La");
end

function tStage0:onNpcDeath(npcIdx, nTime)
	nTime = nTime or 10
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	g_theMS:Msg2MSAll("Thiªn ¢m Gi¸o L©u La c¶nh b¸o, Thiªn ¢m Ph¸p S­ xuÊt hiÖn, h·y ®¸nh b¹i h¾n.");
	g_theMS:action("s1");
	SetNpcLifeTime(npcIdx, nTime);
end

function tStage0:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
