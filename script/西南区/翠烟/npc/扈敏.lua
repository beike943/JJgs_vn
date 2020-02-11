-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´äÑÌÃÅNPC²Ê·ï¶ùScript
-- By StarryNight
-- 2006/03/22 PM 17:20

-- Ö±Ãæ×Ô¼ºµÄÄÚĞÄ°É£¡

-- ======================================================
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
		if g_akct_GetTaskStep(bTag) then
			return
		end
	
		local t_dialog = {
			"<color=green>Hé MÉn<color>: Thóy Yªn M«n võa vµo Trung Nguyªn ®· thu hót rÊt nhiÒu nh©n tµi gia nhËp, v« cïng n¸o nhiÖt.",
			"<color=green>Hé MÉn<color>: Thóy Yªn M«n c¶nh s¾c mª ng­êi, lµ n¬i tèt ®Ó häc móa, nu«i TiÓu §iªu.",
			}
		Talk(1,"",t_dialog[random(getn(t_dialog))])
end;		
