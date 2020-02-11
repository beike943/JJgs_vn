Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nPoint = 0;
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == "Thæ d©n" then
		BT_AddBattleEvenPoint(BP_EMPLACEMENT_KILL_NATIVE);
		nPoint = BT_GetBattleEvenPoint(BP_EMPLACEMENT_KILL_NATIVE);
		BT_AddMissionPoint(BT_GetCamp(),nPoint);
		BT_AddBattleActivity(BA_EMPL_KILL_NATIVE);
		SetMissionV(MV_KILL_INDIGENE,GetMissionV(MV_KILL_NATIVE_COUNT)+1);
	elseif sNpcName == "VÖ binh Ph¸o ®µi" then
		BT_AddBattleEvenPoint(BP_EMPLACEMENT_KILL_GUARD);
		nPoint = BT_GetBattleEvenPoint(BP_EMPLACEMENT_KILL_GUARD);
		BT_AddMissionPoint(BT_GetCamp(),nPoint);
		BT_AddBattleActivity(BA_EMPL_KILL_GUARD);
		SetMissionV(MV_KILL_GUARD_COUNT,GetMissionV(MV_KILL_GUARD_COUNT)+1);
		BT_EmperorAward(1);
	end;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
end;