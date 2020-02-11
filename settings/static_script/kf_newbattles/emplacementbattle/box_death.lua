Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\box_effect_head.lua");
TBOX_FILE = new(KTabFile, "\\settings\\newbattles\\emplacementbattle\\box.txt")

function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	SetNpcLifeTime(npcIndex,0);
	SetMissionV(MV_KILL_BOX_COUNT,GetMissionV(MV_KILL_BOX_COUNT)+1);
	BT_AddBattleActivity(BA_EMPL_OPEN_BOX);
	Do_Box_Effect(TBOX_FILE);
end
