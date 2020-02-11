Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");
--ÌìÉ½Ñ©Ñý
function OnDeath(npcIdx)
	ModifyExp(15000000);
	AwardGenuineQi(200);
	SB_OnBossDied();
	SetNpcLifeTime(npcIdx, 0);
end