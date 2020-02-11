Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--µÚ4¹Ø£º±ÙÐ°Ö®Ï·
-----------------------------------------------------------------
tStage04 = {
	name = "TÞch Tµ Chi HÝ",
	nStageId = 4,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage04 = inherit(cycPhase, tStage04);

function tStage04:onTimeout()
	local self = tStage04;
	this:Msg2MSAll(format("%d phót sau ch­a hoµn thµnh [%s], ¶i sÏ ®ãng l¹i!", tStage04.maxsecond / 60, tStage04.name));
	TY_CloseMission();
end

-----------------------------------------------------------------
tStage04_1 = {
	name = "TÞch Tµ Chi HÝ-Khu chuÈn bÞ",
	nStageId = TOTAL_STAGE + tStage04.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "TÞch Tµ Chi HÝ-Khu chuÈn bÞ",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage04_1:CreateNpcs()
	local self = tStage04_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[5][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[5][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage04_1:Init()
	local self = tStage04_1;
	
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_01, eMSName.TOWER);
	SetMissionV(this.mv_03, 0);
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	
	local nTaskID = 0;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		nTaskID = TASKID_TY_NORMAL_ENTER_LIMIT;
	elseif nDifType == eDifType.HARD then
		nTaskID = TASKID_TY_HERO_ENTER_LIMIT;
	else
		return 
	end
	this.msCamp:turnPlayer(0, function() SetTask(%nTaskID, GetTask(%nTaskID) + 1); end);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("§éi tr­ëng vµ Méc QuÕ Anh ®èi tho¹i ®Ó tiÕp tôc ¶i!") end);
end

function tStage04_1:BeginFight()
	local self = tStage04_1;
	SetMissionV(this.mv_22, 1);		--¿ªÆô¹Ø¿¨
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 12, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 24, 0, 1);
	end
end

function tStage04_1:CheatMode()
	local self = tStage04_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>Méc QuÕ Anh<color>: Trªn ng­êi b¹n"..TYT_IB_ITEM[1].."Kh«ng ®ñ.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 33, 0, 1);
	self:BeginFight();
end

function tStage04_1:EndStage05()
	local self = tStage04_1;
	TY_StagePassed(self);
	
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	SetMissionV(self.father.curPhaseLv, 3);
	local tCurPhase = self.father.phases[3];
	tCurPhase:onInit(self.father);
end

function tStage04_1.GoToStage06()
	local self = tStage04_1;
	TY_ClearMapNpc();
	TY_ClearAllGodState();
	SetMissionV(this.mv_03, 1);
	SetMissionV(tPhaseDriver.curPhaseLv, 10);
	local tCurPhase = tPhaseDriver:GetPhase();
	tCurPhase:onInit(tPhaseDriver);
end

function tStage04_1:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage04_1.NpcMain()
	local self = tStage04_1;
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) ~= tNpcs.mgy_2[2] then
		return 0;
	end
	
	if not TY_IsCaptain() then
		return 0;
	end
	
	if not tStage04_1.sel_NORMAL then
		tStage04_1.sel_NORMAL = {
			"Më ¶i 1: TÞch Tµ Chi HÝ/#tStage04_1.BeginFight()",
			"H×nh thøc sao chÐp (CÇn "..TYT_IB_ITEM[1].."*1)/#tStage04_1.CheatMode()",
--			"½áÊøµÚ4¹Ø/#tStage04_1.EndStage05()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
	end
	
	if not tStage04_1.sel_HARD then
		tStage04_1.sel_HARD = {
			"Më ¶i 1: TÞch Tµ Chi HÝ/#tStage04_1.BeginFight()",
--			"½áÊøµÚ4¹Ø/#tStage04_1.EndStage05()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
	end
	
	local strTab = tStage04_1.sel_HARD;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		strTab = tStage04_1.sel_NORMAL;
	end
	
	Say("<color=green>Méc QuÕ Anh<color>: §¹i hiÖp ®· s½n sµng ch­a?", getn(strTab), strTab);
end

function tStage04_1:OnPlayerDeath()
	local self = tStage04_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage04_1 = inherit(cycPhase, tStage04_1);

tStage04_1.actions = {
	[1] = {
		[0] = {tStage04_1.Init, },
	},
};

tStage04_1.triggers = {
	Talk = {
		{action = tStage04_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage04_1.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
tStage04_2 = {
	name = "TÞch Tµ Chi HÝ",
	nStageId = TOTAL_STAGE + tStage04.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "TÞch Tµ Chi HÝ",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage04_2:Init()
	local self = tStage04_2;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_easy_open_1, 1);
		local nMSType = GetMissionV(this.mv_01);
		this.msCamp:turnPlayer(0, function() SetTask(tTaskID.JoinInTime[%nMSType], GetTask(tTaskID.JoinInTime[%nMSType]) + 1); end);	--¾­ÑéË¥¼õ
	else
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_hard_open_1, 1);
	end
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 1);		--0:Î´¿ªÆô¹Ø¿¨ 1:¹Ø¿¨¿ªÆô(¶Ô°×½×¶Î) 2:¹Ø¿¨¿ªÆô(Õ½¶·½×¶Î)
	SetMissionV(this.mv_23, 0);		--Ê±¼äÖá±äÁ¿ n*5
	SetMissionV(this.mv_24, 0);		--±ÙÐ°Òª³ÔµÄÄ¢¹½index
	SetMissionV(this.mv_25, 0);		--±ÙÐ°ÅäÖÃ±íAIÀàÐÍ
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYI_ITEM, 0); end);
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	
	local nBXIdx = 0;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nBXIdx = TY_CreateNpc(tNpcs.bx_1, tNpcPos.bx[5][1]);
	else
		nBXIdx = TY_CreateNpc(tNpcs.bx, tNpcPos.bx[5][1]);
	end
	SetCampToNpc(nBXIdx, CampPlayer);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	if 0 ~= nMgyIdx and 0 ~= nYzbIdx then
		SetNpcDir(nMgyIdx, 36);
		SetNpcDir(nYzbIdx, 34);
	end
	TY_AddAttackState();
	TY_ClearDamagePoint();
end

function tStage04_2:NpcTalk()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	local self = tStage04_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local tContent = {
		[1] = {
			{nYzbIdx, "§©y lµ... l¹i thªm 1 con qu¸i vËt n÷a µ! Ch¼ng lÏ nã lµ do TÞch DiÖt T«n Gi¶ t¹o ra sao?"},
			{nMgyIdx, "Trong bé d¹ng th× kh«ng gièng c¬ quan tµ thó do TÞch DiÖt T«n Gi¶ t¹o ra. Khoan ®·! H×nh nh­ ta ®· gÆp qua nã råi!"},
			{nMgyIdx, "Ch¼ng lÏ ®©y chÝnh lµ TÞch Tµ ThÇn Thó trong truyÒn thuyÕt?"},
			{nYzbIdx, "C¸i g×? TÞch Tµ... ThÇn Thó?"},
			{nMgyIdx, "TÞch Tµ ThÇn Thó chuyªn trõ tµ ma, v× thÕ n¬i ë cña nã sÏ kh«ng cã yªu ma d¸m ®Õn gÇn, nªn cã chÝnh khÝ ngÊt trêi."},
			{nYzbIdx, "Xem ra ®©y lµ vËt ë trªn trêi råi!"},
			{nMgyIdx, "ChÝnh x¸c! T­ëng Lai Gia Gia hi sinh th©n m×nh ®Ó b¶o vÖ b¸ t¸nh cña §¹i Tèng, trêi cao ®éng lßng nªn ®· ph¸i TÞch Tµ ThÇn Thó ®Õn ®Ó b¶o vÖ di thÓ cña Gia Gia!"},
			{nYzbIdx, "Nh­ng hiÖn t¹i nã ®ang chiÕm lèi vµo cña Th¸i NhÊt Th¸p, nÕu kh«ng ®¸nh b¹i nã chóng ta sÏ kh«ng thÓ vµo trong th¸p!"},
			{nMgyIdx, "VËy th× chØ cßn c¸ch… nãi ®¹o lý víi nã th«i."},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		else
			if nParagraph == 1 then	--µÚÒ»¶Î·Ï»°ËµÍê
				SetMissionV(this.mv_22, 2);	--×ªÈëÕ½¶·½×¶Î
				local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
				local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
				TY_SetNpcType2Fight(nMgyIdx);
				TY_SetNpcType2Fight(nYzbIdx);
				
				local nBXIdx = TY_FindNpc(tNpcs.bx[2]);
				if 0 ~= nBXIdx then TY_SetNpcType2Fight(nBXIdx); end
				SetCampToNpc(nBXIdx, CampEnemy);
--				if eDifType.NORMAL == GetMissionV(this.mv_02) then
--					TY_SupplyNpc(self.nStageId);
--				end
				SetMissionV(this.mv_25, GetUnitCurStates(nBXIdx, 7));
				SetNpcDeathScript(nBXIdx, thisFile);
			end
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage04_2:CreateMashroom()
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	local self = tStage04_2;
	local nPosIdx = -1;
	local nMashroomIdx = -1;
	local nMapId = this.msPosition:getMapID();
	local tRand = floyd_rm4n(8, getn(tNpcPos.mashroom[5]));
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	
	for i = 1, 2 do
		tPos = tNpcPos.mashroom[5][tRand[i]];
		nMashroomIdx = CreateNpc("TYT_BlackMogu", "NÊm §en", nMapId, tPos[1], tPos[2]);
		SetNpcScript(nMashroomIdx, thisFile);
	end
	local tMashrooms = {
		{"TYT_GrennMogu", "NÊm Lôc"},
		{"TYT_RedMogu", "NÊm §á"},
		{"TYT_BlueMogu", "NÊm Lam"},
	};
	for i = 1, 4 do
		tPos = tNpcPos.mashroom[5][tRand[i + 2]];
		local nIdx = random(1, getn(tMashrooms));
		nMashroomIdx = CreateNpc(tMashrooms[nIdx][1], tMashrooms[nIdx][2], nMapId, tPos[1], tPos[2]);
		SetNpcScript(nMashroomIdx, thisFile);
	end
	
	local szMsg = "Chó ý: ChØ cã mét sè nÊm cã t¸c dông víi TÞch Tµ, nÕu chóng ta ¨n ph¶i nh÷ng lo¹i nÊm nµy sÏ kh«ng cã lîi Ých g×.";
	NpcChat(nMgyIdx, szMsg);
	this:Msg2MSAll(szMsg);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("Trªn mÆt ®Êt mäc lªn c¸c lo¹i nÊm") end);
end

--±ÙÐ° ×°±¸»¤¶Ü
function tStage04_2:EquipShield()
	local nBXIdx = TY_FindNpc(tNpcs.bx[2]);
	if 0 == nBXIdx or 1 == IsNpcDeath(nBXIdx) then
		return 0;
	end
	local _, x, y = GetNpcWorldPos(nBXIdx);
	
	SetCurrentNpcSFX(nBXIdx, 987, 1, 1);
	CastState2Npc(nBXIdx, "state_physical_damage_absorb", 5000000, 60*18, 0, 10001);
	CastState2Npc(nBXIdx, "state_magic_damage_absorb", 5000000, 60*18, 0, 10002);
end

--¼ì²â±ÙÐ°ÊÇ·ñ×ßµ½Ä¿±êÄ¢¹½
function tStage04_2:CheckPos()
	local self = tStage04_2;
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	local nMashroomIdx = GetMissionV(this.mv_24);
	if 0 == nMashroomIdx then
		return 0;
	end
	
	local nBXIdx = TY_FindNpc(tNpcs.bx[2]);
	local szName = GetNpcName(nMashroomIdx);
	if szName ~= GetMissionS(this.ms20) then
		DebugOutput("[Th¸i NhÊt Th¸p] [npcidx and npcname not match!!!]", nMashroomIdx, szName, GetMissionS(this.ms20));
		SetMissionV(this.mv_24, 0);
		return 0;
	end
	
	local nMapId, x, y = GetNpcWorldPos(nBXIdx);
	
	local _, x1, y1 = GetNpcWorldPos(nMashroomIdx);
	
	if abs(x1 - x) <= 1 and abs(y1 - y) <= 1 then
		AddUnitStates(nBXIdx, 7, GetMissionV(this.mv_25));	--ÉèÖÃAIÎª×·Ëæ×î´ó³ðºÞÍæ¼Ò
		
		SetNpcLifeTime(nMashroomIdx, 0);	--³Ôµô
		SetMissionV(this.mv_24, 0);
		
		local szMashroomName = GetMissionS(this.ms20);
		if "NÊm §á" == szMashroomName then
			RemoveStateFromNpc(nBXIdx, 10003);
			CastState2Npc(nBXIdx, "state_move_speed_percent_add", 26, 15*18, 0, 10003);
			CastState2Npc(nBXIdx, "state_p_attack_percent_add", 100, 15*18, 0, 10004);
			NpcCommand(nBXIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1662);
		elseif "NÊm Lôc" == szMashroomName then
			local nMax, nCur = GetUnitCurStates(nBXIdx, 1);
			local fPercent = nCur / nMax;
			local nAdd = 0.4;
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				nAdd = 0.2;
			end
			fPercent = fPercent + nAdd;
			if fPercent > 1.0 then fPercent = 1.0; end
			ModifyNpcData(nBXIdx, 0, floor(nMax * fPercent), 0);
			SetCurrentNpcSFX(nBXIdx, 989, 0, 0);
		elseif "NÊm §en" == szMashroomName then	--Ð¶¶Ü
			RemoveStateFromNpc(nBXIdx, 10001);
			RemoveStateFromNpc(nBXIdx, 10002);
			CastState2Npc(nBXIdx, "state_move_speed_percent_add", 22, 15*18, 0, 10003);
			SetCurrentNpcSFX(nBXIdx, -1, 1, 1);
			SetCurrentNpcSFX(nBXIdx, 0, 1, 1);
			SetCurrentNpcSFX(nBXIdx, -1, 0, 1);
			SetCurrentNpcSFX(nBXIdx, 0, 0, 1);
		elseif "NÊm Lam" == szMashroomName then
			local nPlayerIndex = GetWhoHitNpcMost(nBXIdx);
			if not nPlayerIndex then
				nPlayerIndex = PIdx2NpcIdx(TY_FindRandomPlayer({x1, y1}));
			end
			SetCurrentNpcSFX(nBXIdx, 988, 1, 1);
			DoSkill2Target(nBXIdx, 1663, 1, nPlayerIndex);
		end
		TY_ClearNpc({"NÊm §á","NÊm Lôc","NÊm Lam","NÊm §en"});
	end
end

--±ÙÐ° ³ÔÄ¢¹½
function tStage04_2:EatMashroom()
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	
	local self = tStage04_2;
	local nBXIdx = TY_FindNpc(tNpcs.bx[2]);
	if 0 == nBXIdx then
		DebugOutput("EatMashroom:0 == nBXIdx")
		return 0;
	end
	if not tStage04_2.EatList then
		tStage04_2.EatList = {"NÊm §á", "NÊm Lam", "NÊm Lôc", "NÊm §en"};
	end
	local nNewMashroomIdx = nil;
	local nOldMashroomIdx = GetMissionV(this.mv_24);
	for i = 1, getn(tStage04_2.EatList) do
		local tNpcIdx = TY_FindAllNpc(tStage04_2.EatList[i]);
		if getn(tNpcIdx) ~= 0 then
			for k = 1, getn(tNpcIdx) do
				--DebugOutput("nOldMashroomIdx, tNpcIdx[k] =", nOldMashroomIdx, tNpcIdx[k])
				if nOldMashroomIdx ~= tNpcIdx[k] then
					nNewMashroomIdx = tNpcIdx[k];
					break;
				end
			end
			
			if nNewMashroomIdx then
				local _, x, y = GetNpcWorldPos(nNewMashroomIdx);
				SetNpcActivator(nBXIdx);
				g_NpcAI:setAI(nBXIdx, AT_SM_MOVE);
				g_NpcAI:setWayPoint(nBXIdx, {{x, y}, });
				SetMissionV(this.mv_24, nNewMashroomIdx);
				SetMissionS(this.ms20, tStage04_2.EatList[i]);
				--DebugOutput("nNewMashroomIdx, GetNpcName(nNewMashroomIdx), tStage04_2.EatList[i] =", nNewMashroomIdx, GetNpcName(nNewMashroomIdx), tStage04_2.EatList[i])
				break;
			end
		end
	end
	if not nNewMashroomIdx then
		local _, x, y = GetNpcWorldPos(nBXIdx);
		NpcCommand(nBXIdx, NPCCOMMAND.do_hurt);
		return 0;
	end
	return 1;
end

function tStage04_2:StagePassed(tPos)
	local self = tStage04_2;
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	NpcChat(nMgyIdx, "……");
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 13, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 25, 0, 1);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_46, 0); -- Ç§Ñ°Ëþ²ú³ö
	TY_StagePassed(self, tPos);
	self:onFinish();
end

function tStage04_2:OnNpcDeath(event, data)
	local self = tStage04_2;
	local szName = GetNpcName(data[1]);
	local nMapId, x, y = GetNpcWorldPos(data[1]);
	RemoveNpc(data[1]);
	if szName == tNpcs.bx[2] then
		self:StagePassed({nMapId, x, y});
	end
end

function tStage04_2:MoveNpc()
	local self = tStage04_2;
	local nMashroomIdx = GetMissionV(this.mv_24);
	if 0 == nMashroomIdx then return 0; end
	local nBXIdx = TY_FindNpc(tNpcs.bx[2]);
	local _, x1, y1 = GetNpcWorldPos(nBXIdx);
	local _, x2, y2 = GetNpcWorldPos(nMashroomIdx);
	
	if abs(x1 - x2) > 1 or abs(y1 - y2) > 1 then
		SetNpcPos(nBXIdx, x2, y2);
	end
end

function tStage04_2:DoSth()
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	
	local self = tStage04_2;
	SetMissionV(this.mv_23, GetMissionV(this.mv_23) + 1);
	local nValue = GetMissionV(this.mv_23) * 5;
	if nValue == 15 then
		TY_ClearNpc({"NÊm §á","NÊm Lôc","NÊm Lam","NÊm §en"});
		self:CreateMashroom();
		self:EquipShield();
	elseif nValue == 20 then
		self:EatMashroom();
	elseif nValue == 30 then
		self:MoveNpc();
	elseif nValue == 45 then
		SetMissionV(this.mv_23, 0);
	end
end

function tStage04_2:BxChangeEatMashroom()
	local self = tStage04_2;
	local nBXIdx = TY_FindNpc(tNpcs.bx[2]);
	local nMapId, x, y = GetNpcWorldPos(nBXIdx);
	
	NpcCommand(nBXIdx, NPCCOMMAND.do_stand);
	AddUnitStates(nBXIdx, 7, GetMissionV(this.mv_25));	--ÉèÖÃAIÎª×·Ëæ×î´ó³ðºÞÍæ¼Ò
	local nRet = self:EatMashroom();
	if 0 == nRet then
		SetMissionV(this.mv_24, 0);
	end
end

function tStage04_2:NpcMain()
	local self = tStage04_2;
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	if szName ~= tNpcs.mgy_2[2] and szName ~= tNpcs.yzb_2[2] and szName ~= tNpcs.bx[2] then
		RemoveNpc(nNpcIdx);
	end
	SetTask(TASKID_TAIYI_ITEM, nNpcIdx);
	if nNpcIdx == GetMissionV(this.mv_24) then	--Èç¹ûÊÇ±ÙÐ°ÕýÒª³ÔµÄÄ¢¹½£¬Ôò»»Ò»¸ö
		self:BxChangeEatMashroom();
	end
	
	if not self.MashroomEffect then
		self.MashroomEffect = {
			[eDifType.NORMAL] = {
				["NÊm §en"] = {
					["states"] = {{"state_lost_p_life_per18", 2, 10*18, 0, 10001}, },		--Ã¿1Ãëµô3%Ñª
					["sfx"] = {980, 1, 1},
				},
				["NÊm Lôc"] = {
					["states"] = {{"state_lost_p_life_per18", 2, 10*18, 0, 10001}, 
								  {"state_damage_point", 1000, 18*30, 0, 10004}, },			--³ÔÂÌÉ«Ä¢¹½Ôö¼ÓÉËº¦
					["sfx"] = {981, 1, 1},
				},
				["NÊm §á"] = {
					["states"] = {{"state_lost_p_life_per18", 2, 10*18, 0, 10001}, 
								  {"state_p_attack_percent_add", 100, 18*30, 0, 10002}, },	--³ÔºìÉ«Ä¢¹½Ôö¼ÓÍâ¹¦¹¥»÷
					["sfx"] = {983, 1, 1},
				},
				["NÊm Lam"] = {
					["states"] = {{"state_lost_p_life_per18", 2, 10*18, 0, 10001},
								  {"state_m_attack_percent_add", 100, 18*30, 1, 10003}, },	--³ÔÀ¶É«Ä¢¹½Ôö¼ÓÄÚ¹¦¹¥»÷
					["sfx"] = {982, 1, 1},
				},
			},
			[eDifType.HARD] = {
				["NÊm §en"] = {
					["states"] = {{"state_lost_p_life_per18", 4.5, 10*18, 0, 10001}, },		--Ã¿1Ãëµô3%Ñª
					["sfx"] = {980, 1, 1},
				},
				["NÊm Lôc"] = {
					["states"] = {{"state_lost_p_life_per18", 4.5, 10*18, 0, 10001}, 
								  {"state_damage_point", 1000, 18*30, 0, 10004}, },			--³ÔÂÌÉ«Ä¢¹½Ôö¼ÓÉËº¦
					["sfx"] = {981, 1, 1},
				},
				["NÊm §á"] = {
					["states"] = {{"state_lost_p_life_per18", 4.5, 10*18, 0, 10001}, 
								  {"state_p_attack_percent_add", 100, 18*30, 0, 10002}, },	--³ÔºìÉ«Ä¢¹½Ôö¼ÓÍâ¹¦¹¥»÷
					["sfx"] = {983, 1, 1},
				},
				["NÊm Lam"] = {
					["states"] = {{"state_lost_p_life_per18", 4.5, 10*18, 0, 10001},
								  {"state_m_attack_percent_add", 100, 18*30, 1, 10003}, },	--³ÔÀ¶É«Ä¢¹½Ôö¼ÓÄÚ¹¦¹¥»÷
					["sfx"] = {982, 1, 1},
				},
			},
		};
	end
	local nDifType = GetMissionV(this.mv_02);
	if not self.MashroomEffect[nDifType][szName] then return 0; end
	local tStates = self.MashroomEffect[nDifType][szName].states;
	if tStates then
		for k, v in tStates do
			CastState(v[1], v[2], v[3], v[4], v[5]);
		end
	end
	tSfx = self.MashroomEffect[nDifType][szName].sfx;
	if tSfx then
		SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), tSfx[1], tSfx[2], tSfx[3]);
	end
end

function tStage04_2:DoExplode()
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	
	local nBXIdx = TY_FindNpc(tNpcs.bx[2]);
	local _, x, y = GetNpcWorldPos(nBXIdx);
	local tPlayerIndex = TY_FindRandomPlayer({x, y}, 3);
	CastState2Npc(nBXIdx, "state_attack_trans", 50, 10*18);
	local nOldPlayerIndex = PlayerIndex;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		for i = 1, getn(tPlayerIndex) do
			PlayerIndex = tPlayerIndex[i];
			DoSkill2Target(nBXIdx, 1769, 2, PIdx2NpcIdx(PlayerIndex));		--£¨¼¼ÄÜ5£©
		end
	else
		for i = 1, getn(tPlayerIndex) do
			PlayerIndex = tPlayerIndex[i];
			DoSkill2Target(nBXIdx, 1769, 1, PIdx2NpcIdx(PlayerIndex));		--£¨¼¼ÄÜ5£©
		end
	end
end

function tStage04_2:RemoveSFX()
	local self = tStage04_2;
	this.msCamp:turnPlayer(0, function()
		if 0 ~= GetTask(TASKID_TAIYI_ITEM) then
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 1, 1);
		end
	end);
end

function tStage04_2:onTimeout()
	local self = tStage04_2;
	TY_RecordDamagePoint()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	TY_ClearPlayerSFX();
	TY_GoToStage(self, self.father, 1);
end

function tStage04_2:OnPlayerDeath(event, data)
	local self = tStage04_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 1, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 1, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 0, 1);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 0, 1);
end

tStage04_2 = inherit(cycPhase, tStage04_2);

tStage04_2.actions = {
	[1] = tStage04_2.Init,
};

tStage04_2.cycActions = {
	[1] = {
		[0] = {tStage04_2.CheckPos, },
	},
	[2] = {
		[0] = {tStage04_2.NpcTalk, },
	},
	[5] = {		--45sÖÜÆÚÊ±¼äÖá
		[0] = {tStage04_2.DoSth},
	},
	[6] = {
		[0] = {tStage04_2.DoExplode},
	},
	[30] = {
		[0] = {tStage04_2.RemoveSFX},
	},
};

tStage04_2.triggers = {
	NpcDeath = {
		{action = tStage04_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage04_2.OnPlayerDeath},
	},
	Talk = {
		{action = tStage04_2.NpcMain},
	},
};

--±ÙÐ°Ö®Ï·-½áÊøÇø
-----------------------------------------------------------------
tStage04_3 = {
	name = "TÞch Tµ Chi HÝ-Khu kÕt thóc",
	nStageId = TOTAL_STAGE + tStage04.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "TÞch Tµ Chi HÝ-Khu kÕt thóc",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage04_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[5][2]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[5][2]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
end

function tStage04_3:Init()
	local self = tStage04_3;
	self:CreateNpcs();
end

function tStage04_3:GoToStage06()
	local self = tStage04_3;
	TY_ClearMapNpc();
	TY_StagePassed(self);
	self:onFinish();
end

function tStage04_3:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		local strTab = {
			"TruyÒn tèng ®Õn Th¸i NhÊt Th¸p-Trung/#tStage04_3.GoToStage06()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
		Say("<color=green>Méc QuÕ Anh<color>: muèn ®Õn Th¸i NhÊt Th¸p-Trung?", getn(strTab), strTab);
	end
end

function tStage04_3:OnPlayerDeath()
	local self = tStage04_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage04_3:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage04_3 = inherit(cycPhase, tStage04_3);

tStage04_3.actions = {
	[1] = tStage04_3.Init,
};

tStage04_3.triggers = {
	Talk = {
		{action = tStage04_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage04_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage04.phases = {tStage04_1, tStage04_2, tStage04_3};
