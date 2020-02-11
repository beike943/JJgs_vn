Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\define.lua")
--Include("\\script\\lib\\globalfunctions.lua")
--需要特殊处理的每周清理工作往这里加
--内部机制已经实现在需要的时候自动调用这个脚本
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")

function OnWeeklyDoSpecial()
	--通天和万剑冢(已完成任务才清0)
	if tGtTask:check_cur_task(84) == 0 then
		SetTask(VET_TDD_WEEK_TASK_CROSS,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,2,0,4);
	end	
	if tGtTask:check_cur_task(86) == 0 then
		SetTask(VET_WJZ_WEEK_TASK_CROSS,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,4,0,4);
	end	
	if tGtTask:check_cur_task(88) == 0 then
		SetTask(VET_WEEK_TASK_FANPAI,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,6,0,4);
	end
	
	--3v3每周要干的事
	SetTask(TASKID_3V3_LASTWEEK_FIGHT_TIMES, GetTask(TASKID_3V3_WEEK_FIGHT_TIMES)); --本周战况变成上周
	SetTask(TASKID_3V3_WEEK_FIGHT_TIMES, 0); --本周战况清零
	if GetTask(TASKID_3V3_LASTWEEK_FIGHT_TIMES) ~= 0 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 1, 1); --上周奖励可领取
	end
	
	SetTask(3198,0)--equip shop weekly limit
	SetTask(3199,0)--equip shop weekly limit
	
	--帮派烤肉
	tf_ResetTask_Weekly();
	
	--帮派大乱斗，战旗领奖标记周清
	tm_WeeklyClear();
	
	--武林功勋每周衰减
	merit_WeeklyDecay();
end