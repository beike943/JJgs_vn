-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 翠烟门NPC彩凤儿Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- 直面自己的内心吧！

-- ======================================================
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
		if g_akct_GetTaskStep(bTag) then
			return
		end
	
		local t_dialog = {
			"<color=green>扈敏<color>: 翠烟刚进入中原，吸引了很多有才华的人士加入，热闹非凡.",
			"<color=green>扈敏<color>: 翠烟门风光旖旅，景色迷人，是个练习舞蹈，喂养小貂的好地方。.",
			}
		Talk(1,"",t_dialog[random(getn(t_dialog))])
end;		
