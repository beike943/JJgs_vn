--双剑诛邪头文件
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

--使用物品召唤怪死亡脚本
--nGTaskID：		gtaskID
--nTaskID：		记录NpcID的变量
--返回值
--1：成功
--2：没有接任务
--3：接了任务，但是不是他的怪
function CallNpcOnDeath(nGTaskID, nTaskID, nNpcIdx)
	if tGtCondition:check_taskid(nGTaskID, 2) ~= nil then
		--Msg2Player(GetTargetNpc());
		if GetTask(nTaskID) == 0 or GetTask(nTaskID) == 1 or GetTask(nTaskID) == nNpcIdx then
			return 3
		else
			local nNpcIdx = GetTask(nTaskID);
			SetNpcLifeTime(nNpcIdx, 0);
			SetTask(nTaskID, 1);
			
			return 1
		end
	else
		return 2
	end
end

--使用物品招怪
--nGTaskID： 	gtaskID
--tMapID：		地图ID
--nTaskID：	记录NpcID的任务变量
--szNpcName：		召唤Npc名字
--szNpcTemp：		召唤Npc模板
--szNpcScript：		召唤Npc脚本
--返回值
--1：成功
--2：地图不对
--3：上一次召唤出来的怪还存在
--4：召唤已经意外死掉了
--5：没有接任务
--例子
--local ret = CallNpcOnUser(525, tMap, 3378, "雪精灵", "妖狐2", "\\script\\task\\2011_newtask_newnpc\\xuejinling.lua");
function CallNpcOnUser(nGTaskID, tMap, nTaskID, szNpcName, szNpcTemp, szNpcScript)
	if tGtCondition:check_taskid(nGTaskID, 2) ~= nil then
		--检测地图
		if tMap ~= nil and type(tMap) == "table" then
			local nMapID, nMapX, nMapY = GetWorldPos();
			if tMap[1] ~= nil and tMap[1] == nMapID then
				if tMap[2] ~= nil and tMap[3] ~= nil then
					if tMap[2] ~= nMapX or tMap[3] ~= nMapY then
						return 2
					end
				end
			else
				return 2
			end
		end
		
		if GetTask(nTaskID) == 0 then
			local nNpcIdx = CreateNpc(szNpcName, szNpcTemp, GetWorldPos());
			SetTask(nTaskID, nNpcIdx);
			SetNpcScript(nNpcIdx, szNpcScript);
			SetNpcLifeTime(nNpcIdx, 120);
			return 1
		else
			local nCurNpcID = GetTask(nTaskID);
			local nNpcIdx = GetNpcID(nNpcIdx);
			if nNpcIdx == 0 or nNpcIdx ~= nCurNpcID then	--召唤怪已经消失，或者被别人打死
				return 4
			else
				return 3
			end
		end
	else
		return 5
	end
end

--杀10个必出，配合杀怪触发器使用
-- nGTaskID: gtask 中的任务ID
-- nTaskID: 任务变量，用来记录杀怪次数的
-- nKillTriggerID : 死亡触发器
-- nKillTriggerCustonID: 死亡触发器自己的ID
-- szTalk: 完成对话
-- tItem: 掉落物品，注意只能是一个。。。
-- strItemName: 掉落物品的名称
function kill10or1(nGTaskID, nTaskID, nKillTriggerID, nKillTriggerCustomID, szTalk, tItem, strItemName, funDo)
	--2011新手改进之后
	if tGtCondition:check_taskid(nGTaskID, 2) ~= nil then
		if GetTask(nTaskID) ~= 10 then
			RemoveTrigger(GetTrigger(nKillTriggerCustomID));
			local nOver = 0;
			SetTask(nTaskID, GetTask(nTaskID) + 1);
			
			if GetTask(nTaskID) == 10 then
				nOver = 1;
			end
			
			local nRand = random(1, 10);
			if nRand == 1 then
				nOver = 1;
			end
			
			if nOver == 1 then
				if szTalk == nil then
					szTalk= {
						"少侠还没有接任务!",
					};
				end
				Talk(1, "", szTalk);
				
				if tItem ~= nil and strItemName ~= nil then
					gf_AddItemEx(tItem, strItemName);
				end
				
				if funDo ~= nil then
					funDo()
				end
				
				SetTask(nTaskID, 10);
				return 
			end
			if GetTrigger(nKillTriggerCustomID) == 0 then
				CreateTrigger(0, nKillTriggerID, nKillTriggerCustomID);
			end
		else
			Talk(1, "", "召唤怪已经消失，或者被别人打死!")
		end
	end
	--2011新手改进之前
end

--杀N个怪触发器
--在触发器中被调用，触发器中需要知道taskID + 怪物的名字
--nTaskID 			记录杀怪个数的任务ID
--nSum				需要杀多少个
-- nKillTriggerID	死亡触发器
-- nKillTriggerCustonID	死亡触发器自己的ID
--szTalk				对话
--tItem				物品
--szItemName	物品名称	
function KillAction(nTaskID, nSum, nKillTriggerID, nKillTriggerCustonID,szTalk, tItem, szItemName)
	nTaskID = tonumber(nTaskID);
	nSum = tonumber(nSum);
	nProbability = tonumber(nProbability);
	
	SetTask(GetTask(nTaskID) + 1);
	local nNum = GetTask(nTaskID);
	--每次都要移除触发器
	RemoveTrigger(GetTrigger(nKillTriggerCustomID));
	if nSum == nNum then	--完成任务，赶紧结束
		--1、对话
		if szTalk ~= nil then
			Talk(1, "", szTalk);
		end
		
		--2、物品
		if tItem ~= nil and strItemName ~= nil then
			gf_AddItemEx(tItem, strItemName);
		end
	else
		if GetTrigger(nKillTriggerCustonID) == 0 then
			CreateTrigger(0, nKillTriggerID, nKillTriggerCustonID);
		end
	end
end