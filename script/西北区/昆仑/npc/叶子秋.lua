-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPCҶ����Script
-- By StarryNight
-- 2007/06/13 AM 11:02

-- ��̬����̬����Ҫ�����ٱ�Ů����Ҫ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- ��������05�²ְ���----------------------------------
	
	--��������Ҷ����Ի�
	if nStep_XBTask == 21 then
		task_005_06_0();
		return
	end
	
	--δ�ػ���Ҷ��
	if nStep_XBTask == 22 then
		task_005_06_1();
		return
	end
	
	---------------------------------- ��������06������----------------------------------
	
	--��Ҷ����ѯ�ʳ������ϵ�����
	if nStep_XBTask == 26 then
		task_006_02_0();
		return
	end
	
	--δ������ƽѯ�ʳ������ϵ�����
	if nStep_XBTask == 27 then
		task_006_02_1();
		return
	end
	
	---------------------------------- ������24��֧2_1����ԩ��----------------------------------
	--��Ҷ����Ի�������������
	if nStep_XBTask_02 == 2 then
		task_024_03_0();
		return
	end
	
	--δ���ɵ��������Ż��ȴ������ص���
	if nStep_XBTask_02 == 3 then
		task_024_03_1();
		return
	end
	
	---------------------------------- ������25��֧2_2�ؾ�����----------------------------------
	
	--����Ҷ����Թ��֮��һ��
	if nStep_XBTask_02 == 6 then
		task_025_01_0();
		return
	end

	--��δ����ʦ�ؾ������˵����ص��ӶԻ�
	if nStep_XBTask_02 == 7 then
		task_025_01_1();
		return
	end
	
	--��֪Ҷ����������һ��
	if nStep_XBTask_02 == 10 then
		task_025_04_0();
		return
	end
	
	--��δ��֪ŷ������������һ������
	if nStep_XBTask_02 == 11 then
		task_025_04_1();
		return
	end

	---------------------------------- ������26��֧2_3�ǳ�����----------------------------------
	--��Ҷ��������Ҷ����Ի�
	if nStep_XBTask_02 == 13 then
		task_026_03_0();
		return
	end

	--δ�򵹷ǳ����˶Ի�
	if nStep_XBTask_02 == 14 then
		task_026_03_1();
		return
	end
	
	---------------------------------- ������27��֧2_4��������----------------------------------
	--�򵹷ǳ����˺���Ҷ����Ի�
	if nStep_XBTask_02 == 15 then
		task_027_01_0();
		return
	end

	--�ռ���δ�ռ���10�����β�������
	if nStep_XBTask_02 == 16 then
		task_027_02_0();
		return
	end
	
	--δ�����ص��ӶԻ���Ϥ����������
	if nStep_XBTask_02 == 17 then
		task_027_02_1();
		return
	end
	
	---------------------------------- ������28��֧2_5�������----------------------------------
	--ɱ�������޺���Ҷ����Ի�
	if nStep_XBTask_02 == 18 then
		task_028_01_0();
		return
	end
	
	--��δɱ��Ѫħ�ˣ���������ذ�ף�
	if nStep_XBTask_02 == 19 then
		task_028_01_1();
		return
	end
	
	--�Ѿ�ɱ��Ѫħ��
	if nStep_XBTask_02 == 20 then
		task_028_02_0();
		return
	end
	
	---------------------------------- ������23��֧1_14��ɳ��Ļ----------------------------------
	--ѯ��Ҷ�������ɳĮ���������
	if nStep_XBTask_01 == 62 then
		task_023_01_0();
		return
	end
	
	--��û�򵹻���ǰ��ʾ����
	if nStep_XBTask_01 == 63 then
		task_023_01_1();
		return
	end
	
	--��û�򵹻���ǰ��Ҷ����Ի����������
	if  nStep_XBTask_01 == 64 or nStep_XBTask_01 == 65 then
		task_023_01_2();
		return
	end
	
	--�򵹻���󽻻�������
	if nStep_XBTask_01 == 66 then
		task_023_04_0();
		return
	end
	
	--��δ�㱨ŷ����
	if nStep_XBTask_01 == 67 then
		task_023_04_1();
		return
	end
	
	--��ɷ�֧2��
	if nStep_XBTask_02 == 21 then
		task_028_02_1();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"�ҷ���, ר���޵�������������ħ��������̫ƽ."},
		{"����һ�ɣ�ר־������ħ�����ɼ��ս��Դ�Ϊ����аħ�������ɽ���֣�������ԭ�����һ��ƵƵ��������ħ����ص��������ü�аΪ���˼䣿"},
		{"Trung nguy�n lu�n nghi k? v�i m�n ph�i ? xa nh�ng giang h? hi�m �c ta kh�ng n�n tr�ch h?, m�i vi�c c�n th�n v�n t�t h�n."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
