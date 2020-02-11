
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 任务变量管理头文件
-- Edited by peres
-- 2005/03/30 PM 14:06

-- 看见的  熄灭了
-- 消失的  记住了
-- 我站在  海脚天涯
-- 听见    土壤萌芽
-- 等待    昙花再开
-- 把芬芳  留给年华
-- 彼岸    没有灯塔
-- 我依然  张望着
-- 天黑    刷白了头发
-- 紧握着  我火把
-- 他来    我对自己说
-- 我不害怕
-- 我很爱他

-- lyrics : 彼岸花

-- ======================================================

-- 一名玩家最多可接 30 个任务
TASK_NUM_MAX = 30;

-- 用于储存任务状态的变量总数
-- 所能存储的任务数 = 变量总数 * 16
TASK_STATE_MAX = 500;

-- 任务索引所开始的变量位置
-- 任务索引 = TASK_INDEX_START + TASK_NUM_MAX 
TASK_INDEX_START = 2001;

-- 用于储任务状态的变量开始值
TASK_STATE_START = 2051;

CTaskValue = {
	
	-- 分配一个任务在任务索引区间之内，传入该任务的编号
	AssignTask = function(self, nTask)
		
		self:SetTaskState(nTask, 1);
		
		-- 首先检索区间索引看看有没有空的
		for i = TASK_INDEX_START, TASK_NUM_MAX do
			if GetTask(i)==0 then
				SetTask(i, nTask);  -- 设置区间 i 的任务标识
				return i
			end;
		end;
		
		-- 都没找到的话就返回 0，不能做任务了
		return 0;
		
	end,
	
	-- 设置一个任务为完成状态，并且如果当前的空间区域有改任务的话则全部清空
	CompleteTask = function(self, nTask)
		local i=0;

		for i = TASK_INDEX_START, TASK_NUM_MAX do
			if GetTask(i)==nTask then
				SetTask(i, 0);
			end;
		end;
		self:SetTaskState(nTask, 2);
	end,
	
	-- 设置一个任务为还未开始的状态，并且如果当前的空间区域有改任务的话则全部清空
	ClearTask = function(self, nTask)
		local i=0;

		for i = TASK_INDEX_START, TASK_NUM_MAX do
			if GetTask(i)==nTask then
				SetTask(i, 0);
			end;
		end;
		self:SetTaskState(nTask, 0);
	end,
	
	-- 确定在任务完成状态的索引中对应的任务变量和具体的第一位数
	GetTaskStateIndex = function(self, nTask)
	
		-- 如果大于最大任务记录数，则返回失败
		if nTask > TASK_STATE_MAX*16 + TASK_STATE_START then
			return nil, nil;
		end;
		
		if nTask>= TASK_STATE_START then
			nTask = nTask - TASK_STATE_START + 1;
		end;
	
			if (nTask<16) then
				return TASK_STATE_START, nTask * 2 - 1;
			else
				if mod(nTask, 16)==0 then
					return TASK_STATE_START + nTask/16 - 1, 31;
				else
					return TASK_STATE_START + floor(nTask/16), mod(nTask, 16) * 2 - 1;
				end;
			end;

	end,
	
	-- 获取一个任务的完成状态，检查标志位
	GetTaskState = function(self, nTask)
	
		local nTaskID, nTaskBit = self:GetTaskStateIndex(nTask);
		
		local nBit_1 = GetBit(GetTask(nTaskID), nTaskBit);
		local nBit_2 = GetBit(GetTask(nTaskID), nTaskBit + 1);
		
		if nBit_1==0 and nBit_2==0 then return 0 end; -- 还未开始，返回 0
		
		if nBit_1==0 and nBit_2==1 then return 1 end; -- 已经开始，返回 1
		
		if nBit_1==1 and nBit_2==1 then return 2 end; -- 已经开始，返回 2
		
	end,
	
	-- 设置一个任务的状态
	-- 0：还未开始
	-- 1：已经开始
	-- 2：已经完成
	SetTaskState = function(self, nTask, nState)
	
		local nTaskID, nTaskBit = self:GetTaskStateIndex(nTask);
		
		local nBit_1, nBit_2 = 0, 0;
		
		if nState==0 then
			nBit_1 = 0;
			nBit_2 = 0;
		end;
		
		if nState==1 then
			nBit_1 = 0;
			nBit_2 = 1;
		end;

		if nState==2 then
			nBit_1 = 1;
			nBit_2 = 1;
		end;
		
		SetTask(nTaskID, SetBit(GetTask(nTaskID), nTaskBit, nBit_1));
		SetTask(nTaskID, SetBit(GetTask(nTaskID), nTaskBit + 1, nBit_2));
		
	end,

}