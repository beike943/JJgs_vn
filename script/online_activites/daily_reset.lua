Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\online_activites\\trigger_IDs.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");
Include("\\script\\online_activites\\2010_11\\activity_03\\head.lua"); --gather activity

--扩充该文件用途，用于活动的每天要重置的TaskID，详见下面文件注释
Include("\\script\\online_activites\\daily_taskids_reset.lua");

DR_DailyResetTaskID = VET_201011_CM_TASK_LAST_DAILY_RESET_TIME;
DR_ResetTriggerIndexTaskID = VET_201011_CM_TASK_TEMP_TRIGGER_INDEX;

function DR_OnPlayerLogin()
	--WriteLog("DR_OnPlayerLogin::called");
	local curDate = tonumber(date("%y%m%d"));
	local lastDailyResetDate = GetTask(DR_DailyResetTaskID);
	--WriteLog("DR_OnPlayerLogin::curDate: "..curDate..", lastDailyResetDate: "..lastDailyResetDate);
	if curDate ~= lastDailyResetDate then
		DR_DailyReset()
	end
	local triggerIndex = CreateTrigger(1, 1505, TD_DAILY_RESET_TRIGGER_ID);
	if 0 < triggerIndex then
			--WriteLog("DR_OnPlayerLogin::triggerIndex: "..triggerIndex);
			SetTaskTemp(DR_ResetTriggerIndexTaskID, triggerIndex);
			SetTimerType(triggerIndex, 0);
			SetTimerCount(triggerIndex, 60);
			ContinueTimer(triggerIndex);	
	else
		WriteLog("DR_OnPlayerLogin::warning: failed to create reset trigger");
	end
end

function DR_OnTimer()
	--WriteLog("DR_OnTimer::called");
	local curHour = tonumber(date("%H"));
	local curMinute = tonumber(date("%M"));
	local curDate = tonumber(date("%y%m%d"));
	--check during 0:0-0:10 to avoid trivial system time modification by SunZhuoshi
	if 0 == curHour and 10 > curMinute then
		local lastDailyResetData = GetTask(DR_DailyResetTaskID);
		if curDate ~= lastDailyResetDate then
			DR_OnDailyReset();
		end
	end
end

function DR_DailyReset()
	--WriteLog("DR_DailyReset::called");
	SetTask(DR_DailyResetTaskID, tonumber(date("%y%m%d")));
	DR_OnDailyReset();
    VET_reset_activity_taskIDs()
end

function DR_OnDailyReset()
	HBDayBegin();
	GT_dayBegin();
    VET_reset_activity_taskIDs()
end

--扩充该文件用途，用于今后所有活动的每天要重置的TaskID，详见\script\online_activites\daily_taskids_reset.lua
function VET_reset_activity_taskIDs()
    local nNum;
    for nNum = 1, getn(VET_TB_DAILY_RESET_TASKID) do
        if VET_TB_DAILY_RESET_TASKID[nNum] ~= nil then
            SetTask(VET_TB_DAILY_RESET_TASKID[nNum], 0);
        end
    end
end
