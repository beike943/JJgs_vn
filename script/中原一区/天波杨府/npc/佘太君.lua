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
szNpcName  = "<color=green>����̫��<color=green> : "
function main()
	local nTaskValue = FN_GetTaskState(FN_YM);
	local nTaskValuem = FN_GetTaskState(FN_YMM);
	  
	if (GetSex() == 1) then
		if ((nTaskValue > 0) and (nTaskValue < 7)) then
			Say("��ȥ�� <color=yellow>���ڱ�<color> ��!",0);
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
			Say("��ȥ�� <color=yellow>�¹�Ӣ<color> ��!",0);
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
	Say("C? chuy�n g? v�y?",
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

--�������������꾩����ӿ�
function sayhi()
  local nBjStep = GetTask(TASK_BJ_ID);    --�꾩����
  local UWorld1401 = GetTask(1401);
    
    if nBjStep >= 1 and nBjStep<=6 and UWorld1401 ~= 0 then
        local szSay = {
            "<sex> ������ʲô����?",
            "�꾩����/bj_question",
            "����������/tmz_question"
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
    	Talk(1,"","����ҹ���Դ�������̤���Ҵ��ν���!")
    end;
end;

function tmz_question() --����������
    local UWorld1401 = GetTask(1401);
    if ( UWorld1401 == 40 )  then
    	Talk(6,"","T�i h? v�n an Xa L�o Th�i Qu�n!","Kh?! Kh?! �a t?! Xin h�i anh h�ng c? g? ch? gi�o!","T? nh? t�i h? v�n s�ng k�nh D��ng t��ng qu�n, nay mu�n b�o danh gia nh�p D��ng Gia qu�n gi�t gi�c Khi�t �an. N�o ng? b? bi�t ph�i ��n L��ng S�n B�c, xin L�o Th�i Qu�n ph�i t�i h? ��n Nh�n M�n quan ti�n tuy�n!","H?! Chuy�n n�y d? th�i! Chuy�n c�a D��ng Gia qu�n, l�o ��y c? th? t? quy�t! C? n�i l? ta ph�i ng��i �i s? d? d�ng ��u qu�n!","Ti�n th? ng��i chuy�n l�i cho phu qu�n <color=red>D��ng Nghi�p<color> c�a ta ? <color=red>Nh�n M�n quan<color> r�ng: Ti�u nh�n l�ng quy�n, h? t�t ph�i ph? t�i.","�a t? L�o Th�i Qu�n chi�u c?! Ti�u nh�n nh�t ��nh chuy�n l�i!")
        SetTask(1401,45)
        ----AddItem(0,0,0)
        Earn(1000)
        GivePlayerExp(SkeyTianmenzhen,"setaijun")
        ModifyReputation(12,0)
        --AddNote("ȥ���Ź�����ҵ��Ϊ��̫�����������Ҵ���ɽ�����ͼ���鱨��")
        TaskTip("ȥ���Ź�����ҵ��Ϊ��̫�����������Ҵ���ɽ�����ͼ���鱨!")
    	
    elseif ( UWorld1401  == 45  ) then
    		Talk(1,"","Ϊ��̫��������<color=red>��ҵ<color> �6�7 <color=red>���Ź�<color>!")	
    elseif ( UWorld1401  > 45  ) then
    	Talk(1,"","�a t? b�ng h�u!")
    else
    	Talk(1,"","����ҹ���Դ�������̤���Ҵ��ν���!")
    end
end;	
	
	
	
	
	
--end;

function intertangmen()		--��������
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0)  or (GetTask(1033)>0) then
		Say("���Ѽ�������! �޷��ټ�������!",0)
	elseif GetLevel() < 10 then	  --�ȼ����
		Say("��������ű���߱�һ��ʵ��.�㻹û�� <color=yellow>10��<color> ���Ϊ��Ч��! 10��֮����������!",0)
	elseif GetPlayerFaction() == 6 then	--���ɼ��
		Say("���Ѽ�������, �����ʲô?",0)
	elseif GetPlayerFaction() > 0 then	--���ɼ��
		Say("���Ѽ�������! �޷��ټ�������!",0)
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
		Say("�㲻�����ŵ���, �������첨����£���Ҫ�������!",0)
	elseif  GetPlayerRoute() == 16 then 	--�����ŵ��ӵ��ǻ�û��ȥ��ʦ
		Say("�첨��ó���ͨ����ս��, ��Ҿ���������. �������ѧϰ<color=yellow>����ǹ��<color> ��ȥ��<color=yellow>���ڱ�<color>; �������ѧϰ <color=yellow>���Ź���<color> ��ȥ��<color=yellow>�¹�Ӣ<color>.",0)
	elseif  GetPlayerRoute() == 17 then
		Say("����ѧ <color=yellow>����ǹ��<color>, ��ǹ��ʦ�� <color=yellow>���ڱ�<color>.",0)
	elseif  GetPlayerRoute() == 18 then
		Say("����ѧ<color=yellow>���Ź���<color>, �ҹ���ʦ��<color=yellow>�¹�Ӣ<color>.",0)	
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 6 then
		Say("�㲻�����ŵ���, �������첨����£���Ҫ�������!",0)
	else
		taskmain("Xa Th�i Qu�n", 5)
	end
end;				


function no()
--	Say("<color=green>��̫��<color>��fuck u��")
end;

function practice()
    if GetPlayerFaction() ~= 6 then
       Talk(1,"","�㲻�����ŵ���, �������첨����£���Ҫ�������!");
    else
        if GetItemCount(2, 0, 350) >= 1 then  --ʦ������
            Say("�������ѵ����?",2,"��/practice_start","Sai/no");
        else
            Talk(1,"","��û��<color=yellow>��������<color>, �޷�����ѵ��.");
        end;
    end;
end;

-- ����ʦ���ظ���������
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 6) then						--�������ŵ���
		Say("�������ŵ���, ���ŵ����㻹���ٴ���Ϊ��!", 0)
	elseif (GetPlayerRoute() == 16) then 					--�����ŵ��ӵ��ǻ�û��ȥ��ʦ
		Say("��ȥ��ʦ����������!", 0)
	elseif (GetPlayerRoute() == 17) then
		task_main_entrance(TASK_ID_YANGMEN_QIANGQI);		-- ǹ��
	elseif (GetPlayerRoute() == 18) then
		task_main_entrance(TASK_ID_YANGMEN_GONGQI);			-- ����
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
	
	if (GetPlayerFaction() ~= 6) then	-- ���Ǳ��ŵ���
		Say("Ng��i kh�ng ph�i l? �� t? c�a b�n gi�o, h�y v? m�n ph�i c�a ng��i m? tra xem �� c�ng hi�n s? m�n nh?. Giao di�n F3 c�ng c? th? tra xem �� c�ng hi�n s? m�n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>��̫��<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--�µ����
function main_new()
	local selTab = {
				"�첨���Դ/know_qiyuan",
				"�첨��书/know_wugong",
				"��������/know_rumentiaojian",
				"�����첨�/intertangmen",
				"�����������/about_faction_task",
				"�չ�����/practice",
				"�Ҵ�����ף������ʦ/#faction_graduate(6)",
				"����к�/sayhi",
				}
	if (GetPlayerRoute() == 17) or  (GetPlayerRoute() == 18) then
		tinsert(selTab, 1, "Nhi�m v? Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_32");
	end
--	tinsert(selTab,8,"��������ս���/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 091130 then
		tinsert(selTab, 1, "�� t? xin k�nh d�ng s? ph? tr? hoa c�c v? b�nh b�ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 6)");
	end
	Say(g_szInfoHead.."Thi�n Ba D��ng ph?, trung ngh�a ki�n c��ng, h�t l�ng v? ��i T�ng.",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."��̫��̫ƽ�˹����꣬���𱱺�������Σ���Ϊ�󽫾����������Źء�̫ƽ�˹����꣬����ʮ�����������Źأ���ʱ����±���ֻ�м�ǧ����ȡ�������֮�߰�Χ��Ϯ������ʮ���ɾ������Źش�ݣ������Զ���������ɹ��������ս�죬�ŷ�ɥ�����첨��������¡�.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("�������У������Ϊǹ��������������������� (��ƥ�����ŷ紦���Թ���)�� ǹ���������������, ���ǹ���ɽ���̴򡢿�Զ����Ѹ�ͳ�ɱ,��ʽ�վ�����ɱ��������, �Դ�����˵м���,һ�˳�ǹ������ȥ���, ��ѧ�����书 {��������ǹ}��������������ٶ�, �ɿ��ٷ����������,�ֿ�ȫ���������һ��,��Զ��ѹ�Ƽ���, ��ѧ�����书 {��������}."),g_szInfoHead..sf_ConvertColorString("ǹ�����ҵʦ����ǹ���ͷ{���ڱ�}, �������ҵʦ���ǹ����ͷ{�¹�Ӣ}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."������Ů,Ʒ�ж���, û�м�����������,�Ǳ�����ͽ���ɲξ�.�Ҿ���Ч�ҹ�,Ч�ҳ�͢, ά�����²������ξ��߽����Դ�Ϊ־.");
end;