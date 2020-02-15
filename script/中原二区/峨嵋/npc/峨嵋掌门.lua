--������ʦ̫���������֣���ʦ������
Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\practice\\practice_main.lua"); --�����Ľű�
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76���������������ű�
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Nga My Gi�o Ch?<color> : "
function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76�������䷽ѧϰ����
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),3) ~= 1 then
		weapon_76_talk(3,nSkillDetail)
		return
	end
	
	if (nTaskValue==0) then
		main_new();
		return		
	elseif (nTaskValue < 5) then
		Say("<color=yellow>Chu Thi�n Nh�n<color> ? Th�nh �� ph? l? ng��i c? l�ng h�o t�m, y �ang c�u t? d�n ch�ng ? <color=yellow>T�n T��ng T?<color>, ng��i h�y gi�p y m�t tay.",0);
		return
	elseif (nTaskValue == 5) then
		task_013();
		return
	elseif (nTaskValue >= 7) then
		fix_em();
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
		"ʦ�Ź��׶Ȳ�ѯ/check_query_faction_contri",
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

function interemei()		--��������
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then  --����������
		Say("���Ѽ������ɣ��޷��ټ����ü!",0)
	elseif GetSex()==1 then	--�Ա���
		Say("Nga My l? n�i thanh tu Ph�t m�n, xin Th? ch? h�y quay b��c.",0)
	elseif GetLevel() < 10 then	--�ȼ����
		Say("������ü����߱�һ��ʵ��.�㻹û��<color=yellow>10��<color> ��10��֮����������!",0)��
	elseif GetPlayerFaction() == 4 then	
		Say("���Ѽ����ü, �����ʲô?",0)��
	elseif GetPlayerFaction() > 0 then	
		Say("���Ѽ�������! �޷��ټ����ü",0)��
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t? Nga My, sao l�i mu�n h�c v? c�ng b�n ph�i? H�c l�n v? c�ng l? ��i k? trong giang h?, c�n kh�ng mau �i!",0)
	elseif  GetPlayerRoute() == 7 then 
		Say("Nga My chia l�m: T�c gia v? Xu�t gia �� t?. Xu�t gia �� t? h�c ki�m, do <color=yellow>Tu? T�m S? Th�i<color> ph? tr�ch; T�c gia �� t? h�c c�m, do <color=yellow>Hu? �m S? Th�i<color> ph? tr�ch; ng��i c? th? t�m h? �� b�i s? h�c ngh? nh�ng ch? c? th? ch�n m�t h? ph�i.",0)
		--end
	elseif  GetPlayerRoute() == 8 then
		Say("Ng��i l? �� t? xu�t gia, h�c v? c�ng n�n t�m <color=yellow>Tu? T�m S? Th�i<color> m�i ph�i.",0)
	else
		Say("Ng��i l? �� t? t�c gia, h�c v? c�ng n�n t�m <color=yellow>Hu? �m S? Th�i<color> m�i ph�i.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 3 then
		Say("Th? ch? kh�ng ph�i �� t? Nga My, kh�ng phi�n Th? ch?.",0)
	else
		taskmain("Ch�n Nh? s? th�i", 3)
	end
end;				


function no()
end;

function practice()
    if GetPlayerFaction() ~= 3 then
       Talk(1,"","Ng��i kh�ng ph�i �� t? Nga My, kh�ng th? ��n ��y tu luy�n.");
    else
        if GetItemCount(2, 0, 207) >= 1 then  --ʦ������
            Say("Mu�n v�o ��y tu luy�n?",2,"��ng/practice_start","Sai/no");
        else
            Talk(1,"","Ng��i kh�ng c? <color=yellow>L�nh b�i s? m�n Nga My<color>, kh�ng th? ti�n h�nh b? quan tu luy�n.");
        end;
    end;
end;

-- ����ʦ���ظ���������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 3) then
		Say("Ch? c? �� t? Nga My m�i c? th? nh�n nhi�m v? s? m�n.", 0);
	elseif (GetPlayerRoute() == 7) then 
		Say("H�y ��n g�p hai v? S? th�i b�i s? h�c ngh?, sau �� quay l�i t�m ta!", 0);
	elseif (GetPlayerRoute() == 8) then
		task_main_entrance(TASK_ID_EMEI_FOJIA);		-- ���
	else
		task_main_entrance(TASK_ID_EMEI_SUJIA);		-- �׼�
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
	
	if (GetPlayerFaction() ~= 3) then	-- ���Ǳ��ŵ���
		Say("Ng��i kh�ng ph�i l? �� t? c�a b�n gi�o, h�y v? m�n ph�i c�a ng��i m? tra xem �� c�ng hi�n s? m�n nh?. Giao di�n F3 c�ng c? th? tra xem �� c�ng hi�n s? m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Ch�n Nh? S? Th�i<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--�µ����
function main_new()
	local selTab = {
				"��ü��Դ/know_qiyuan",
				"��ü�书/know_wugong",
				"��������/know_rumentiaojian",
				"�����ü/interemei",
				"ʦ���������/about_faction_task",
				"�չ�����/practice",
				"�Ҵ�����ף������ʦ/#faction_graduate(3)",
				"����к�/no",
				}
	if (GetPlayerRoute() == 8) or (GetPlayerRoute() == 9)  then
		tinsert(selTab, 1, "Nhi�m v? Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "�� t? xin k�nh d�ng s? ph? tr? hoa c�c v? b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 3)");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");				
	Say(g_szInfoHead.."Nga My s�n c�nh tr? tuy�t m?, xin m�i ra ngo�i ngo�n c�nh!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Tuy�t k? Nga My l? �i�u m�a ki�m c? t? th�i ���ng nh�ng ���ng ki�m uy�n chuy�n kh�ng gi�ng ki�m ph�p c�a nam nh�n, giang h? g�i l? Ng�c N? ki�m ph�p ho�c Nga My ki�m. Sau �� c? �� t? ��n n�i Nga My khai s�n l�p ph�i n�n h�i �m v�i t�n g�i t? �� truy�n cho ��n nay.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Nga My chia ra hai ���ng Ph�t gia, T�c gia. Ph�t gia ch? tu Ph�t ph�p n�i c�ng, h�c Nga My tr? th��ng �� h�i ph�c t�m ph�p, h? tr? l? ch�nh, s? ki�m �� t�ng th�c l�c c�a ��ng ��i, c? th? h�c v? c�ng tr�n ph�i V�n T��ng Th�n C�ng. T�c gia ch? tu n�i kh?, h�c Nga My ��n �� ch? ng? t�m ph�p c�a ��ch, l�m cho ��ch nh�n t�m tr? b�n lo�n, d�ng ti�ng ��n �� l�m gi�m s�c chi�n ��u c�a ��ch, ch? ng? h�nh ��ng c�a ch�ng, c? th? h�c v? c�ng tr�n ph�i Thi�n �m Tr�n H�n Kh�c."),g_szInfoHead..sf_ConvertColorString("Ph�t gia th? nghi�p s? ph? l? Tu? T�m s? th�i, T�c gia th? nghi�p s? ph? l? Tu? �m s? th�i."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Nga My ph�i x�a nay ch? thu nh�n n? �� t?, kh�ng l�m vi�c �c, ch�a gia nh�p m�n ph�i kh�c, kh�ng ph�i l? ph�n �� c�a b�n ph�i. �� t? Nga My ph�i d�ng Ph�t t�m �� ph? �� ch�ng sinh, h�nh t�u giang h? �� c�u nh�n �� th?, b�o v? b�ch t�nh.");
end;