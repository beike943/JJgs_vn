-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíNPC³ÂÁ¢ºâScript
-- By StarryNight
-- 2005/01/09 PM 15:38

--Å©ÀúÍøÕ¾»µÁË£¬ÒÔºó¿´²»µ½Í¨Ê¤ÁË¡«¡«¡«

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv50\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
--print("nTask_DL_State_50:"..nTask_DL_State_50)
	
	--ÁìÈ¡ÍÁË¾Ååµ¶ÈÎÎñ
	if nTask_DL_State_50 == 1 then
		task_000_00();
		return
	end
	
	--ÒÑ¾­ÁìÈ¡ÍÁË¾Ååµ¶ÈÎÎñ
	if nTask_DL_State_50 == 2 then
		task_001_00();
		return
	end
	
	--ÒÑ¾­Íê³ÉÍÁË¾Ååµ¶ÈÎÎñ»¹Ã»ÓëÃçÁë×å³¤¶Ô»°
	if nTask_DL_State_50 == 3 then
		task_002_00();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Nghe nãi cã vŞ gi¸o sÜ ®Õn tõ Trung Nguyªn, miÖng nãi nh÷ng lêi khã hiÓu! Ta muèn diÖn kiÕn h¾n mét phen!",
		"TrÇn LËp Hoµnh: bala b«l« bili! --(cæ ng÷ §¹i Lı)",
		}
	TalkEx("",strTalk);
	return
	
end;
