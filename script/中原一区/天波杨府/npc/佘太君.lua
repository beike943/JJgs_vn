--����
--�ص㣺�꾩��  ����������������6
--�߻���������  2004.03.
--append by lizhi
--2005-8-8 11:26

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�꾩\\task_main.lua");
Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\practice\\practice_main.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName  = "<color=green>D��ng M�n Gi�o Ch�<color=green> : "
function main()
	local nTaskValue = FN_GetTaskState(FN_YM);
	local nTaskValuem = FN_GetTaskState(FN_YMM);
	  
	if (GetSex() == 1) then
		if ((nTaskValue > 0) and (nTaskValue < 7)) then
			Say("Ng��i ��n t�m <color=yellow>D��ng T�n B�o<color> nh�!",0);
			return
		end;
		if (nTaskValue == 7) then 
			task_115();
			return
		end;
		if (nTaskValue>=9) then
			fix_ym();
			return
	    end;
	end;
		
	if (GetSex() == 2) then
		if ((nTaskValuem > 0) and (nTaskValuem < 7)) then
			Say("Ng��i ��n t�m <color=yellow>M�c Qu� Anh<color> nh�!",0);
			return		
		end;
		if (nTaskValuem == 7) then 
			task_015();
			return
		end;
	    if (nTaskValuem>=9) then
			fix_ym();
			return
		end;
	end; 
	main_new();
end;

-- ʦ���������
function about_faction_task()
	Say("C� chuy�n g� v�y?",
		3,
		"Ta mu�n c�ng hi�n cho s� m�n (nhi�m v� s� m�n)/start_faction_tasklink",
		"Ta mu�n tra xem �� c�ng hi�n./check_query_faction_contri",
		"Ta mu�n t�m hi�u �� c�ng hi�n s� m�n./shimenshuoming")
--		"��Ҫ�޸�ʦ�������޷���ɵ�����/repair_faction_bug")
end;

-- �޸�ɱ�������޷���ɵ�bug
function repair_faction_bug()
	Say("G�n ��y c�ng vi�c r�t nhi�u, ta qu�n nhi�m v� c�a ng��i r�i. Xem nh� l�n n�y ta th� ng��i! B�y gi� ta gi�p ng��i h�y nhi�m v� tr��c, nh�ng ph�i tr� ng��i 5 �i�m c�ng hi�n s� m�n, ng��i x�c ��nh ch�a?", 
		2,
		"���c, ta ��ng �/confirm_repair_bug",
		"�� ta ngh� c�ch kh�c/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("Ta �� h�y gi�p ng��i r�i!", 0)
end;

--�������������꾩����ӿ�
function sayhi()
  local nBjStep = GetTask(TASK_BJ_ID);    --�꾩����
  local UWorld1401 = GetTask(1401);
    
    if nBjStep >= 1 and nBjStep<=6 and UWorld1401 ~= 0 then
        local szSay = {
            "<sex> t�m ta c� vi�c g� kh�ng?",
            "Nhi�m v� Bi�n Kinh/bj_question",
            "Nhi�m v� Thi�n M�n tr�n/tmz_question"
        }
        SelectSay(szSay);
        return
    end;
    
    if nBjStep >= 1 and nBjStep<=6 then
        bj_question();
        return
    end;
    
    if UWorld1401 ~= 0 then
        tmz_question();
        return
    end;
    --Talk(1,"","<color=green>��̫��<color>������ҹ���Դ�������̤���Ҵ��ν�����");     
end;



function bj_question()
    local nBjStep = 0;
    nBjStep = GetTask(TASK_BJ_ID);  --�꾩ϵ��������������
    
    if (nBjStep == 1) then
        task_001_00();
        return
    elseif (nBjStep == 2) then
        task_002_00();
        return
    elseif (nBjStep == 3) then
        task_003_00();
        return
    elseif (nBjStep == 4) then
        task_004_01();
        return
    elseif (nBjStep == 5) then
        task_005_00();
        return
    elseif (nBjStep == 6) then
        task_006_00();
        return
    else
    	Talk(1,"","Gi�c Khi�t �an t� cao t� ��i nh�ng kh�ng d� x�m ph�m c��ng th� ��i T�ng ta!")
    end;
end;

function tmz_question() --����������
    local UWorld1401 = GetTask(1401);
    if ( UWorld1401 == 40 )  then
    	Talk(6,"","T�i h� v�n an Xa L�o Th�i Qu�n!","Kh�! Kh�! �a t�! Xin h�i anh h�ng c� g� ch� gi�o!","T� nh� t�i h� v�n s�ng k�nh D��ng t��ng qu�n, nay mu�n b�o danh gia nh�p D��ng Gia qu�n gi�t gi�c Khi�t �an. N�o ng� b� bi�t ph�i ��n L��ng S�n B�c, xin L�o Th�i Qu�n ph�i t�i h� ��n Nh�n M�n quan ti�n tuy�n!","H�! Chuy�n n�y d� th�i! Chuy�n c�a D��ng Gia qu�n, l�o ��y c� th� t� quy�t! C� n�i l� ta ph�i ng��i �i s� d� d�ng ��u qu�n!","Ti�n th� ng��i chuy�n l�i cho phu qu�n <color=red>D��ng Nghi�p<color> c�a ta � <color=red>Nh�n M�n quan<color> r�ng: Ti�u nh�n l�ng quy�n, h� t�t ph�i ph� t�i.","�a t� L�o Th�i Qu�n chi�u c�! Ti�u nh�n nh�t ��nh chuy�n l�i!")
        SetTask(1401,45)
        ----AddItem(0,0,0)
        Earn(1000)
        GivePlayerExp(SkeyTianmenzhen,"setaijun")
        ModifyReputation(12,0)
        --AddNote("ȥ���Ź�����ҵ��Ϊ��̫�����������Ҵ���ɽ�����ͼ���鱨��")
        TaskTip("��n Nh�n M�n quan t�m D��ng Nghi�p chuy�n l�i c�a Xa Th�i Qu�n, ��ng th�i h�i th�m tin t�c v� B�n �� S�n H� X� T�c!")
    	
    elseif ( UWorld1401  == 45  ) then
    		Talk(1,"","Gi�p ta chuy�n l�i cho phu qu�n <color=red>D��ng Nghi�p<color> � <color=red>Nh�n M�n quan<color>!")	
    elseif ( UWorld1401  > 45  ) then
    	Talk(1,"","�a t� b�ng h�u!")
    else
    	Talk(1,"","Gi�c Khi�t �an t� cao t� ��i nh�ng kh�ng d� x�m ph�m c��ng th� ��i T�ng ta!")
    end
end;	
	
	
	
	
	
--end;

function intertangmen()		--��������
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0)  or (GetTask(1033)>0) then
		Say("Ng��i s�c m�i giang h�! D��ng m�n ta kh�ng ti�n thu nh�n!",0)
	elseif GetLevel() < 10 then	  --�ȼ����
		Say("Mu�n gia nh�p qu�n D��ng gia ph�i c� th�c l�c nh�t ��nh. Ch�a ��n <color=yellow>c�p 10<color> sao c� th� g�p s�c cho Qu�c gia! C�p 10 h�y ��n t�m ta!",0)
	elseif GetPlayerFaction() == 6 then	--���ɼ��
		Say("Ng��i ���ng ���ng l� �� t� D��ng m�n, c�n mu�n gia nh�p g� n�a?",0)
	elseif GetPlayerFaction() > 0 then	--���ɼ��
		Say("Ng��i �� gia nh�p c�c ��i m�n ph�i, D��ng m�n kh�ng th� thu nh�n Nh�n s� giang h�!",0)
	else
	  if GetSex()==2 then
		task_001();
		end;
		if GetSex()==1 then
		task_101();
		return
	  end
   end
end

function skilllearn()
	if GetPlayerFaction() ~= 6 then		--�������ŵ���
		Say("Kh�ng ph�i �� t� D��ng M�n, chuy�n c�a D��ng gia xin ch� xen v�o!",0)
	elseif  GetPlayerRoute() == 16 then 	--�����ŵ��ӵ��ǻ�û��ȥ��ʦ
		Say("D��ng gia qu�n ta cung m� tinh th�ng. D��ng gia Th��ng thi�n h� bi�t danh. H�c <color=yellow>Th��ng ph�p<color>, c� th� t�m <color=yellow>D��ng T�n B�o<color>; H�c <color=yellow>Cung thu�t<color>, c� th� t�m <color=yellow>M�c Qu� Anh<color>.",0)
	elseif  GetPlayerRoute() == 17 then
		Say("Ng��i theo <color=yellow>D��ng M�n th��ng k�<color>, h�c v� c�ng ph�i t�m Th��ng ph�p gi�o ��u <color=yellow>D��ng T�n B�o<color>.",0)
	elseif  GetPlayerRoute() == 18 then
		Say("Ng��i theo<color=yellow>D��ng M�n cung k�<color>, h�c v� c�ng ph�i t�m Cung thu�t gi�o ��u <color=yellow>M�c Qu� Anh<color>.",0)	
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 6 then
		Say("Kh�ng ph�i �� t� D��ng M�n, chuy�n c�a D��ng gia xin ch� xen v�o!",0)
	else
		taskmain("Xa Th�i Qu�n", 5)
	end
end;				


function no()
--	Say("<color=green>��̫��<color>��fuck u��")
end;

function practice()
    if GetPlayerFaction() ~= 6 then
       Talk(1,"","Kh�ng ph�i �� t� D��ng M�n, chuy�n c�a D��ng gia xin ch� xen v�o!");
    else
        if GetItemCount(2, 0, 350) >= 1 then  --ʦ������
            Say("C� mu�n v�o hu�n luy�n kh�ng?",2,"��ng/practice_start","Sai/no");
        else
            Talk(1,"","Ng��i kh�ng c� <color=yellow>l�nh b�i c�a D��ng M�n<color>, kh�ng th� v�o hu�n luy�n.");
        end;
    end;
end;

-- ����ʦ���ظ���������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 6) then						--�������ŵ���
		Say("Kh�ng ph�i �� t� D��ng M�n, chuy�n c�a D��ng gia kh�ng d�m phi�n b�ng h�u!", 0)
	elseif (GetPlayerRoute() == 16) then 					--�����ŵ��ӵ��ǻ�û��ȥ��ʦ
		Say("H�y ��n b�i s� T�n B�o ho�c Qu� Anh, r�i h�y ��n g�p ta nh�n nhi�m v�!", 0)
	elseif (GetPlayerRoute() == 17) then
		task_main_entrance(TASK_ID_YANGMEN_QIANGQI);		-- ǹ��
	elseif (GetPlayerRoute() == 18) then
		task_main_entrance(TASK_ID_YANGMEN_GONGQI);			-- ����
	end
end;

function shimenshuoming()
		Say("<color=green>Thuy�t minh �� c�ng hi�n s� m�n<color>: \n <color=yellow>�� c�ng hi�n s� m�n<color>: Th�ng qua vi�c ho�n th�nh nhi�m v� S� M�n ��t ��n m�t ��ng c�p nh�t ��nh, b�n c� th� nh�n ���c trang ph�c ho�c v� kh� c�a S� M�n. \n <color=yellow>Gi�i h�n �� c�ng hi�n s� m�n<color>: Hi�n nay �� c�ng hi�n S� M�n kh�ng b� h�n ch�, ch� c�n ho�n th�nh nhi�m v� th� c� th� n�ng cao �� c�ng hi�n. \n <color=yellow>S� ki�n V� L�m<color>: L�m xong nhi�m v� c� ��nh s� nh�n th�m m�t nhi�m v� ng�u nhi�n, ho�n th�nh s� nh�n ���c 50 �i�m c�ng hi�n S� m�n v� c� kh� n�ng nh�n ���c m�t t�ch s� m�n.", 
			1,
			"Trang k�/shuoming2")		
end;

function shuoming2()
		Say("<color=green>Thuy�t minh �� c�ng hi�n s� m�n<color>: \n <color=yellow>Gi�i h�n ��ng c�p �� c�ng hi�n S� M�n<color>: ��ng c�p kh�c nhau th� �i�m t�ch l�y �� c�ng hi�n c�ng kh�ng gi�ng nhau. �� c�ng hi�n S� M�n c�ng cao c�ng n�ng cao ��ng c�p c�a m�nh, t� sau c�p 75 th� kh�ng c�n gi�i h�n �� c�ng hi�n n�a. \n <color=yellow>�i�m kinh nghi�m ng�u nhi�n<color>. L�m nhi�u nhi�m v� s� m�n �� c�ng hi�n c�ng cao �i�m kinh nghi�m c�ng nhi�u. �i�m c�ng hi�n <3000 <color=yellow>�i�m kinh nghi�m t��ng ��i<color>, >3000 <color=yellow>�i�m kinh nghi�m c�ng nhi�u<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- û�м�������
		Say("Mu�n l�m nhi�m v� s� m�n tr��c ti�n ph�i gia nh�p b�n gi�o. Sau �� h�y gia nh�p tr��ng ph�i, r�i quay l�i ch� ta nh�n nhi�m v�. Sau khi ho�n th�nh nhi�m v� s� m�n s� nh�n ���c �� c�ng hi�n s� m�n, t�ch l�y �� c�ng hi�n nh�t ��nh c� th� mua v�t ph�m b� truy�n b�n m�n.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 6) then	-- ���Ǳ��ŵ���
		Say("Ng��i kh�ng ph�i l� �� t� c�a b�n gi�o, h�y v� m�n ph�i c�a ng��i m� tra xem �� c�ng hi�n s� m�n nh�. Giao di�n F3 c�ng c� th� tra xem �� c�ng hi�n s� m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Xa Th�i Qu�n<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--�µ����
function main_new()
	local selTab = {
				"Thi�n Ba D��ng ph�/know_qiyuan",
				"V� c�ng Thi�n Ba D��ng ph�/know_wugong",
				"�i�u ki�n nh�p m�n/know_rumentiaojian",
				"Ta mu�n gia nh�p Thi�n Ba D��ng ph�/intertangmen",
				"Ta mu�n l�m nhi�m v� S� M�n/about_faction_task",
				"Li�n quan tu luy�n./practice",
				"Ta s�p th�nh th�n n�n ph�i xu�t s�/#faction_graduate(6)",
				"Th�m h�i Th�i Qu�n/sayhi",
				}
	if (GetPlayerRoute() == 17) or  (GetPlayerRoute() == 18) then
		tinsert(selTab, 1, "Nhi�m v� Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 091130 then
		tinsert(selTab, 1, "�� t� xin k�nh d�ng s� ph� tr� hoa c�c v� b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 6)");
	end
	Say(g_szInfoHead.."Thi�n Ba D��ng ph�, trung ngh�a ki�n c��ng, h�t l�ng v� ��i T�ng.",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."T�ng Th�i T�ng th�i b�nh h�ng th�nh 4 n�m, T�ng di�t B�c H�n, l�nh c�ng qui T�ng, ���c phong l�m ��i t��ng qu�n, tr�n gi� �i Ung M�n. ���c 5 n�m h�ng th�nh, th� nh� Li�u ph�i 10 v�n ��i qu�n ��nh Ung M�n, l�c �� binh m� d��i tay l�nh c�ng ch� c� m�y ngh�n, s� d�ng k� s�ch t�p k�ch, ��nh tan 10 v�n qu�n Li�u, Ung M�n ��i th�ng, l�nh c�ng uy danh l�y l�ng, nh� Li�u ��n l�c n�y m�i khi�p s� tr��c D��ng Gia Tr�n K�. Thi�n Ba D��ng ph� vang danh thi�n h� t� ��.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Thao tr��ng luy�n v� c�a D��ng gia ph�n th�nh Th��ng K� v� Cung K�, t�n c�ng tr�n ng�a (ng�a c� th� mua � ch� D��ng B�i Phong). Th��ng K� ch� tr�ng v�o s�c m�nh t�n ph�, D��ng Gia Ph�p c� th� t�n c�ng g�n v� xa, chi�u th�c d�ng m�nh l�c s�t th��ng m�nh, chuy�n v� t�n c�ng k� th� � di�n t�ch l�n, nhanh nh�n nh� gi�, c� th� h�c v� c�ng tr�n ph�i {Li�n Ho�n To�n Long Th��ng}. Cung k� ch� tr�ng t�c �� th�n ph�p, t�n c�ng li�n t�c v�o k� th�, c�n c� th� to�n l�c ��nh ra ��n ch� m�ng, s� tr��ng t�n c�ng xa, c� th� h�c v� c�ng tr�n ph�i {B� V��ng T��ng Ph�ng Ti�n}."),g_szInfoHead..sf_ConvertColorString("S� ph� Th��ng K� l� Th��ng K� gi�o ��u {D��ng T�n B�o}, s� ph� Cung K� l� Cung K� gi�o ��u {M�c Qu� Anh}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh�ng ph�n bi�t nam n�, ph�m h�nh �oan ch�nh, ch�a gia nh�p bang m�n kh�c, kh�ng ph�i l� ph�n �� c�a phe ta ��u c� th� gia nh�p. Qu�n ta v� l�i �ch qu�c gia, tri�u ��nh, ng��i gia nh�p ph�i ghi nh� �i�u n�y.");
end;