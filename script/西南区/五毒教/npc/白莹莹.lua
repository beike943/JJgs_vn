-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC��ӨӨScript
-- By StarryNight
-- 2006/01/04 PM 16:26

--������ ������ ������ 
--��: ���� �ܻ� ���� ���� ���� ��Ȣ �ɲ� ��ж ���� ���� ���� ���� ���� ���� ��լ ���� ���� ��׽ ��� ��ľ ���˿� ��ˮ 
--��: ���� ���� �޷� ���� 
--��������: �帻 ����  
--�����˼�: ��ɷ С�� ���� ���� Ԫ��  
--ÿ��̥��ռ��: ռ�������ڱ� 
--����: ����ˮ ִִλ 
--��: ����(����)ɷ�� 
--����ټ�: �ﲻ����������ǿ �Ѳ�Զ�в������ 

-- ======================================================

-- ������������ͷ�ļ�
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\faction\\faction_main_wp.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\practice\\practice_main.lua"); --�����Ľű�
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�

-- ���������������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv30\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
----------------------
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Ng? ��c Gi�o Ch? <color>: "
function main()

local nTaskValue = GetTask(FN_WP);

	if ((nTaskValue >= 1) and (nTaskValue <= 6)) then
		Say("Ng��i mu�n nh�p m�n ?? H�y g�p <color=yellow>b�n v? qu? s?<color> th��ng l��ng.",0);
		return
	elseif (nTaskValue == 7) then
		task_011();
		return
	elseif (nTaskValue > 8) then
		fix_wp();
		return
	else
		main_new();
	end
end;

-- ʦ���������
function about_faction_task()
	Say("����ʲô?",
		3,
		"��ʼʦ������/start_faction_tasklink",
		"ʦ�Ź��׶Ȳ�ѯ/check_query_faction_contri",
		"ʦ������˵��/shimenshuoming")
--		"��Ҫ�޸�ʦ�������޷���ɵ�����/repair_faction_bug")
end;

-- �޸�ɱ�������޷���ɵ�bug
function repair_faction_bug()
	Say("�����æ, ���������������. ����ҾͰ���ȡ��,������Ҫ�۳�5��ʦ�Ź��׶ȣ���ȷ����?", 
		2,
		"�ǵģ���ͬ��/confirm_repair_bug",
		"��������/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("�Ѿ�ȡ����!", 0)
end;

--��������
function interwudu()		
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) then
		Say("B�ng h�u �� gia nh�p m�n ph�i kh�c, kh�ng th? gia nh�p Ng? ��c Gi�o!",0)
	elseif GetLevel() < 10 then	--�ȼ����
		Say("Ng? ��c Gi�o ta ��i v�i nh�n t�i kh�ng c�u n?, nh�ng c�ng kh�ng th? qua loa, b�ng h�u ��t <color=yellow>c�p 10<color> r�i quay l�i nh?!",0)
	elseif GetPlayerFaction() == 7 then	--���ɼ��
		Say("B�ng h�u kh�ng ph�i �� gia nh�p Ng? ��c gi�o r�i sao? Sao mau qu�n th?.",0)
	elseif GetPlayerFaction() > 0 then	--���ɼ��
		Say("Ph�m �� t? Ng? ��c Gi�o r�t trung th�nh, B�ng h�u �� l? ng��i c�a m�n ph�i kh�c, xin th? l�i cho b�n gi�o kh�ng th? thu gi?.",0)
	else
		task_000();
	end
end;

--ѧϰ�书
function skilllearn()
	if GetPlayerFaction() ~= 7 then
		Say("B�ng h�u kh�ng ph�i l? �� t? b�n gi�o, th�t kh�ng ti�n n�i chuy�n.",0)
	elseif  GetPlayerRoute() == 19 then 
		Say("�� t? b�n gi�o ph�n l�m 2 lo�i: t? hi�p v? c? s?, �� t? <color=yellow>t? hi�p<color> do Thi Th��ng Th��ng Ch? <color=yellow>Ng? Ng�n<color> truy�n th? v? c�ng, �� t? <color=yellow>c? s?<color> do C? Th��ng Th��ng Ch? <color=yellow>Li�u T�n Tr�c<color> truy�n th? v? c�ng. Ngu�i c? th? g�p h? b�i s? h�c ngh?, nh�ng m�i ng��i ch? c? th? h�c 1 tr��ng ph�i.",0)
	elseif  GetPlayerRoute() == 20 then
		Say("Ngu�i l? �� t? <color=yellow>t? hi�p<color> Ng? ��c Gi�o, mu�n h�c v? c�ng ph�i ki�m <color=yellow>Ng? Ng�n<color> m�i ��ng ch?!",0)
	else 
		Say("Ngu�i l? �� t? <color=yellow>c? s?<color> Ng? ��c Gi�o, mu�n h�c v? c�ng ph�i ki�m <color=yellow>Li�u T�n Tr�c<color> m�i ��ng ch?!",0)
	end
end;

--��������������
function task_xn()
local nTask_DL_State_30 = GetTask(TASK_DL_LV30_ID);
local nTask_DL_State_62 = GetTask(TASK_DL_LV62_ID);
local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);

	if nTask_DL_State_30 == 1 then
		task_001_00();
		return
	end
	
	if nTask_DL_State_30 == 2 then
		task_002_00();
		return
	end
	
	if nTask_DL_State_30 == 3 then
		task_003_00();
		return
	end
	
	if nTask_DL_State_30 == 4 then
		task_004_00();
		return
	end
	
	if nTask_DL_State_30 == 5 then
		task_005_00();
		return
	end
	
	--��ȡ62�������嶾�̵�ŭ��
	if nTask_DL_State_62 == 5 then 
		task_006_00();
		return
	end
	
	--δɱ�������
	if nTask_DL_State_75 == 1 then 
		task_007_00();
		return
	end
	
	--�Ѿ�ɱ�������
	if nTask_DL_State_75 == 2 then 
		task_008_00();
		return
	end
	
	--����嶾�̵�ŭ������,δ��������Ի�
	if nTask_DL_State_75 == 3 then 
		task_009_00();
		return
	end
end
--�չ�����
function practice()
    if GetPlayerFaction() ~= 7 then
       Talk(1,"","Ngu�i kh�ng ph�i l? �� t? b�n gi�o, kh�ng th? tu luy�n ? ��y.");
    else
        if GetItemCount(2, 0, 390) >= 1 then  --ʦ������
            Say("����չ�����?",2,"��/practice_start","����/no");
        else
            Talk(1,"","��û��<color=yellow>ʦ������<color>,�޷�����.");
        end;
    end;
end;

-- �嶾��ʦ���ظ��������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 7) then
		Say("Ngu�i kh�ng ph�i l? �� t? b�n gi�o, vi�c b�n gi�o kh�ng can h? g? ��n ng��i!", 0)
	elseif (GetPlayerRoute() == 19) then 
		Say("�� t? b�n gi�o ph�n l�m t? hi�p, c? s?, ch? c? �� t? �� b�i s? m�i c? th? ti�p nh�n nhi�m v? c�a ta!", 0)
	elseif (GetPlayerRoute() == 20) then
		task_main_entrance(TASK_ID_WUDU_XIEXIA);		-- а��
	else 
		task_main_entrance(TASK_ID_WUDU_GUSHI);			-- ��ʦ
	end	
end;

function shimenshuoming()
		Say("<color=green>Thuy�t minh �� c�ng hi�n s? m�n<color>: \n <color=yellow>�� c�ng hi�n s? m�n<color>: Th�ng qua vi�c ho�n th�nh nhi�m v? S? M�n ��t ��n m�t ��ng c�p nh�t ��nh, b�n c? th? nh�n ���c trang ph�c ho�c v? kh? c�a S? M�n. \n <color=yellow>Gi�i h�n �� c�ng hi�n s? m�n<color>: Hi�n nay �� c�ng hi�n S? M�n kh�ng b? h�n ch?, ch? c�n ho�n th�nh nhi�m v? th? c? th? n�ng cao �� c�ng hi�n. \n <color=yellow>S? ki�n V? L�m<color>: L�m xong nhi�m v? c? ��nh s? nh�n th�m m�t nhi�m v? ng�u nhi�n, ho�n th�nh s? nh�n ���c 50 �i�m c�ng hi�n S? m�n v? c? kh? n�ng nh�n ���c m�t t�ch s? m�n.", 
			1,
			"Trang k?/shuoming2")		
end;

function shuoming2()
		Say("<color=green>Thuy�t minh �� c�ng hi�n s? m�n<color>: \n <color=yellow>Gi�i h�n ��ng c�p �� c�ng hi�n S? M�n<color>: ��ng c�p kh�c nhau th? �i�m t�ch l�y �� c�ng hi�n c�ng kh�ng gi�ng nhau. �� c�ng hi�n S? M�n c�ng cao c�ng n�ng cao ��ng c�p c�a m�nh, t? sau c�p 75 th? kh�ng c�n gi�i h�n �� c�ng hi�n n�a. \n <color=yellow>�i�m kinh nghi�m ng�u nhi�n<color>. L�m nhi�u nhi�m v? s? m�n �� c�ng hi�n c�ng cao �i�m kinh nghi�m c�ng nhi�u. �i�m c�ng hi�n <3000 <color=yellow>�i�m kinh nghi�m t��ng ��i<color>, >3000 <color=yellow>�i�m kinh nghi�m c�ng nhi�u<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- û�м�������
		Say("Mu�n l�m nhi�m v? s? m�n tr��c ti�n ph�i gia nh�p b�n gi�o. Sau �� h�y gia nh�p tr��ng ph�i, r�i quay l�i ch? ta nh�n nhi�m v?. Sau khi ho�n th�nh nhi�m v? s? m�n s? nh�n ���c �� c�ng hi�n s? m�n, t�ch l�y �� c�ng hi�n nh�t ��nh c? th? mua v�t ph�m b? truy�n b�n m�n.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 7) then	-- ���Ǳ��ŵ���
		Say("Ng��i kh�ng ph�i l? �� t? c�a b�n gi�o, h�y v? m�n ph�i c�a ng��i m? tra xem �� c�ng hi�n s? m�n nh?. Giao di�n F3 c�ng c? th? tra xem �� c�ng hi�n s? m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>B�ch Doanh Doanh<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--�µ����
function main_new()
	local selTab = {
				"�嶾��Դ/know_qiyuan",
				"�嶾����/know_wugong",
				"��������/know_rumentiaojian",
				"�����嶾��/interwudu",
				"ʦ������˵��/about_faction_task",
				"�չ�����/practice",
				"�Ҵ�����ף������ʦ/#faction_graduate(7)",
				"����к�/task_xn",
				}
	if GetPlayerRoute() == 20 or GetPlayerRoute() == 21  then
		tinsert(selTab, 1, "Nhi�m v? Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "�� t? xin k�nh d�ng s? ph? tr? hoa c�c v? b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 7)");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");
	Say(g_szInfoHead.."��ng tr�ch ta kh�ng n�i tr��c, n�u ng��i g�p chuy�n g? k? l? th? ��ng c? m? t? x�u ��",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."��t Mi�u C��ng nguy hi�m v? c�ng, c? nhi�u m�nh th? ��c tr�ng, ng��i Mi�u bi�t c�ch ch? ng? ��c tr�ng c�n g�i l? C? thu�t, ngo�i ra c�n c? th? gi? t? thi v? d�ng k? ��c kh�ng ch? c�n g�i l? Phong thi thu�t. Sau n�y c? ng��i s�ng ? Mi�u C��ng h�n m��n n�m h�c ���c t�t c? b? thu�t t? x�ng l? Kim T�m L�o Ti�n, �� t? c�a �ng ta l? B�ch Di�n Lang Qu�n ng��i s�ng l�p Ng? ��c gi�o v? t�n L�o ti�n l? Ng? ��c t? s?.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Mi�u C��ng k? thu�t chia l�m C? thu�t v? Kh�ng thi thu�t, Ng? ��c gi�o chia th�nh 2 h? ph�i C? s? v? T? hi�p. C? S? chuy�n nghi�n c�u Ng? ��c C? Thu�t, d�ng ��c t�n c�ng k? ��ch, sau khi tr��ng th�nh c? th? h�c v? c�ng tr�n ph�i {V? �nh Ma C�}. T? hi�p d�a v�o s? nhanh nh�n c�a th�n ph�p �� kh�ng ch? t? thi, s? d�ng song �ao t�n c�ng k? ��ch, sau khi tr��ng th�nh c? th? h�c v? c�ng tr�n ph�i {V? Thi�n Ma C�ng}."),g_szInfoHead..sf_ConvertColorString("S? ph? truy�n th? C? s? l? C? Th��ng Th��ng Ch? {Li�u T�n Tr�c}, truy�n th? T? hi�p l? Thi Th��ng Th��ng Ch? {Ng? Ng�n}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh�ng gi�i h�n nam n?, ch�a gia nh�p m�n ph�i kh�c, kh�ng ph�i l? ph�n �� b�n m�n th? c? th? nh�p m�n. Ng? ��c gi�o kh�ng xem tr�ng ch�nh t?, gi�t ng��i ph�ng h�a c�ng kh�ng sao nh�ng n�u m�u h�i ��ng m�n s? b? v�n c? th�c t�m m? ch�t.");
end;