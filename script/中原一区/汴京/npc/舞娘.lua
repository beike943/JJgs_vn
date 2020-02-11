
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ³É¶¼ÎèÄï½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID); 
	--print("nTask_DL_State_60_2:"..nTask_DL_State_60_2);
	
	if (nState==9) then
		task_009();
		return
	end
	
	--Î´ÁìÈ¡ÊÕ¼¯ÑªÑ»ÓğÈÎÎñ
	if nTask_DL_State_60_2 == 1 then
		task_014_12();
		return
	end
	
	--ÒÑ¾­ÁìÈ¡ÊÕ¼¯ÑªÑ»ÓğÈÎÎñ
	if nTask_DL_State_60_2 == 2 then
		task_014_22();
		return
	end
	
	--ÒÑ¾­Íê³Éãê¾©ÎèÄïÈÎÎñ
	if nTask_DL_State_60_2 == 3 then
		task_014_32();
		return
	end	
	
	Talk(1,"","Nh×n b»ng h÷u, biÕt ngay lµ ng­êi sèng cã nghÜa cã t×nh!");
	
end;