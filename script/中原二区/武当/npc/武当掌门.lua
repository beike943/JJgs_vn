
-- ������������ͷ�ļ�
Include("\\script\\lib\\task_main.lua");

--���Ϻ����˴������䵱����ʦ������
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�

Include("\\script\\task\\faction\\faction_main_wd.lua"); -- ��������ͷ�ļ�

Include("\\script\\task\\practice\\practice_main.lua"); --�����Ľű�

-------��������------
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");
----------------------
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76���������������ű�
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>V?�ang Gi�o Ch?<color>: "

function main()
	local nTaskValue = FN_GetTaskState(FN_WD);
	local strMain_001 = {
	"Ng��i bi�t ng��i �� l�m sai m�t chuy�n r�i kh�ng!",
	"?s?ph?l?",
	"B�nh g�m c�a T?M?Th�i Th??T��ng D��ng tuy kh�ng ��ng gi?nh�ng b�n trong n?c?gi�u m�nh b�n �� S�n H?X?T�c! Hi�n Ho�ng Th��ng �ang b�t c�c quan ph?��a ph��ng mau ch�ng t�m v�t ��, t�n Th�i Th?c??t�o ph�n v?th?kh�ng ch�u giao n�p m�nh b�n �� n�y.",
	"G�n ��y c?ng��i nghe T?M?Th�i Th?t?th�ng v�i n��c Li�u, c?kh?n�ng s?chuy�n t�m b�n �� n�y ra quan ngo�i, n�u �� t�m b�n �� S�n H?X?T�c r�i v�o tay n��c Li�u th?��i T�ng ta g�p ��i ho�n!",
	"Ta c?nh?bang ch�ng ?tr�n Ph�c Ng�u s�n ra m�t n�o ng?l�i b?ng��i �o�t l�y!",
	"��Xem ra l�i l??do t�i h?ph�i do t�i h?b?��p.",
	"Hi�n gi?t�n Th�i Th?ch�c �ang ��nh chuy�n m�nh b�n �� ra quan ngo�i, ng��i mau ��n T��ng D��ng t�m <color=yellow>Xa phu<color> h�i c?ng��i trong ph?Th�i Th?ra ngo�i kh�ng?",
	"�� t?l�p t�c l�n ���ng!"
}
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76�������䷽ѧϰ����
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),2) ~= 1 then
		weapon_76_talk(2,nSkillDetail)
		return
	end

	if CTask:IsTaskStart("T��ng D��ng_t�m T?H�c Ch�n Nh�n")==1 then
		CTask:TalkEx("task_yes_001", strMain_001);
		return
	end;
	
	if CTask:IsTaskStart("T��ng D��ng_t�m Xa phu")==1 then
		Say("Ng��i mau ��n T��ng D��ng t�m <color=yellow>Xa phu<color> h�i xem Th�i Th?c?ph�i ng��i chuy�n m�nh b�n �� S�n H?X?T�c �i ch�a!",0);
		return
	end;

	if (nTaskValue==0) then
		main_new();
		return
	elseif (nTaskValue==1) or (nTaskValue==2) then
	
		Say("Chuy�n nh�p m�n ng��i c?th?t�m <color=yellow>Tr��ng Ng?D��ng<color> th��ng l��ng.",0);
		return
				
	elseif (nTaskValue==3) then
	
		task_011();
		return
	elseif (nTaskValue>=5) then
	
		fix_wd();
		return
		
	else
		main_new();
	end
end;

-- ʦ���������
function about_faction_task()
	Say("��ô����?",
		3,
		"�������ʦ������/start_faction_tasklink",
		"�������ʦ�Ź��׶�./check_query_faction_contri",
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

-- ��ʼ�µ�����ȥ�ҳ���
function task_yes_001()
	CTask:FinishTask("T��ng D��ng_t�m T?H�c Ch�n Nh�n");
	CTask:PayAward("T��ng D��ng_t�m T?H�c Ch�n Nh�n");
	CTask:StartTask("T��ng D��ng_t�m Xa phu");
	return
end;

function interwudang()		--��������
	if (GetTask(1001)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then
		Say("����������һ�����ɣ�",0)
	elseif GetLevel() < 10 then	--�ȼ����
		Say("��Ҫ��Ϊ�䵱���ӱ���߱�һ�������ʡ� ����ﵽ<color=yellow>10��<color>����!",0)
	elseif GetPlayerFaction() == 2 then	--���ɼ��
		Say("���������䵱��Ϊʲô��ô��������ˣ�",0)
	elseif GetPlayerFaction() > 0 then	--���ɼ��
		Say("ʲô��,�������������ɻ�������Ҫ����ȥ�䵱̸ʲô��",0)
	else
		task_001();
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 2 then
		Say("Ng��i kh�ng ph�i l?�� t?V?�ang! Th?l�i B�n ��o kh�ng ti�n n�i r?",0)
	elseif  GetPlayerRoute() == 13 then 
		Say("V?�ang m�n �� chia l�m 2 h?��o gia v?T�c gia, <color=yellow>��o gia<color> �� t?do <color=yellow>Du Ch�n Sinh<color> truy�n th?v?c�ng, <color=yellow>T�c gia<color> �� t?do <color=yellow>��i Ki�m Ch�u<color> truy�n th?v?c�ng. M�i ng��i ch?c?th?ch�n m�t h?ph�i.",0)
	elseif  GetPlayerRoute() == 14 then
		Say("Ng��i l?<color=yellow>��o gia<color> �� t? mu�n h�c v?c�ng ph�i t�m <color=yellow>Du Ch�n Sinh<color>.",0)
	else 
		Say("Ng��i l?<color=yellow>T�c gia<color> �� t? mu�n h�c v?c�ng ph�i t�m <color=yellow>��i Ki�m Ch�u<color>.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 2 then
		Say("Ng��i kh�ng ph�i �� t?V?�ang! Kh�ng d�m l�m phi�n!",0)
	else
		taskmain("T?H�c ch�n nh�n", 2)
	end
end;				

function no()

end;

function task_xy()
-------��������------


    local nStep = GetTask(TASK_XYTY);
    if nStep == 2 then
        task_02_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    elseif nStep == 5 then
    	task_05_00();
    	return
    elseif nStep == 6 then
        task_06_00();
        return
    elseif nStep == 8 then
        task_08_00();
        return
    elseif nStep == 14 then
        task_14_00();
        return
    elseif nStep == 15 then
        task_15_00();
        return
    elseif nStep == 19 then
        task_19_00();
        return
    elseif nStep == 21 then
        task_21_00();
        return
    elseif nStep == 50 then
        task_50_00();
        return
    elseif nStep == 51 then
        task_51_00();
        return
    elseif nStep == 52 then
        task_52_00();
        return
    end;

    local nStep = GetTask(TASK_XY_TWO);
    if nStep == 1 then
        two_01_00();
        return
    elseif nStep == 2 then
        two_02_00();
        return
    elseif nStep == 3 then
        two_03_00();
        return
    end;
end;

function practice()
    if GetPlayerFaction() ~= 2 then
       Talk(1,"","�㲻���䵱����, �������䵱�ɵ��£���Ҫ�������");
    else
        if GetItemCount(2, 0, 206) >= 1 then  --ʦ������
            Say("������бչ�������?",2,"��/practice_start","Sai/no");
        else
            Talk(1,"","��û��<color=yellow>�䵱����<color>, �޷���������.");
        end;
    end;
end;

-- �䵱ʦ���ظ���������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 2) then
		Say("�����䵱����, �䵱�����㻹���ٴ���Ϊ��", 0);
	elseif (GetPlayerRoute() == 13) then 
		Say("��ȥ��ʦ����������!.", 0);
	elseif (GetPlayerRoute() == 14) then
		task_main_entrance(TASK_ID_WUDANG_DAOJIA);		-- ����
	else 
		task_main_entrance(TASK_ID_WUDANG_SUJIA);		-- �׼�
	end
end;

function shimenshuoming()
		Say("<color=green>Thuy�t minh �� c�ng hi�n s?m�n<color>: \n <color=yellow>�� c�ng hi�n s?m�n<color>: Th�ng qua vi�c ho�n th�nh nhi�m v?S?M�n ��t ��n m�t ��ng c�p nh�t ��nh, b�n c?th?nh�n ���c trang ph�c ho�c v?kh?c�a S?M�n. \n <color=yellow>Gi�i h�n �� c�ng hi�n s?m�n<color>: Hi�n nay �� c�ng hi�n S?M�n kh�ng b?h�n ch? ch?c�n ho�n th�nh nhi�m v?th?c?th?n�ng cao �� c�ng hi�n. \n <color=yellow>S?ki�n V?L�m<color>: L�m xong nhi�m v?c?��nh s?nh�n th�m m�t nhi�m v?ng�u nhi�n, ho�n th�nh s?nh�n ���c 50 �i�m c�ng hi�n S?m�n v?c?kh?n�ng nh�n ���c m�t t�ch s?m�n.", 
			1,
			"Trang k?shuoming2")		
end;

function shuoming2()
		Say("<color=green>Thuy�t minh �� c�ng hi�n s?m�n<color>: \n <color=yellow>Gi�i h�n ��ng c�p �� c�ng hi�n S?M�n<color>: ��ng c�p kh�c nhau th?�i�m t�ch l�y �� c�ng hi�n c�ng kh�ng gi�ng nhau. �� c�ng hi�n S?M�n c�ng cao c�ng n�ng cao ��ng c�p c�a m�nh, t?sau c�p 75 th?kh�ng c�n gi�i h�n �� c�ng hi�n n�a. \n <color=yellow>�i�m kinh nghi�m ng�u nhi�n<color>. L�m nhi�u nhi�m v?s?m�n �� c�ng hi�n c�ng cao �i�m kinh nghi�m c�ng nhi�u. �i�m c�ng hi�n <3000 <color=yellow>�i�m kinh nghi�m t��ng ��i<color>, >3000 <color=yellow>�i�m kinh nghi�m c�ng nhi�u<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- û�м�������
		Say("Mu�n l�m nhi�m v?s?m�n tr��c ti�n ph�i gia nh�p b�n gi�o. Sau �� h�y gia nh�p tr��ng ph�i, r�i quay l�i ch?ta nh�n nhi�m v? Sau khi ho�n th�nh nhi�m v?s?m�n s?nh�n ���c �� c�ng hi�n s?m�n, t�ch l�y �� c�ng hi�n nh�t ��nh c?th?mua v�t ph�m b?truy�n b�n m�n.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 2) then	-- ���Ǳ��ŵ���
		Say("Ng��i kh�ng ph�i l?�� t?c�a b�n gi�o, h�y v?m�n ph�i c�a ng��i m?tra xem �� c�ng hi�n s?m�n nh? Giao di�n F3 c�ng c?th?tra xem �� c�ng hi�n s?m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>�Ϻ�����<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--�µ����
function main_new()
	local selTab = {
				"�䵱����Դ/know_qiyuan",
				"�䵱���书����/know_wugong",
				"��������/know_rumentiaojian",
				"�����䵱��/interwudang",
				"ʦ���������/about_faction_task",
				"�չ�����/practice",
				"�Ҵ�����ף������ʦ/#faction_graduate(2)",
				"����к�/task_xy",
				}
	if (GetPlayerRoute() == 14) or (GetPlayerRoute() == 15)  then
		tinsert(selTab, 1, "Nhi�m v?Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "�� t?xin k�nh d�ng s?ph?tr?hoa c�c v?b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 2)");
	end
	Say(g_szInfoHead.."�뿴һ�·羰���䵱ɽ��������ˮϡ�еĵط���",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."L�o T?m?��u ��o gia, h�u th?chia l�m 2 h?ph�i Thi�n S?v?Thu�n D��ng. Thi�n S?luy�n ph? Thu�n D��ng luy�n ��n. V?�ang thu�c h?Thu�n D��ng. V?�ang s�n Th�i Ho?cung ���c d�ng l�n v�o th�i ���ng, t�n Ch�n V?��i �� l�m th�y. V?c�ng b�n ph�i ch?y�u thi�n v?h? l�y n�i ch�ng ngo�i. C?nhi�u cao nh�n ng�y x�a, ��n ng�y nay v�n ���c giang h?k�nh tr�ng.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("V?�ang chia th�nh 2 h?v?c�ng ��o gia v?T�c gia. ��o gia ch?tu n�i c�ng, tu luy�n V?�ang n�i gia t�m ph�p, l�y n�i c�ng th�m h�u l�m tr�ng, l�y ti�n thi�n ki�m kh?�� ��nh b�i ��ch th? c?th?h�c v?c�ng tr�n ph�i V?Th��ng Th�i C�c Ki�m. T�c gia c?th?t?th�n linh ��ng, tu luy�n V?�ang b�t ph�p, d�ng ��n t�n c�ng nhanh li�n t�c �� ��nh b�i ��i ph��ng, c?th?h�c v?c�ng tr�n ph�i Th�i C�c Th�n C�ng."),g_szInfoHead..sf_ConvertColorString("��o gia th?nghi�p s?ph?l?Du Ch�n Sinh, T�c gia th?nghi�p s?ph?l?��i Ki�m Ch�u."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh�ng gi�i h�n nam n? ph�i l?ng��i kh�ng l�m vi�c �c, ch�a gia nh�p m�n ph�i, kh�ng ph�i l?ph�n �� c�a b�n ph�i ��u c?th?gia nh�p. �� t?V?�ang kh�ng ���c l�m vi�c �c, kh�ng ���c k�t giao v�i t?ma ngo�i ��o, khi h�nh t�u giang h?ph�i gi?g�n thanh quy, h�nh hi�p tr��ng ngh�a.");
end;