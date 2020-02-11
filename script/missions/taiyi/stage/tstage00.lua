--×¼±¸Çø
-----------------------------------------------------------------
tStage00 = {
	name = "Khu chuÈn bÞ",
	nStageId = 0,
	maxsecond = 5 * 60,
	actionsType = "second",
};

function tStage00:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[0][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[0][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	this:Msg2MSAll("§éi tr­ëng vµ Méc QuÕ Anh ®èi tho¹i ®Ó b¾t ®Çu ¶i!");
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("§éi tr­ëng vµ Méc QuÕ Anh ®èi tho¹i ®Ó b¾t ®Çu ¶i!") end);
end

function tStage00.GoToStage01()
	local self = tStage00;
	TY_ClearMapNpc();
	self:onFinish();
end

function tStage00.GoToStage04()
	local self = tStage00;
	TY_ClearMapNpc();
	tPhaseDriver:setPhase(5);
end

function tStage00:NpcMain()
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	
	if tNpcs.mgy_1[2] == szName then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage00.sel_FOREST_HARD then
			tStage00.sel_FOREST_HARD = {
				"Vµo ¶i 1: Nhiªn TÞch Chi Th­¬ng/#tStage00.GoToStage01()",
				"Rêi cöa ¶i/TY_ConfirmClose",
				"KÕt thóc ®èi tho¹i/nothing",
			};
		end
		if not tStage00.sel_FOREST_NORMAL then
			tStage00.sel_FOREST_NORMAL = {
				"Vµo ¶i 1: Nhiªn TÞch Chi Th­¬ng/#tStage00.GoToStage01()",
				"Rêi cöa ¶i/TY_ConfirmClose",
				"KÕt thóc ®èi tho¹i/nothing",
			};
		end
		if not tStage00.sel_TOWER_HARD then
			tStage00.sel_TOWER_HARD = {
				"Vµo ¶i 1: TÞch Tµ Chi HÝ/#tStage00.GoToStage04()",
				"Rêi cöa ¶i/TY_ConfirmClose",
				"KÕt thóc ®èi tho¹i/nothing",
			};
		end
		if not tStage00.sel_TOWER_NORMAL then
			tStage00.sel_TOWER_NORMAL = {
				"Vµo ¶i 1: TÞch Tµ Chi HÝ/#tStage00.GoToStage04()",
				"Rêi cöa ¶i/TY_ConfirmClose",
				"KÕt thóc ®èi tho¹i/nothing",
			};
		end
		if not tStage00.sel then
			tStage00.sel = {
				[1] = {
					[eDifType.NORMAL] = tStage00.sel_FOREST_NORMAL,
					[eDifType.HARD] = tStage00.sel_FOREST_HARD,
				},
				[2] = {
					[eDifType.NORMAL] = tStage00.sel_TOWER_NORMAL,
					[eDifType.HARD] = tStage00.sel_TOWER_HARD,
				},
			};
		end
		local x, y = GetMissionV(this.mv_01), GetMissionV(this.mv_02);
		local strTab = tStage00.sel[x][y];
		Say("<color=green>Méc QuÕ Anh<color>: §ång ý b¾t ®Çu ¶i kh«ng?", getn(strTab), strTab);
	end
end

function tStage00:onTimeout()
	this:Msg2MSAll("§éi tr­ëng thao t¸c qu¸ giê, ¶i ®· ®ãng l¹i.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage00:OnPlayerDeath()
	local self = tStage00;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage00.Init()
	local self = tStage00;
	SetMissionV(MV_STAGE, self.nStageId);
	tStage00:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_ClearTaskID);
	this.msCamp:turnPlayer(0, function() BigDelItem(2, 95, 1510, BigGetItemCount(2, 95, 1510)); end);
end

tStage00 = inherit(cycPhase, tStage00);
tStage00.actions = {
	[1] = tStage00.Init,
};

tStage00.triggers = {
	Talk = {
		{action = tStage00.NpcMain},
	},
	PlayerDeath = {
		{action = tStage00.PlayerDeath},
	},
};
