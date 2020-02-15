Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --�����Ľű�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�����\\task_main.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76���������������ű�
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>C�i Bang Gi�o Ch? <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_GB)
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76�������䷽ѧϰ����
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),5) ~= 1 then
		weapon_76_talk(5,nSkillDetail)
		return
	end

	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_008();
		return
	elseif (nTaskValue==1) then
		Say("C? r��u th�t h�y �� c�c huynh �� trong bang d�ng tr��c! Ta l? bang ch?, ��ng lo cho ta!",0);
		return
	elseif (nTaskValue>=3) then
		fix_gb()
		return
	else
		main_new();
	end
end;

-- ʦ���������
function about_faction_task()
	Say("�л��ǵĵط��������ã���Ц��Ц��",
		3,
		"��ʼʦ������/start_faction_tasklink",
		"ʦ�Ź��׶Ȳ���./check_query_faction_contri",
		"ʦ������˵��./shimenshuoming")
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

function intergaibang()		--��������
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0)  or (GetTask(1033)>0) then --����������
		Say("���Ѽ������ɣ��޷��ټ���ؤ��!",0)
	elseif GetLevel() < 10 then	--�ȼ����
		Say("�����ؤ�����߱�һ��ʵ��.�㻹û��<color=yellow>10��<color> ��10��֮����������!",0)��
	elseif GetPlayerFaction() == 4 then	
		Say("���Ѽ���ؤ��, �����ʲô?",0)��
	elseif GetPlayerFaction() > 0 then	
		Say("���Ѽ�������! �޷��ټ���ؤ��",0)��
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 4 then
		Say("Kh�ng ph�i �� t? C�i Bang, kh�ng th? h�c ���c v? c�ng b�n ph�i!",0)
	elseif  GetPlayerRoute() == 10 then 
		Say("Bang ch�ng C�i Bang ta chia l�m 2 ph�i <color=yellow>T�nh Y<color> v? <color=yellow>? Y<color>. V? c�ng T�nh Y ph�i do H? C�n tr��ng l�o <color=yellow>M? T�nh Sinh<color> truy�n th?. V? c�ng ? Y ph�i do Tr? B�t tr��ng l�o <color=yellow>T�ng Nguy�n An<color> truy�n th?. H�y suy ngh? c�n th�n, ch�n h? ph�i r�i t�m c�c tr��ng l�o th�nh gi�o v? c�ng!",0)
	elseif  GetPlayerRoute() == 11 then
		Say("�� t? <color=yellow>T�nh Y<color> n�n t�m <color=yellow>M? tr��ng l�o<color> h�c v? c�ng m�i ��ng!",0)
	else 
		Say("�� t? <color=yellow>? Y<color> n�n t�m <color=yellow>T�ng tr��ng l�o<color> h�c v? c�ng m�i ��ng!",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 4 then
		Say("Ng��i ch�ng ph�i �� t? C�i Bang, Khi�u H�a T? ta ch�ng d�m l�m phi�n!",0)
	else
		taskmain("Long T�i Thi�n", 4)
	end
end;				


function no()
    local nStep = GetTask(TASK_JJC);
    if nStep == 31 then
        task_31_00();
        return
    end;
end;


function StartTask001()
	local strMain = {
		"C? vi�c g? kh�ng?",
		"Ta ph�ng l�nh T�ng Giang ��i ca ? L��ng S�n B�c nh? Long Bang ch? ph�i cao th? ��n ch? ng? quan binh!",
		"M�u ch�y ru�t m�m, ta nh�t ��nh s? ra tay gi�p s�c. Nh�ng g�n ��y, v�a l�c C�i Bang ta s�p c? h�nh Hi�n Vi�n ��i h�i, c�n nhi�u vi�c ph�i l�m, e l��.",
		"T�i h? c? th? gi�p ���c g? kh�ng?",
		"H�y gi�p ta t�m 10 b�nh T�y M�ng T�u �� t? ch�c ��i h�i! C? h�nh xong ta s? gi�p s�c cho T�ng ��i ca!",
		"���c! Ta �i t�m ngay ��y!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("S�n tr�i Long T�i Thi�n");
	TaskTip("T�m 10 b�nh T�y M�ng T�u cho C�i Bang m? Hi�n Vi�n ��i h�i!")
end


function FinishTask001()
local strMain = {
	"Long bang ch?! H�y nh�n l�y 10 b�nh T�y M�ng T�u!",
	"T�t l�m! B�ng h�u qu? nhi�n tr�ng ch? t�n, C�i Bang ta c�ng kh�ng ph? l�ng. B�ng h�u c? tr? v? n�i v�i T�ng ��u l�nh, c? h�nh xong Hi�n Vi�n ��i h�i, C�i Bang ta s? ��n ngay!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("S�n tr�i Long T�i Thi�n")
	CTask:PayAward("S�n tr�i Long T�i Thi�n")
end;

function practice()
    if GetPlayerFaction() ~= 4 then
       Talk(1,"","Kh�ng ph�i �� t? b�n bang, kh�ng th? v�o bang tu luy�n!");
    else
        if GetItemCount(2, 0, 208) >= 1 then  --ʦ������
           Say("������бչ�������?",2,"��/practice_start","����/no");
        else
            Talk(1,"","��û��<color=yellow>ʦ������<color>, �޷���������.");
        end;
    end;
end;

function no_practice()

end;

-- ؤ��ʦ���ظ���������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 4) then
		Say("Kh�ng ph�i �� t? C�i Bang, sao c? th? c�ng hi�n cho ta!", 0);
	elseif (GetPlayerRoute() == 10) then 
		Say("Chi b�ng h�y ��n c�c tr��ng l�o c�a b�n bang b�i s? h�c ngh?, r�i h�y nh�n nhi�m v?!", 0);
	elseif (GetPlayerRoute() == 11) then
		task_main_entrance(TASK_ID_GAIBANG_JINGYI);			-- ����
	else 
		task_main_entrance(TASK_ID_GAIBANG_WUYI);			-- ����
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
	
	if (GetPlayerFaction() ~= 4) then	-- ���Ǳ��ŵ���
		Say("Ng��i kh�ng ph�i l? �� t? c�a b�n gi�o, h�y v? m�n ph�i c�a ng��i m? tra xem �� c�ng hi�n s? m�n nh?. Giao di�n F3 c�ng c? th? tra xem �� c�ng hi�n s? m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>������<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--�µ����
function main_new()
	local selTab = {
				"ؤ����Դ/know_qiyuan",
				"ؤ���书/know_wugong",
				"��������/know_rumentiaojian",
				"����ؤ��/intergaibang",
				"ʦ���������/about_faction_task",
				"�չ�����/practice",
				"�Ҵ�����ף������ʦ/#faction_graduate(4)",
				"����к�/no",
				}
	if (GetPlayerRoute() == 11) or (GetPlayerRoute() == 12) then
		tinsert(selTab, 1, "Nhi�m v? Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "�� t? xin k�nh d�ng s? ph? tr? hoa c�c v? b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 4)");
	end
	Say(g_szInfoHead.."M�t n�i l�p x�p nh? th? n�y, mong l��ng th? cho!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Th�i ��i n�o c�ng ��y d�y �n m�y, nh�ng ng��i b? n�n, thu? m? l�i cao, n�n n�i chi�n li�n mi�n, th? l�c C�i Bang c�ng t? �� m? r�ng, h? m�t l�ng m�t d? ch�ng ngo�i x�m, ph�t huy bang ph�i.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("C�i Bang ph�n th�nh 2 h? ? Y v? T�nh Y. T�nh Y chuy�n luy�n v? ngo�i c�ng, chuy�n v? C�i Bang Ch��ng Ph�p, chi�u th�c ch? tr�ng v? t�n c�ng, d�ng quy�n ��nh ra ��n ch? m�ng, c? th? h�c ���c v? c�ng tr�n ph�i {Gi�ng Long Th�p B�t Ch��ng}. ? Y ch? tr�ng th�n ph�p nhanh nh�n, chuy�n v? C�i Bang C�n Ph�p, quy�n b�ng nhanh nh�n �i�u luy�n, d�ng �� c�u b�ng t�n c�ng k? th?, c? th? h�c v? c�ng tr�n ph�i {�� C�u C�n Tr�n}."),g_szInfoHead..sf_ConvertColorString("S? ph? T�nh Y l? B�ng tr��ng l�o {M? T�nh Sinh}, S? ph? ? Y l? Ch��ng B�t tr��ng l�o {T�ng Nguy�n An}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh�ng ph�n bi�t nam n?, xu�t th�n, ch? c�n kh�ng l�m �i�u �c, kh�ng gia nh�p bang ph�i kh�c, kh�ng ph�i l? ph�n �� c�a b�n ph�i. �n m�y th? c�n quy t�c g? ch?? Ch? c�n tu�n theo qui ��nh c�a b�n m�n, v? ��i ngh�a d�n t�c, b�o v? x? t�c.");
end;