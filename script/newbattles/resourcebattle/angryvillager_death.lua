Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetNpcDeathScript(npcIndex,"");
	AddItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],3);
	Msg2Player("Bπn nhÀn Æ≠Óc 3 ph«n "..tBattleItem[3][1]);
end;