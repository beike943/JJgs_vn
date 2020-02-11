--NPCÄ¬ÈÏ¶Ô»°½Å±¾
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	--»î¶¯
	local tID = {125, 140}
	for i = 1, getn(tID) do
		if g_akct_ShowDialog(tID[i], bTag) then
			return
		end
	end
	
	local tbSay = {};
	Say("<color=green>Th«n tr­ëng: <color>N¨m nay lµ n¨m ®¹i thu!",getn(tbSay),tbSay);
end