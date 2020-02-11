-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíNPC´óÀí¶ş»Ê×ÓScript
-- By StarryNight
-- 2005/01/09 PM 15:38

--Å©ÀúÍøÕ¾»µÁË£¬ÒÔºó¿´²»µ½Í¨Ê¤ÁË¡«¡«¡«

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv80\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>§oµn Tè ThuËn<color> : "
function main()
	selTab =
	{ 
		"NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/trans_talk_35",
		"Ta chØ ghĞ qua/no_thing"
	}
	Say("<color=green>NhŞ Hoµng Tö<color>".." NhiÖm vô tiªu diÖt hån ma L·nh H­¬ng L¨ng!",getn(selTab),selTab);
	
local nTask_DL_State_80 = GetTask(TASK_DL_LV80_ID);
--print("nTask_DL_State_80:"..nTask_DL_State_80)
	
	--´ò°Ü¶Î³Ğ¶÷ºóÓë¶ş»Ê×Ó¶Ô»°
	if nTask_DL_State_80 == 2 then
		task_000_00();
		return
	end
	
--	local strTalk = {
--		"§¸ng ghĞt! Cßn ph¶i ë n¬i quû ¸m nµy bao l©u n÷a!",
--		}
--	TalkEx("",strTalk); 
	return
end

function no_thing()
end