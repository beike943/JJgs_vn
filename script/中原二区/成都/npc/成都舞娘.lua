
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 成都舞娘脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	--活动
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		Say("Mu鑞 thng th鴆 甶謚 m骯 c馻 ta xin i n t鑙 h穣 quay l筰!", getn(WN_201403_DIALOG), WN_201403_DIALOG);
		return
	end	
	
	---------------

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID); 
	
	if (nState==9) then
		task_009();
		return
	end
	
	--已经领取了郑贯之的债款任务
	if nTask_DL_State_60_1 == 1 then
		task_014_11();
		return			
	end;
	
	--未杀死狱火狂人
	if nTask_DL_State_60_1 == 2 then
		task_014_21();
		return			
	end;
		
	--已经杀死狱火狂人
	if nTask_DL_State_60_1 == 3 then
		task_014_31();
		return			
	end;
	
	--已完成郑贯之货款成都舞娘部分
	if nTask_DL_State_60_1 == 4 then
		task_014_41();
		return			
	end;
	
	Talk(1,"","Mu鑞 thng th鴆 甶謚 m骯 c馻 ta xin i n t鑙 h穣 quay l筰!");
	
end;