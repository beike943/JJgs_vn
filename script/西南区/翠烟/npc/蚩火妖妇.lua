-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC������Script
-- By StarryNight
-- 2005/12/30 PM 13:54

--������ ������ ������
--��: ���� ���� ��ţ�� ������ȡ
--��: ��լ ���� ���� ��Ȣ ���� �촬
--��������: ���� ���� ����
--�����˼�: �½� Сʱ ���� ���� �ػ�
--����: ������  ��ִλ
--����ټ�: �첻������������ �Ӳ��ʲ����ǻ���

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")
Include("\\script\\task\\world\\����\\lv10\\task_main.lua");

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV10_ID) == 2 then
        	SetTask(TASK_DL_LV10_ID, 3);
        	Msg2Player("L�y ���c h�a ��n c�a Tr�nh Qu�n Chi.");
        	TaskTip("�õ���֣��֮�Ļ���.");
        	AddItem(2,0,363,1,1);--�õ�����
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_DL_LV10_ID) == 2 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_DL_LV10_ID, 3);
            	Msg2Player("L�y ���c h�a ��n c�a Tr�nh Qu�n Chi.");
            	TaskTip("�õ���֣��֮�Ļ���.");
            	AddItem(2,0,363,1,1);--�õ�����
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;