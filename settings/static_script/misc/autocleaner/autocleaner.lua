-- autocleaner.lua

Include("\\script\\class\\mem.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\task_id_manage.lua")
Include("\\script\\lib\\time.lua")
Include("\\script\\pop\\daily_clear.lua")

AutoCleanerBase = {
	taskList = {
		1,
	},
	interval = nil,
	taskid_LastDate = nil,
}

function AutoCleanerBase:clean()
	if self:checkDate() == 1 then
		for k, task in self.taskList do
			self:resetTask(task);
		end
	end
end
function AutoCleanerBase:checkDate()
	if not self.interval or not self.taskid_LastDate then return end
	local nDate = self:getDate();
	local nLastDate = GetTask(self.taskid_LastDate);
	if nDate - nLastDate >= self.interval then
		SetTask(self.taskid_LastDate, nDate);
		return 1;
	end
end
function AutoCleanerBase:resetTask(task)
	local taskp = type(task);
	if taskp == "number" then
		SetTask(task, 0);
	elseif taskp == "function" then
		task();
	elseif taskp == "table" then
		SetTask(task[1], task[2]);
	else
		print("[AutoCleanerBase:resetTask] [Error task type] [task=%s]", tostring(task));
	end
end

-------------------------------------------------------
cleaner_TaskMgr = {
	taskList = { 
		{tCamp_2011_DragonBoat, {1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,19,21,}},
		{tCamp_CallBack, {1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9,10,11,12,45,48}},
		{tCamp_GoodWine,{5,6,7}},
		{tCamp_201110,{1,2,3}},
		{tCamp_201111,{1,2,3,4,}},
		{tCamp_Oscar,	{1,2}},
		{tCamp_2012_SF,{5,8,27,28,29,30,49 ,54,56,58,59,60}},
	}
}
function cleaner_TaskMgr.resetTask()
	self = cleaner_TaskMgr
	for i = 1, getn(self.taskList) do
		local camp = self.taskList[i][1];
		if camp:CheckCampDate() == 1 then
			local tasks = self.taskList[i][2];
			if type(tasks) == "number" then
				tasks = {tasks};
			end
			for k = 1, getn(tasks) do
				local realTask = camp:getRealTaskId(tasks[k]);
				SetTask(realTask, 0);
			end
		end
	end
end

AutoCleanerDaily = {
	interval = 1,
	taskid_LastDate = TASKID_AUTOCLEANER_LASTDATE_DAILY,
	taskList = {
		TASKID_0911_KILL_BOSS,
		TASKID_LIANGSHAN_AWARD_TIMES_DAILY,
		TASKID_WHITE_TIGER_BLESS_DAILY,
		TASKID_TIGER_BLESS_DAILY,
		TASKID_2010_PCB_DAILAY_FINISH_FLAG,
		TASKID_2010_PCB_DAILY_TASK_FLAG_1,
		TASKID_2010_PCB_DAILY_TASK_FLAG_2,
		TASKID_DIXUANGONG_DAILY_BOSS1,
		TASKID_DIXUANGONG_DAILY_BOSS2,
		TASKID_DIXUANGONG_DAILY_BOSS3,
		TASK_GT_GET_FRIENDLY_DAILY,
		TASK_MJ_OPEN_PACKAGE,
		TASKID_QIFU_TITLE_NUM,
		TASKID_WULIN_CRAFT_VOTE_DAILY,
		TASKID_WULIN_CRAFT_VOTE_TOTAL,
		TASKID_WUCAISHENGQI_TIMES,
		TASKID_2010_FIFA_FLAG_DAILY,
		TASKID_DXG_DAILY_TASK,
		TASKID_NORMAL_VOTE_DAILY,
		TASKID_QIXI_NPC_GETMEIGUI,
		TASKID_QIXI_NPC_GETDAILY,
		TASKID_QIXI_NPC_KILLBOSS,
		TASKID_QIXI_NPC_KILLAWARD,
		TASKID_3F_GET_TUZHI,
		TASKID_3F_ZQ_BOX_NUM,
		TASKID_3F_CHANGE_EXP_NUM,
		TASKID_MAIL_SEND_COUNT,
		TASK_FIELD_PVP_CAR_TASK,
		TASK_FIELD_PVP_CAR_DAILY_NUM,
		TASK_FIELD_PVP_CAR_BIAOLING,
		TASK_JZMY_DAYLY_FINISH,
		cleaner_TaskMgr.resetTask,		-- 清理任务管理器里面的变量
		OnPopDailyClear,						-- 清理声望任务
		TASKID_NVN_WIN_TIMES_DAILY,
		TASKID_NVN_LOSS_TIMES_DAILY,
		TASKID_NVN_AWARD_DAILY1,
		TASKID_NVN_AWARD_DAILY2,
		TASKID_NVN_AWARD_DAILY3,
		TASK_FIELD_PVP_FIREBOX_NUM,
		TASKID_SF_LMJS_TITLE_EXP_COUNT,
	},
}
AutoCleanerDaily = inherit(AutoCleanerBase, AutoCleanerDaily)
function AutoCleanerDaily:getDate()
	return tonumber(date("%y%m%d"));
end

-------------------------------------------------------
AutoCleanerWeekly = {
	interval = 1,
	taskid_LastDate = TASKID_AUTOCLEANER_LASTDATE_WEEKLY,
	taskList = {
		TASK_GT_WEEK_FINISH_NUM,
		TASK_FIELD_PVP_GXD_WARD,
	},
}
AutoCleanerWeekly = inherit(AutoCleanerBase, AutoCleanerWeekly)
function AutoCleanerWeekly:getDate()
	return tf_GetWeekSequence(1,0);
end

-------------------------------------------------------
AutoCleanerCommittee = {
	cleaners = {
		AutoCleanerDaily,
		AutoCleanerWeekly,
	}
}
function AutoCleanerCommittee:clean()
	for k,cleaner in self.cleaners do
		cleaner:clean();
	end
end

-------------------------------------------------------
