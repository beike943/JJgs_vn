-- =========================================
-- File : ��ԭһ�����꾩�����ε���.lua
-- Name : ���ε���
-- ID   : 1, 8
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

ID_LEARNLIFESKILL		= 1925		-- �����������
TASK49_BEGGING			= 1933		-- 49����������ʼ��ʾ
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�������
FORGETMAIN_NUM			= 1940		-- ���������ܴ���
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
strName = "";
strTitle = "";

--*****************************************MAIN����*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu?5 gi?ch�i, h�y ngh?ng�i �� gi?g�n s�c kh�e!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-------------------------------------------��������-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 2) then
		Say(strTitle.."�� <color=yellow>10��<color> ��ȥ <color=yellow>�ɶ�<color> �� <color=yellow>�η�ҽ��<color> �˽� <color=yellow>�����<color>!", 0)
    	TaskTip("10����ȥ�ɶ����η�ҽ��.")        
		return    
    elseif (GetTask(ID_LEARNLIFESKILL) >= 2 and GetTask(ID_LEARNLIFESKILL) < 15) then
		Talk(3, 
			 "",
			 strTitle.."�ҽ�����һЩ�й��ռ����ɵ�����",
			 strTitle.."�ռ����ܰ�����<color=yellow>������ľ���ɿ󣬸��֣�ɹ�ڣ����ԣ�ժҩ��˿�����<color>�� �ռ�������Ҫһ�������ʹ��������Ӧ���ߡ� <color=yellow>������ľ��Ҫ����; �ɿ���Ҫ��; ������Ҫ��ͷ..<color>.",
			 strTitle.."��ע�⣬ÿ�����߶�����һ���������ԡ� ���ڣ�����ת��<color=yellow>�꾩<color> ȥ�� <color=yellow>��һ��<color>.")
		if (GetTask(ID_LEARNLIFESKILL) == 2) then
			SetTask(ID_LEARNLIFESKILL, 3)
			TaskTip("ȥ�꾩����һ��")
		end
		return
    end
	
 ---------------------------------------------���Ի�-------------------------------------------
	Say(strTitle.."�������ε���,��ͨ�Ʒ�,��ʲô���԰������.",
		4,
		"ѧϰ�Ʒ�����/luaLearnLifeSkill",
		"�䷽��ص�����/learn_all_recipe",
		"�����Ʒ�����/forget_life_skill",
		"û����/SayHello")
end;

-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."Ng��i mu�n h�c c�ch ph�i ch?ho�c l�m nhi�m v?ph�i ch?",
		7,
		"ѧϰ�µ��䷽/luaLearnRecipe",
		"�˽����Ϊ��ĩ���׼��/Weekend",
		"��ѧ�µ��䷽/luaResLearnRecipe",
		"����76���䷽����/get_76_task",
		"��ѧ76���䷽/relearn_76_recipe",
		"�޸��䷽/Reset_Learn",
		"û����/SayHello")
end;

-- ����76���䷽����
function get_76_task()
 ----------------------------------76�������䷽�����������----------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU);
		
	if nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79 then
		--��δ�����䷽����
		if nTaskState_chiwu == 0 then
			juju_chiwu_001()
			return
		--����ȥ��ħ����ĶԻ�
		elseif nTaskState_chiwu == 1 then
			juju_chiwu_002()
			return
		--�ͻغ���ʯ������ľ��ѧ���䷽
		elseif nTaskState_chiwu == 2 then
			juju_chiwu_007()
			return			
		end 
	end
		
	--��ʾ���76�������䷽����
	if nSkillGenre == 1 and nSkillDetail ~= 8 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("�㲻�����76���䷽����.", 0)
end;


-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (nGene == 1 and nSkillID == 8) then
		if (GetTask(1605) == 3 and nLevel >= 79) then
			AddRecipe(808)
			Msg2Player("��ѧ���� X�ch ?Linh ph")
		else
			Say("B�n ch�a l�m nhi�m v?ph�i ch?c�p 76", 0)
		end
	else
		Say("B�n ch�a h�c k?n�ng: <color=yellow>Luy�n b�a<color>!", 0)
	end
end;

-- ���������
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- ������
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."��y l?l�n th?"..(nForgetTimes + 1).." l�n b?k?n�ng s�n xu�t, m�t "..nShouldPay.." l��ng, ng��i suy ngh?k?ch�a?",
			2,
			"Ta �� quy�t ��nh r�i!/forget_now",
			"Khoan ��! Ch?ta suy ngh?l�i!/SayHello")
	else
		Say(strTitle.."Ng��i ch�a h�c k?n�ng luy�n b�a? Ta kh�ng th?gi�p ng��i!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- ������
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 8)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(515, 0)
				SetTask(1601, 0);--���79�������䷽����
				SetTask(1605, 0);--���79�������䷽����
				Msg2Player("B�n �� b?k?n�ng luy�n b�a")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh?", 0)
		end
	end
end;

----------------------------------------ʱ���ж��ű�----------------------------------------
--�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;
--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H")
	nMin = date("%M")
	return tonumber(nHour), tonumber(nMin)
end;
--19 - 23��59��
function CheckTime(day)
	if (WEEKEND_SWITCH == 0) then
		return 0
	end
	if (day ~= GetWeekDay()) then
		return 0
	end
	--����19:00 - 24:00��ʲô����
	local nBegin = 19 * 60
	local nEnd = 24 * 60
	local nHour, nMin = GetLocalTime()
	local nValue = nHour * 60 + nMin
	if (nValue >= nBegin and nValue <= nEnd) then
		return 1
	else
		return 0
	end
end;


----------------------------����ѧϰѡ��--------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
    	Say (strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch?th?h�c k?n�ng s�ng.", 0)
    	return
	end
	
    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."B�ng h�u �� h�c k?n�ng s�n xu�t, mu�n h�c k?n�ng m�i c�n ph�i b?k?n�ng c?", 0)
    	return
    end
    
	Say(strTitle.."B�ng h�u mu�n h�c k?n�ng <color=yellow>luy�n b�a<color>?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh?l�i/LearnNo")
end;
--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if LearnLifeSkill(1, 8, 1, 79, 1) then
        	AddItem(2, 1, 901, 30)
        	Msg2Player("H�c ���c k?n�ng s�ng: Ch?ph?v?nh�n ���c 30 Bi�n kinh th�ch.")
	    end
    
    		AddRecipe(36)
    		Msg2Player("��ѧ���� H�i ph?Bi�n Kinh")
    		AddRecipe(37)
    		Msg2Player("��ѧ���� H�i ph?Th�nh ��")
    		AddRecipe(38)
    		Msg2Player("��ѧ���� H�i ph?Tuy�n Ch�u")
    	SetTask(LEV_LEARNRECIPE, 10)
    	
	else
		Say(strTitle.."B�n �� h�c k?n�ng s�ng, kh�ng th?h�c th�m k?n�ng kh�c.", 0)
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."H�y suy ngh?k?r�i quay l�i ��y nh?", 0)
end

--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
    		AddRecipe(36)
    		Msg2Player("��ѧ���� H�i ph?Bi�n Kinh")
    		AddRecipe(37)
    		Msg2Player("��ѧ���� H�i ph?Th�nh ��")
    		AddRecipe(38)
    		Msg2Player("��ѧ���� H�i ph?Tuy�n Ch�u")
    		SetTask(LEV_LEARNRECIPE, 10)
    	elseif (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
	    	AddRecipe(29)
    		Msg2Player("��ѧ���� Gi�m ��nh ph?(c�p 1)")
    		AddRecipe(39)
    		Msg2Player("��ѧ���� H�i ph?T��ng D��ng")    		
    		AddRecipe(226)
    		Msg2Player("��ѧ���� H�i ph?D��ng Ch�u")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
        	AddRecipe(30)
        	Msg2Player("��ѧ���� Gi�m ��nh ph?(c�p 2)")
        	AddRecipe(41)
        	Msg2Player("��ѧ���� ��i L?H�i ph")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
        	AddRecipe(31)
        	Msg2Player("��ѧ���� Gi�m ��nh ph?(c�p 3)")
        	AddRecipe(947)
        	Msg2Player("��ѧ���� V?�ang H�i ph")
        	AddRecipe(948)
        	Msg2Player("��ѧ���� C�i Bang H�i ph")
        	AddRecipe(949)
        	Msg2Player("��ѧ���� Thi�u L�m H�i ph")
        	AddRecipe(950)
        	Msg2Player("��ѧ���� Nga My H�i ph")
        	AddRecipe(952)
        	Msg2Player("��ѧ���� ���ng M�n H�i ph")
        	AddRecipe(953)
        	Msg2Player("��ѧ���� Ng?��c H�i ph")
        	AddRecipe(954)
        	Msg2Player("��ѧ���� D��ng M�n H�i ph")          	 
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(32)
        	Msg2Player("��ѧ���� Gi�m ��nh ph?(c�p 3)")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(33)
        	Msg2Player("��ѧ���� Gi�m ��nh ph?(c�p 5)")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(34)
        	Msg2Player("��ѧ���� Gi�m ��nh ph?(c�p 6)")
        	AddRecipe(951)
        	Msg2Player("��ѧ���� T�p linh ph")
        	SetTask(LEV_LEARNRECIPE,70)
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(35)
        	Msg2Player("��ѧ���� Gi�m ��nh ph?(c�p 7)")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say(strTitle..": ��ng qu?n�n n�ng, kinh nghi�m giang h?ng��i c�n k�m l�m, c?g�ng th�m nh?", 0)
    	end
    end
end;

--�Լ��ܵ�˵����Ϣ
function Weekend()
    if (GetLifeSkillLevel(1, 8) >= 1 and 
    	(CheckTime(0) == 1 or CheckTime(5) == 1 or CheckTime(6) == 1)) then
    	Say(strTitle.."Tu�n l?ho�ng kim �� ��n, ta ��y c?ph��ng ph�p ph�i ch?��c bi�t l�m ���c gi�y b�a qu�n d�ng r�t c?�ch cho ti�n tuy�n!", 0)
    	AddRecipe(231)
    	Msg2Player("B�n h�c ���c c�ch ph�i ch?m�i - Gi�y b�a qu�n d�ng!")
    else
    	Say(strTitle.."Ng��i ch�a h�c luy�n b�a ho�c ch�a ��ng l�c n�n ta kh�ng th?truy�n th?", 0)
    end
end

--ȡ������
function SayHello()
end

--�޸��䷽
function Reset_Learn()
	if (GetLifeSkillLevel(1, 8) >= 1) then
		SetTask(LEV_LEARNRECIPE, 0)
		Talk(1, "", strTitle.."Ph�i ch?c�a ng��i �� ���c tu s�a, m�i 10 c�p c?th?h�c c�ch ph�i ch?m�i.")
		return	
	else
		Talk(1, "", strTitle.."��ng h�ng g�t ta!")
	end
end

--���µ��䷽
function luaResLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(947)
        	Msg2Player("��ѧ���� V?�ang H�i ph")
        	AddRecipe(948)
        	Msg2Player("��ѧ���� C�i Bang H�i ph")
        	AddRecipe(949)
        	Msg2Player("��ѧ���� Thi�u L�m H�i ph")
        	AddRecipe(950)
        	Msg2Player("��ѧ���� Nga My H�i ph")
        	AddRecipe(952)
        	Msg2Player("��ѧ���� ���ng M�n H�i ph")
        	AddRecipe(953)
        	Msg2Player("��ѧ���� Ng?��c H�i ph")
        	AddRecipe(954)
        	Msg2Player("��ѧ���� D��ng M�n H�i ph") 
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(947)
        	Msg2Player("��ѧ���� V?�ang H�i ph")
        	AddRecipe(948)
        	Msg2Player("��ѧ���� C�i Bang H�i ph")
        	AddRecipe(949)
        	Msg2Player("��ѧ���� Thi�u L�m H�i ph")
        	AddRecipe(950)
        	Msg2Player("��ѧ���� Nga My H�i ph")
        	AddRecipe(952)
        	Msg2Player("��ѧ���� ���ng M�n H�i ph")
        	AddRecipe(953)
        	Msg2Player("��ѧ���� Ng?��c H�i ph")
        	AddRecipe(954)
        	Msg2Player("��ѧ���� D��ng M�n H�i ph") 
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(947)
        	Msg2Player("��ѧ���� V?�ang H�i ph")
        	AddRecipe(948)
        	Msg2Player("��ѧ���� C�i Bang H�i ph")
        	AddRecipe(949)
        	Msg2Player("��ѧ���� Thi�u L�m H�i ph")
        	AddRecipe(950)
        	Msg2Player("��ѧ���� Nga My H�i ph")
        	AddRecipe(952)
        	Msg2Player("��ѧ���� ���ng M�n H�i ph")
        	AddRecipe(953)
        	Msg2Player("��ѧ���� Ng?��c H�i ph")
        	AddRecipe(954)
        	Msg2Player("��ѧ���� D��ng M�n H�i ph") 
        	AddRecipe(951)
        	Msg2Player("��ѧ���� T�p linh ph")        	
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(947)
        	Msg2Player("��ѧ���� V?�ang H�i ph")
        	AddRecipe(948)
        	Msg2Player("��ѧ���� C�i Bang H�i ph")
        	AddRecipe(949)
        	Msg2Player("��ѧ���� Thi�u L�m H�i ph")
        	AddRecipe(950)
        	Msg2Player("��ѧ���� Nga My H�i ph")
        	AddRecipe(952)
        	Msg2Player("��ѧ���� ���ng M�n H�i ph")
        	AddRecipe(953)
        	Msg2Player("��ѧ���� Ng?��c H�i ph")
        	AddRecipe(954)
        	Msg2Player("��ѧ���� D��ng M�n H�i ph") 
        	AddRecipe(951)
        	Msg2Player("��ѧ���� T�p linh ph")
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 80) then
        	AddRecipe(947)
        	Msg2Player("��ѧ���� V?�ang H�i ph")
        	AddRecipe(948)
        	Msg2Player("��ѧ���� C�i Bang H�i ph")
        	AddRecipe(949)
        	Msg2Player("��ѧ���� Thi�u L�m H�i ph")
        	AddRecipe(950)
        	Msg2Player("��ѧ���� Nga My H�i ph")
        	AddRecipe(952)
        	Msg2Player("��ѧ���� ���ng M�n H�i ph")
        	AddRecipe(953)
        	Msg2Player("��ѧ���� Ng?��c H�i ph")
        	AddRecipe(954)
        	Msg2Player("��ѧ���� D��ng M�n H�i ph") 
        	AddRecipe(951)
        	Msg2Player("��ѧ���� T�p linh ph")
    	else
        	Say(strTitle..": ��ng qu?n�n n�ng, kinh nghi�m giang h?ng��i c�n k�m l�m, c?g�ng th�m nh?", 0)
    	end
    end
end;

function Huan_Fushi()
	if GetItemCount(0,200,29)>0 then 
		Say("Ng��i c?mu�n ��i Bi�n Kinh Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Bianjingzhuanhuan",
		"�� ta suy ngh?l�i!/SayHello"
		)
	elseif GetItemCount(0,200,30)>0 then 
		Say("Ng��i c?mu�n ��i Th�nh �� Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Chengduzhuanhuan",
		"�� ta suy ngh?l�i!/SayHello"
		)
	elseif GetItemCount(0,200,31)>0 then 
		Say("Ng��i c?mu�n ��i Tuy�n Ch�u Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Quanzhouzhuanhuan",
		"�� ta suy ngh?l�i!/SayHello"
		)
	elseif GetItemCount(0,200,32)>0 then 
		Say("Ng��i c?mu�n ��i T��ng D��ng Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Xiangyangzhuanhuan",
		"�� ta suy ngh?l�i!/SayHello"
		)
	elseif GetItemCount(0,200,34)>0 then 
		Say("Ng��i c?mu�n ��i ��i L?Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Dalizhuanhuan",
		"�� ta suy ngh?l�i!/SayHello"
		)
	elseif GetItemCount(0,200,35)>0 then 
		Say("Ng��i c?mu�n ��i D��ng Ch�u Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Yangzhouzhuanhuan",
		"�� ta suy ngh?l�i!/SayHello"
		)
	else Say("Ng��i kh�ng mang theo t�m Ph?Th�ch c?? Hay l?b?qu�n ch?th?kh?r�i.",
		1,
		"�� ta �i l�y!/SayHello"
		)		
	end;
end;

function Bianjingzhuanhuan()
		DelItem(0,200,29,1)
		AddItem(2,1,901,20)
end;

function Chengduzhuanhuan()
		DelItem(0,200,30,1)
		AddItem(2,1,902,20)
end;

function Quanzhouzhuanhuan()
		DelItem(0,200,31,1)
		AddItem(2,1,903,20)
end;

function Xiangyangzhuanhuan()
		DelItem(0,200,32,1)
		AddItem(2,1,904,20)
end;

function Dalizhuanhuan()
		DelItem(0,200,34,1)
		AddItem(2,1,906,20)
end;

function Yangzhouzhuanhuan()
		DelItem(0,200,35,1)
		AddItem(2,1,907,20)
end;