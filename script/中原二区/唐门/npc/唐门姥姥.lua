--���Ƴ��촦�������֣���ʦ������
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ����ʦ������Ľű�ͷ�ļ�
Include("\\script\\task\\practice\\practice_main.lua"); --�����Ľű�
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76���������������ű�
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>���ng M�n Gi�o Ch? <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_TM)
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76�������䷽ѧϰ����
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),4) ~= 1 then
		weapon_76_talk(4,nSkillDetail)
		return
	end

	if (nTaskValue==7) then
		
		task_012();
		return
	elseif (nTaskValue >= 9) then
		fix_tm();
		return
	elseif ((nTaskValue > 0) and (nTaskValue < 7)) then
		Say("Ng��i �i t�m <color=yellow>Thi�n Ti�u<color>, y s? an b�i m�i vi�c cho ng��i c�ng nh? �� L�o l�o th�y l�ng <color=yellow>trung th�nh<color> c�a ng��i th? n�o.",0);
		return
	else
		main_new();
	end
end;

-- ʦ���������
function about_faction_task()
	Say("����ʲô��",
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

function intertangmen()		--��������
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then
			Say("���Ѽ������ɣ��޷��ټ���ؤ��!",0)
	elseif GetLevel() < 10 then	--�ȼ����
		Say("��������ű���߱�һ��ʵ��.�㻹û��<color=yellow>10��<color> ��10��֮����������!",0)��
	elseif GetPlayerFaction() == 4 then	
		Say("���Ѽ�������, �����ʲô?",0)��
	elseif GetPlayerFaction() > 0 then	
		Say("���Ѽ�������! �޷��ټ�������",0)��
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 5 then		--�������ŵ���
		Say("Ng��i kh�ng ph�i �� t? b�n m�n, tuy�t h�c gia truy�n l? n�o l�i �� ng��i bi�t ���c.",0)
	elseif  GetPlayerRoute() == 5 then 	--�����ŵ��ӵ��ǻ�û��ȥ��ʦ
		Say("Ta gi? r�i! Vi�c truy�n th? v? c�ng chi b�ng h�y ��n t�m <color=yellow>Thi�n Ti�u<color> �i! �ng ta m�i l? t�ng qu�n c�a ���ng M�n.",0)
	else  	--���ŵ��ӣ����Ѿ���ʦ
		Say("Mu�n h�c v? c�ng h�y t�m <color=yellow>Thi�n Ti�u<color> l�m <color=yellow>Nhi�m v?<color> m�i ��n t�m ta.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t? ���ng M�n, chuy�n c�a ���ng M�n kh�ng th? cho ng��i bi�t ���c.",0)
	else
		taskmain("���ng S? H�ng", 5)
	end
end;				


function no()
end;

function practice()
    if GetPlayerFaction() ~= 5 then
       Talk(1,"","Ng��i kh�ng ph�i l? �� t? ���ng M�n! Kh�ng th? tu luy�n ? ��y.");
    else
        if GetItemCount(2, 0, 209) >= 1 then  --ʦ������
            Say("Mu�n v�o ��y tu luy�n?",2,"��ng/practice_start","Sai/no");
        else
            Talk(1,"","Ng��i kh�ng c? <color=yellow>L�nh b�i ���ng M�n<color>, kh�ng th? v�o ��y b? quan tu luy�n.");
        end;
    end;
end;

-- ����ʦ���ظ��������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 5) then		--�������ŵ���
		Say("Ng��i kh�ng ph�i l? �� t? ���ng M�n, nhi�m v? m�n ph�i sao c? th? �� ng��i l�m!", 0)
	elseif (GetPlayerRoute() == 5) then 	--�����ŵ��ӵ��ǻ�û��ȥ��ʦ
		Say("H�y t�m Thi�n Ti�u t�ng qu�n h�c v? c�ng tr��c r�i quay l�i ��y nh�n nhi�m v?.", 0)
	else  	--���ŵ��ӣ����Ѿ���ʦ
		task_main_entrance(TASK_ID_TANGMEN);
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
	
	if (GetPlayerFaction() ~= 5) then	-- ���Ǳ��ŵ���
		Say("Ng��i kh�ng ph�i l? �� t? c�a b�n gi�o, h�y v? m�n ph�i c�a ng��i m? tra xem �� c�ng hi�n s? m�n nh?. Giao di�n F3 c�ng c? th? tra xem �� c�ng hi�n s? m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>���ng S? H�ng<color>:";
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
				"��������/intertangmen",
				"ʦ���������/about_faction_task",
				"�չ�����/practice",
				"�Ҵ�����ף������ʦ/#faction_graduate(5)",
				"����к�/no",
				}
	if (GetPlayerRoute() == 6)  then
		tinsert(selTab, 1, "Nhi�m v? Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "�� t? xin k�nh d�ng s? ph? tr? hoa c�c v? b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 5)");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");		
	Say(g_szInfoHead.."���ng M�n kh�ng ph�i l? n�i c? th? tu? ti�n ra v�o, c? chuy�n g? mau n�i �i, n�u kh�ng th? m�i l�i b��c!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."���ng M�n thu�c ��t Th�c, �� m�y tr�m n�m h�ng c? t�i ��t Th�c, n�i ti�ng tr�n v? l�m v? 4 m�n: ho? kh?, �m kh?, c�m b�y, d�ng ��c. ���ng M�n ��a linh nh�n ki�t, r�t gi�i thi�t k?, ph�t minh c�c lo�i �m kh? v? c? quan m�i, c? uy l�c kinh ng��i. V? ���ng M�n r�t hi�m khi h�nh t�u giang h?, n�i ? l�i tr�n ng�p c? quan, �m kh?, kh? x�m nh�p, cho n�n ���ng M�n tuy c? danh ti�ng tr�n giang h?, nh�ng kh�ng mu�n cho ng��i kh�c nh�n th�y khu�n m�t c�a m�nh. Kh�ng mu�n k�t giao v�i danh m�n ch�nh ph�i, c�ng kh�ng giao du v�i t? ma ngo�i ��o, thi�n �c tu? t�m, t? do t? t�i.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("V? c�ng ���ng M�n kh�ng chia h? ph�i, v? cho d? l? �m kh?, c? quan hay d�ng ��c, ��u c? m�i li�n h? ch�t ch? v�i nhau. ���ng M�n th�n ph�p nhanh nh�n, k? thu�t tinh x�o, s? d�ng c? quan, �m kh? t�m ��c c? th? khi�n cho k? ��ch r�i v�o tr�ng th�i x�u, h�n ch? h�nh ��ng c�a k? ��ch, c? th? h�c ���c v? c�ng tr�n ph�i H�p Tinh Tr�n."),g_szInfoHead..sf_ConvertColorString("���ng M�n th? nghi�p s? ph? l? t�ng qu�n ���ng Thi�n Ti�u."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh�ng gi�i h�n nam n?. Tuy kh�ng ph�i l? danh m�n ch�nh ph�i, nh�ng ���ng M�n c�ng r�t gh�t b�n ti�u nh�n b? �i. Nh�ng ai ch�a gia nh�p m�n ph�i, kh�ng ph�i l? ph�n �� c�a b�n ph�i ��u c? th? gia nh�p. 'Th? �i g�p Di�m V��ng, ch? ��ng ���ng M�n lang.' �� t? ���ng M�n h�nh t�u giang h?, t? do t? t�i, lu�n t�n trung t�n ngh�a v�i ng��i c�a b�n ph�i.");
end;