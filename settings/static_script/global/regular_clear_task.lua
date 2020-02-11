Include("\\script\\task_access_code_def.lua")

--还有一个CheckAndDoRegularClear(nType)程序lua接口也是可以供逻辑调用的，用来刷新定期清理的数据
--与程序EM_REGULAR_CLEAR_TYPE匹配
_EM_REGULAR_CLEAR_TYPE_NONE = 0
_EM_REGULAR_CLEAR_TYPE_ALL = _EM_REGULAR_CLEAR_TYPE_NONE
EM_REGULAR_CLEAR_TYPE_DAILY = 1
EM_REGULAR_CLEAR_TYPE_WEEKLY = 2
_EM_REGULAR_CLEAR_TYPE_COUNT = 3

-----------------------------------------------------------------------
--提供给脚本的实时定期清理接口,用这些接口取得的任务变量，是会定期清理的
function rc_GetDailyTask(nIndex)--与程序GetDailyTask(nIndex)功能完全一致
	local nType = EM_REGULAR_CLEAR_TYPE_DAILY
	return _rc_GetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nType)
end

function rc_SetDailyTask(nIndex, nValue)--与程序SetDailyTask(nIndex, nValue)功能完全一致
	local nType = EM_REGULAR_CLEAR_TYPE_DAILY
	return _rc_SetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nValue, nType)
end

function rc_GetWeeklyTask(nIndex)
	local nType = EM_REGULAR_CLEAR_TYPE_WEEKLY
	return _rc_GetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nType)
end

function rc_SetWeeklyTask(nIndex, nValue)
	local nType = EM_REGULAR_CLEAR_TYPE_WEEKLY
	return _rc_SetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nValue, nType)
end
-----------------------------------------------------------------------


function _rc_GetRegularClearTaskFromGroup(tGroup, nIndex, nType)
	if not tGroup then
		assert(1==0)
		return
	end
	CheckAndDoRegularClear(nType)
	if nIndex >= 1 and nIndex <= getn(tGroup) then
		return GetTask(tGroup[nIndex][1])
	else
		--print(format("_rc_GetRegularClearTaskFromGroup(nIndex=%d, nType=%d) max=%d, nIndex invalid", nIndex, nType, getn(tGroup)))
		return 0
	end
end

function _rc_SetRegularClearTaskFromGroup(tGroup, nIndex, nValue, nType)
	if not tGroup then
		assert(1==0)
		return
	end
	CheckAndDoRegularClear(nType)
	if nIndex >= 1 and nIndex <= getn(tGroup) then
		return SetTask(tGroup[nIndex][1], nValue, tGroup[nIndex][2])
	else
		--print(format("_rc_SetRegularClearTaskFromGroup(nIndex=%d, nValue = %d, nType=%d) max=%d, nIndex invalid", nIndex, nValue, nType, getn(tGroup)))
		return 0
	end
end
-----------------------------------------------------------------------


-----------------------------------------------------------------------
--内部的一些数据定义
--每日清理的任务变量组
_t_DailyClearTaskIdGroup =
{
	{2914, TASK_ACCESS_CODE_DAILY_TASK},
	{2915, TASK_ACCESS_CODE_DAILY_TASK},
	{2916, TASK_ACCESS_CODE_DAILY_TASK},
	{2917, TASK_ACCESS_CODE_DAILY_TASK},
	{2918, TASK_ACCESS_CODE_DAILY_TASK},
	{2919, TASK_ACCESS_CODE_DAILY_TASK},
}

--每周清理的任务变量组
_t_WeeklyClearTaskIdGroup =
{
    {3082, TASK_ACCESS_CODE_DAILY_TASK},
    {3083, TASK_ACCESS_CODE_DAILY_TASK},
    {3084, TASK_ACCESS_CODE_DAILY_TASK},
    {3085, TASK_ACCESS_CODE_DAILY_TASK},
    {3086, TASK_ACCESS_CODE_DAILY_TASK},
}

--每月清理的任务变量组
_t_MonthClearTaskIdGroup =
{
	{3230, TASK_ACCESS_CODE_DAILY_REGISTRATION},
}

t_RegularClearTaskGroups = 
{
	_t_DailyClearTaskIdGroup,
	_t_WeeklyClearTaskIdGroup,
}

--目标表构造完整 这两个表没用了
_t_DailyClearTaskIdGroup = nil
_t_WeeklyClearTaskIdGroup = nil
-----------------------------------------------------------------------