--�����ȴ��������֣���ʦ������
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�����\\task_main.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --�����Ľű�
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76���������������ű�
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Thi�u L�m Gi�o Ch? <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_SL);
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76�������䷽ѧϰ����
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),1) ~= 1 then
		weapon_76_talk(1,nSkillDetail)
		return
	end
	
	if (nTaskValue==0) then
		main_new();
		return
	elseif (nTaskValue < 7) then
		Say("C? th? nh? th? n�o, th? ch? g�p Huy�n Minh �� h�i", 0);
		return
	elseif (nTaskValue == 7) then
		task_014();
		return
	elseif (nTaskValue >= 9) then
		fix_sl();
		return
	else
		main_new();
	end
end;

-- ʦ���������
function about_faction_task()
	Say("��ô���£�",
		3,
		"��ʼʦ������/start_faction_tasklink",
		"ʦ�Ź��׶Ȳ���/check_query_faction_contri",
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

function intershaolin()		--��������
	if ((GetTask(1002) > 0) or 
		(GetTask(1003) > 0) or 
		(GetTask(1004) > 0) or 
		(GetTask(1005) > 0) or 
		(GetTask(1031) > 0) or 
		(GetTask(1032) > 0) or 
		(GetTask(1033) > 0)) then --����������
		Say("Th? ch? �� c? ? gia nh�p m�n ph�i kh�c, b�n t�ng ��y kh�ng ti�n.", 0);
	elseif GetSex() == 2 then	--�Ա���
		Say("Trong t? to�n nam nh�n, kh�ng thu nh�n <color=yellow>n? gi�i<color>, m�i th? ch? �i n�i kh�c!", 0);
	elseif GetLevel() < 10 then	--�ȼ����
		Say("��������ֱ���߱�һ��ʵ��.�㻹û�� <color=yellow>10��<color>��10��֮����������!", 0);
	elseif GetPlayerFaction() == 1 then	--���ɼ��
		Say("���Ѽ�������, �����ʲô?", 0);
	elseif GetPlayerFaction() > 1 then	--���ɼ��
		Say("���Ѽ�������! �޷��ټ���ؤ��", 0);
	else
		task_001();
		return
	end
end;

function gettask()
	if GetPlayerFaction() ~= 1 then
		Say("Th? ch? kh�ng ph�i �� t? b�n ph�i, kh�ng d�m l�m phi�n!", 0);
	else
		taskmain("Huy�n T?", 1)
	end
end;


function no()
    local nStep = GetTask(TASK_JJC);
    if nStep == 20 then
        task_20_00();
        return
    elseif nStep == 21 then
        task_21_00();
        return
    elseif nStep == 30 then
        task_30_00();
        return
    end;
    
	Say("A Di �� Ph�t!");
end;

function practice()
    if GetPlayerFaction() ~= 1 then
       Talk(1, "", "Th? ch? kh�ng ph�i �� t? c�a Thi�u L�m, kh�ng th? ��n ��y tu luy�n.");
    else
        if GetItemCount(2, 0, 205) >= 1 then  --ʦ������
            Say("����չ�����?",
            	2,
            	"��/practice_start",
            	"����/no_practice");
        else
            Talk(1, "", "��û��<color=yellow>ʦ������<color>, �޷�����.");
        end;
    end;
end;

function no_practice()
	Say("A Di �� Ph�t!");
end;

-- ����ʦ���ظ���������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 1) then
		Say("Ch? c? �� t? Thi�u L�m m�i c? th? c�ng hi�n cho b�n ph�i.", 0);
	elseif (GetPlayerRoute() == 1) then 
		Say("Ng��i n�n ��n c�c m�n ph�i kh�c b�i s? h�c v?, c�ng hi�n s�c l�c c�a m�nh.!", 0);
	elseif (GetPlayerRoute() == 2) then
		task_main_entrance(TASK_ID_SHAOLIN_SUJIA);			-- �׼�
	elseif (GetPlayerRoute() == 3) then
		task_main_entrance(TASK_ID_SHAOLIN_CHANSENG);		-- ��ɮ
	else
		task_main_entrance(TASK_ID_SHAOLIN_WUSENG);			-- ��ɮ
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
	
	if (GetPlayerFaction() ~= 1) then
		Say("Ng��i kh�ng ph�i l? �� t? c�a b�n gi�o, h�y v? m�n ph�i c�a ng��i m? tra xem �� c�ng hi�n s? m�n nh?. Giao di�n F3 c�ng c? th? tra xem �� c�ng hi�n s? m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Huy�n T?<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--�µ����
function main_new()
	local selTab = {
				"������Դ/know_qiyuan",
				"�����书/know_wugong",
				"��������/know_rumentiaojian",
				"��������/intershaolin",
				"ʦ������˵��/about_faction_task",
				"�չ�����/practice",
				"�Ҵ�����ף������ʦ/#faction_graduate(1)",
				"����к�/no",
				}
	if (GetPlayerRoute() == 2) or (GetPlayerRoute() == 3) or (GetPlayerRoute() == 4) then
		tinsert(selTab, 1, "Nhi�m v? Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");		
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "�� t? xin k�nh d�ng s? ph? tr? hoa c�c v? b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 1)");
	end
	Say(g_szInfoHead.."A di �� ph�t! Thi�u L�m t? x�a nay y�n t�nh, ch? g�y �n �o, l�m phi�n ��n thi�n nh�n.",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Ng�y Hi�u V�n �� th�i h�a 19 n�m, Thi�n Tr�c T�ng Nh�n B�t �� t? T�y T�ng ��n trung nguy�n, ���c Hi�u V�n �� qu? tr�ng. B�t �� nh�n th�y Tung S�n nh? m�t ��a hoa sen, b�n l�p t? ? ��, m? ra Thi�u L�m. 30 n�m sau, Nam Thi�n Tr�c T�ng Nh�n ��t Ma ��n Thi�u L�m, truy�n d�y Thi�n c�ng, v? ngh?, Thi�u L�m ng�y m�t h�ng th�nh. ��u th�i ���ng, T�n V��ng L? Th? D�n v? V��ng Th? Sung chi�n tranh ? L�c D��ng, ba th�ng r�ng ch�a d�t, �� m�i 30 Thi�u L�m v? t�ng xu�t tr�n, li�n gi�nh th�ng l�i, Thi�u L�m vang danh thi�n h? t? ��.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Thi�u L�m c? 72 tuy�t k?, 3 ���ng v? h�c. V? t�ng {N�i c�ng}, luy�n Thi�u L�m Quy�n C��c V? Ngh?, s? tr��ng v? chi�u th�c li�n ho�n, g�y s�t th��ng cho ��i th? ? di�n r�ng, c? th? h�c v? c�ng tr�n ph�i {Nh? Lai Th�n Ch��ng}. T�c gia {G�n c�t}, luy�n Thi�u L�m �ao C�n V? Ngh?, m�nh v? ph�ng ng?, c? n�ng l�c ph�ng ng? cao ? c? ly g�n, c? th? h�c v? c�ng tr�n ph�i {D�ch c�n kinh}. Thi�n t�ng {n�i c�ng}, luy�n Thi�u L�m N�i Gia V? Ngh?, d�ng thi�n tr��ng t�n c�ng xa, c? th? h�c v? c�ng tr�n ph�i {T�y t�y kinh}."),g_szInfoHead..sf_ConvertColorString("S? ph? v? t�ng l? ��t Ma ���ng Th? T�a {Huy�n Kh? ��i S�}, s? ph? t�c gia l? Ban Nh��c ���ng Th? T�a {Huy�n Bi ��i S�}; s? ph? thi�n t�ng l? T�ng Kinh C�c Th? T�a {Huy�n H�i ��i S�}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Thi�u L�m t? khi khai t�ng ��n nay, ch? thu nam �� t?, ch�a gia nh�p m�n ph�i kh�c, kh�ng ph�i ph�n �� Thi�u L�m ��u c? th? nh�p m�n. Thi�u L�m c? 5 ��i khi�t: S�t sinh, v�ng ng?, d�m t?, th�u ��o, hu�n t�u, �� t? Thi�u L�m ph�i tu�n th? tuy�t ��i. 30 ti�u khi�t, kh�ng ���c xem nh?.");
end;
