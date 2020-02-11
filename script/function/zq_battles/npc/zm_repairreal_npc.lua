--¾°ÃÅ·âÓ¡npc
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if gf_GetTaskBit(ZQ_BATTLE_TASK11, 17) ~= 1 then
		return 0;
	end
	if GetTrigger(1523 * 2) ~= 0 and gf_GetTaskBit(ZQ_BATTLE_TASK6, 16) == 1 then
		ZQ_RepairReal_NpcTalk(GetTargetNpc());
	else
		Talk(1,"","Cã thÓ nhËn ®­îc nhiÒu th«ng tin h¬n t¹i <color=green>C¶nh M«n TrËn Linh<color>");
	end
end