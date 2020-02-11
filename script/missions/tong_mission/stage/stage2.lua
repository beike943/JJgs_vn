--create date:2007-07-15 10:09
--author:yanjun
--describe:°ï»á¹Ø¿¨stageÎÄ¼þ£¬Ö÷ÒªÊÇ¹Ø¿¨µÄÏà¹Ø²Ù×÷


--MV_VALUE1±íÊ¾BOSSµÄËÀÍö´ÎÊý
--MV_VALUE9±íÊ¾ÒªÈ¥µôµÄµÚÒ»ÖÖÖ°Òµ
--MV_VALUE10±íÊ¾ÒªÈ¥µôµÄµÚ¶þÖÖÖ°Òµ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE2 = OO_Inherit(CBASE_STAGE);	--¼Ì³Ð»ùÀà
--=========ÏÂÃæÊÇ×ÓÀàÄÚÈÝµÄ¶¨ÒåºÍÖØÔØ=========================================================
CSTAGE2.nStage = 2;	
CSTAGE2.tbTimerEven = {};
CSTAGE2.nMaxDeath = 4;	--µÚ4´ÎËÀÍöºó¹ý¹Ø
CSTAGE2.nMaxNpcCount = 12;
CSTAGE2.tbBossInfo = {"boss3","B¸ KiÒu"};
--´´½¨BOSS
function CSTAGE2:OnCreateBoss()
	self:CreateBossByLevel(1);
	local szName = self.tbBossInfo[2];
	Msg2MSAll(MISSION_ID,"NhiÖm vô cña ¶i: §¸nh b¹i "..szName);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("Bãng hé vÖ",45,0,1,tbPlayer);
end;
--ÔÚËÄ¸öË¢¹ÖµãË¢Ëæ»úÖÖÀàµÄ¹Ö
function CSTAGE2:CreateOpposedNpc(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	local nCurStage = self.nStage;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nNpcCount = 0;
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
				"Hìi c¸c anh em, x«ng lªn nµo!",
				"Ng­êi ®«ng lùc m¹nh, ®Ì bÑp chóng cho ta!",
				"C¸c ng­¬i h¹ c¸c ®Ö tö cña ta råi nãi chuyÖn sau nhÐ!",
				}
	if GetNpcName(nBossIdx) == self.tbBossInfo[2] then
		NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("Bãng hé vÖ",90,0,1,tbPlayer);
end;
--BOSSÉúÐ¡º¢
function CSTAGE2:CreateBossChild(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	if GetNpcName(nBossIdx) ~= self.tbBossInfo[2] then
		self:EndStage(0);	--´³¹ØÊ§°Ü
		WriteLog("[V­ît ¶i bang héi cã lçi]: CreateOpposedNpc cña ¶i 2 cã hµm sè tªn BOSS kh«ng ph¶i lµ B¸ KiÒu, lµ"..tostring(GetNpcName(nBossIdx)));
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local nNpcIdx = 0;
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("TiÓu qu¸i ¶i 3","CÊm vÖ binh",nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
end;
--BOSSµÄËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE2:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nDeathTimes = GetMissionV(MV_VALUE1);
	if nDeathTimes >= self.nMaxDeath-1 then			
		self:EndStage();		
		self:CheckAllStagePass();
	else
		self:SetTimerTrigger(10);
		SetMissionV(MV_VALUE1,nDeathTimes+1);
		self:CreateBossChild({nDeathTimes+2});
		SetMissionV(MV_BOSS1,0);
	end;
	SetNpcLifeTime(nNpcIdx,2);
end;
--¸ù¾ÝµÈ¼¶´´½¨BOSS
function CSTAGE2:CreateBossByLevel(nLevel)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
end;
--¸¨ÖúÊ±¼ä´¥·¢Æ÷Ö´ÐÐº¯Êý
function CSTAGE2:OnTimerTriggerEven()
	local nDeathTimes = GetMissionV(MV_VALUE1);
	self:CreateBossByLevel(nDeathTimes+1);
	local nBossIdx = GetMissionV(MV_BOSS1);
	NpcChat(nBossIdx,"§õng cã t­ëng nh­ thÕ nµy lµ dÔ h¹ ®­îc ta, ng­êi ®©u quÐt s¹ch lò nµy cho ta!");
end;
--³õÊ¼»¯tbTimerEven
CSTAGE2.tbTimerEven = 
{	--tbTimerEvenµÄ¸÷¸öÔªËØµÄÄÚÈÝ¾ÍÊÇProcessTimeCheckPointº¯ÊýµÄËÄ¸ö²ÎÊý
	--	´¥·¢Ê±¼ä ´¥·¢¼ä¸ô ´¥·¢µÄº¯Êý 			´¥·¢º¯ÊýµÄ²ÎÊýtable
	[1] = {45,		90,	CSTAGE2.CreateOpposedNpc,	{}},
	[2] = {30*60,	0,	CSTAGE2.AllDeath,			{}},
}
