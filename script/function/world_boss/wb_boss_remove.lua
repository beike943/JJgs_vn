--世界BOSS移除时脚本
Include("\\script\\function\\world_boss\\wb_head.lua")

function OnRemove(id, npcName)
	local nIndex = wb_MatchNpc(tostring(npcName))
	if nIndex == -1 then
		return
	end
	local msg = format("Sau m閠 h錳 chi課 u k辌h li謙, xu蕋 hi謓 t筰 %s-%s  ch箉 tho竧!", WB_WORLD_BOSS_MAP[nIndex], npcName);
	Msg2Global(msg)
	AddLocalNews(msg)
end