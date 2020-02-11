Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	BT_EmperorAward(5);
	SetNpcLifeTime(npcIndex,0);
	BT_AddBattleEvenPoint(BP_EMPLACEMENT_KILL_EMPLACEMENT);
	local nPoint = BT_GetBattleEvenPoint(BP_EMPLACEMENT_KILL_EMPLACEMENT);
	BT_AddMissionPoint(BT_GetCamp(),nPoint);
	BT_AddBattleActivity(BA_EMPL_KILL_EMPL);
	BT_SetData(PT_KILL_EMPLACEMENT,BT_GetData(PT_KILL_EMPLACEMENT)+1);
	local nCamp = BT_GetCamp();
	local nEnemyCamp = 3-nCamp;
	local nCurTime = GetTime();
	if GetMissionV(MV_TAKE_TIME_SONG+nCamp-1) == 0 then	--如果目前没有占领炮台
		SetMissionV(MV_TAKE_TIME_SONG+nCamp-1,nCurTime);
		if GetMissionV(MV_TAKE_TIME_SONG+nEnemyCamp-1) ~= 0 then	--如果是敌方之前占领了炮台
			local nOccupyTime = nCurTime - GetMissionV(MV_TAKE_TIME_SONG+nEnemyCamp-1);
			SetMissionV(MV_OCCUPY_TIME_SONG+nEnemyCamp-1,GetMissionV(MV_OCCUPY_TIME_SONG+nEnemyCamp-1)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_SONG+nEnemyCamp-1,0);
		end;
	end;
	Create_Emplacement(nCamp);
end;