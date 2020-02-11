Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--µÚÒ»¹Ø
-----------------------------------------------------------------
tStage01 = {
	name = "Nhiªn TÞch Chi Th­¬ng",
	nStageId = 1,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage01 = inherit(cycPhase, tStage01);

function tStage01:onTimeout()
	local self = tStage01;
	this:Msg2MSAll(format("%d phót sau ch­a hoµn thµnh [%s], ¶i sÏ ®ãng l¹i!", tStage01.maxsecond / 60, tStage01.name));
	TY_CloseMission();
end

--µÚÒ»¹Ø¿ªÆôÇ°
-----------------------------------------------------------------
tStage01_1 = {
	name = "Nhiªn TÞch Chi Th­¬ng-Khu chuÈn bÞ",
	nStageId = TOTAL_STAGE + tStage01.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Nhiªn TÞch Chi Th­¬ng-Khu chuÈn bÞ",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage01_1.JumpStage()
	local self = tStage01_1;
	TY_StagePassed(self);
	
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	SetMissionV(self.father.curPhaseLv, 3);
	local tCurPhase = self.father.phases[3];
	tCurPhase:onInit(self.father);
end

function tStage01_1:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[1][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[1][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage01_1.Init()
	local self = tStage01_1;
	
	SetMissionV(this.mv_03, 0);
	if GetMissionV(this.mv_02) == eDifType.NORMAL then
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_easy_open_1, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_hard_open_1, 1);
	end
	SetMissionV(MV_STAGE, self.father.nStageId);
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	
	local nTaskID = 0;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		nTaskID = TASKID_FTL_NORMAL_ENTER_LIMIT;
	elseif nDifType == eDifType.HARD then
		nTaskID = TASKID_FTL_HERO_ENTER_LIMIT;
	else
		return
	end
	this.msCamp:turnPlayer(0, function() SetTask(%nTaskID, GetTask(%nTaskID) + 1); end);
end

function tStage01_1.EndStage()
	local self = tStage01_1;
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 6, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 18, 0, 1);
	end
end

function tStage01_1.CheatMode()
	local self = tStage01_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>Méc QuÕ Anh<color>: Trªn ng­êi b¹n"..TYT_IB_ITEM[1].."Kh«ng ®ñ.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 30, 0, 1);
	self:EndStage();
end

function tStage01_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage01_1.sel_NORMAL then
			tStage01_1.sel_NORMAL = {
--				"½áÊøµÚ1¹Ø/#tStage01_1.JumpStage()",
				"Më ¶i/#tStage01_1.EndStage()",
				"H×nh thøc sao chÐp (CÇn "..TYT_IB_ITEM[1].."*1)/#tStage01_1.CheatMode()",
				"Rêi khái/TY_ConfirmClose",
				"Hñy bá/nothing",
			};
		end
		
		if not tStage01_1.sel_HARD then
			tStage01_1.sel_HARD = {
--				"½áÊøµÚ1¹Ø/#tStage01_1.JumpStage()",
				"Më ¶i/#tStage01_1.EndStage()",
				"Rêi khái/TY_ConfirmClose",
				"Hñy bá/nothing",
			};
		end
		
		local strTab = tStage01_1.sel_HARD;
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			strTab = tStage01_1.sel_NORMAL;
		end
		Say("<color=green>Méc QuÕ Anh<color>: §¹i hiÖp ®· s½n sµng ch­a?", getn(strTab), strTab);
	end
end

function tStage01_1:OnPlayerDeath()
	local self = tStage01_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage01_1:onTimeout()
	local self = tStage01_1;
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_CloseMission();
end

tStage01_1 = inherit(cycPhase, tStage01_1);

tStage01_1.actions = {
	[1] = tStage01_1.Init,
};

tStage01_1.triggers = {
	Talk = {
		{action = tStage01_1.NpcMain},
	},
	NpcDeath = {
		{action = tStage01_1.OnPlayerDeath}
	},
};

--µÚÒ»¹Ø¿ªÆôÕ½¶·
-----------------------------------------------------------------
tStage01_2 = {
	name = "Nhiªn TÞch Chi Th­¬ng",
	nStageId = TOTAL_STAGE + tStage01.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Nhiªn TÞch Chi Th­¬ng",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage01_2.CreateNpcs()
	local self = tStage01_2;
	local tNpcXy = tNpcs.xy;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		tNpcXy = tNpcs.xy_1;
	end
	local nXyIdx = TY_CreateNpc(tNpcXy, tNpcPos.xy[1][1]);
	TY_SetNpcType2Talk(nXyIdx);
end

function tStage01_2.Init()
	local self = tStage01_2;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);	--0:Õ½¶·Ç° 1:¿ªÊ¼Õ½¶·
	SetMissionV(this.mv_23, 1);	--¼¼ÄÜÊ©·ÅË÷Òý
	SetMissionV(this.mv_24, 0);	--ÏôÞÄÑª<10%£¨½áÊø¶Ô°×ÏÔÊ¾£©
	SetMissionV(this.mv_25, 0);
	SetMissionV(this.mv_26, 0);	--ÊÇ·ñ¹ý¹Ø
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	self:CreateNpcs();
	TY_AddAttackState();
	TY_ClearDamagePoint();
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		local nMSType = GetMissionV(this.mv_01);
		this.msCamp:turnPlayer(0, function() SetTask(tTaskID.JoinInTime[%nMSType], GetTask(tTaskID.JoinInTime[%nMSType]) + 1); end);	--¾­ÑéË¥¼õ
	end
end

function tStage01_2.BeginFight()
	local self = tStage01_2;
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	local nXyIdx = TY_FindNpc(tNpcs.xy[2]);
	TY_SetNpcType2Fight(nMgyIdx)
	TY_SetNpcType2Fight(nYzbIdx);
	TY_SetNpcType2Fight(nXyIdx);
--	if eDifType.NORMAL == GetMissionV(this.mv_02) then 
--		TY_SupplyNpc(self.nStageId);
--	end
end

function tStage01_2.CheckBlood()
	if 1 ~= GetMissionV(this.mv_22) then
		return 0;
	end
	local self = tStage01_2;
	local nXyIdx = TY_FindNpc(tNpcs.xy[2]);
	if 0 ~= nXyIdx then
		local nMaxLife, nCurLife = GetUnitCurStates(nXyIdx, 1);
		local nCurBlood = floor(nCurLife/nMaxLife * 100);
		if not self.tBloodList then self.tBloodList = {95, 75, 55, 35, 15}; end
		local nIndex = GetMissionV(this.mv_23);
		if self.tBloodList[nIndex] and nCurBlood <= self.tBloodList[nIndex] then
			SetMissionV(this.mv_23, nIndex + 1);
			self:CallXlsy();
		end
	end
end

--ÏôÞÄÐÞÂÞ»¯
function tStage01_2:XyFrenzy()
	local nXyIdx = TY_FindNpc(tNpcs.xy[2]);
	--óïÞÈÎÞµÐ¡¢¹¥»÷Á¦¡Á3£¬ÒÆ¶¯ËÙ¶È½µµÍÎª10
	local _, x, y = GetNpcWorldPos(nXyIdx);
	NpcCommand(nXyIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536+1750);
	SetCurrentNpcSFX(nXyIdx, 978, 1, 1);
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		CastState2Npc(nXyIdx, "state_dispear", 100, 60*60*18, 0, 10001);
		CastState2Npc(nXyIdx, "state_p_attack_percent_add", 300, 60*60*18, 0, 10002);
	else
		CastState2Npc(nXyIdx, "state_dispear", 100, 60*60*18, 0, 10001);
		CastState2Npc(nXyIdx, "state_p_attack_percent_add", 300, 60*60*18, 0, 10002);
	end
	local _, x, y = GetNpcWorldPos(nXyIdx);
	local nPlayerIdx = TY_FindRandomPlayer({x, y});
	if 0 ~= nPlayerIdx then
		local nOldPlayerIdx = PlayerIndex;
		PlayerIndex = nPlayerIdx;
		local szName = GetSafeName();
		PlayerIndex = nOldPlayerIdx;
		
		local szMsg = format("%s ®· tróng mét chiªu!!!!!!!!!", szName);
		NpcChat(nXyIdx, szMsg);
		this:Msg2MSAll(szMsg);
	end
end

--ÕÙ»½ÐÞÂÞËéÓ°
function tStage01_2.CallXlsy()
	local self = tStage01_2;
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nXyIdx = TY_FindNpc(tNpcs.xy[2]);
	local nXlsyIdx = 0;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nXlsyIdx = TY_CreateNpc(tNpcs.xlsy_1, tNpcPos.xlsy[1][1]);
		nXlsyIdx = TY_CreateNpc(tNpcs.xlsy_1, tNpcPos.xlsy[1][1]);
	else
		nXlsyIdx = TY_CreateNpc(tNpcs.xlsy, tNpcPos.xlsy[1][1]);
		nXlsyIdx = TY_CreateNpc(tNpcs.xlsy, tNpcPos.xlsy[1][1]);
	end
	SetMissionV(this.mv_25, GetMissionV(this.mv_25) + 2);
	local szMsg = "H·y mau dô Tiªu DÞch ®i chç kh¸c, vµ gi¶i quyÕt To¸i ¶nh cña h¾n!";
	NpcChat(nMgyIdx, szMsg);
	this:Msg2MSAll(szMsg);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("Tiªu DÞch To¸i ¶nh ®· xuÊt hiÖn råi") end);
	self:XyFrenzy();
end

function tStage01_2:StagePassed()
	local self = tStage01_2;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 7, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 19, 0, 1);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_13, 0); -- Ç§Ñ°Ëþ²ú³ö
	TY_StagePassed(self);
	self:onFinish();
end

function tStage01_2.NpcTalk()
	if GetMissionV(this.mv_22) ~= 0 then
		return 0;
	end
	local self = tStage01_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local nXyIdx = TY_FindNpc(tNpcs.xy[2]);
	
	local tContent = {
		{
			{nYzbIdx, "Nghe LiÔu Tèng V©n nãi, v­ît qua Ph¹n Thiªn L©m, lµ cã thÓ ®Õn th¼ng Th¸i NhÊt Th¸p råi, chóng ta h·y nhanh ch©n lªn nµo!"},
			{nMgyIdx, "Tông Th­¬ng Phñ… ch¼ng lÏ ®©y chÝnh lµ ®Ö nhÊt cao thñ cña Liªu quèc-Ngäc Tu La Tiªu DÞch?"},
			{nXyIdx, "Ng­êi Tèng kia, ng­¬i biÕt Tông Th­¬ng cña ta µ? Ha ha, vËy lµ cã trß vui råi!"},
			{-1, ""},
		},
		{
			{nYzbIdx, "Râ rµng vâ c«ng cña tªn ng­êi Liªu kia cao h¬n chóng ta rÊt nhiÒu, vËy t¹i sao l¹i tha cho chóng ta chø?"},
			{nMgyIdx, "Tiªu DÞch vèn mang danh lµ B¾c Ph­¬ng NghÜa HiÖp, kh«ng thÝch xen vµo cuéc chiÕn Tèng Liªu. Ch¾c lÇn nµy lµ do phông lÖnh hµnh sù, kh«ng ph¶i muèn lÊy m¹ng cña chóng ta."},
			{nYzbIdx, "Nh©n lóc h¾n ch­a hèi hËn th× chóng ta h·y nhanh chãng rêi khái khu rõng nµy!"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		elseif nParagraph == 1 then	--µÚÒ»¶Î·Ï»°ËµÍê¿ª´ò
			SetMissionV(this.mv_22, 1);
			self:BeginFight();
		end
		
		SetMissionV(this.mv_21, nSentence + 1);
		if nParagraph == getn(tContent) and nSentence == getn(tContent[nParagraph]) then
			self:StagePassed();
		end
	end
end

--Ã¿¸ô10ÃëÏôÒÝÊ©·ÅÈ«ÆµÉËº¦¼¼ÄÜ
function tStage01_2:DoSkill()
	if 1 ~= GetMissionV(this.mv_22) then
		return 0;
	end
	
	local nXyIdx = TY_FindNpc(tNpcs.xy[2]);
	if 0 == nXyIdx then return end
	local _, x, y = GetNpcWorldPos(nXyIdx);
	local tPlayerIndex = TY_FindRandomPlayer({x, y}, 8);
	local nOldPlayerIdx = PlayerIndex;
	CastState2Npc(nXyIdx, "state_attack_trans", 50, 10*18);
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		for i = 1, getn(tPlayerIndex) do
			PlayerIndex = tPlayerIndex[i];
			DoSkill2Target(nXyIdx, 1763, 2, PIdx2NpcIdx(PlayerIndex));
		end
	else
		for i = 1, getn(tPlayerIndex) do
			PlayerIndex = tPlayerIndex[i];
			DoSkill2Target(nXyIdx, 1763, 1, PIdx2NpcIdx(PlayerIndex));
		end
	end
	PlayerIndex = nOldPlayerIdx;
end

function tStage01_2:OnNpcDeath(event, data)
	local self = tStage01_2;
	local szName = GetNpcName(data[1]);
	RemoveNpc(data[1]);
	if tNpcs.xlsy[2] == szName then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 1);
		if GetMissionV(this.mv_25) > 0 then return 0; end
		local nXyIdx = TY_FindNpc(tNpcs.xy[2]);
		RemoveStateFromNpc(nXyIdx, 10001);
		RemoveStateFromNpc(nXyIdx, 10002);
		RemoveStateFromNpc(nXyIdx, 10003);
		SetNpcLifeTime(data[1], 0);
		SetCurrentNpcSFX(nXyIdx, 0, 1, 1);
	elseif tNpcs.xy[2] == szName then
		local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
		local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
		TY_SetNpcType2Talk(nMgyIdx);
		TY_SetNpcType2Talk(nYzbIdx);
		SetMissionV(this.mv_20, 2);	--¿ªÊ¼µÚ¶þ¶Î¶Ô»°
		SetMissionV(this.mv_21, 1);
		SetMissionV(this.mv_22, 0);
		SetMissionV(this.mv_26, 1);	--¹ý¹Ø
	end
end

function tStage01_2:OnPlayerDeath(event, data)
	local self = tStage01_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage01_2:onTimeout()
	local self = tStage01_2;
	if 1 == GetMissionV(this.mv_26) then
		self:StagePassed();
		return 0;
	end
	TY_RecordDamagePoint()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	TY_GoToStage(self, self.father, 1);
end

tStage01_2 = inherit(cycPhase, tStage01_2);

tStage01_2.actions = {
	[1] = tStage01_2.Init,
};

tStage01_2.cycActions = {
	[2] = {
		[0] = {tStage01_2.NpcTalk, tStage01_2.CheckBlood, },
	},
	[10] = {
		[0] = {tStage01_2.DoSkill},
	},
};

tStage01_2.triggers = {
	NpcDeath = {
		{action = tStage01_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage01_2.OnPlayerDeath},
	},
};

--È¼¼ÅÖ®éä-½áÊøÇø
----------------------------------------------------------------
tStage01_3 = {
	name = "Nhiªn TÞch Chi Th­¬ng-Khu kÕt thóc",
	nStageId = TOTAL_STAGE + tStage01.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "Nhiªn TÞch Chi Th­¬ng-Khu kÕt thóc",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage01_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[1][2]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[1][2]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
end

function tStage01_3.GoToStage02()
	local self = tStage01_3;
	TY_StagePassed(self);
	self:onFinish();
end

function tStage01_3:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		local strTab = {
			"Më ¶i 2/#tStage01_3.GoToStage02()",
			"Ta muèn rêi khái ¶i/TY_ConfirmClose",
			"Hñy bá/nothing",
		};
		Say("<color=green>Méc QuÕ Anh<color>: §ång ý vµo ¶i tiÕp theo kh«ng?", getn(strTab), strTab);
	end
end

function tStage01_3.Init()
	local self = tStage01_3;
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage01_3:OnPlayerDeath()
	local self = tStage01_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage01_3:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage01_3 = inherit(cycPhase, tStage01_3);

tStage01_3.actions = {
	[1] = tStage01_3.Init,
};

tStage01_3.triggers = {
	Talk = {
		{action = tStage01_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage01_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage01.phases = {tStage01_1, tStage01_2, tStage01_3};
