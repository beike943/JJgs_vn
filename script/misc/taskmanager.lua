Include("\\script\\lib\\globalfunctions.lua")

local TaskGroup = {}
TaskManager = {}
TaskManager.tbUseGroup = {}
TaskManager.tbTaskGroup = 
{
	[1] = 
	{
		-- date:2011-02-25 00:00~2011-03-28 00:00	2月活动
		-- date:2011-03-12 00:00~2011-04-30 00:00	雄王祭祖活动
		-- date:2011-06-15 00:00~2011-07-11 00:00	2011summer holiday
		-- date:2011-07-15 00:00~2011-08-21 00:00	7月夏日雪糕活动
		-- date:2011-08-26 00:00~2011-10-03 00:00	8月中秋月饼
		-- date:2011-10-07 00:00~2011-11-06 00:00	10月活动
		-- date:2011-11-11 00:00~2011-12-13 00:00	11月献花活动
		-- date:2011-12-30 00:00~2012-01-08 00:00	元旦活动
		-- date:2012-02-10 00:00~2012-03-05 00:00	2月情人节活动
		-- date:2012-06-15 00:00~2012-07-16 00:00 6月上交水果活动
		-- date:2012-10-26 00:00~2012-11-12 00:00 追回大字帖活动 --具体时间参见\script\online\dazitie\dzt_head.lua
		-- date:2013-02-14 00:00~2013-02-28 00:00 2013年情人节活动
		-- date:2013-05-17 00:00~2013-06-15 00:00 神散丹活动
		-- date:2013-10-05 00:00~2013-10-18 00:00 重开千寻塔活动 --时间以\script\online\qianhe_tower\qht_head.lua设置为准
		-- date:2014-02-13 00:00~2014-02-16 00:00 2014年1月副活动3
		-- date:2014-04-18 00:00~2014-05-12 00:00 2014年4月活动
		-- 邀请码活动时间参看\script\function\invite_code\ic_define.lua
		-- date:2014-09-22 00:00~2014-09-29 00:00 黑道具补偿活动
		nCurrentVersion = 18,
		nVersionTask = 2761,
		tbTaskSet = {2762,2763,2764,2765,2766,2767,2768,2769,2770,2771},
	},
	[2] = 
	{
		-- date:2011-02-25 00:00~2011-03-28 00:00	2月活动
		-- date:2011-03-12 00:00~2011-04-30 00:00	雄王祭祖活动
		-- date:2011-07-15 00:00~2011-08-21 00:00	7月夏日色彩
		-- date:2011-08-26 00:00~2011-10-03 00:00	8月烤月饼
		-- date:2011-10-07 00:00~2011-11-06 00:00	夏日色彩
		-- date:2011-11-11 00:00~2011-12-13 00:00	送花活动
		-- date:2011-12-30 00:00~2012-01-08 00:00	圣诞节活动
		-- date:2012-03-09 00:00~2012-04-09 00:00	国际妇女节
		-- date:2012-07-20 00:00~2012-08-13 00:00	青海活动
		-- date:2012-11-16 00:00~2012-12-17 00:00	教师节活动
		-- date:2013-03-08 00:00~2013-04-15 00:00	国际妇女节活动
		-- date:2013-06-14 00:00~2013-07-15 00:00	月亮礼会
		-- date:2013-10-18 00:00~2013-11-11 00:00	10月主活动
		-- date:2014-01-30 00:00~2014-02-07 00:00	2014年1月副活动4
		-- date:2014-04-18 00:00~2014-05-12 00:00	2014年4月副活动
		-- date:2014-07-04 00:00~2014-08-01 00:00	2014年7月活动
		-- date:2014-10-04 00:00~2014-11-01 00:00	2014年10月活动
		nCurrentVersion = 17,
		nVersionTask = 2781,
		tbTaskSet = {2782,2783,2784,2785,2786,2787,2788,2789,2790,2791},
	},
	[3] = 
	{
		-- date:2011-04-22 00:00~2011-05-30 00:00 解放日纪念活动
		-- date:2011-08-26 00:00~2011-10-03 00:00 8月灯会活动
		-- date:2011-11-11 00:00~2011-12-13 00:00 教师节活动
		-- date:2011-12-30 00:00~2012-01-08 00:00 圣诞节副活动
		-- date:2012-03-12 00:00~2012-04-09 00:00	国际妇女节
		-- date:2012-07-20 00:00~2012-08-13 00:00	海边宴席活动
		-- date:2012-11-16 00:00~2012-12-17 00:00	教师节副活动
		-- date:2013-06-14 00:00~2013-07-15 00:00	国际儿童节
		-- date:2013-10-18 00:00~2013-11-11 00:00	10月副活动
		-- date:2014-01-31 00:00~2014-01-15 00:00	中方春节活动\script\online\spring2014\sp_define.lua
		-- date:2014-04-18 00:00~2014-05-12 00:00	2014年4月副活动1
		-- date:2014-07-04 00:00~2014-08-01 00:00	2014年7月副活动
		-- 邀请码活动时间参看\script\function\invite_code\ic_define.lua
		nCurrentVersion = 14,
		nVersionTask = 2801,
		tbTaskSet = {2802,2803,2804,2805,2806,2807,2808,2809,2810,2811},
	},
	[4] = 
	{
		-- date:2011-08-26 00:00~2011-10-03 00:00 8月灯会活动-奖励
		-- date:2011-11-11 00:00~2011-12-13 00:00 种花活动
		-- date:2011-12-30 00:00~2012-01-08 00:00 圣诞节送礼活动
		-- date:2012-04-13 00:00~2012-05-06 00:00 开宴待军活动
		-- date:2012-08-17 00:00~2012-09-10 00:00 孟兰报孝活动
		-- date:2012-12-21 00:00~2013-01-21 00:00 圣诞活动
		-- date:2013-04-19 00:00~2013-05-13 00:00 劳动节活动
		-- date:2013-07-19 00:00~2013-08-19 00:00 7月活动
		-- date:2013-11-15 00:00~2013-12-16 00:00	11月主活动
		-- date:2014-02-21 00:00~2014-03-17 00:00	2014年2月活动
		-- date:2014-04-18 00:00~2014-05-12 00:00	2014年4月副活动2
		--CDKey活动\script\function\cdkey\ck_define.lua
		nCurrentVersion = 13,
		nVersionTask = 2821,
		tbTaskSet = {2822,2823,2824,2825,2826,2827,2828,2829,2830,2831},
	},
	[5] = 
	{
		-- date:2011-12-30 00:00~2012-01-08 00:00 装饰圣诞树活动
		-- date:2012-04-13 00:00~2012-05-06 00:00 共力活动
		-- date:2012-08-17 00:00~2012-09-10 00:00 素食盘活动
		-- date:2012-12-21 00:00~2013-01-21 00:00 圣诞副活动
		-- date:2013-04-19 00:00~2013-05-13 00:00 后防稳重活动
		-- date:2013-07-19 00:00~2013-08-19 00:00 7月副活动
		-- date:2013-11-15 00:00~2013-12-16 00:00	11月副活动
		-- date:2014-02-21 00:00~2014-03-21 00:00	2014年2月副活动1
		-- date:2014-05-09 00:00~2014-06-01 00:00	2014年5月活动
		-- date:2014-08-08 00:00~2014-09-01 00:00	2014年8月活动
		-- date:2014-10-05 00:00~2014-11-01 00:00	2014年10月副活动
		nCurrentVersion = 11,
		nVersionTask = 2841,
		tbTaskSet = {2842,2843,2844,2845,2846,2847,2848,2849,2850,2851},
	},
	[6] = 
	{
		-- date:2012-01-13 00:00~2012-02-20 00:00 春节活动
		-- date:2012-04-13 00:00~2012-05-06 00:00 馈赠活动
		-- date:2012-09-14 00:00~2012-10-08 00:00 中秋节活动
		-- date:2012-12-21 00:00~2013-01-21 00:00 坐骑活动
		-- date:2013-xx-xx 00:00~2013-xx-xx 00:00 新门派收集卡牌活动
		-- date:2013-08-23 00:00~2013-09-16 00:00 8月活动
		-- date:2013-12-20 00:00~2014-01-13 00:00	12月主活动
		-- date:2014-02-21 00:00~2014-03-21 00:00	2014年2月副活动2
		-- date:2014-05-09 00:00~2014-06-01 00:00	2014年5月副活动
		-- date:2014-08-08 00:00~2014-09-01 00:00	2014年8月副活动
		-- date:2014-10-04 00:00~2014-11-01 00:00	2014年10月副活动
		nCurrentVersion = 11,
		nVersionTask = 2772,
		tbTaskSet = {2777,2778,2779,2780,2792,2793,2794,2795,2796,2797},
	},
	[7] = 
	{
		-- date:2012-01-23 00:00~2012-02-02 00:00 新年利利是是活动
		-- date:2012-05-11 00:00~2012-06-11 00:00 清凉暑假活动
		-- date:2012-09-14 00:00~2012-10-08 00:00 中秋节副活动
		-- date:2012-12-21 00:00~2013-01-21 00:00 圣诞树活动
		-- date:2013-05-17 00:00~2013-06-10 00:00 夏日清凉活动
		-- date:2013-08-23 00:00~2013-09-16 00:00 8月副活动
		-- date:2013-12-20 00:00~2014-01-13 00:00	12月副活动
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014年3月活动
		-- date:2014-05-09 00:00~2014-06-01 00:00	2014年5月副活动
		-- date:2014-08-22 00:00~2014-09-08 00:00 千寻塔活动 --时间以\script\online\qianhe_tower\qht_head.lua设置为准
		-- date:2014-11-07 00:00~2014-12-01 00:00	2014年11月活动
		nCurrentVersion = 10,
		nVersionTask = 2773,
		tbTaskSet = {2798,2799,2800,2812,2813,2814,2815,2816,2817,2818},
	},
	[8] = 
	{
		-- date:2012-02-10 00:00~2012-02-20 00:00 情人节活动
		-- date:2012-05-11 00:00~2012-06-11 00:00 畅快暑假活动
		-- date:2012-09-14 00:00~2012-10-08 00:00 千寻塔活动 --时间以\script\online\qianhe_tower\qht_head.lua设置为准
		-- date:2012-12-21 00:00~2013-01-21 00:00 小如意活动
		-- date:2013-05-17 00:00~2013-06-10 00:00 五月玫瑰
		-- date:2013-09-19 00:00~2013-10-13 00:00 9月主活动
		-- date:2014-01-17 00:00~2014-02-17 00:00 2014年1月主活动
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014年3月副活动
		-- date:2014-06-06 00:00~2014-07-01 00:00	2014年6月活动
		-- date:2014-09-05 00:00~2014-10-01 00:00 2014年9月活动
		-- date:2014-11-07 00:00~2014-12-01 00:00	2014年11月副活动
		nCurrentVersion = 11,
		nVersionTask = 2774,
		tbTaskSet = {2819,2820,2832,2833,2834,2835,2836,2837,2838,2839},
	},
	[9] = 
	{
		-- date:2012-01-13 00:00~2012-02-02 00:00 新年五盘果活动
		-- date:2012-06-15 00:00~2012-07-16 00:00 6月活动
		-- date:2012-10-12 00:00~2012-11-12 00:00 妇女节活动
		-- date:2013-01-25 00:00~2013-02-25 00:00 春节活动
		-- date:2013-05-17 00:00~2013-06-10 00:00 冰凉冰棒活动
		-- date:2013-09-19 00:00~2013-10-13 00:00 9月副活动
		-- date:2014-01-17 00:00~2014-02-17 00:00 2014年1月副活动1
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014年3月副活动1
		-- date:2014-06-06 00:00~2014-07-01 00:00	2014年6月副活动
		-- date:2014-09-05 00:00~2014-10-01 00:00 2014年9月副活动
		-- date:2014-11-07 00:00~2014-12-01 00:00	2014年11月副活动
		nCurrentVersion = 11,
		nVersionTask = 2775,
		tbTaskSet = {2840,2852,2853,3051,3052,3053,3054,3055,3056,3057},
	},
	[10] = 
	{
		-- date:2012-01-13 00:00~2012-02-20 00:00 春节活动副活动
		-- date:2012-06-15 00:00~2012-07-16 00:00 6月切换奖励活动
		-- date:2012-10-12 00:00~2012-11-12 00:00 妇女节副活动
		-- date:2013-01-25 00:00~2013-02-25 00:00 梅花迎春
		-- date:2013-05-24 00:00~2013-06-14 00:00 冰凉冰棒活动
		-- date:2013-09-19 00:00~2013-10-13 00:00 9月副活动
		-- date:2014-01-25 00:00~2014-02-09 00:00 2014年1月副活动2
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014年3月副活动2
		-- date:2014-06-06 00:00~2014-07-01 00:00	2014年6月副活动
		-- \script\online_activites\201409\huadeng.lua 2014年9月中秋花灯
		nCurrentVersion = 10,
		nVersionTask = 2776,
		tbTaskSet = {3058,3059,3060,3061,3062,3063,3064,3065,3066,3067},
	},
}

--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetTask(nGroupId, nIndex)
	self:ResetTaskGroup(nGroupId)
	return GetTask(self:GetTaskId(nGroupId, nIndex))
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	return SetTask(self:GetTaskId(nGroupId, nIndex), nValue)
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:AddTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex)
	return SetTask(nTaskId, GetTask(nTaskId) + nValue)
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetDailyTask(nGroupId, nIndex)
	self:ResetTaskGroup(nGroupId);
	local nTaskValue =  GetTask(self:GetTaskId(nGroupId, nIndex));
	local nCurDate = tonumber(date("%y%m%d"));
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256;
		SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue);
	end
	return mod(nTaskValue, 256);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetDailyTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId);
	local nCurDate = tonumber(date("%y%m%d"));
	local nTaskValue =  nCurDate * 256;
	return SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue + nValue);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:AddDailyTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId);
	local nTaskValue =  GetTask(self:GetTaskId(nGroupId, nIndex));
	local nCurDate = tonumber(date("%y%m%d"));
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256;
		SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue);
	end
	return SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue + nValue);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetTaskBit(nGroupId, nIndex, nBitPos)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return SafeGetBit(GetTask(nTaskId), nBitPos);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetTaskBit(nGroupId, nIndex, nBitPos, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return SetTask(nTaskId, SafeSetBit(GetTask(nTaskId), nBitPos, nValue));
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetTaskByte(nGroupId, nIndex, nByteIndex)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_GetTaskByte(nTaskId,nByteIndex);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetTaskByte(nGroupId, nIndex, nByteIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_SetTaskByte(nTaskId,nByteIndex,nValue);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetMyTaskByte(nGroupId, nIndex, nByteIndex1, nByteIndex2)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_GetMyTaskByte(nTaskId,nByteIndex1,nByteIndex2);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetMyTaskByte(nGroupId, nIndex, nByteIndex1, nByteIndex2, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_SetMyTaskByte(nTaskId,nByteIndex1,nByteIndex2,nValue)
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetMyTaskBit(nGroupId, nIndex, nBitIndex1, nBitIndex2)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_GetMyTaskBit(nTaskId,nBitIndex1,nBitIndex2);
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetMyTaskBit(nGroupId, nIndex, nBitIndex1, nBitIndex2, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_SetMyTaskBit(nTaskId,nBitIndex1,nBitIndex2,nValue)
end

--获取某组任务变量里的任务变量Id
function TaskManager:GetTaskId(nGroupId, nIndex)

	if type(self:GetGroupTaskTable(nGroupId)[nIndex]) ~= "number" then
		return error(format("tbTaskGroup[%s].tbTaskSet[%s] is not a number", nGroupId, nIndex))
	end
	
	return self.tbTaskGroup[nGroupId].tbTaskSet[nIndex]
end
--获取组当前版本号
function TaskManager:GetCurrentVersion(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nCurrentVersion) ~= "number" then
		return error(format("tbTaskGroup[%s].nCurrentVersion is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nCurrentVersion
end


--获得某组任务变量组的任务变量集合
function TaskManager:GetGroupTaskTable(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	if type(self.tbTaskGroup[nGroupId].tbTaskSet) ~= "table" then
		return error(format("tbTaskGroup[%s].tbTaskSet is not a table", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].tbTaskSet
end




--获得某组任务变量组的版本号任务变量Id
function TaskManager:GetVersionTaskId(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nVersionTask) ~= "number" then
		return error(format("tbTaskGroup[%s].nVersionTask is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nVersionTask
end

--检查任务变量组的版本号是否一致
function TaskManager:CheckTaskGroup(nGroupId)
	if GetTask(self:GetVersionTaskId(nGroupId)) == self:GetCurrentVersion(nGroupId) then
		return 1
	end
end

--重置一组任务变量
function TaskManager:ResetTaskGroup(nGroupId)
	if self:CheckTaskGroup(nGroupId) ~= 1 then
		SetTask(self:GetVersionTaskId(nGroupId), self:GetCurrentVersion(nGroupId))
		for i=1, getn(self:GetGroupTaskTable(nGroupId)) do
			SetTask(self:GetTaskId(nGroupId, i), 0)
		end
	end
end

--重置在使用表用的任务变量组
function TaskManager:ResetUseGroup()
	for nGroupId, bUse in self.tbUseGroup do
		if bUse == 1 then
			self:ResetTaskGroup(nGroupId)
		end
	end
end

--添加一组任务变量到使用组里
function TaskManager:AddUseGroup(nGroupId)
	if self.tbUseGroup[nGroupId] == 1 then
		return
	end
	self.tbUseGroup[nGroupId] = 1
end

--测试检查有没有填写重复的TaskId
function TaskManager:DebugCheck()
	local tbFlag = {}
	local tbGroup = TaskManager.tbTaskGroup
	
	for i=1, getn(tbGroup) do
		local Group = tbGroup[i]
		local nId = Group.nVersionTask
		
		if tbFlag[nId] then
			error(format("%d, %d",i, nId))
		else
			tbFlag[nId] = 1
		end
		
		for j=1, getn(Group.tbTaskSet) do 
			local nId = Group.tbTaskSet[j]
			if tbFlag[nId] then
				error(format("%d, %d, %d",i, j, nId))
			else
				tbFlag[nId] = 1
			end
		end
		
	end
end

function TaskManager:Create(nGroupId, nVersion)
	self:AddUseGroup(nGroupId)
	local tb = {}
	for key , value in %TaskGroup do
		if type(value) == "function" then
			tb[key] = value
		end
	end
	tb:_init(nGroupId, nVersion)
	tb.TaskManager = self
	return tb
end


function TaskGroup:_init(nGroupId, nVersion)
	self.nGroupId = nGroupId
	self.nVersion = nVersion
end

function TaskGroup:GetTask(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTask(self.nGroupId, nIndex)
end

function TaskGroup:SetTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:AddTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:AddTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:GetDailyTask(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetDailyTask(self.nGroupId, nIndex)
end

function TaskGroup:SetDailyTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetDailyTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:AddDailyTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:AddDailyTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:GetTaskBit(nIndex, nBitPos)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskBit(self.nGroupId, nIndex, nBitPos)
end

function TaskGroup:SetTaskBit(nIndex, nBitPos, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetTaskBit(self.nGroupId, nIndex, nBitPos, nValue)
end

function TaskGroup:GetTaskId(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskId(self.nGroupId, nIndex);
end

function TaskGroup:GetTaskByte(nIndex, nByteIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskByte(self.nGroupId, nIndex, nByteIndex)
end

function TaskGroup:SetTaskByte(nIndex, nByteIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetTaskByte(self.nGroupId, nIndex, nByteIndex, nValue)
end

function TaskGroup:GetMyTaskByte(nIndex, nByteIndex1, nByteIndex2)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetMyTaskByte(self.nGroupId, nIndex, nByteIndex1, nByteIndex2)
end

function TaskGroup:SetMyTaskByte(nIndex, nByteIndex1, nByteIndex2, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetMyTaskByte(self.nGroupId, nIndex, nByteIndex1, nByteIndex2, nValue)
end

function TaskGroup:GetMyTaskBit(nIndex, nBitIndex1, nBitIndex2)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetMyTaskBit(self.nGroupId, nIndex, nBitIndex1, nBitIndex2)
end

function TaskGroup:SetMyTaskBit(nIndex, nBitIndex1, nBitIndex2, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetMyTaskBit(self.nGroupId, nIndex, nBitIndex1, nBitIndex2, nValue)
end
