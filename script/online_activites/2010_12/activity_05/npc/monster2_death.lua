Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");

function OnDeath(npcIdx)
	SB_HandleExp(300000, 4);
	SB_OnMonsterDied();
	SetNpcLifeTime(npcIdx, 0);
end