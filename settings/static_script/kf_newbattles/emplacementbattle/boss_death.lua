--boss¿‰œ„¡‚

Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nMapId, nX, nY = GetNpcWorldPos(npcIndex);
	SetNpcLifeTime(npcIndex,0);
	SetMissionV(MV_LENGXL_BOSS_NPXIDX, 0);
	
	BT_AddBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	local nPoint = BT_GetBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	BT_AddMissionPoint(BT_GetCamp(),nPoint);
	BT_AddBattleActivity(BA_EMPL_KILL_EMPL);

	for i=1, 4 do
		local nNpcIndex = CreateNpc("Sa mπc b∂o r≠¨ng","R≠¨ng s∏t kh›", nMapId, nX, nY, 6, 1, 1, 100);
		SetNpcScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\shaqi_box.lua");
		SetNpcLifeTime(nNpcIndex, 3 * 60);
	end;
end