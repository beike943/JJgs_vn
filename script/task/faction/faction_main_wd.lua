
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �䵱��������ʵ�崦��ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- ���Ϻ����˵ĶԻ�
function task_001()

local strMain = {
		"Ҫ��Ϊ���䵱�ĵ��ӣ����ò����С����¾������˽��京�壬Ȼ���ݴ�ʦ���ճ̣��Ա��ܹ���ʼ������ ��������<color=yellow>������<color> �˽���?"
	}

TaskTip("�������˸����������������濪ʼ����!");
TE_Talk(getn(strMain), "task_002", strMain);

end


-- �Ի�������ı������1
function task_002()

	SetTask(1002,1);

end


-- ���������ĶԻ�
function task_003()

local strMain = {
		"�����¾���������д�ģ���Ϊ�������ᡣ�Ͼ�37�£��¾�44�£�������̣��ǵ��̵�ָʾ���ڳ�Ϊ�䵱����֮ǰ �������벢����京�塣�Ƿ�Ҫ���ԣ�",
		"���ȼ��µ��¾�/task_003_read",
		"��ʼ����/task_003_next",
		"�һ�����������/task_exit"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end


-- ������¾�
function task_003_read()

local strMain = {
		"��o Kh?��o, Phi Th��ng ��o. Danh Kh?Danh, Phi Th��ng Danh. V?Danh Thi�n ��a Chi Kh�i. H�u Danh V�n V�t Chi M�u. C?Th��ng V?D�c D?Quan K?Di�u.",
		"Th��ng H�u D�c D?Quan K?Di�u. Th?L��ng Gi?��ng Xu�t Nhi D?Danh. ��ng V?Chi Huy�n. Huy�n Chi H�u Huy�n, Ch�ng Di�u Chi M�n.",
		"C�c Th�n B�t T?Th?V?Huy�n T�n. Huy�n T�n Chi M�n Th?V?Thi�n ��a C�n. Mi�n Mi�n Nh��c T�n, D�ng Chi B�t C�n.",
		"Th��ng Thi�n Nh��c Th�y. Th�y Thi�n L�i V�n V�t Nhi B�t Tranh, X?Ch�ng Nh�n Chi S?�c, C?C??��o. C?Thi�n ��a, T�m Thi�n Uy�n D?Thi�n Nh�n, Ng�n Thi�n T�n, Ch�nh Thi�n Tr? S?Thi�n N�ng, ��ng Thi�n Th�i. Phu Duy B�t Tranh, C?V?V�u.",
		"��i Th�nh Nh��c Khuy�t, K?D�ng B�t T? ��i Doanh Nh��c Xung, K?D�ng B�t C�ng. ��i Tr�c Nh��c Khu�t. ��i X�o Nh��c Chuy�t. ��i Bi�n Nh��c N�t. T�nh Th�ng T�o. Thanh T�nh Vi Thi�n H?Ch�nh.",
		"H�u V�t H�n Th�nh ti�n thi�n ��a sanh. T�ch H?Li�u H?��c L�p B�t C�i, Chu H�nh Nhi B�t ��i, Kh?D?Vi Thi�n H?M�u. Ng?B�t Tri K?Danh, C��ng T?Chi Vi�t ��o. C��ng Vi Chi Danh Vi�t ��i. ��i Vi�t Th? Th?Vi�t Vi�n, Vi�n Vi�t Ph�n.",
		"C?��o ��i, Thi�n ��i, ��a ��i, Nh�n Di�c ��i. V�c Trung H�u ��i, Nhi Nh�n C?K?Nh�t Y�n. Nh�n Ph�p ��a, ��a Ph�p Thi�n, Thi�n Ph�p ��o, ��o Ph�p T?Nhi�n."
	}
	
TE_Talk(getn(strMain), "task_003", strMain);

end





-- ���е��¾�
function task_003_next()

local strMain = {
		"�����¾����ĵ�һ�仰��ʲô��",
		"��o Sinh Nh�t, Nh�t Sinh Nh? Nh?Sinh Tam, Tam Sinh V�n V�t/task_error",
		"Nh�n Ph�p ��a, ��a Ph�p Thi�n, Thi�n Ph�p ��o, ��o Ph�p T?Nhi�n/task_error",
		"���ǵ����ǳ��������������ǳ���/task_004_next"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_004_next()

local strMain = {
		"�Ǳ��������������?",
		"Huy�n V?task_error",
		"��/task_005_next",
		"H�u Huy�n/task_error"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_005_next()

local strMain = {
		"ͨ��?",
		" Kim /task_error",
		"M�c/task_error",
		"��/task_006_next",
		"H�a/task_error",
		"Th?task_error"
	}

Say(strMain[1],5,strMain[2],strMain[3],strMain[4],strMain[5],strMain[6]);

end

function task_006_next()

local strMain = {
		"��Ҫ��΢����ϵ��ʲô��",
		"V?vi/task_error",
		"Sung Doanh/task_error",
		"Khu�t Chuy�t/task_error",
		"��͢/task_007_next"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

function task_007_next()

local strMain = {
		"���ط����𷨾��ۣ��𷨾��ۣ���֮·��",
		"��Ȼ/task_008",
		"�m d��ng/task_error",
		"V?vi/task_error",
		"H?th�c/task_error"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

-- ȫ���ش���ȷ��֮��ı����������2
function task_008()

	SetTask(1002,2);
	
	Say("�ں̵ܶ�ʱ���ھͼ�ס�ˡ����¾�����������Ҳ�ܲ���Ѱ��<color = yellow> 1 ƿ�� <color> �� <color = yellow> 1 �����ٽ�<color> �������̵��򣬾�����å���ϣ�",0);
	
	TaskTip("ȥ��1�����ٽ���1ƿ�ƣ�");
	
end


function task_009()

local strMain = {
		"�����Ľ����ڣ�����ұ���壡",
		"�� b�i T?s? C?th?quay v?g�p <color=yellow>Ch��ng m�n<color>."
	}

	if (GetItemCount(0,2,14)>=1) and (GetItemCount(2,1,12)>=1) then
	
		TE_Talk(getn(strMain), "task_010", strMain);
		
		TaskTip("������ɿ��飬���Է������ҵ��������ˣ�");
		
	else
	
		Say("�Ͻ����ң�",0);
	
	end
	
return

end

-- ɾ�����;ƣ����ı����������3
function task_010()

	DelItem(0,2,14,1);
	DelItem(2,1,12,1);
	SetTask(1002,3);

end


-- �ؼ����ŵĶԻ�
function task_011()

local strMain = {
		"�ڽ̽���������Ϊ�䵱�ĵ��ĵ��ӡ� ���������������ع��򣬳�����ϰ��������Ҫ�������ǵ�������"
	}
	
TE_Talk(getn(strMain), "task_012", strMain);

end


-- �����ŶԻ��������ı����������4
function task_012()

	SetTask(1002,4);
	
	SetPlayerFaction(2)
	SetPlayerRoute(13)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,74,1)
		AddItem(0,108,74,1)
	elseif i==2 then
		AddItem(0,109,78,1)
		AddItem(0,108,78,1)
	elseif i==3 then
		AddItem(0,109,82,1)
		AddItem(0,108,82,1)
	else
		AddItem(0,109,86,1)
		AddItem(0,108,86,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ����䵱��")
	TaskTip("���Ѿ��������䵱��")
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function task_exit()

end;


function task_error()

	Say("���Ѳ����ڵ��¾������в�������",0);

end


function fix_wd()
FN_SetTaskState(FN_WD, 0);
Say("������һЩС���⣬���ѽ���� �������ٴμ������塣",0);
end;