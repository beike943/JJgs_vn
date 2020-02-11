--create date:2007-07-13 16:15
--author:yanjun
--describe:°ï»á¹Ø¿¨stageÎÄ¼þ£¬Ö÷ÒªÊÇ¹Ø¿¨µÄÏà¹Ø²Ù×÷


--MV_VALUE9±íÊ¾ÒªÈ¥µôµÄµÚÒ»ÖÖÖ°Òµ
--MV_VALUE10±íÊ¾ÒªÈ¥µôµÄµÚ¶þÖÖÖ°Òµ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE1 = OO_Inherit(CBASE_STAGE);	--¼Ì³Ð»ùÀà
--=========ÏÂÃæÊÇ×ÓÀàÄÚÈÝµÄ¶¨ÒåºÍÖØÔØ=========================================================
CSTAGE1.nStage = 1;	
CSTAGE1.tbTimerEven = {};
CSTAGE1.nMaxNpcCount = 12;
CSTAGE1.tbBossInfo = {"boss2","Li Yªn"};
--´´½¨BOSS
function CSTAGE1:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
	Msg2MSAll(MISSION_ID,"NhiÖm vô cña ¶i: §¸nh b¹i "..szName);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("Bãng hé vÖ",60,0,1,tbPlayer);
	TM_StartTimeGuage("Li Phñ N÷ T­íng",30,0,2,tbPlayer);
end;
--ÔÚËÄ¸öË¢¹ÖµãË¢Ëæ»úÖÖÀàµÄ¹Ö
function CSTAGE1:CreateOpposedNpc(tbArg)	
	local nBossIdx = GetMissionV(MV_BOSS1);
	local nCurStage = self.nStage;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nNpcCount = 0;
	local nMapX,nMapY = 0,0;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE9) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE10) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,4 do	--ËÄ¸öµãË¢
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--´³¹ØÊ§°Ü
		return 0;
	end;
	local tbChat = {
				"Ha ha, ®Ó ta cho ng­¬i biÕt sù lîi h¹i cña c¸c ®å ®Ö ta!",
				"Ng­êi ®©u, mau ®Õn ®©y tiªu diÖt bän nay cho ta!",
				"Tø ®¹i hé vÖ §«ng Nam T©y B¾c, x«ng lªn nµo c¸c anh em!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("Bãng hé vÖ",90,0,1,tbPlayer);
end;
--BOSSÉúÐ¡º¢
function CSTAGE1:CreateBossChild(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	if GetNpcName(nBossIdx) ~= self.tbBossInfo[2] then
		self:EndStage(0);	--´³¹ØÊ§°Ü
		WriteLog("[V­ît ¶i bang héi cã lçi]: CreateOpposedNpc cña ¶i 1 cã hµm sè tªn BOSS kh«ng ph¶i lµ Li Yªn, lµ"..tostring(GetNpcName(nBossIdx)));
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local nNpcIdx = 0;
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("TiÓu qu¸i ¶i 2","Li Phñ N÷ Vâ T­íng",nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
		AddGroupUnit(NPC_GROUP_ID,nNpcIdx);
	end;
	local tbChat = {
				"Li Phñ N÷ Vâ T­íng mau hiÖn th©n!!!",
				"Ng­êi ®©u, mau ®Õn ®©y tiªu diÖt bän nay cho ta!",
				"§Ó cho c¸c ng­¬i biÕt thùc lùc cña ®å ®Ö ta!!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(2);
	TM_StartTimeGuage("Li Phñ N÷ T­íng",60,0,2,tbPlayer);
end;
--BOSSµÄËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE1:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;

function CSTAGE1:LostLifePerMin()
	local tbPlayer = TM_GetPlayerTable();
	local funLostLife = function(tArg)
		CastState("state_lost_life_per18",5,60*18);
	end;
	gf_OperatePlayers(tbPlayer,funLostLife,{});
end;
--³õÊ¼»¯tbTimerEven
CSTAGE1.tbTimerEven = 
{	--tbTimerEvenµÄ¸÷¸öÔªËØµÄÄÚÈÝ¾ÍÊÇProcessTimeCheckPointº¯ÊýµÄËÄ¸ö²ÎÊý
	--	´¥·¢Ê±¼ä ´¥·¢¼ä¸ô ´¥·¢µÄº¯Êý 			´¥·¢º¯ÊýµÄ²ÎÊýtable
	[1] = {60,		90,	CSTAGE1.CreateOpposedNpc,	{}},
	[2] = {30,		60,	CSTAGE1.CreateBossChild,	{6}},	
	[3] = {30*60,	0,	CSTAGE1.AllDeath,			{}},
	[4] = {0,		60, CSTAGE1.LostLifePerMin,		{}},
}
