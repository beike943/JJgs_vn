--create date:2007-07-09 23:16
--author:yanjun
--describe:°ï»á¹Ø¿¨stageÎÄ¼þ£¬Ö÷ÒªÊÇ¹Ø¿¨µÄÏà¹Ø²Ù×÷

--MV_VALUE9±íÊ¾ÒªÈ¥µôµÄµÚÒ»ÖÖÖ°Òµ
--MV_VALUE10±íÊ¾ÒªÈ¥µôµÄµÚ¶þÖÖÖ°Òµ
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE4 = OO_Inherit(CBASE_STAGE);	--¼Ì³Ð»ùÀà
--=========ÏÂÃæÊÇ×ÓÀàÄÚÈÝµÄ¶¨ÒåºÍÖØÔØ=========================================================
CSTAGE4.nStage = 4;	
CSTAGE4.tbTimerEven = {};
CSTAGE4.nMaxNpcCount = 12;
CSTAGE4.tbBossInfo = {"boss1","§Þa HuyÒn"};
--´´½¨BOSS
function CSTAGE4:OnCreateBoss()
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
	TM_StartTimeGuage("Bãng hé vÖ (tr¸i)",20,0,1,tbPlayer);
	TM_StartTimeGuage("BÉy tr¸i",60,0,2,tbPlayer);
	TM_StartTimeGuage("Bãng hé vÖ (ph¶i)",80,0,3,tbPlayer);
	TM_StartTimeGuage("BÉy ph¶i",120,0,4,tbPlayer);
end;
--ÔÚÄ³¸öÇøÓò´´½¨NPC£¬tbArg[1]Ð¡ÓÚ0±íÊ¾ÔÚ×ó±ßÇøÓò´´½¨£¬´óÓÚ0±íÊ¾ÔÚÓÒ±ß
function CSTAGE4:CreateOpposedNpc(tbArg)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nRegion = tbArg[1];
	local nMapX,nMapY = 0,0;
	local tbNpc = {1,2,3,4,5,6,7};
	local nRand,nRandNpcIdx,nNpcCount = 0,0,0;
	local nCurStage = self.nStage;
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
	for i=1,2 do
		if nRegion == LEFT_REGION then
			nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		else
			nMapX,nMapY = tPos_Rect[i+2][1],tPos_Rect[i+2][2];
		end;
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--´³¹ØÊ§°Ü
		return 0;
	end;
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"Ha ha, ®Ó ta cho ng­¬i biÕt sù lîi h¹i cña c¸c ®å ®Ö ta!",
				"Ng­êi ®©u, mau ®Õn ®©y tiªu diÖt bän nay cho ta!",
				"Hé ph¸p bªn tr¸i ph¶i, x«ng lªn!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(1,tbPlayer);
		TM_StartTimeGuage("Bãng hé vÖ (tr¸i)",120,0,1,tbPlayer);
	else
		TM_StopTimeGuage(3,tbPlayer);
		TM_StartTimeGuage("Bãng hé vÖ (ph¶i)",120,0,3,tbPlayer);
	end;
end;
--»ìÂÒÄ³¸öÇøÓò£¬ËÀÍöÖÐ¼äÇøÓò£¬tbArg[1]Ð¡ÓÚ0±íÊ¾ÔÚ×ó±ßÇøÓò´´½¨£¬´óÓÚ0±íÊ¾ÔÚÓÒ±ß
--tbArg[2]±íÊ¾»ìÂÒ³ÖÐøÊ±¼ä
function CSTAGE4:ConfusionRegion(tbArg)
	local funConfuse = function(tbArg)
		local nPos = %self:GetPlayerSection();
		local nRegion = tbArg[1];
		local nDuration = tbArg[2];
		if (nPos == nRegion and nPos ~= MID_REGION)then
			CastState("state_confusion",1,nDuration*18);	--»ìÂÒnÃë
		elseif nPos == MID_REGION then
			ModifyLife(0);	--Èç¹ûÔÚÖÐ¼ä¾ÍÁ¢¿ÌËÀÍö
		end;
		gf_ShowDebugInfor("Thùc hiÖn hµm sè hçn lo¹n!!!!  nPos:"..nPos..",nRegion:"..nRegion);
	end;
	local tbNormalPlayer = TM_GetPlayerTable();
	gf_ShowDebugInfor("TM_GetPlayerTable hµm sè trë vÒ table lín nhá:"..getn(tbNormalPlayer));
	gf_OperatePlayers(tbNormalPlayer,funConfuse,tbArg);
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"Cho ng­¬i biÕt thÕ nµo gäi lµ vâ c«ng, xem chiªu: Thiªn H¹ §¹i Lo¹n!!!!",
				"Ta muèn chiÕn th¾ng trong sù hçn lo¹n, h·y ®ì chiªu!!!!",
				"H·y xem sù lîi h¹i cña ta ®©y!!!!",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	TM_DoSpecialEffect(1569,3175,953,"Ph¸o hoa chÕt chãc",10);	--MapX,MapY,EffectID,EffectName
	TM_DoSpecialEffect(1582,3163,953,"Ph¸o hoa chÕt chãc",10);
	TM_DoSpecialEffect(1555,3191,953,"Ph¸o hoa chÕt chãc",10);
	if tbArg[1] == LEFT_REGION then
		TM_DoSpecialEffect(1548,3156,936,"Ph¸o hoa hçn lo¹n",10);
		TM_DoSpecialEffect(1559,3140,936,"Ph¸o hoa hçn lo¹n",10);
		TM_DoSpecialEffect(1534,3168,936,"Ph¸o hoa hçn lo¹n",10);
	else
		TM_DoSpecialEffect(1591,3202,936,"Ph¸o hoa hçn lo¹n",10);
		TM_DoSpecialEffect(1601,3191,936,"Ph¸o hoa hçn lo¹n",10);
		TM_DoSpecialEffect(1579,3214,936,"Ph¸o hoa hçn lo¹n",10);
	end;
	local nRegion = tbArg[1];
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(2,tbPlayer);
		TM_StartTimeGuage("BÉy tr¸i",120,0,2,tbPlayer);
	else
		TM_StopTimeGuage(4,tbPlayer);
		TM_StartTimeGuage("BÉy ph¶i",120,0,4,tbPlayer);
	end;
end;
--BOSSµÄËÀÍö½Å±¾Ö´ÐÐº¯Êý
function CSTAGE4:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;
--³õÊ¼»¯tbTimerEven
CSTAGE4.tbTimerEven = 
{	--tbTimerEvenµÄ¸÷¸öÔªËØµÄÄÚÈÝ¾ÍÊÇProcessTimeCheckPointº¯ÊýµÄËÄ¸ö²ÎÊý
	--	´¥·¢Ê±¼ä ´¥·¢¼ä¸ô 	´¥·¢µÄº¯Êý 			´¥·¢º¯ÊýµÄ²ÎÊýtable
	[1] = {20,		120,	CSTAGE4.CreateOpposedNpc,	{LEFT_REGION}},	--×ó±ßÇøÓòË¢NPC
	[2] = {80,		120,	CSTAGE4.CreateOpposedNpc,	{RIGHT_REGION}},	--ÓÒ±ßÇøÓòË¢NPC
	[3] = {60,		120,	CSTAGE4.ConfusionRegion,	{LEFT_REGION,20}},	--×ó±ß»ìÂÒ20Ãë
	[4] = {120,		120,	CSTAGE4.ConfusionRegion,	{RIGHT_REGION,20}},	--ÓÒ±ß»ìÂÒ20Ãë
	[5] = {30*60,	0,		CSTAGE4.AllDeath,			{}},
}
