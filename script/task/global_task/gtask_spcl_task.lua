Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\2011TaskTemp\\temp.lua");
Include("\\script\\task\\world\\task_head.lua");

--道具召唤怪物类型
--策划需求：道具召唤后不消失，在任务完成时上交，填成完成任务必须条件。召唤出的怪物存在时间5分钟，道具使用间隔2分钟。使用会有提示：该道具每2分钟才可使用一次！
--参数
	--1、nItemIndex
	--2、nGtask			gtask中的任务ID
	--3、nTimeTaskID	用来记录上一次使用的时间的TaskID
	--4、tNpc				召唤Npc的信息
		--{
			--[1] npc的模板名,
			--[2] npc的名字,
			--[3] 召唤的位置,
			--[4] npc死亡脚本,
			--[5] npc类型(1,对话 2,战斗),
			--[6] npc存在时间,
		--}
	--5、间隔时间
--返回值
	--1、成功
	--2、没有接到任务
	--3、CD时间木有到
	--4、任务已经完成
function UseItemToCallNpc(nItemIndex, nGtask, nTimeTaskID, tNpc, nNextTime)
	return CallSpclNpc(nGtask, nTimeTaskID, tNpc, nNextTime);
end


function CallSpclNpc(nGtask, nTimeTaskID, tNpc, nNextTime)
	if tGtCondition:check_taskid(nGtask, 2) == nil then
		return 2 
	end
	
	if nNextTime == nil then
		nNextTime = 2
	end
	
	local nNowTime = tonumber(date("%m%d%H%M"));
	local nLastTime = GetTask(nTimeTaskID);
	if nLastTime == 0 then
		SetTask(nTimeTaskID, nNowTime);
	elseif nLastTime == 1 then
		return 4
	else
		if nNowTime - nLastTime < nNextTime then	--2分钟
			return 3
		else
			SetTask(nTimeTaskID, nNowTime);
		end
	end
	
	local nNpcIdx = 0;
	if tNpc[3] == 1 then
		nNpcIdx = CreateNpc(tNpc[1], tNpc[2], GetWorldPos());	
	else
		nNpcIdx = CreateNpc(tNpc[1], tNpc[2], tNpc[3][1], tNpc[3][2], tNpc[3][3]);	
	end

	if tNpc[4] ~= nil and tNpc[4] ~= "" then
		SetNpcScript(nNpcIdx, tNpc[4]);
	end
	
	if tNpc[5] == 1 then
		ChangeNpcToFight(nNpcIdx, 0, 6);
	elseif tNpc[5] == 2 then
		ChangeNpcToFight(nNpcIdx);
	end
	
	SetNpcLifeTime(nNpcIdx, tNpc[6]);
	
	return 1
end

--对话后changeNpc任务
--策划需求：对话后，原有Npc变为战斗状态，5分钟后自动消失。5S后，在原有位置刷新原有对话Npc。此类任务全部配置成可放弃任务，并且在任务描述中增加一行(若因为未知原因导致任务无法完成，您可以放弃该任务重新接取）
function ChangeNpcToFightForGtask(nNpcIdx)
	ChangeNpcToFight(nNpcIdx);
	SetNpcLiftTime(nNpcIdx, 5*60);		--五分钟
end