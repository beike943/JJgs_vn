-- =========================================
-- File : ��ԭ�������ɶ����η�ҽ��.lua
-- Name : �η�ҽ��
-- ID   : 1, 6
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �����������
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�������
TASK49_BEGGING			= 1933		-- ��������ʼ
FORGETMAIN_NUM			= 1940		-- ���������ܴ���
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
strName = "";
strTitle = "";

--*****************************************MAIN����*******************************************
function main()	
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","����5��Сʱ������Ϣһ���Ա��ֽ���!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
		
	-------------------------------------------��������-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) > 3 and GetTask(ID_LEARNLIFESKILL) < 15) then
		SetTask(ID_LEARNLIFESKILL, 0)
		TaskTip(" �� gi�p b�n s�a nhi�m v?T�n Th?k?n�ng s�ng, xin h�y b�t ��u l�i.")
		return
	end
    if (GetLevel() < 10) then
		Say(strTitle.."�㻹���ᣡ ��ѧϰ������� �ȵ���ﵽ10����������!", 0)
		return
    elseif (GetTask(ID_LEARNLIFESKILL) >= 0 and GetTask(ID_LEARNLIFESKILL) < 15 and GetLevel() >= 10) then
		Talk(2, "NewLifeSkills", 
			 strTitle.."�ҽ�����չʾ�������ܣ����Ȱ�����������: <color=yellow>���������죬���������죬������װ�ף���װ��ñ�ӣ���⿵�<color>.",
			 strTitle.."������Ʒ��Ҫ���ɺͲ��ϡ� ����3������<color=yellow>������<color> ��Ҫ��ϼ���<color=yellow>����<color>��<color=yellow>�ɿ�<color>�ṩԭ���ϡ� �������� <color=yellow>װ�ף���װ��ͷ��<color>��Ҫ�������<color=yellow>���� <color> ��<color=yellow>����<color>. Mu�n <color=yellow>���<color> ��Ҫ <color=yellow>�ո�<color>...")
		if (GetTask(ID_LEARNLIFESKILL) == 0) then
			SetTask(ID_LEARNLIFESKILL, 1)
			TaskTip("ȥȪ���� �����")
		end
		return
    end
    
--------------------------------------------���Ի�-------------------------------------------
	Say(strTitle.."�����η�ҽ������רҵ��ҽѧ֪ʶ����������֪������Ϊ����Щʲô?",
		4,
		"ѧϰ��ҩ/luaLearnLifeSkill",
		"76���䷽/learn_all_recipe",
		"������ҩ����/forget_life_skill",
		"û����/SayHello")
end;


-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."����ʲô?",
		5,
		"ѧϰ�µ��䷽/luaLearnRecipe",
		"�˽����Ϊ��ĩ���׼��/Weekend",
		"����76���䷽����/get_76_task",
		"��ѧ76���䷽/relearn_76_recipe",
		"û����/SayHello")
end;


-- ����76���䷽����
function get_76_task()
----------------------------------76�������䷽���پ�ʯ����----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
		
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--��δ�����䷽����
		if nTaskState_heiwu == 0 then
			medicine_heiwu_001()
			return
		--�Ͻ�ҩƷ
		elseif nTaskState_heiwu == 1 then
			medicine_heiwu_002()
			return
		--δ����󹤶Ի�
		elseif nTaskState_heiwu == 2 then
			medicine_heiwu_004()
			return
		--ѧ����پ�ʯ�䷽
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_009()
			return
		end 
	end
		
	--��ʾ���76�������䷽����
	if nSkillGenre == 1 and nSkillDetail ~= 6 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("�㲻�����76���䷽����.", 0)
end;


-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nGene == 1 and nSkillID == 6) then
		if (GetTask(1602) == 5 and nLevel >= 79) then
			AddRecipe(805)
			Msg2Player("��ѧ�������� H�c ?Tinh Th�ch")
		else
			Say("B�n ch�a ho�n th�nh nhi�m v?ph�i ch?c�p 76 c�a k?n�ng Ch?d��c!", 0)
		end
	else
		Say("B�n ch�a h�c k?n�ng: <color=yellow>Ch?d��c<color>!", 0)
	end
end;


-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(1, 6) > 0) then
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
			"ȷ��Ҫ������!/forget_now",
			"������/SayHello")
	else
		Say(strTitle.."��Ҳ������ҩ���ܰ�.", 0)
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
	
	if (GetLifeSkillLevel(1, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(RESET_ERROR, 0)
				SetTask(1602, 0);						--���79�������䷽����
				Msg2Player("K?n�ng Ch?d��c c�a b�n �� h�y.")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh?", 0)
		end
	end
end;





 ------------------------------------------ʱ���ж�--------------------------------------------
 --�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;

--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23��59��
function CheckTime(day)
	--�����
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--����19:00 - 24:00��ʲô����
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end
end;


--**********************************************����ѧϰ����***************************************
--����ѧϰѡ��
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."�� <color=yellow>10��<color> �Ժ���������.",0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."�Ѿ�ѧϰ���������ܣ���ѧϰ�¼�����Ҫ�����ɼ���", 0)
    	return
	end
    
	Say(strTitle.."<color=yellow>��ҩ<color>��Ϊ����������ܣ���ȷ��Ҫѧϰ?",
    	2,
    	"ѧϰ��ҩ/LearnYes",
    	"�Ȳ�ѧ/LearnNo")
end

--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 6, 1, 79, 1)) then
        	Msg2Player("��ѧϰ������ܣ���ҩ��һЩ��������.")
        	AddItem(1,2,8,9)
        	AddItem(1,2,1,3)
	   		
	   		AddRecipe(3)
        	Msg2Player("��ѧ�������� Kim S�ng t�n")
        	AddRecipe(8)
        	Msg2Player("��ѧ�������� Ti�u Ho�n ��n")
    	    SetTask(LEV_LEARNRECIPE,10)
		end
	else
		Say(strTitle.."���Ѿ�ѧϰ������ܣ��޷�ѧϰ��������.", 0)
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say(strTitle.."H�y suy ngh?k?r�i quay l�i ��y nh?", 0)
end

--**********************************************�䷽ѧϰ����***************************************
--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nLevel >= 1) then
		if GetTask(LEV_LEARNRECIPE)>=20 and HaveLearnRecipe(234)==0 then
			AddRecipe(234)
            Msg2Player("��ѧ�������� B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("��ѧ�������� �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("��ѧ�������� Gi�i ��c ��n")
		elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("��ѧ�������� B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("��ѧ�������� �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("��ѧ�������� Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("��ѧ�������� To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("��ѧ�������� Ch?Th�y ��n")
        elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(234)==0 then
        	AddRecipe(234)
            Msg2Player("��ѧ�������� B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("��ѧ�������� �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("��ѧ�������� Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("��ѧ�������� To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("��ѧ�������� Ch?Th�y ��n")
            AddRecipe(240)
            Msg2Player("��ѧ�������� Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("��ѧ�������� B�i V�n ��n")
		elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("��ѧ�������� B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("��ѧ�������� �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("��ѧ�������� Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("��ѧ�������� To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("��ѧ�������� Ch?Th�y ��n")
            AddRecipe(240)
            Msg2Player("��ѧ�������� Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("��ѧ�������� B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("��ѧ�������� Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("��ѧ�������� B?Thi�n t�n")
        elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("��ѧ�������� B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("��ѧ�������� �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("��ѧ�������� Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("��ѧ�������� To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("��ѧ�������� Ch?Th�y ��n")
            AddRecipe(240)
            Msg2Player("��ѧ�������� Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("��ѧ�������� B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("��ѧ�������� Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("��ѧ�������� B?Thi�n t�n")
            AddRecipe(237)
            Msg2Player("��ѧ�������� Ng?D�ch ��n")
            AddRecipe(247)
            Msg2Player("��ѧ�������� C�n Nguy�n Ch�nh Kh?��n")
        elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("��ѧ�������� B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("��ѧ�������� �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("��ѧ�������� Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("��ѧ�������� To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("��ѧ�������� Ch?Th�y ��n")
            AddRecipe(240)
            Msg2Player("��ѧ�������� Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("��ѧ�������� B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("��ѧ�������� Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("��ѧ�������� B?Thi�n t�n")
            AddRecipe(237)
            Msg2Player("��ѧ�������� Ng?D�ch ��n")
            AddRecipe(247)
            Msg2Player("��ѧ�������� C�n Nguy�n Ch�nh Kh?��n")
            AddRecipe(242)
            Msg2Player("��ѧ�������� Th�t Tr�ng Th�t Hoa t�n")
        elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("��ѧ�������� B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("��ѧ�������� �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("��ѧ�������� Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("��ѧ�������� To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("��ѧ�������� Ch?Th�y ��n")
            AddRecipe(240)
            Msg2Player("��ѧ�������� Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("��ѧ�������� B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("��ѧ�������� Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("��ѧ�������� B?Thi�n t�n")
            AddRecipe(237)
            Msg2Player("��ѧ�������� Ng?D�ch ��n")
            AddRecipe(247)
            Msg2Player("��ѧ�������� C�n Nguy�n Ch�nh Kh?��n")
            AddRecipe(242)
            Msg2Player("��ѧ�������� Th�t Tr�ng Th�t Hoa t�n")
            AddRecipe(238)
            Msg2Player("��ѧ�������� B�n Tinh Nguy�t ��n")
            AddRecipe(243)
            Msg2Player("��ѧ�������� ��i Nh�t D��ng T�n")
            AddRecipe(248)
            Msg2Player("��ѧ�������� Thi�n V��ng B?T�m ��n")    
		elseif nLevel>=1 and GetTask(LEV_LEARNRECIPE)==0 then
       		AddRecipe(3)
        	Msg2Player("��ѧ�������� Kim S�ng t�n")
        	AddRecipe(8)
        	Msg2Player("��ѧ�������� Ti�u Ho�n ��n")
    	    SetTask(LEV_LEARNRECIPE,10)
        elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(4)
        	Msg2Player("��ѧ�������� Ch?Huy�t t�n")
        	AddRecipe(13)
        	Msg2Player("��ѧ�������� Thanh T�m t�n")
        	AddRecipe(234)
        	Msg2Player("��ѧ�������� B�ch Nh�t ��n")
        	AddRecipe(239)
        	Msg2Player("��ѧ�������� �ch D��ng t�n")
        	AddRecipe(244)
        	Msg2Player("��ѧ�������� Gi�i ��c ��n")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(9)
        	Msg2Player("��ѧ�������� Ho�n D��ng ��n")
        	AddRecipe(14)
        	Msg2Player("��ѧ�������� �ch Kh?t�n")
        	AddRecipe(235)
        	Msg2Player("��ѧ�������� To�n Sinh ��n")
        	AddRecipe(245)
        	Msg2Player("��ѧ�������� Ch?Th�y ��n")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(5)
        	Msg2Player("��ѧ�������� B�ch V�n t�n")
        	AddRecipe(240)
        	Msg2Player("��ѧ�������� Thi�n Kim t�n")
        	AddRecipe(246)
        	Msg2Player("��ѧ�������� B�i V�n ��n")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(10)
        	Msg2Player("��ѧ�������� ��i Ho�n ��n")
        	AddRecipe(15)
        	Msg2Player("��ѧ�������� Ng�c Linh t�n")
        	AddRecipe(236)
        	Msg2Player("��ѧ�������� Chi�u H�n ��n")
        	AddRecipe(241)
        	Msg2Player("��ѧ�������� B?Thi�n t�n")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(6)
        	Msg2Player("��ѧ�������� Thi�n H��ng C�m T�c")
        	AddRecipe(11)
        	Msg2Player("��ѧ�������� Nh�t Nguy�n Ph�c Th�y ��n")
        	AddRecipe(237)
        	Msg2Player("��ѧ�������� Ng?D�ch ��n")
        	AddRecipe(247)
        	Msg2Player("��ѧ�������� C�n Nguy�n Ch�nh Kh?��n")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(16)
        	Msg2Player("��ѧ�������� Ng?Hoa Ng�c L?Ho�n")
        	AddRecipe(7)
        	Msg2Player("��ѧ�������� H�c Ng�c �o�n T�c cao")
        	AddRecipe(12)
        	Msg2Player("��ѧ�������� V�n V�t Quy Nguy�n ��n")
        	AddRecipe(242)
        	Msg2Player("��ѧ�������� Th�t Tr�ng Th�t Hoa t�n")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
	    	AddRecipe(17)
        	Msg2Player("��ѧ�������� Sinh Sinh H�a T�n")
        	AddRecipe(238)
        	Msg2Player("��ѧ�������� B�n Tinh Nguy�t ��n")
        	AddRecipe(243)
        	Msg2Player("��ѧ�������� ��i Nh�t D��ng T�n")
        	AddRecipe(248)
        	Msg2Player("��ѧ�������� Thi�n V��ng B?T�m ��n")
        	SetTask(LEV_LEARNRECIPE,80)
       	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(238)==0 then
        	AddRecipe(238)
        	Msg2Player("��ѧ�������� B�n Tinh Nguy�t ��n")
        	AddRecipe(243)
        	Msg2Player("��ѧ�������� ��i Nh�t D��ng T�n")
        	AddRecipe(248)
        	Msg2Player("��ѧ�������� Thi�n V��ng B?T�m ��n")
    	else
        	Say (strTitle..":���鲻���������Ŭ��",0)
      	end
    end
end;


--�Լ��ܵ�˵����Ϣ
function Weekend()
    if (GetLifeSkillLevel(1,6) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."��ս����ǰ���һ��һЩҩ��������ʿ��!")
    	AddRecipe(232)
    	Msg2Player("��ѧ����һ���·���-����ҽҩ����!")
    else
    	Say(strTitle.."����δѧ����ҩ��ʱ����δ�������޷���׼���������ڸ���.", 0)
    end
end

--ȡ������
function SayHello()
end

function NewLifeSkills()
	Talk(2, "",
		 strTitle.."",
		 "�ðɣ� �����������������һ���˽�<color=yellow>��ѧϰ��������<color>. ������ȥ�� <color=yellow>Ȫ�������<color>.")
	return
end;

