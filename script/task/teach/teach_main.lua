
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ʵ�崦���ļ�
-- Edited by peres
-- 2005/05/07 PM 19:55

-- �̻�.��һҹ���̻�.
-- ���ǵ����ڴ������Ⱥ��,վ�����ı���ӵ��ס��.
-- ����ů��Ƥ��,����Ϥ��ζ��.�̻����������۾�.
-- һ���޿���ء���

-- ======================================================

-- ��������ͷ�ļ�
Include("\\script\\task\\teach\\teach_head.lua");

-- �����������ļ�
Include("\\script\\task\\teach\\teach_award.lua");

-- ��һ����Ұ�ŶԻ�
function task_000_00()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%y%m%d"))
--	if nNation ~= 89 then
--		Talk(1, "", "Giang h?�ang d�y s�ng, ta ph�i ngh?ng�i 1 t?�� !!!!!")
--		return 0
--	end
	
--	if nDate > 140406 then
--		Talk(1, "", "Giang h?�ang d�y s�ng, ta ph�i ngh?ng�i 1 t?�� !!!!!")
--		return 0
--	end
	
	local strMain = {
		"��ӭ���� <color=yellow> ������Ե2<color>������",
		"������ʲô/task_000_okay", 
		"��ʼ��������/task_000_01",
	}
	SetTask(1, 1);
	AddItem(2,0,505,1)
	SelectSay(strMain);

end;

-- ѡ����Ұ�Ž���
function task_000_okay()

	local strMain = {

		"�����˽�ʲô?",
		"��������/Teach_Basic",
		"��ɫ����/Teach_Level",
		"��μӵ�/Teach_Point",
		"���׬Ǯ/Teach_Earn",
		"��������/Teach_Faction",
		"���ڿ�����ʲô/Teach_Something",
		"�õ�/task_000_00",
	}

	SelectSay(strMain);

end;


-- ��ʼ����ѧ����
function task_000_01()

	local strMain = {
		"<color=yellow>�������������,��װ����,Ůװ����,��Ʒ����,<color>����֪ʶԨ�����ˣ� �ҵ�����ѧϰ��",
		"ȥ���������İ�",
	}

	TE_Talk("task_000_02",strMain);

end;

-- ��������,�ı����������1
function task_000_02()
	SetTask(1, 1);
	TaskTip("ȥ���������ϰ�");
end;

-- ���������ϰ�ĶԻ�
function task_001_00()

	local strMain = {
		"��ӭ����  <color=yellow>������Ե2<color> ��������ֻ��4������ͼ���,��ɣ� �һ���������ʹ����",
		"��ôʹ��/task_001_01",
		"֪����/task_001_02",
	}
	SelectSay(strMain);

end;

-- ���������ϰ彲��
function task_001_01()

	local strMain = {
		--"H�nh t�u giang h? c�n ph�i c?v?kh?�� ph�ng th�n. Nh�ng th?��n gi�n nh?<color=yellow>H?th?color>, <color=yellow>Ki�m<color>, <color=yellow>�m kh?color>, <color=yellow>C�n<color> kh�ng c�n s?ph?h��ng d�n, nh�ng th?c�n l�i nh?�ao, c�m, b�t, tr��ng ph�i ���c h��ng d�n.",
		"ÿ���������Ա��Ӧ������,��ҿ������������ﹺ����ͨ����,���߼���������������������ﹺ�����.",
		--"L�c tr��c ta c?giao ��u v�i cao th?ph�i t?ki�m ph�i Thanh Th�nh, may ���c m�t v?V?�ang ra tay c�u gi�p, tr�n tay �ng ta l?thanh b�o ki�m ���c kh�m ng�c, uy l�c kinh ng��i. Nghe n�i ��y l?lo�i k?th�ch h�c b�ch c?th?kh�m n�m l�n v?kh?",
		--"N�u ng��i g�p c?duy�n c?���c b�o ki�m �� th?vi�c h�nh t�u giang h?xem ra r�t nh?nh�ng.",
		"������������ <color=yellow>��װ���ϰ�<color>.",
	}
	TE_Talk("task_001_02",strMain);

end;

-- ���꽲��,�ı����������2
function task_001_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?Ti�m v?kh");
	if GetSex()==1 then
		TaskTip("ȥ����װ���ϰ�");
	else
		TaskTip("ȥ��Ůװ���ϰ�");
	end;
end;

-- ���װ�����ϰ�ĶԻ�
function task_002_00_male()

	local strMain = {
		"��ӭ���Ѽ��뽣����Ե2. ���ǵ��̵�ר��������װ,��ɣ� ���ǽ�����չʾ���ʹ��<color=yellow>��װ<color>",
		"��ôʹ��/task_002_01",
		"֪����/task_002_02",
	}
	SelectSay(strMain);
end;

-- ���װ��Ů�ϰ�ĶԻ�
function task_002_00_female()

	local strMain = {
		"��ӭ���Ѽ��뽣����Ե2. ���ǵ��̵�ר������Ůװ, ��ɣ� ���ǽ�����չʾ���ʹ��<color=yellow>��װ<color>",
		"��ôʹ��/task_002_01",
		"�˽���/task_002_02",
	}
	SelectSay(strMain);
end;

-- ����װ���ϰ�Ľ���
function task_002_01()

	local strMaleMain = {
		"���·��Ǳز����ٵ�.��ͷ��,���º�����,",
		"��ֻ����ͨ��װ��",
		"������ֻ������,������װ��Ҫ����ĵط�����.",
		"������������<color=yellow>��Ʒ���ϰ�<color>.",
	}

	local strFemaleMain = {
		"���·��Ǳز����ٵ�.��ͷ��,���º�����,",
		"��ֻ����ͨ��װ��",
		"������ֻ������,������װ��Ҫ����ĵط�����.",
		"������������ <color=yellow>��Ʒ���ϰ�<color>!",
	}

	if GetSex()==1 then
		TE_Talk("task_002_02",strMaleMain);
	else
		TE_Talk("task_002_02",strFemaleMain);
	end;
	
end;

-- ���װ���ϰ�Ի�������,�ı����������3
function task_002_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?ti�m trang ph�c");
	TaskTip("ȥ����Ʒ���ϰ�");
end;

-- ����Ʒ���ϰ�ĶԻ�
function task_003_00()

local strMain = {
	"��ӭ���Ѽ��뽣����Ե2. ���ǵ��̵�ר������Ůװ,������. ��ɣ� ���ǽ�����չʾ���ʹ��<color=yellow>��Ʒ<color>",
	"��ôʹ��/task_003_01",
	"�˽���/task_003_02",
}
SelectSay(strMain);

end;

-- ����Ʒ����ϰ彲��
function task_003_01()

	local strMain = {
		"<color=yellow>Nam cao th?<color> th��ng mang Ng�c b�i, H?ph? <color=yellow>N?k?hi�p<color> mang h��ng nang, H�ng li�n. C�n nh�n c?nam n?��u �eo ���c.",
		"��ֻ����ͨ����Ʒ!",
	}
	TE_Talk("task_003_02",strMain);
end;

-- ������Ʒ���ϰ彲�ⷢ����,�ı����������4
function task_003_02()

	local strMain = {
		"����� <color=yellow>С����<color>�� �Ժ�,�ǵù�˹�ˣ� ���ڿ��Ե�<color=yellow>ҩ���ϰ�<color>��",
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?Kim ho�n");
	TaskTip("ȥ��ҩ���ϰ�");
	TE_Talk("",strMain);

end;

-- ��ҩ���ϰ�ĶԻ�
function task_004_00()

	local strMain = {
		"��ӭ���Ѽ��뽣����Ե2. ���ǵ��̵�ר����ҩ ��ɣ� ���ǽ�����չʾ���ʹ��<color=yellow>ҩƷ<color>",
		"��ôʹ��/task_004_01",
		"�˽���/task_004_02"
	}
	SelectSay(strMain);

end;

-- ��ҩ���ϰ�Ľ���
function task_004_01()

	local strMain = {
		"ҩƷ�Ǵ��������ز����ٵ�.",
		"û���䷽,����ֻ��ʹ��<color=yellow>��ҩ<color>. ��ȻЧ������,���Ը�̤�뽭�������а���",
	}
	TE_Talk("task_004_02",strMain);

end;

-- ����ҩ���ϰ彲�����ֱ����������,�ı����������5
function task_004_02()

	local strMain = {
		"���㼸ƿ <color=yellow>ҩ<color>�� �Ժ�,�ǵù�ˣ� ���ڿ��Ե�<color=yellow>�ӻ����ϰ�<color>��",
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?D��c �i�m");
	TaskTip("ȥ���ӻ����ϰ�");
	TE_Talk("",strMain);

end;

-- ���ӻ����ϰ�ĶԻ�
function task_005_00()

	local strMain = {
		"��ӭ���Ѽ��뽣����Ե2. ���ǵ��̵�ʲô����, ���",
		"����ʲô/task_005_01",
		"֪����/task_005_02",
	}
	SelectSay(strMain);

end;

-- ���ӻ����ϰ�Ľ���
function task_005_01()

	local strMain = {
		--"V�t ph�m tr�n giang h?mu�n h�nh v�n tr�ng, c�n hi�u r?�� v?sau s?d�ng! C�c lo�i {Ch�c C�m} v?{Da th�} c?th?ch?t�o H?gi�p. {C�c m�nh kim lo�i, B�o Th�ch} c?th?ch?t�oV?kh?",
		"����һЩ������Ʒ��,���ﻹ��������ʳ��.",
		"����˵��<color=yellow>���ص�����<color>��������Ʒ,��Ӧ��ȥ���￴��.",
	}
	TE_Talk("task_005_02",strMain);

end;

-- �����ӻ����ϰ�Ľ�������ֱ����������,�ı����������6
function task_005_02()

	local strMain = {
		--"B�n ti�m bu�n b�n nh? ch?c?2 t�m <color=red>Gi�m ��nh ph?color> n�y t�ng b�n tr? Sau n�y ��nh qu�i r�i <color=yellow>trang b?color>, ch?c�n d�ng chu�t ph�i nh�n v�o Gi�m ��nh ph?��a h�nh chu�t t�i trang b?l?c?th?bi�t ���c thu�c t�nh.",
		"��ȥ�� <color=yellow>Ұ��<color> ��!",
	}
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?T�p h�a");
	TaskTip("��ȥ��Ұ��");
	TE_Talk("",strMain);

end;

-- ������Ұ�ŵĶԻ�
function task_006_00()

	local strMain = {
		"�ջ�ܶ��",
		"�������Ǹ�����ܶණ��?",
		"������ ���и������˾�������飡 ���㵽��<color=yellow>4��<color> ��������.",
	}
	TE_Talk("task_006_01",strMain);

end;

-- ��Ұ�ŶԻ�������ı����������7
function task_006_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("��n g�p D?T�u");
	TaskTip("4���Ժ���������.");
end;

-- ���� 4 ��֮����Ұ�ŵĶԻ�
function task_007_00()

	local strMain = {
		"�������ô����?",
		"���� ����Ĺ����ǿ!",
		"<color=yellow>��������<color> ��<color=yellow>��ʦ<color> �Թ���Ƚ��˽�.",
	}
	TE_Talk("task_007_01",strMain);
end;

-- ��Ұ�ŶԻ�������ı����������8
function task_007_01()
	TE_SetTeachAdd();
	TaskTip("Ѱ�ҳ�������ѯ����������");
end;

-- ����������ĶԻ�
function task_008_00()

	local strMain = {
		"���ܸ�����<color=yellow>����<color>�ص���?",
		"���ҵ����ʵ���!",
		--"Qu�i ���c ph�n b?b�n ngo�i th�nh ho�c g�n m�n ph�i, c�ng xa th�nh th?��ng c�p qu�i c�ng m�nh, qu�i m�nh nh�t kho�ng <color=yellow>c�p 50<color>.",
		"��Ҫȥ��Ѩ,��Ϊ����ط���Σ��.",
		"����ô֪����Ѩ��Σ��?",
	}
	TE_Talk("task_008_00_01",strMain);

end;


function task_008_00_01()

	local strMain = {
		"�������ֵ� <color=yellow>��ɫ<color> ����ʶ������, <color=yellow>��ɫ<color> �������ȼ��������; <color=yellow>��ɫ<color> �������ȼ��ߵĹ���; <color=yellow>��ɫ<color> �������СͷĿ <color=yellow> ��ɫ <color> ˵�����ǹ�������!",
		"��������������������ֻ�����ɫ���ﲫ����",
		--"��������,��ʦ?",
		--"Ta bi�t r?qu�i ph�n b??��u, n�u c�n th?��n ��y <color=yellow>t�m hi�u<color> n�i luy�n c�ng th�ch h�p. C�n v?chi�n ��u th?t�m v?s?th�nh gi�o.",
		"ȥ�� <color=yellow>��ʦ<color>�˽�ս������!",
	}
	TE_Talk("task_008_01",strMain);

end;

-- �������Ի�������ı����������9
function task_008_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V?binh th�nh m�n");
	TaskTip("����ʦ�˽�ս������");
end;

-- ����ʦ�Ի�
function task_009_00()

	local strMain = {
		--"D?T�u b�o ta ��n t�m ti�n b�i h�c <color=yellow>c�ch chi�n ��u<color>.",
		"��ϲ��ָ�������书,������Ҫ�˽�<color=yellow>ս������<color>.�����������ҹ�����?",
		"�Ҳ����ף�",
		--"B�n tr�i ch?��nh V�t l? b�n ph�i l?��nh v?c�ng. C?th?s?d�ng <color=yellow>v?c�ng b�n ph�i<color> ��nh qu�i. V?c�ng m�n ph�i, m�t t�ch ho�c theo ta h�c ��u s?d�ng ���c.",
		--"Kh�ng ng?b�n ph�i h�u hi�u ��n nh?v�y?",
		"�����Ͳ����װ�",
		"������ٻ��ܹ���,��Ҫ�˽� <color=yellow>���ǵ�����<color>.",
		"����˵������̸�۹���ĵȼ�,��ɫ�ͷֲ�����.",
	}	
	TE_Talk("task_009_00_01",strMain);
end;

function task_009_00_01()

	local strMain = {
		"��ʵ���л�����,̸��<color=yellow>��ô��<color> ,�����������б�������,��������,��������,����,Ϯ������ʽ. ��ֻ��Ҫ֪�����ԶԸ����Ǽ���.",
		--"Ti�n b�i h��ng d�n r?h�n ���c kh�ng?",
		"<color=yellow>��������<color> �Ĺ���ֻ�б������ŷ��� <color=yellow>��������<color>�Ĺ��￴����ͻ��Զ�������;",
		"<color=yellow>�������� <color> ���˽�����˰�?",	
	}
	TE_Talk("task_009_01",strMain);
end;

-- ����ʦ�Ի�����չ
function task_009_01()

	local strMain = {
		"<color=yellow>��������<color> ��Ҫ�ǽ�,ľ,ˮ,��,��,��,����. �ͼ�����û������,�ȼ�20���¹��޾�<color=yellow>��������<color>,���ǻ�������Ԫ�ص������Զ��仯.",
		"�������Ǳ���ѡ�����Ԫ��,��<color=yellow>������<color>��?",
		"����<color=yellow>ɽ�����ͼ<color>����,������һ�־��������Ե����͹���,���ǲ����������Ĺ���,�������������������޷��˺�����.",
		"��ʧ����ô��? �������ͷ���?",
	}
	TE_Talk("task_009_02",strMain);
end;

-- ����ʦ�Ի�����չ
function task_009_02()

	local strMain = {
		"����Ϸ��û������,��������,ֻ����ʧ��ǰ�����1��,����5����һ������,���ս��ʧ��,������ѡ�񷵻س���,���ߵȴ��߼��Ķ�ü��ҽ��о�Ԯ;����������,��ֻ����ʧ��Ǯ������,���������ܾ�����ڲ��˺�.",
		"�Ϸ����Ϊ��չʾһЩ����",
		"��������<color=yellow>�Ṧ<color>Ҫ����.",
		"��ȥ�� <color=yellow>Ұ��<color>.",
	}
	TE_Talk("task_009_03",strMain);
end;

-- ����ʦ�Ի�������ı����������10
function task_009_03()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V?s");
	LearnSkill(20)--ֱ��ѧ���Ṧ
	TaskTip("��ϲ��,ѧ���Ṧ");
end;

-- ��ȥ��Ұ�ŶԻ�
function task_010_00()

	local strMain = {
		"��֪����ô����?",
		"���������������úܺ�.лл��!",
		"6���Ժ���������!",
	}
	TE_Talk("task_010_01",strMain);
end;

-- ��Ұ�ŶԻ���ı����������11
function task_010_01()
	TE_SetTeachAdd();
	TaskTip("6���Ժ��ٻ�����Ұ��.");
end;

-- �ȼ����� 6 ��ʱ������Ұ�ŵĶԻ�
function task_011_00()

	local strMain = {
		"����ͦ�찡?",
		"ûʲô��Ȥ��,���Ǵ��̵��ϰ�����ѧ���˺ܶණ��,�������Ǻ�æ. ������� <color=yellow>˵��<color> ����ô�ظ�?",
		--"Kh�ng vui l?ph�i r�i! Ng��i ph�i th��ng xuy�n n�i chuy�n v�i h?",
		--"Th?n�y v�y! H�y t�m <color=yellow>Ch?t�u l�u<color> v?<color=yellow>Ti�u s?color>, kh�ng ch�ng h?s?ch?d�y ���c g?th�m!",
		"ȥ��<color=yellow>��¥�ϰ�<color> ����!",
	}
	TE_Talk("task_011_01",strMain);
end;

-- ��Ұ�ŶԻ���ı����������12
function task_011_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?t�u l�u");
	TaskTip("ȥ�Ҿ�¥�ϰ�.");
end;

-- ���¥�ϰ�ĶԻ�
function task_012_00()
	local strMain = {
		--"Ti�n b�i c?th?ch?cho c�ch <color=yellow>giao l�u<color> ���c kh�ng?",
		--"��n gi�n th�i! Trong tr?ch�i mu�n ��i tho�i v�i ai ch?c�n nh�n ph�m <color=yellow><Ctrl><color> k�t h�p v�i chu�t ph�i l�n ��i ph��ng ch�n d�ng th�ch h�p l?���c.",
		--"<color=yellow>T�m hi�u<color>: Xem th�ng tin ��i ph��ng; <color=yellow>T�n g�u<color>: Chat m�t v�i ��i ph��ng; <color=yellow>Theo sau<color>: �i theo m�t ng��i n�o ��; <color=yellow>Giao d�ch<color>: M�i ng��i ch�i kh�c giao d�ch; <color=yellow>T?��i<color>: M�i ng��i ch�i c�ng t?��i.",
		--"Ng��i ch�i kh�ng n�m trong ph�m vi th?giao l�u b�ng c�ch n�o?",
		"<color=yellow>�ϻ�һ��....<color>",
	}
	TE_Talk("task_012_00_01",strMain);
end;


function task_012_00_01()
	local strMain = {
		--"Khi mu�n t�n g�u, nh�n <color=yellow><Enter><color> ho�c ch�n <color=yellow>T�n s?t�n g�u <color>, nh�p t�n ng��i ch�i v?n�i dung mu�n g�i �i, nh�n <Enter> l?���c.",
		--"T�n s?t�n g�u l?sao?",
		--"C?nhi�u t�n s?�� t�n g�u. <color=yellow>T�n s?ph?c�n<color> ng��i ch�i xung quanh nh�n th�y. <color=yellow>T�n s?c�ng c�ng<color> ng��i ch�i to�n server nh�n th�y. <color=yellow>T�n s?h?th�ng<color> hi�n th?th�ng b�o c�a h?th�ng.",
		--"<color=yellow>T�n s?��i ng?color> ch?trong ��i m�i th�y; <color=yellow>T�n s?M�n ph�i<color> ch?thu�c m�n ph�i m�i th�y; <color=yellow>B�n s?bang ph�i<color> ch?ng��i trong bang m�i th�y.",
		--"Sao c?l�c ch�n t�n s?r�i v�n kh�ng t�n g�u ���c?",
		"<color=yellow>�ϻ�һ��....<color>",
	}
	TE_Talk("task_012_01",strMain);
end;

-- ���¥�ϰ�ĶԻ���չ
function task_012_01()

	local strMain = {
		--"�� ��m b�o cho ch�t l��ng t�n g�u, m�i t�n s?��u c?h�n ch?ri�ng. T�n s?m�n ph�i c�n ng��i ch�i ph�i gia nh�p m�n ph�i, c�ch nhau 1 ph�t. T�n s?c�ng c�ng ��i h�i ng��i ch�i tr�n c�p 30, c�ch nhau 3 ph�t. T�n s?b?h�n ch?s?hi�n m�u �� r�t d?nh�n th�y.",
		--"Ta hi�u r�i!",
		--"Mu�n k�t giao h�o h�u n�n t�m <color=yellow>Ti�u s?color>, ng��i n�y c?nhi�u b�ng h�u, nh�t ��nh s?gi�p ���c ng��i!",
		"<color=yellow>�ϻ�һ��....<color>",
		"ȥ�� <color=yellow>��ʦ<color>",
	}
	TE_Talk("task_012_02",strMain);
end;

-- ���¥�ϰ�Ի���ı����������13
function task_012_02()
	TE_SetTeachAdd();
	TaskTip("ȥ����ʦ.");
end;

-- ����ʦ�ĶԻ�
function task_013_00()

	local strMain = {
		--"Xin ti�n b�i ch?d�n cho nh�ng kinh nghi�m <color=yellow>K�t giao b�n h�u<color>!",
		--"Qu?khen! ��n gi�n th�i mu�n k�t b�ng h�u v�i ai nh�n <color=yellow><ctrl><color> k�t h�p chu�t ph�i nh�p l�n ng��i ��i ph��ng ch�n <color=yellow>h�o h�u<color>, h?th�ng t?��ng xin ph�p ng��i ch�i ��. N�u ��ng ?t�n ng��i �� l�p t�c hi�n trong danh s�ch h�o h�u. V?sau ch?c�n nh�n <color=yellow><F6><color> l?bi�t ���c h?c?online hay kh�ng.",
		--"Ta nghe c?ng��i n�i v?�� th�n thi�n, ti�n b�i c?th?n�i r?���c kh�ng?",
		"<color=yellow>�ϻ�һ��....<color>",
	}
	TE_Talk("task_013_00_01",strMain);
end;

function task_013_00_01()
	local strMain = {
		--"Ng��i ch�i sau khi tr?th�nh h�o h�u s?c?th�m <color=yellow>�i�m th�n thi�n<color>. Ng��i ch�i b�nh th��ng t?��i ��nh qu�i, t�n g�u c�ng ���c t�nh �i�m th�n thi�n, m�t s?v�t ph�m ��c bi�t nh?hoa h�ng c�ng gi�p t�ng �i�m th�n thi�n. N�u tr�n 1000 �i�m th�n thi�n c?th?<color=yellow>K�t Ngh�a Kim Lan<color>, tr�n 1500 �i�m, hai ng��i kh�c gi�i c?th?��n C?��o t�m Nguy�t L�o k�t th�nh <color=yellow>phu th?color>.",
		--"H�o h�u, kim lan ho�c phu th?b�nh th��ng c�ng t?��i luy�n c�ng s?���c t�nh th�m kinh nghi�m.",
		--"Th�o n�o g�n ��y c?nhi�u ng��i xin ���c t?��i.",
		--"R�nh r�i n�n �i g�p <color=yellow>V?N��ng<color>! B�y gi?c?th?quay v?g�p D?T�u.",
		"��ȥ�� <color=yellow>Ұ��<color>��",
	}
	TE_Talk("task_013_01",strMain);
end;

-- ����ʦ�Ի�������ı����������14
function task_013_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ti�u s");
	TaskTip("��ȥ��Ұ��");
end;

-- ������Ұ�ŵĶԻ�
function task_014_00()

	local strMain = {
		"֪����ô����������?",
		--"Hi�u r�i! Hay qu?",
		--"Gi?h�y �i m�i m�t ng��i b�n theo ng��i v?��y, s?c?<color=yellow>L?v�t<color> cho ng��i! N�u kh�ng t�m ���c c?th?t?l�p t?��i r�i m�i b�n h�u v? nh�ng  <color=yellow>l?v�t<color> s?kh�ng t�t l�m!"
	}
	TE_Talk("task_014_01",strMain);
end;

-- ��Ұ�ŶԻ���ı����������15
function task_014_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("trao ��i nhi�m v?v�i ng��i kh�c");
	TaskTip("�Ҹ������������Ұ��");
end;



-- ����ٴδ���������Ұ�ŶԻ�
-- ���������1 Ϊ�Ѿ����  2 Ϊ��û�����  3 Ϊѡ��֪����ô���  4 Ϊѡ��û�����
function task_015_check(nState)
	local strMain = {
		"��һ��С�������,ϣ�����������ܳ�Ϊ�˴˵ĺ�����.",
		"����ƭ����?�������������?",
		"��<color=yellow>��� <color>,���������˼������,Ȼ���������.",
		"�ܶ���������!",
		"ϣ�����ҵ����ʵ�����.",
		"����Ҳ���������,����ĳ�˺�����������!",
	}
	
	if (nState==1) then
		Talk(1,"task_015_01",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	elseif (nState==5) then
		Talk(1,"task_015_01",strMain[5]);
	elseif (nState==6) then
		Talk(1,"",strMain[6]);
	end
	
	return
	
end;

-- ������������֮��ı����������16
function task_015_01()

local strMain = {
	"8���Ժ���������",
}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Nhi�m v?k�t giao h�o h�u");
	TaskTip("8���Ժ��ٻ�����Ұ��!");
	TE_Talk("",strMain);
end;

-- ���� 8 ��֮���Ұ�ŵĶԻ�
function task_016_00()

	local strMain = {
		"����2�������ܼ��������ɣ�",
		"��лǰ������ָ��.",
		"�����,�ҵ�ְ����ָ������",
		"������Ȼ��֪�������￪ʼ!",
		"ȥ��<color=yellow> ���ɽ����� <color>, �˽� <color=yellow>��������<color> �����,Ȼ��ش��� <color=yellow>6��<color>����."
	}

	TE_Talk("task_016_01",strMain);
end;

-- ��Ұ�ŶԻ�������ı����������17
function task_016_01()
	TE_SetTeachAdd();
	TaskTip("ȥ�����ɽ�����");
end;

-- �ٴλ�����Ұ�ŵĶԻ�
function task_017_00()
	Say("���˽���ɵ���ɫ��?",2,"�˽���/Teach_Qustion_001","��û��/task_exit");
	return
end;

-- ��ȫ��ȷ�Ļش������
function task_017_01()

	local strMain = {
		"�ܺ�ȥ�� <color=yellow> ������<color> ",
	}
	TE_Talk("task_017_02",strMain);
end;

-- �ı����������18
function task_017_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Hi�u v?c�c m�n ph�i");
	TaskTip("ȥ�� ������");
end;

-- ��������ĶԻ�
function task_018_00()

	local strMain = {
		--"Theo B�ch ti�n sinh ��p �n nh?v�y ��ng kh�ng?",
		--"��ng r�i! Ng��i bi�t g?v?s? hi�p, �n tam ��i <color=yellow>����<color>?",
		--"Nh?ti�n sinh ch?gi�o!",
		--"<color=green>B�ch Hi�u Sinh<color>: Giang h?c?th�p ��i ph�i ph�n bi�t l?Thi�u L�m, V?�ang, Nga My, C�i Bang, ���ng M�n, Minh Gi�o, C�n L�n, Ng?��c, Th�y Y�n v?Thi�n Ba D��ng ph? nh�ng hi�n c?9 m�n ph�i thu nh�n �� t?l?Thi�u L�m, V?�ang, Nga My, C�i Bang, ���ng M�n, Ng?��c, Thi�n Ba D��ng Ph? C�n L�n, Th�y Y�n.",
		--"<color=green>B�ch Hi�u Sinh<color>: Thi�u L�m c?3 h��ng g�m Thi�n T�ng, V?T�ng v?T�c gia; V?�ang c?T�c gia v?��o gia; Nga My c?T�c gia v?Ph�t gia; C�i Bang c?T�nh Y v??Y; ���ng M�n c?m�t h��ng; Thi�n Ba D��ng Ph?c?Th��ng k?v?Cung k? Ng?��c c?C?S?v?Hi�p ��c; C�n L�n c?Thi�n S? Th�y Y�n c?V?N?v?Linh N? Nh�ng b�t c?c�c m�n ph�i cung c�p m�y h��ng tu luy�n, m�i ng��i ch?���c ch�n m�t h��ng tu h�nh.",
		--"<color=green>B�ch Hi�u Sinh<color>: 17 h��ng ch?ch�n ���c 1 th?ti�c nh?",
		--"<color=green>B�ch Hi�u Sinh<color>: V?v�y m�i c?����. 17 h��ng hay 20 h��ng chung quy c�ng l?s?, hi�p, �n tam ��i ����. N�u c�c h?hi�u �i�u n�y th?s?kh�ng nghi ho�c r�i.",
		--"Ti�n sinh n�i r?h�n ���c kh�ng?",
		"�ϻ�..",
	}
	TE_Talk("task_018_00_01",strMain);
end;

function task_018_00_01()
	local strMain = {
		--"S? hi�p, �n th�c t?ch?h��ng tu luy�n c�a nh�n v�t, ng��i ch�i theo <color=yellow>s?color> c?th�n th?c��ng tr�ng v?s�c m�nh h�n ng��i.",
		--"Theo <color=yellow>Hi�p<color> s�c m�nh v?nhanh nhen c�n b�ng; theo <color=yellow>�n<color> kh�ng quan tr�ng b�n ngo�i, ch?y�u r�n luy�n tinh th�n.",
		--"Ti�n sinh n�i xem ta n�n �i theo h��ng n�o?",
		--"Ng��i ch�a gia nh�p m�n ph�i, sao ch�n ���c h��ng �i, n�n th�n tr�ng khi ��a ra quy�t ��nh.",
		--"Ti�n sinh h��ng d�n th�m ���c kh�ng?",	
		"�ϻ�..",
	}
	TE_Talk("task_018_01",strMain);
end;

-- ��������ĶԻ���չ
function task_018_01()

	local strMain = {
		--"Th�t ra theo h��ng n�o c�ng c?�u �i�m ri�ng c�a n? c�n ph�i ch�n l�a s?ph?sau khi gia nh�p m�n ph�i.",
		--"Nhi�u m�n ph�i v?nhi�u h��ng tu luy�n, ta ph�i l�m sao?",
		--"Tu h�nh t�y m�i ng��i th�i!",
		--"�a t?ti�n sinh!",
		--"H�y quay v?g�p <color=yellow>D?T�u<color> �i!"
		"�ϻ�..",
	}
	TE_Talk("task_018_02",strMain);
end;

-- ��������Ի�������ı����������19
function task_018_02()
	TE_SetTeachAdd();
    Earn(100);
	ModifyReputation(4,0);
	GivePlayerExp(SKeyXinShou,"baixiaosheng")
	TaskTip("��ȥ��Ұ��");
end;

-- �ٴλ�����Ұ�ŵĶԻ�
function task_019_00()

	local strMain = {
		"��֪���˰�?",
		--"B�ch ti�n sinh n�i v�i v�n b�i v?s?, hi�p, �n tam ��i ����.",
		--"B�ch Hi�u Sinh qu?th�t m�u tr?h�n ng��i, v?sau c�n g?ng��i c?��n �� th�nh gi�o. ��t <color=yellow>c�p 9<color> ��n t�m ta! Gi?h�y �i th�nh gi�o <color=yellow>Ch?th��ng h�i<color>!"
	}
	TE_Talk("task_019_01",strMain);
end;

-- ��Ұ�ŶԻ�������ı����������20
function task_019_01()
	TE_SetTeachAdd();
	TaskTip("9���Ժ�������Ұ��");
end;

-- ��ҵ��� 9 ��֮���Ұ�ŶԻ�
function task_020_00()

	local strMain = {
		"30�ꡭ����죡",
		"��ʮ��ǰ��������ô˵?",
		"���Ŵ���<color=yellow> �꾩 ������<color>",
	}

	TE_Talk("task_020_01",strMain);

end;

-- ��Ұ�ŶԻ�������ı����������21
function task_020_01()
	TE_SetTeachAdd();
	TaskTip("ȥ���꾩 ������");
	AddItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"yeshou3")
	RestoreStamina()
	--CreateTrigger(4,199,80);
end;


function task_021_00()

	local strMain = {
		"��"..GetPlayerSex().."��������",
		"Ұ��Ҫ�Ұ�����Ŵ�������",
		"�������ˣ�",
		"����Yan���ţ�",
		"�Һö�,���ҵ�һ��<color=yellow>��ͷ<color>��?",
		"��ͷ�ǡ���",
		"�򿪼��ܽ���,������ͷ",
		--"Nh?k? Ng��i m?<color=yellow>giao di�n k?n�ng<color> ch�n <color=yellow>tuy�t k?gia truy�n<color> sau �� nh�n <color=yellow>B�nh ng?color> r�i <color=yellow>��ng ?color> l?���c.",
		--"�� v�n b�i th?xem!",
	}

	TE_Talk("task_021_01",strMain);

end;

-- ��������Ի�������ı����������22
function task_021_01()
	TE_SetTeachAdd();
	DelItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"zhaoyannian")
	TaskTip("����������һ����ͷ");
end;



function task_022_00()

	local strMain = {
		"����һ����������,�����˸��㽲��ʮ��ǰ�Ĺ���.",
		"лл!",
		--"30 n�m tr��c th�i t?Tri�u Khu�ng D�n �o�t ���c <color=yellow>b�n �� S�n H?X?T�c<color> t?tay S�i Vinh, b?m�t li�n l�c c�c m�n ph�i c�ng t�m b�n �� kho b�u b�n trong ��ng th�i ph�t ��ng binh bi�n Tr�n ki�u, m�u �� so�i v? Kh�ng ai bi�t �� ch�nh l?t�m b�n �� c�a Thi�n, ��a, Nh�n <color=yellow>Tam Gi�i ch�n ph?color>, long m�ch c�a Trung Nguy�n, b�u v�t m?S�i Vinh �em t�nh m�ng ra gi�nh l�y. Vi�c l�m c�a th�i t?d�n ��n tr�i ��t c�m ph�n, trong ng�y ��i l?t?tr�i, S�n H?X?T�c ��t nhi�n h�a th�nh tro b�i, bay �i kh�p n�i.",
		"��ʮ��ǰ...de.de...!",
		--"Th�i t?bi�t m�nh �� l�m ngh�ch ?tr�i, ��o l�n c�n kh�n tam gi�i, y�u ma hi�n th? Trung Nguy�n s�p l�m v�o ��i ki�p. �� s�a sai l�m, m�t b�n ch�n ch�nh l�i c�c c�c di�n, m�t kh�c b?c�o thi�n h? hy v�ng t�m ���c ng��i ki�m l�i nh�ng m�nh b�n �� S�n H?X?T�c."
	};

	if GetItemCount(1,1,1)>=1 then
	    DelItem(1,1,1,1);
		TE_Talk("task_022_01",strMain);
		return
	else
		Say("�������ͷ��!",0);
	end;
	
end;

-- ��������Ի�������ı����������23
function task_022_01()

	local strMsg = {
		--"C�u chuy�n t��ng ch�ng ch�m v�o qu�n l�ng, ��t nhi�n c?tin th�i t?b�o b�nh qua ��i, ng��i k?v?kh�ng ph�i th�i t?Tri�u ��c Ph��ng m?l?em vua Tri�u Quang Ngh�a, tin ��n lan truy�n ��n d�n gi�n....100 ng�n binh l�nh c�a n��c Li�u �� k?c�n Nh�n M�n Quan, m�t s?h�o ki�t lai l�ch kh�ng r?chi�m c?L��ng S�n B�c, Th�nh �� ph?v?Tuy�n Ch�u ph?xung quanh xu�t hi�n nhi�u qu?qu�i.",
		--"K?t?�� tin t�c v?t�m b�n �� S�n H?X?T�c lan truy�n kh�p Trung Nguy�n.",
		--"T��ng lai kh�ng xa, Trung Nguy�n s?ph�i ��i m�t v�i m�t c�c di�n tranh gi�nh, t�n s�t l�n nhau �� c?���c t�m b�n �� qu?gi?�y."
		"��������ƺ���������",
	};
	local strMain = {
		"�Ҳ��������Թ�!",
		"10����������.",
		"�һ��!"
	};

	TE_SetTeachAdd();
	TaskTip("10 ��֮������������");
	GivePlayerExp(SKeyXinShou,"zhaoyannian_wotou")
	TE_Talk("",strMsg);
	TE_Talk("", strMain);
end;

function task_023_00()

	local strMain = {
		"�ܺã� ��Ҫ������ʧ��.",
		--"Ta c?3 b�c th?nh?mang cho <color=yellow>D?T�u<color>. L�m phi�n b�ng h�u qu?",
		"�õ�!",
	}
	TE_Talk("task_023_01",strMain);
end;

-- ��������Ի�������ı����������24
-- �������������
function task_023_01()
	TE_SetTeachAdd();
	AddItem(2,0,49,3);
	TaskTip("����3���Ÿ�Ұ��");
end;


function task_024_00()

	local strMain = {
		--"V?r�i ? Ng��i bi�t Tri�u Di�n Ni�n l?ai kh�ng?",
		--"V�n b�i kh�ng bi�t!",
		--"Tri�u Di�n Ni�n v�n ng��i ho�ng t�c, do ch�n c�nh tranh quy�n ch�n ho�ng cung m?quy�t ��nh b?h�t danh l�i, phi�u b�t giang h?",
		--"Th?ra l?v�y!",
		--"Ng��i �� c?ch�t th�nh t�u, c?th?��n c�c m�n ph�i h�c h�i th�m. C?g�ng nh?",
		"����...",
	}
	TE_Talk("task_024_01",strMain);
end;


function task_024_01()

	local strMain = {
		"���ܰ��Ұ���3�����ͳ�ȥ��",
		"��˭?",
		--"Tri�u Di�n Ni�n lo c�c ��a ph��ng x�y ra <color=yellow>bi�n c?color>, cho n�n mu�n li�n l�c c�c v?sau. <color=yellow>Kh�u Chu�n<color> ng��i ch�nh tr�c hi�n �ang l�m quan ?<color=yellow>Bi�n Kinh<color>; <color=yellow>Ph�m Tr�ng Y�m<color> v�n quan hi�n ?<color=yellow>Nam Th�nh ��<color>; <color=yellow>V��ng Nghi�p V?color> th��ng gia s�nh s?hi�n ?<color=yellow>Tuy�n Ch�u<color>.",
		"<color=yellow>�꾩�Ŀ�׼,�ɶ��ķ�����,Ȫ�ݵ���ҵΰ<color>",
		"�����Ǵ������ǣ�����һЩ�������,�չ˺�����ọ́�",
		"�ǳ���л",
	}
	TE_Talk("task_024_02",strMain);
end


-- ��Ұ�ŶԻ�������ı����������25
function task_024_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chuy�n giang h");
	TaskTip("���Ÿ� ��׼�������͡���ҵΰ");
	SetTask(130,1); --��ҵΰ
	SetTask(131,1); --��׼
	SetTask(132,1); --������
end;


-- ��������������
function task_giveout()
--	TE_SetTeachState(23);
	Say("Th�y ng��i b�n l�nh h�n ng��i, l�o ��y kh�ng c�n d�y nhi�u, v?sau �i�u g?kh�ng hi�u c?th?��n t�m ta.", 0);
end;

-- ʲôҲ�����Ŀպ���
function task_exit()

end;






-- ��������
function Teach_Basic()

	local strMain = {
		"D�ng chu�t ch?v�o b�t k?n�i n�o trong b�n �� �� di chuy�n nh�n v�t. N�u kh�ng x�c ��nh ���c v?tr? m?<color=yellow>B�n �� nh?color>, d�u ch�m <color=yellow>v�ng<color> b�n trong ch?cho v?tr?c�a ng��i ch�i.",
		"Ra ngo�i th�nh n�u kh�ng may ch?chu�t l�n qu�i, nh�n v�t s?t?��ng ��nh qu�i li�n t�c, c�n ch??",
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ����ȼ�����
function Teach_Level()

	local strMain = {
		"Nh�n v�t d�ng <color=yellow>�i�m kinh nghi�m<color> �� t�ng c�p. Nh�n <color=yellow><F3><color> m?Giao di�n trang b?nh�n v�t s?th�y <color=yellow>n�t t�ng c�p<color>. Khi �i�m kinh nghi�m l�n h�n kinh nghi�m �� t�ng c�p, c?th?<color=yellow>t�ng c�p nh�n v�t<color>. Sau khi t�ng c�p nh�n v�t s?c?<color=yellow>�i�m ti�m n�ng<color>. ��ng c�p c�ng cao �i�m ti�m n�ng c�ng nhi�u.",
		"C?nhi�u c�ch �� nh�n <color=yellow>�i�m kinh nghi�m<color>, nh?��nh qu�i, l�m nhi�m v? b?quan tu luy�n th�m ch?truy�n c�ng...Kinh nghi�m hi�n t�i �nh h��ng ��ng c�p v?k?n�ng nh�n v�t, n�n c�n ch??t?l?ph�n b?c�n b�ng!"
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ����Ǳ�ܵ����
function Teach_Point()

	local strMain = {
		"Nh�n v�t c?5 ti�m n�ng: <color=yellow>S�c m�nh<color>, <color=yellow>N�i c�ng<color>, <color=yellow>G�n c�t<color>, <color=yellow>Th�n ph�p<color>, <color=yellow>Linh ho�t<color>.",
		"<color=yellow>S�c m�nh<color> quy�t ��nh ��nh ngo�i c�ng v?s�c l�c; <color=yellow>N�i c�ng<color> quy�t ��nh n�i l�c, ��nh n�i c�ng v?ph�ng th?n�i.",
		"<color=yellow>G�n c�t<color> quy�t ��nh sinh l�c v?ph�ng th?ngo�i; <color=yellow>Th�n ph�p<color> quy�t ��nh n?tr�nh, ch�nh x�c v?t�c �� ��nh; <color=yellow>nh�n r?color> quy�t ��nh t�n c�ng ch?m�ng v?t?��ng n?tr�nh, �nh h��ng ch�nh x�c v?t�c �� ��nh.",
		" LiT�n th?n�n t�ng nhi�u v�o <color=yellow>S�c m�nh<color> v?<color=yellow>G�n c�t<color>."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ����׬Ǯ
function Teach_Earn()

	local strMain = {
		"Ng��i c?th?ra ngo�i th�nh ��nh qu�i mang v�t ph�m v?b�n cho c�c ch?ti�m ho�c l�m m�t v�i nhi�m v?��n gi�n. <color=yellow>B�ch Hi�u Sinh<color> trong th�nh c?c�u h�i cho T�n th? ��p ��ng s?���c ph�n th��ng. B�n c�nh �� tri�u ��nh c�n ph�i Kh�m Sai ��i th�n ti�p t?T�n th? nh?n�m b�t c?h�i nh?",
		"��n <color=yellow>c�p 10<color> c?th?mua b�n, v�n ti�u, t�m ki�m kho b�u, ��nh l�i ��i..."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ���ܰ�������
function Teach_Faction()

	local strMain = {
		"Hi�n c�c m�n ph�i �ang thu nh�n �� t? ta th�y ng��i t?ch�t c�ng kh�ng t? ch?c�n c?g�ng luy�n ��n c�p 10 ��i tho�i v�i <color=yellow>S?gi?m�n ph�i<color> l?c?th?gia nh�p.",
		"M�i m�n ph�i c?h��ng tu luy�n kh�c nhau, c�n t�m hi�u k?��c s�c c�a h?"
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ���ܵ�ǰ����������
function Teach_Something()

	local strMain = {
		"����Ҫ����о�����кཻܶ��",
		"�����Գ�ȥ�����ս��,�������������ߵ�̫Զ,��Ϊ����ط��ǳ����,�������,�������������.���������.",
		"����������ָ����������������������,��Ӧע������ע������,��  <color=yellow><F11><color> �鿴˵��."
	}
	TE_Talk("task_000_okay",strMain);
end;





-- �����ʴ��������
function Teach_Qustion_001()
	Say("����������һЩ����, ����1: ����������ͽ��?",4,"10������/Teach_Qustion_Error","8������/Teach_Qustion_Error","9�����ɣ��ԣ�/Teach_Qustion_002","3������/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("�ô𰸣� ��һ������: �䵱������˭����",3,"���ҵ��ӣ��ԣ�/Teach_Qustion_003","�׼ҵ���/Teach_Qustion_Error","����/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("�ô𰸣� ��һ������: �����ϴ��Ϊʲô",4,"M�n ch/Teach_Qustion_Error","���ѣ��ԣ�/Teach_Qustion_004","Ch��ng m�n/Teach_Qustion_Error","T�ng qu�n/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("�ô𰸣� ��һ������: �� t?t�c gia Nga My s?d�ng binh kh?n�o?",4,"Th�ch/Teach_Qustion_Error","Ki�m/Teach_Qustion_Error","C�m���ԣ�/Teach_Qustion_005","B�t/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("�ô𰸣� ��һ������: ������������ϸ��,��ش�72��. ��ô�����м�������·��?",4,"1��/Teach_Qustion_Error","2��/Teach_Qustion_Error","3�����ԣ�/Teach_Qustion_006","4��/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("�ô𰸣� ��һ������: Nghe n�i �� t?C�i Bang c??Y, T�nh Y, v�y �� t?T�nh Y tu luy�n v?c�ng n�o?",4,"C�n ph�p/Teach_Qustion_Error","Ch��ng ph�p���ԣ�/task_017_01","Thu�n d��ng/Teach_Qustion_Error","B�y/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("����������������˵����, ng��i th?v?xem l�i!",1,"�ðɣ� �����ҿ�����/task_exit");
end
