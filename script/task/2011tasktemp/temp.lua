--˫����аͷ�ļ�
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

--ʹ����Ʒ�ٻ��������ű�
--nGTaskID��		gtaskID
--nTaskID��		��¼NpcID�ı���
--����ֵ
--1���ɹ�
--2��û�н�����
--3���������񣬵��ǲ������Ĺ�
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

--ʹ����Ʒ�й�
--nGTaskID�� 	gtaskID
--tMapID��		��ͼID
--nTaskID��	��¼NpcID���������
--szNpcName��		�ٻ�Npc����
--szNpcTemp��		�ٻ�Npcģ��
--szNpcScript��		�ٻ�Npc�ű�
--����ֵ
--1���ɹ�
--2����ͼ����
--3����һ���ٻ������Ĺֻ�����
--4���ٻ��Ѿ�����������
--5��û�н�����
--����
--local ret = CallNpcOnUser(525, tMap, 3378, "ѩ����", "����2", "\\script\\task\\2011_newtask_newnpc\\xuejinling.lua");
function CallNpcOnUser(nGTaskID, tMap, nTaskID, szNpcName, szNpcTemp, szNpcScript)
	if tGtCondition:check_taskid(nGTaskID, 2) ~= nil then
		--����ͼ
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
			if nNpcIdx == 0 or nNpcIdx ~= nCurNpcID then	--�ٻ����Ѿ���ʧ�����߱����˴���
				return 4
			else
				return 3
			end
		end
	else
		return 5
	end
end

--ɱ10���س������ɱ�ִ�����ʹ��
-- nGTaskID: gtask �е�����ID
-- nTaskID: ���������������¼ɱ�ִ�����
-- nKillTriggerID : ����������
-- nKillTriggerCustonID: �����������Լ���ID
-- szTalk: ��ɶԻ�
-- tItem: ������Ʒ��ע��ֻ����һ��������
-- strItemName: ������Ʒ������
function kill10or1(nGTaskID, nTaskID, nKillTriggerID, nKillTriggerCustomID, szTalk, tItem, strItemName, funDo)
	--2011���ָĽ�֮��
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
						"������û�н�����!",
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
			Talk(1, "", "�ٻ����Ѿ���ʧ�����߱����˴���!")
		end
	end
	--2011���ָĽ�֮ǰ
end

--ɱN���ִ�����
--�ڴ������б����ã�����������Ҫ֪��taskID + ���������
--nTaskID 			��¼ɱ�ָ���������ID
--nSum				��Ҫɱ���ٸ�
-- nKillTriggerID	����������
-- nKillTriggerCustonID	�����������Լ���ID
--szTalk				�Ի�
--tItem				��Ʒ
--szItemName	��Ʒ����	
function KillAction(nTaskID, nSum, nKillTriggerID, nKillTriggerCustonID,szTalk, tItem, szItemName)
	nTaskID = tonumber(nTaskID);
	nSum = tonumber(nSum);
	nProbability = tonumber(nProbability);
	
	SetTask(GetTask(nTaskID) + 1);
	local nNum = GetTask(nTaskID);
	--ÿ�ζ�Ҫ�Ƴ�������
	RemoveTrigger(GetTrigger(nKillTriggerCustomID));
	if nSum == nNum then	--������񣬸Ͻ�����
		--1���Ի�
		if szTalk ~= nil then
			Talk(1, "", szTalk);
		end
		
		--2����Ʒ
		if tItem ~= nil and strItemName ~= nil then
			gf_AddItemEx(tItem, strItemName);
		end
	else
		if GetTrigger(nKillTriggerCustonID) == 0 then
			CreateTrigger(0, nKillTriggerID, nKillTriggerCustonID);
		end
	end
end