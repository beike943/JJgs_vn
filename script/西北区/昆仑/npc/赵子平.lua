-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC����ƽScript
-- By StarryNight
-- 2007/06/13 PM 3:01

-- ̫��̫��Ļ�����������˵�������ϸ��������ˡ�

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	local nStep_XBTask = GetTask(TASK_XB_ID);
	
	---------------------------------- ��������06������----------------------------------
	
	--��ȡ�ռ��������
	if nStep_XBTask == 27 then
		task_006_03_0();
		return
	end
	
	--�Ѿ��ռ�����δ�ռ�����10����ǣ���ȡ�ռ���ʯ����
	if nStep_XBTask == 28 then
		task_006_04_0();
		return
	end
	
	--�Ѿ��ռ�����δ�ռ�����10����ʯ
	if nStep_XBTask == 29 then
		task_006_05_0();
		return
	end
	
	--��δ�س��ְ���������
	if nStep_XBTask == 30 then
		task_006_05_1();
		return
	end
	
	--һ������µĶԻ�
	Say("����Ҫȥzys?", 2, "����ȥ����/goto_zys", "������㿴��/nothing");
	return
	
end;

function goto_zys()
	NewWorld(6073, 1586, 3222);
	SetFightState(1);
	SetCampToPlayer("camp_enemy");
end
