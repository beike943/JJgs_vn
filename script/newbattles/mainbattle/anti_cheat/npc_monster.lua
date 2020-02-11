--É±¹Ö
SZ_BF_CHEAT_OP_SCRIPT = "\\script\\newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"
function OnDeath(nNpcIndex)
	local szScript = format("pco_on_task_npc_talk_or_death(%d)",nNpcIndex)
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
end