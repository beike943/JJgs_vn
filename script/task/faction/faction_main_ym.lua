
-- ������Ե II ʦ������
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

      ------------ Ů�����


-- ��ʼ����̫���Ի�

function task_001()

local strMain = {
	"����? ���Ų��Ƚ�������,�Ǵ���������ӣ����ܳ���������ŵľ�Ӫ���� ?",
	"����Ů����������, ��̫������ô��������?",
	"����! ��Ȼ��ִ�����! ��ȥ���¹�Ӣ, ������������.",
	"лл��̫��!",
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("ȥ���¹�Ӣ��Ҫ���������!");

end

-- �Ի��������ı������1
function task_002()

	SetTask(1032,1);

end

-- ���¹�Ӣ�Ի�1
function task_003()

local strMain = {
  "�½���! �����������, ��̫����������.",
	"��������? �ܺ�! ��������Ů�����黹��Ҫȥ��ة������������.",
	"ȥ�꾩��ة�� <color=yellow>����<color> �Ǽ�����ٻ���!",
  "лл�½���!",
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("�¹�Ӣ����ȥ�꾩��ة������");

end

-- �Ի��������ı������2
function task_004()

	SetTask(1032,2);

end


-- �����նԻ�1
function task_005()

local strMain = {
  "��ة��! ���������ŵ��±�, �½��������������Ǽ��ڲ�.",
	"��ͬ���������飬��������ʿ�����Ʊ䶯����Ҫ��ȥ��һ�»ʹ��ſڵĽ���.",
	"��ǰ���ʹ�������Ѱ�� <color=yellow>����<color> ѯ�ʾ������.",
	}

TE_Talk(getn(strMain), "task_006", strMain);

TaskTip("��������ȥ�һʹ��ſڵĽ���");

end

-- �Ի��������ı������3
function task_006()

	SetTask(1032,3);

end

-- ����ٶԻ�
function task_007()

local strMain = {
  "����Ů��!?",
	"�����������ڽ����Ŀ����£����Ǽ����ֻ�������ϵ�.",
	"������������Ȼ���ڳ�͢��������Ի�ȥ�����Դ���.",
	}

TE_Talk(getn(strMain), "task_008", strMain);

TaskTip("����ͳ������ȥ������");

end;

-- �Ի��������ı������4
function task_008()

	SetTask(1032,4);

end;


-- �����նԻ�2
function task_009()

local strMain = {
  "ԭ��������! �����Ǽ����Ҫ��֪�ܴ���.",
	"���Ѿ���֪�����������, ���ڿ��Ի�ȥ�� <color=yellow>�¹�Ӣ<color> ������!",
	"�鷳�Դ�����!",
	}

TE_Talk(getn(strMain), "task_010", strMain);

TaskTip("���ս���ȥ���¹�Ӣ");

end

-- �Ի��������ı������5
function task_010()

	SetTask(1032,5);

end

-- ���¹�Ӣ�Ի�2
function task_011()

local strMain = {
  "�Ǽ����������ô?",
	"�ǵ�! ����Ϊʲô�ɽ������й������鷳!",
	"��Ҳ�����! ��ֻ���������飬�ǲ����ҿ��ǵ���.",
  "�����Ҵ��ھ�Ӫ����ټ�������.",
  "����������������ŵ�ս��?",
	"������ҵ� <color=green>���ŷ�<color>.",
  "ս���������Ǽҳ��㷹������Ҫ���û��������ƣ���� <color=yellow>5������<color> ��������.", 
  "����? �Ҳ�֪��!",
  "�ܼ�! ���� <color=yellow>��������<color> ÿ���˶�����֪��. ���ڽ����в鿴<color=yellow>�����<color>.", 
	}

TE_Talk(getn(strMain), "task_012", strMain);

RestoreStamina()
TaskTip("�¹�Ӣ��������5���������� ");

end

-- �Ի��������ı������6
function task_012()

	SetTask(1032,6);

end

-- ����б�����������ʱ
function task_013()

local strMain = {
		"5�������Ѿ��������.",
		"�ǳ���!������<color=yellow>��̫��<color>������."
	}

	if (GetItemCount(1,0,1)>=5) then
		TE_Talk(getn(strMain), "task_014", strMain);		
	else
		Say("��<color=yellow>F5<color> ѡ<color=yellow>��<color> �� <color=yellow>�����<color>.",0);
		return
	end;

end;

-- �Ի��������ı������7
-- ɾ������
function task_014()
	TaskTip("B�y gi? c? th? g�p Xa Th�i Qu�n");
	DelItem(1,0,1,5);
	SetTask(1032,7);
end;


-- ��ȥ����̫���ĶԻ�

function task_015()

local strMain = {
		"�ӽ��Ժ���ͳ�Ϊ�첨����ˣ��Ժ�Ҫ����ѵ������Ч����.",
		"�첨��ó���ͨ����ս��, ��Ҿ���������. �������ѧϰ<color=yellow>����ǹ��<color> ��ȥ��<color=yellow>���ڱ�<color>; �������ѧϰ <color=yellow>���Ź���<color> ��ȥ��<color=yellow>�¹�Ӣ<color>."
	}
	
TE_Talk(getn(strMain), "task_016", strMain);

end


-- �����ŶԻ��������ı����������8
function task_016()

	SetTask(1032,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ������ţ�")
	TaskTip("���Ѽ������ţ�Ѱ������ʦ��")
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end



      ------------ �������


-- ��ʼ����̫���Ի�


function task_101()

local strMain = {
	"�����������? ����һ֧���������ľ��ӣ����Ƚ������ɣ����Ҫ���.",
	"����������������ѣ�ƥ������",
	"�ܺ�! ȥ��<color=yellow>���ڱ�<color> ������������.",
	}

TE_Talk(getn(strMain), "task_102", strMain);

TaskTip("�����ڱ���������!");

end

-- �Ի��������ı������1
function task_102()

	SetTask(1031,1);

end

-- �����ڱ��Ի�1
function task_103()

local strMain = {
  "���!����������ţ���̫������������",
	"�ܺ�!�����������Ǵ��ɷ���Ϊ!",
  "�������Ѽ�������?",
	"���������Ҫ��͢��׼, ����Ҫȥ�꾩������ʹ<color=yellow>�ܱ�<color>, ����ʿ��������.",
  "���������!",
	}

TE_Talk(getn(strMain), "task_104", strMain);

TaskTip("���ڱ�����ȥ�꾩������ʹ�ܱ�");

end

-- �Ի��������ı������2
function task_104()

	SetTask(1031,2);

end


-- ��ܱ�Ի�1
function task_105()

local strMain = {
  "���ǲܱ����? ������ξ�, ���ڱ���������������.",
	"�������Ƽ����ǲ���������. ����С�ֵ��ܷ����һ��æ?",
  "�ܴ�����˵!",
	"���ڳ�͢����һ��ս��û�͵�. �������һ��<color=yellow>��<color>��Ҫ��û��͵�.",
  "û����!",
	}

TE_Talk(getn(strMain), "task_106", strMain);

TaskTip("�ܱ�����ȥ���꾩��");

end

-- �Ի��������ı������3
function task_106()

	SetTask(1031,3);

end

-- ���꾩���Ի�
function task_107()

local strMain = {
  "�n�ϰ�!�ܴ������������ϴγ�͢������ս���ʱ���͵�.",
	"�ܴ��˹���ս��?�����͵�.",
  "лл!",
	}

TE_Talk(getn(strMain), "task_108", strMain);

TaskTip("�ظ��ܱ�");

end;

-- �Ի��������ı������4
function task_108()

	SetTask(1031,4);

end;


-- ��ܱ�Ի�2
function task_109()

local strMain = {
  "��ô��?",
	"ս�������͹���.",
  "̫����! ��͢���ɹ����ڴ���, ս���ս��������ǳ���Ҫ.",
  "����һ��Ҫ��ܶ���.",
  "�����������, ��������ʦ�����ڱ�����ѧ����.",
	"����Ҳȥ�꾩��ȥ������?",
  "�ܺ�! �����и�ʦ���̵�, ��ҵ��˿��Ե�����ȥȡս��.",
	"��������!",
  "�ð�!����Ի�ȥ��<color=yellow>���ڱ�<color>, ���ѵǼ��ڲ���.",
	"лл�ܴ���!",
	}

TE_Talk(getn(strMain), "task_110", strMain);

TaskTip("�ܱ������ȥ�����ڱ�");

end

-- �Ի��������ı������5
function task_110()

	SetTask(1031,5);

end

-- �����ڱ��Ի�2
function task_111()

local strMain = {
  "��ô����?",
	"����Ǽ��Ѱ��������!",
	"�ܺ�!",
  "ʿ���ܶ࣬��ʳҲ�ܽ�������ʱ���ӳ�����ʿ�����Ը�����.", 
  "ȥ��ѵ�����<color=yellow> ��å<color> �� <color=yellow> 2 �ݼ���<color>����!", 
	}

TE_Talk(getn(strMain), "task_112", strMain);

TaskTip("���ڱ�����ȥ��2�ݼ���?");

end

-- �Ի��������ı������6
function task_112()

	SetTask(1031,6);

end

-- ����м�����������ʱ
function task_113()

local strMain = {
		"�Ѿ�������!",
	  "��ô�죬�е�����ǰǱ��!",
		"��������Իظ�<color=yellow>��̫��<color>.",
	}

	if (GetItemCount(1,3,2)>=2) then
		TE_Talk(getn(strMain), "task_114", strMain);		
	else
		Say("�㻹û�����?",0);
		return
	end;

end;

-- �Ի��������ı������7
-- ɾ������
function task_114()
	TaskTip("B�y gi? c? th? g�p Xa Th�i Qu�n");
	DelItem(1,3,2,2);
	SetTask(1031,7);
end;


-- ��ȥ����̫���ĶԻ�

function task_115()

local strMain = {
		"���ڱ��Ѿ���Ӧ��? �ܺã����������������Ҿ���һԱ��. ���ס������������������Ӿ���!",
    "�첨��ó���ͨ����ս��, ��Ҿ���������. �������ѧϰ <color=yellow>����ǹ��<color> ��ȥ��<color=yellow>���ڱ�<color>;�������ѧϰ<color=yellow>���Ź���<color>�����<color=yellow>�¹�Ӣ<color>.",
	}
	
TE_Talk(getn(strMain), "task_116", strMain);

end


-- �����ŶԻ��������ı����������8
function task_116()

	SetTask(1031,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ������ţ�")
	TaskTip("���Ѽ������ţ�Ѱ������ʦ��")
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end








function task_exit()

end;


function fix_ym()
FN_SetTaskState(FN_TM, 0);
Say("������������¼�����.",0);
end;


