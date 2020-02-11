
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¾ÆÂ¥ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
szNpcName = "<color=green>Chñ töu lÇu<color>: "

Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv58\\task_main.lua");
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")
function main()
	if GetWorldPos() == 200 then
		if GetTaskTrans() == 2 then		
			trans_talk_04()
			return
		end
	end
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==12) then
		task_012_00();
		return
	end
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,374) < 1 then
		--¸úãê¾©¾ÆÂ¥ÀÏ°åÂòÀğÓã±ºÃæ             
		buy_gift_talk(1);
		return
	end
	local sal_num = 97
	if dragon_boat_08_time_chk() ~= 1 then
		sal_num = 98
	end
	local tSel = {
--		"ÎÒÂòĞ©ôÕ×Ó²ÄÁÏ/#Sale("..sal_num..")",
		"Ta chØ ®i ngang th«i/end_dialog"
	}
	Say("<color=green>Chñ Töu lÇu<color>: R­îu vµ thøc ¨n ë chç ta rÊt ngon, cßn cã nguyªn liÖu lµm b¸nh İt n÷a, kh¸ch quan cã muèn ghĞ qua kh«ng?",
		getn(tSel), tSel)
end

