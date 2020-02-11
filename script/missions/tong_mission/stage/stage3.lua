--create date:2007-07-15 12:51
--author:yanjun
--describe:°ï»á¹Ø¿¨stageÎÄ¼þ£¬Ö÷ÒªÊÇ¹Ø¿¨µÄÏà¹Ø²Ù×÷

--MV_VALUE1¼ÇÂ¼Ë¢ÁË¶àÉÙ´ÎBOSSÉí±ßµÄÐ¡¹Ö
--MV_VALUE9±íÊ¾ÒªÈ¥µôµÄµÚÒ»ÖÖÖ°Òµ
--MV_VALUE10±íÊ¾ÒªÈ¥µôµÄµÚ¶þÖÖÖ°Òµ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
LARGE = 1;
EQUAL = 0;
SHORT = -1;

CSTAGE3 = OO_Inherit(CBASE_STAGE);	--¼Ì³Ð»ùÀà
--=========ÏÂÃæÊÇ×ÓÀàÄÚÈÝµÄ¶¨ÒåºÍÖØÔØ=========================================================
CSTAGE3.nStage = 3;	
CSTAGE3.tbTimerEven = {};
CSTAGE3.nNpcCount = 4;
CSTAGE3.nMaxNpcCount = 20;
CSTAGE3.tbBossInfo = 
{
	[1] = {"Boss41","Phong D­¬ng"},
	[2] = {"boss42","V©n Thïy"},
}
--´´½¨BOSS
function CSTAGE3:OnCreateBoss()
	self:CreateBossByType(1);
	self:CreateBossByType(2);
	Msg2MSAll(MISSION_ID,"NhiÖm vô cña ¶i: §¸nh b¹i Phong D­¬ng vµ V©n Thïy");
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("Hai tay nh­ mét",2*60,0,1,tbPlayer);
	TM_StartTimeGuage("VËt ®æi sao dêi",60,0,2,tbPlayer);
	TM_StartTimeGuage("Tø §¹i TiÖn Nh©n",2*60,0,3,tbPlayer);
end;
--¸ù¾ÝÀàÐÍ´´½¨BOSS
function CSTAGE3:CreateBossByType(nType)
	local nMapID = SubWorldIdx2ID(SubWorld);
	nNpcIdx = CreateNpc(self.tbBossInfo[nType][1],self.tbBossInfo[nType][2],nMapID,tPos_Boss[nType][1],tPos_Boss[nType][2]);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1+nType-1,nNpcIdx);
	SetMissionV(MV_BOSS_COUNT,GetMissionV(MV_BOSS_COUNT)+1);
	--NpcChat(nNpcIdx,self.tbBossInfo[nType][2].."»ªÀöµÇ³¡");
end;
--BOSSÉúÐ¡º¢
function CSTAGE3:CreateBossChild(tbArg)
	local nTimes = GetMissionV(MV_VALUE1);
	SetMissionV(MV_VALUE1,nTimes+1);
	local nNpcIdx = 0;
	local nBossIdx = GetMissionV(MV_BOSS1);
	if nBossIdx == 0 then	--Èç¹ûBOSS1ËÀÁË
		nBossIdx = GetMissionV(MV_BOSS2);
	elseif mod(nTimes,2) == 0 and nBossIdx ~= 0 then	--Å¼Êý²¢ÇÒBOSS1Ã»ËÀ
		nBossIdx = GetMissionV(MV_BOSS2);
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local tbNpcName = {"MÆt dµy","V« liªm sü","§ª tiÖn","H¹ l­u"};
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("TiÓu qu¸i ¶i 4",tbNpcName[i],nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");	
		SetMissionV(MV_NPC_COUNT,GetMissionV(MV_NPC_COUNT)+1);
	end;
	local nNpcCount = GetMissionV(MV_NPC_COUNT);
	Msg2MSAll(MISSION_ID,"HiÖn t¹i sè Tø §¹i TiÖn Nh©n lµ: "..nNpcCount.."/"..self.nMaxNpcCount);
	if nNpcCount >= self.nMaxNpcCount then
		self:EndStage(0);	--´³¹ØÊ§°Ü
		return 0;
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(3);
	TM_StartTimeGuage("Tø §¹i TiÖn Nh©n",45,0,3,tbPlayer);
end;
--BOSSµÄËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE3:OnBossDeath(nNpcIdx)
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	nNpcIdx = tonumber(nNpcIdx);
	if nNpcIdx == GetMissionV(MV_BOSS1) then
		SetMissionV(MV_BOSS1,0);
	else
		SetMissionV(MV_BOSS2,0);
	end;
	SetNpcLifeTime(nNpcIdx,0);
	SetMissionV(MV_BOSS_COUNT,nBossCount-1);
	if nBossCount == 1 then
		self:EndStage();
		self:CheckAllStagePass();
		SetMissionV(MV_CHECK_POINT,-1);	--ÉèÎª-1¾Í±íÊ¾¼ì²éµãÎÞÐ§ÁË
	else
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		SetMissionV(MV_CHECK_POINT,nLoop+3);	--Èý¸öÑ­»·£¨15Ãë£©ºó¼ì²é
	end;
end;
--¼ì²âÁ½¸öBOSSµÄ¾àÀë
function CSTAGE3:CheckBossDistance(tbArg)
	local nBoss1Idx = GetMissionV(MV_BOSS1);
	local nBoss2Idx = GetMissionV(MV_BOSS2);
	if nBoss1Idx == 0 or nBoss2Idx == 0 then	--Èç¹ûÖÁÉÙÓÐÒ»¸öBOSSËÀÁË
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX1,nMapY1 = GetNpcWorldPos(nBoss1Idx);
	local nMapID,nMapX2,nMapY2 = GetNpcWorldPos(nBoss2Idx);
	PlayerIndex = nil;
	local nDis = gf_GetDistance(nMapX1,nMapY1,nMapX2,nMapY2);
	Msg2MSAll(MISSION_ID,"Kho¶ng c¸ch cña 2 BOSS:"..nDis);
	local tbPlayer = TM_GetPlayerTable();
	if tbArg[1] == LARGE then
		TM_StopTimeGuage(2);
		TM_StartTimeGuage("VËt ®æi sao dêi",2*60,0,2,tbPlayer);	
	else
		TM_StopTimeGuage(1);
		TM_StartTimeGuage("Hai tay nh­ mét",2*60,0,1,tbPlayer);
	end;
	if nDis >= 10 and tbArg[1] == LARGE then
		local funLostLifePercent = function(tArg)
			local nMaxLife = GetMaxLife();
			local nLostLife = floor(nMaxLife*tArg[1]/100);
			CastState("state_lost_life_per18",nLostLife,tArg[2]*18);
		end;
		gf_OperatePlayers(tbPlayer,funLostLifePercent,{5,20});
		Msg2MSAll(MISSION_ID,"TÊt c¶ ng­êi ch¬i mçi gi©y mÊt 5% sinh lùc, kÐo dµi trßng 20 gi©y");
		return LARGE;
	elseif nDis <= 30 and tbArg[1] == SHORT then
		local funLostLifePercent = function(tArg)
			local nMaxLife = GetMaxLife();
			local nLostLife = floor(nMaxLife/2);
			CastState("imme_damage_life_directly",nLostLife,0);
		end;
		Msg2MSAll(MISSION_ID,"TÊt c¶ ng­êi ch¬i bÞ s¸t th­¬ng mÊt mét nöa sinh lùc");
		gf_OperatePlayers(tbPlayer,funLostLifePercent,{});
		return SHORT;
	else
		return EQUAL;
	end;
end;
--¸¨ÖúÊ±¼ä´¥·¢Æ÷Ö´ÐÐº¯Êý
function CSTAGE3:OnTimerTriggerEven()
	self:CreateBossChild({self.nNpcCount});	--ÖØÐÂÕÐÐ¡¹Ö
	self:RemoveTimerTrigger();	--Í£Ö¹¸¨Öú¼ÆÊ±Æ÷
end;
--Ð¡¹ÖËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE3:OnNpcDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nNpcCount = GetMissionV(MV_NPC_COUNT);
	if self:GetTimerTriggerState() == 0 then	--Èç¹ûµ±Ç°Ã»ÓÐ¿ªÊ¼¸¨Öú¼ÆÊ±Æ÷
		self:SetTimerTrigger(20);	--¿ªÊ¼Ò»¸ö¸¨Öú¼ÆÊ±Æ÷
	elseif nNpcCount == 1 then	--Èç¹ûÊÇ×îºóÒ»Ö»
		self:RemoveTimerTrigger();	--Í£Ö¹¸¨Öú¼ÆÊ±Æ÷
	end;
	SetMissionV(MV_NPC_COUNT,nNpcCount-1);
	SetNpcLifeTime(nNpcIdx,0);
end;
--¼ì²éµãÖ´ÐÐº¯Êý¡£ÕâÀï´¦ÀíÁ½¸öBOSSµÄÉúËÀÇé¿ö
function CSTAGE3:OnProcessCheckPoint()
	local nBoss1Idx = GetMissionV(MV_BOSS1);
	local nBoss2Idx = GetMissionV(MV_BOSS2);
	local nBossCount = GetMissionV(MV_BOSS_COUNT);	
	if nBossCount == 1 then
		if nBoss1Idx == 0 then
			self:CreateBossByType(1);
		elseif nBoss2Idx == 0 then
			self:CreateBossByType(2);
		end;
	else
		gf_ShowDebugInfor("Trong sè l­îng BOSS cã OnProcessCheckPoint lçi, nBossCount: "..nBossCount);
	end;	
end;
--³õÊ¼»¯tbTimerEven
CSTAGE3.tbTimerEven = 
{	--tbTimerEvenµÄ¸÷¸öÔªËØµÄÄÚÈÝ¾ÍÊÇProcessTimeCheckPointº¯ÊýµÄËÄ¸ö²ÎÊý
	--	´¥·¢Ê±¼ä ´¥·¢¼ä¸ô ´¥·¢µÄº¯Êý 			´¥·¢º¯ÊýµÄ²ÎÊýtable
	[1] = {60,		120,	CSTAGE3.CheckBossDistance,	{LARGE}},	--¼ì²éBOSS¾àÀëÊÇ·ñ´óÓÚÄ³¸öÖµ
	[2] = {120,		120,	CSTAGE3.CheckBossDistance,	{SHORT}},	--¼ì²éBOSS¾àÀëÊÇ·ñÐ¡ÓÚÄ³¸öÖµ
	[3] = {120,		45,		CSTAGE3.CreateBossChild,	{CSTAGE3.nNpcCount}},
	[4] = {30*60,	0,		CSTAGE3.AllDeath,			{}},
}
