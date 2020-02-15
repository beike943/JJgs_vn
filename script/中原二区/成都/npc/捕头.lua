-- ====================== �ļ���Ϣ ======================             
             
-- ������ԵonlineII ͨ������ʵ�崦���ļ�             
-- Edited by Starry              
-- 2005/09/05 PM 16:21             
             
-- ======================================================             

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local strButouTitle = "<color=green>��ͷ<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nLevel = GetLevel();
	local nTotalPoint = GetTask(TASK_POINT_TOTAL); 
	
	--���ֲ���
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe n�i tr�n ng��i c�a b�n s�t th?���ng c�ng c?Linh Th�ch, thi�u hi�p ph�i theo d�i b�n ch�ng!");
	end;
	if nTotalPoint == 0 then
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = GetTask(TASK_KILLER_DONUM)*100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);
	end; 
			
	--���ʱ���Ƿ�Ϊ��һ������20����24��
--	if CheckTime() == 1 then
	if CheckTime() <= 1 then
	
		--��������ĵȼ����Ϊ20��
		if nLevel >= 20 then
					
			if task_state == 0 then
				Say(strButouTitle.."���Ű참ʱ���20�㿪ʼ",
					4,
					"��ȡɱ������/Task_Confirm",
					"��������/Task_Show",
					"���񱳾�/Task_Backdrop",
					"û����/Taks_Exit");	
			end;
			
			if task_state >= 1 then
			
				local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
				local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
				local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
				local nPosID = GetTask(TASK_KILLER_MAP_ID);
				local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
				Say(strButouTitle.."��ǰ������ɱ��  <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"�������/Task_Finish",
					"û����/Taks_Exit",
					"ȡ������/Task_Cancel");		
			end;
		
		else
			Say(strButouTitle.."ɱ��̫���������ǵ� <color=yellow>20��<color> �Ժ�������!",0)
				
		end;
		
	elseif task_state >= 1 then
			
		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);		
		local nPosID = GetTask(TASK_KILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
			Say(strButouTitle.."��ǰ������ɱ��  <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"�������/Task_Finish",
					"û����/Taks_Exit",
					"ȡ������/Task_Cancel");		
	else
		Say(strButouTitle.."<color=yellow>��һ<color>��<color=yellow>����<color>��<color=yellow>20<color>�㵽<color=yellow>24<color>�������ȡɱ������",
				3,
				"��������/Task_Show",
				"���񱳾�/Task_Backdrop",
				"û����/Taks_Exit");
	end;
end;

--��������
function Task_Confirm()

	local nKillerName = "";
	local nKillerMode = "";
	local nMapName = "";
	local nMapID = 0;
	local nWx,nWy,nMx,nMy = 0,0,0,0;
	local strButouTitle = "<color=green>��ͷ<color>:";
	local nTriggerID = 0;
	local nCustomID = 0;
	local nTime = 0;
	local nBuTouMapID = GetWorldPos();
	local nTotal_DoNum = 0;
	local i=0;
	local nNowTime = GetTime();
	local nLastTime = GetTask(TASK_ACCEPT_TIME);--��ȡ��һ�νӻ�����ʱ��
	local nCoolTime = 300 - (nNowTime-nLastTime);
			if nLastTime == nil or nCoolTime < 0 then
				nCoolTime = 0;
			end;
	local strCoolTime = TurnTime(nCoolTime);
	
	--���ݵص��ȡ�õص�Ŀǰ�ӻ�ͨ�����������
--	if nBuTouMapID == 100 then nTotal_DoNum = GetMapTaskTemp(100,1);i=1;end;--Ȫ��
--	if nBuTouMapID == 150 then nTotal_DoNum = GetMapTaskTemp(150,1);i=2;end;--����
--	if nBuTouMapID == 200 then nTotal_DoNum = GetMapTaskTemp(200,1);i=3;end;--�꾩
--	if nBuTouMapID == 300 then nTotal_DoNum = GetMapTaskTemp(300,1);i=4;end;--�ɶ�
--	if nBuTouMapID == 350 then nTotal_DoNum = GetMapTaskTemp(350,1);i=5;end;--����
	
--	һ����ͬһ�ص㲶����ӻ������������100
--	if nTotal_DoNum < 100 then 
		
		--�ӻ��������Ҫ5���ӷ��ܽ���һ������
		if nCoolTime ~= 0 then
			Talk(1,"",strButouTitle.." �㻹��Ҫ�ȴ�"..strCoolTime.."������ȡ����!")
			return
		end;
		
		--����һ��ɱ������
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--����һ��ͨ�������ñ���Ϊ 1
		--SetMapTaskTemp(nBuTouMapID,1,nTotal_DoNum+1);--��¼һ�������׵ص㲶��ӻ��������
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--��¼��ҽӻ�����ʱ�ĵȼ�
		
		--nTotal_DoNum = GetMapTaskTemp(BuTouMapData[i][1],1);
		
		Say(strButouTitle.."ɱ��:<color=yellow>"..nKillerName.."<color>�� <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. ���֣���ȥɱ����!",0);--�����Ǳ��θò�ͷ�����ĵĵ�<color=yellow>"..nTotal_DoNum.."<color>������ÿ�η�����������Ϊ<color=yellow>100<color>�Ρ���",0);
		
		--����ʱ�䴥����������ֵΪ1800
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--���浱ǰʱ��
		nTime = GetTime();--��ȡ1970�����񾭹�������
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--���ɵ�ͼ������
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--�����ͼ������ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);

		TaskTip("�ɹ���ȡɱ�����񣬿�ȥɱ����!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
				
--	else
--		Say(strButouTitle.."<color=yellow>"..BuTouMapData[i][2].."<color>����ͨ�������ѷ�����ϣ�",0);
--				 
--	end;
		
end;

--������񼰽�����ȡ
function Task_Finish()

	local strButouTitle = "<color=green>��ͷ<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."������ɵĲ�����!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--�����������״̬��0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--������񣬴�����1
		
		--�����ۼƴ���
		local nTotalPoint = GetTask(TASK_POINT_TOTAL);
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = nTotalPoint + 100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);	
		
		--ɾȥͨ����
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;
		-- ʦͽ���� ��ɱ�֣�
		local nChance, nMaxChance = CustomDataRead("mp_shashou")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shashou", "dd", nChance, nMaxChance)
				Msg2Player("Ho�n th�nh nhi�m v?s?��-s�t th?"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say(strButouTitle.."��ƭ�ң���ȥɱ����!",0);
	end;
end;

--ȡ������
function Task_Cancel()

local strButouTitle = "<color=green>��ͷ<color>:";

	Say(strButouTitle.."���Ҫȡ������?",
	2,
	"������/Task_Exit",
	"ȡ������/Task_CancelConfirm");
	
end;

--�ٴ�ȷ��ȡ������
function Task_CancelConfirm()

local strButouTitle = "<color=green>��ͷ<color>:";

	SetTask(TASK_KILLER_STATE_ID,0);--ȡ����������״̬��0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."�����С��!",0);
	
	TaskPunish();

		--ɾȥͨ����
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--ɾ���õ�ͼ������
	RemoveTrigger(GetTrigger(600));
	--ɾ��ʱ�䴥����
	RemoveTrigger(GetTrigger(500));
	
end;

--ͨ����������˵��
function Task_Show()

local str1 = "<color=yellow>20��<color>,���� <color=yellow>20h:00<color> �� <color=yellow>24h:00<color> ��<color=yellow>��ͷ<color> ����ȡͨ������";
local str2 = "�����ȡ�����Ҫ��<color=yellow>30 ����<color> ����ɡ���ʱ��ȡ��������ʧ�ܡ�";
local str3 = "�����������ȡ����������ʧ�ܣ���Ҫ��� <color=yellow>5 ����<color> �����ٴ���ȡ����";

	Talk(3,"",str1,str2,str3);

end;

--ͨ�����񱳾�˵��
function Task_Backdrop()

local str1 = "...";
local str2 = "...";
local str3 = "...";
	
	Talk(3,"",str1,str2,str3);
	
end;
	
--�պ����������κ���
function Taks_Exit()

end;
