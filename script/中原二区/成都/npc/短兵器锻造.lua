-- =========================================
-- File : ��ԭ�������ɶ����̱�������.lua
-- Name : Ī��
-- ID   : 1, 3
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")
--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- ��������
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�����¼
LEVELTASKID49			= 517		-- ������������
TASK49_BEGGING			= 1933		-- 49����������ʼ��ʾ
RESET_ERROR				= 1938		-- �޸����������ʾ
FORGETMAIN_NUM			= 1940		-- ���������ܴ���
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
strName = "";
strTitle = "";

--*****************************************MAIN����*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu?5 gi?ch�i, h�y ngh?ng�i �� gi?g�n s�c kh�e!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"��Ҫʹװ�����а������ԣ�������Ҫ����3���������Ե�װ��!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
		
	-----------------------------------------��������-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."��<color=yellow>10��<color> ��ȥ <color=yellow>�ɶ�<color> �� <color=yellow>�η�ҽ��<color> �˽� <color=yellow> ����� <color>!", 0)
		TaskTip("10����������ȥ�ɶ��ҵ��η�ҽ��") 
    	return 
    end

---------------------------------------------���Ի�-------------------------------------------
	local strtab = {
    "ѧϰ�̱������켼��/luaLearnLifeSkill",
	"ѧϰ�µ��䷽/learn_all_recipe",
    "���������/forget_life_skill",
    "�������/bagua",
	"76�������䷽����/xinwuqi",
    "������һ��/Dating"
    }		
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"����ѧϰ����/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 3) == 79 then
		tinsert(strtab, "��Ҫѧϰ����߼�����/update_max_skill_level");
	end 
	tinsert(strtab,"û����/SayHello");
	Say(strTitle.."�ҵ����ֽ�Ī����������̱��������������Ƕ̽�����ǿ����磺�����������֡� ��ʲô���԰�����?",
    	getn(strtab),
    	strtab)
end;

-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."����ѧϰ�����䷽?",
		7,
    	"ѧϰ�µ��䷽/luaLearnRecipe",
    	"ѧϰ����װ��/learnLtEquip",
    	"��ĩ�����䷽/Weekend",
		"76�������䷽����/get_76_task",
		"����ѧϰ76���䷽/relearn_76_recipe",
    	"��ѧ˫���䷽/luaLearnRecipeDdao",
    	"û����/SayHello")
end;


-- ����76���䷽����
function get_76_task()
	---------------------------------------76�������䷽����--------------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_76 = GetTask(TASK_76WEAPON)
		
	if (nSkillGenre == 1 and nSkillDetail == 3 and nSkillLevel >= 79) then
		--��δ�����䷽����
		if nTaskState_76 == 0 then
			weapon_76_001(2)
			return
		--�Ͻ�����
		elseif nTaskState_76 == 1 then
			weapon_76_002(2)
			return
		--δ����λ���ŶԻ�
		elseif nTaskState_76 == 2 then
			weapon_76_004(2)
			return
		--�Ѿ�����λ���ŶԻ�
		elseif nTaskState_76 == 3 then
			weapon_76_005(2)
			return
		--ѡ��ѧϰ����ķ���
		elseif nTaskState_76 == 4 then
			weapon_76_choice(2)
			return
		end 
	end
		
	--��ʾ���76�������䷽����
	if (nSkillGenre == 1 and nSkillDetail ~= 3 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail)
	end
	
	Say("B�n ch�a �� �i�u ki�n nh�n nhi�m v?ph�i ch?c�p 76.", 0)
end;



-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 3)
	if (nGene == 1 and nSkillID == 3) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(793) == 0 and 
				HaveLearnRecipe(794) == 0 and 
				HaveLearnRecipe(797) == 0 and 
				HaveLearnRecipe(804) == 0) then
				Say("��ѧ�ĸ�:",
					5,
					"����/learn_long_1",   
					"��/learn_long_2",  
					"��/learn_long_3",    
					"˫��/learn_long_4",    
					"û����/SayHello")
			else
				Say("���Ѿ�ѧ���˰�!", 0)
			end
		else
			Say("B�n ch�a l�m nhi�m v?ph�i ch?c�p 76", 0)
		end
	else
		Say("B�n ch�a h�c k?n�ng:<color=yellow>Ch?t�o binh kh?ng�n<color>!", 0)
	end
end;
-- ����
function learn_long_1()
	AddRecipe(793)
	Msg2Player("B�n h�c ���c ph�i ch? V�n nh�n")
end;
-- ��
function learn_long_2()
	AddRecipe(794)
	Msg2Player("B�n h�c ���c ph�i ch? H�a Tinh")
end;
-- ��
function learn_long_3()
	AddRecipe(797)
	Msg2Player("B�n h�c ���c ph�i ch? C?��nh")
end;
-- ˫��
function learn_long_4()
	AddRecipe(804)
	Msg2Player("B�n h�c ���c ph�i ch? L�ng Phong")
end;



-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(1, 3) > 0) then
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
		Say(strTitle.."Ng��i ch�a h�c k?n�ng Ch?t�o binh kh?ng�n? Ta kh�ng th?gi�p ng��i!", 0)
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
	
	if (GetLifeSkillLevel(1, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(1600, 0);			--���79�������䷽����
				SetTask(1601, 0);			--���79�������䷽����
				Msg2Player("B�n �� b?k?n�ng Ch?t�o binh kh?ng�n")				
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
		Say (strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch?th?h�c k?n�ng s�ng.", 0)
  		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B�ng h�u �� h�c k?n�ng s�n xu�t, mu�n h�c k?n�ng m�i c�n ph�i b?k?n�ng c?", 0)
    	return
	end
	
	Say(strTitle.."B�ng h�u mu�n h�c k?n�ng <color=yellow>Ch?t�o binh kh?ng�n<color> ?",
    	2,
    	"ѧϰ/LearnYes",
    	"����/LearnNo")
end

--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 3, 1, 79, 1)) then
        	Msg2Player("B�n �� h�c k?n�ng Ch?t�o binh kh?ng�n, nh�n ���c 3 h�c kim ph�n.")
        	AddItem(2, 2, 59, 3)

	    	AddRecipe(49)
    		Msg2Player("B�n h�c ���c ph�i ch? Phi Ng?Th?")
	   		AddRecipe(50)
	   		Msg2Player("B�n h�c ���c ph�i ch? H�ng Ma Th?")
    		AddRecipe(62)
    		Msg2Player("B�n h�c ���c ph�i ch? Linh X?Ki�m")
			AddRecipe(63)
			Msg2Player("B�n h�c ���c ph�i ch? X�ch Sa Ki�m")
    		AddRecipe(73)
    		Msg2Player("B�n h�c ���c ph�i ch? Gi�i �ao")
    		AddRecipe(74)
    		Msg2Player("B�n h�c ���c ph�i ch? Chi�t Thi�t �ao")
    		AddRecipe(782)
    		Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
    		AddRecipe(783)
    		Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
        	SetTask(LEV_LEARNRECIPE, 10)
        end
	else
		Say(strTitle.."B�n �� h�c k?n�ng s�ng, kh�ng th?h�c th�m k?n�ng kh�c.", 0)
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say(strTitle.."H�y suy ngh?k?r�i quay l�i ��y nh?", 0)
end

--**********************************************�䷽ѧϰ����***************************************
--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 3);
	if GetLifeSkillLevel(1, 3)>1 then
		if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
			AddRecipe(49)
    		Msg2Player("B�n h�c ���c ph�i ch? Phi Ng?Th")
	   		AddRecipe(50)
	   		Msg2Player("B�n h�c ���c ph�i ch? H�ng Ma Th")
    		AddRecipe(62)
    		Msg2Player("B�n h�c ���c ph�i ch? Linh X?Ki�m")
			AddRecipe(63)
			Msg2Player("B�n h�c ���c ph�i ch? X�ch Sa Ki�m")
    		AddRecipe(73)
    		Msg2Player("B�n h�c ���c ph�i ch? Gi�i �ao")
    		AddRecipe(74)
    		Msg2Player("B�n h�c ���c ph�i ch? Chi�t Thi�t �ao")
    		AddRecipe(782)
    		Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
    		AddRecipe(783)
    		Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
        	SetTask(LEV_LEARNRECIPE, 10)
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(51)
        	Msg2Player("B�n h�c ���c ph�i ch? Xuy�n V�n Th")
        	AddRecipe(52)
        	Msg2Player("B�n h�c ���c ph�i ch? Tam D��ng Th")
        	AddRecipe(64)
        	Msg2Player("B�n h�c ���c ph�i ch? Thanh Minh Ki�m")
        	AddRecipe(65)
        	Msg2Player("B�n h�c ���c ph�i ch? Huy�t S�t Ki�m")
        	AddRecipe(75)
        	Msg2Player("B�n h�c ���c ph�i ch? Li�t Di�m �ao")
        	AddRecipe(76)
        	Msg2Player("B�n h�c ���c ph�i ch? Ng?H?�o�n M�n �ao")
        	AddRecipe(784)
        	Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
        	AddRecipe(785)
        	Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(53)
        	Msg2Player("B�n h�c ���c ph�i ch? Thi�n Ng�u Th")
        	AddRecipe(66)
        	Msg2Player("B�n h�c ���c ph�i ch? H�m Quang Ki�m")
        	AddRecipe(77)
        	Msg2Player("B�n h�c ���c ph�i ch? C�u �m �ao")
        	AddRecipe(786)
        	Msg2Player("B�n h�c ���c ph�i ch? Bi�n B�c �ao")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(54)
        	Msg2Player("B�n h�c ���c ph�i ch? B�ch X?Th")
        	AddRecipe(55)
        	Msg2Player("B�n h�c ���c ph�i ch? Kh�ng Long Th")
        	AddRecipe(67)
        	Msg2Player("B�n h�c ���c ph�i ch? L�c D��ng")
        	AddRecipe(68)
        	Msg2Player("B�n h�c ���c ph�i ch? Huy�n �i�n")
        	AddRecipe(78)
        	Msg2Player("B�n h�c ���c ph�i ch? Ph?S�n �ao")
        	AddRecipe(79)
        	Msg2Player("B�n h�c ���c ph�i ch? Nh�n �� �ao")
        	AddRecipe(787)
        	Msg2Player("B�n h�c ���c ph�i ch? N?H�ng")
        	AddRecipe(788)
        	Msg2Player("B�n h�c ���c ph�i ch? B�o Hoa")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(56)
        	Msg2Player("B�n h�c ���c ph�i ch? T��ng Ph�ng")
        	AddRecipe(57)
        	Msg2Player("B�n h�c ���c ph�i ch? N?Long")
        	AddRecipe(69)
        	Msg2Player("B�n h�c ���c ph�i ch? Thanh S��ng")
        	AddRecipe(70)
        	Msg2Player("B�n h�c ���c ph�i ch? Dao Quang")
        	AddRecipe(80)
        	Msg2Player("B�n h�c ���c ph�i ch? Long L�n")
        	AddRecipe(81)
        	Msg2Player("B�n h�c ���c ph�i ch? B�ch B�ch")
        	AddRecipe(789)
        	Msg2Player("B�n h�c ���c ph�i ch? Uy�n ��ng Li�n Ho�n")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(58)
        	Msg2Player("B�n h�c ���c ph�i ch? Ng?Ph��ng Qu?Ch�ng")
        	AddRecipe(71)
        	Msg2Player("B�n h�c ���c ph�i ch? B�ch Huy�t")
        	AddRecipe(82)
        	Msg2Player("B�n h�c ���c ph�i ch? Thi�n S�t")
        	AddRecipe(790)
        	Msg2Player("B�n h�c ���c ph�i ch? Huy�t Li�n Ho�n")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(59)
        	Msg2Player("B�n h�c ���c ph�i ch? N?L?��a Ng�c")
        	AddRecipe(72)
        	Msg2Player("B�n h�c ���c ph�i ch? Huy�n thi�t Tr�ng Ki�m")
        	AddRecipe(83)
        	Msg2Player("B�n h�c ���c ph�i ch? B?V��ng")
        	AddRecipe(791)
        	Msg2Player("B�n h�c ���c ph�i ch? T�i Nguy�t")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
        	AddRecipe(792)
        	Msg2Player("B�n h�c ���c ph�i ch? �o�n Tr��ng")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say (strTitle..": ��ng qu?n�n n�ng, kinh nghi�m giang h?ng��i c�n k�m l�m, c?g�ng th�m nh?",0)
    	end
    end
end

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 3)
	if nLevel >= 79 then
    	AddRecipe(1114)
    	Msg2Player(format("�� h�c ph�i ch?m�i: %s", "Linh �� Thi�u L�m �ao"))
    	AddRecipe(1116)
    	Msg2Player(format("�� h�c ph�i ch?m�i: %s", "Linh �� Thi�u L�m Th"))
    	AddRecipe(1118)
    	Msg2Player(format("�� h�c ph�i ch?m�i: %s", "Linh �� Nga My Ki�m"))
    	AddRecipe(1120)
    	Msg2Player(format("�� h�c ph�i ch?m�i: %s", "Linh �� C�i Bang Th"))
    	AddRecipe(1122)
    	Msg2Player(format("�� h�c ph�i ch?m�i: %s", "Linh �� V?�ang Ki�m"))
    	AddRecipe(1126)
    	Msg2Player(format("�� h�c ph�i ch?m�i: %s", "Linh �� Ng?��c �ao"))
    	AddRecipe(1128)
    	Msg2Player(format("�� h�c ph�i ch?m�i: %s", "Linh �� C�n L�n Ki�m"))
	else
    	Say(strTitle..": ��ng qu?n�n n�ng, kinh nghi�m giang h?ng��i c�n k�m l�m, c?g�ng th�m nh?",0)
	end
end

--��ѧ˫���䷽
function luaLearnRecipeDdao()
		local nLevel = GetLifeSkillLevel(1, 3);
		if GetLifeSkillLevel(1, 3)>1 then
    if GetTask(LEV_LEARNRECIPE)==10 and HaveLearnRecipe(782)==0 then
    	AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
    elseif GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
      AddRecipe(784)
      Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
      AddRecipe(785)
      Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
    elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
      AddRecipe(784)
      Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
      AddRecipe(785)
      Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
      AddRecipe(786)
      Msg2Player("B�n h�c ���c ph�i ch? Bi�n B�c �ao")
      elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
      AddRecipe(784)
      Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
      AddRecipe(785)
      Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
      AddRecipe(786)
      Msg2Player("B�n h�c ���c ph�i ch? Bi�n B�c �ao")
      AddRecipe(787)
      Msg2Player("B�n h�c ���c ph�i ch? N?H�ng")
      AddRecipe(788)
      Msg2Player("B�n h�c ���c ph�i ch? B�o Hoa")
      elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
      AddRecipe(784)
      Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
      AddRecipe(785)
      Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
      AddRecipe(786)
      Msg2Player("B�n h�c ���c ph�i ch? Bi�n B�c �ao")
      AddRecipe(787)
      Msg2Player("B�n h�c ���c ph�i ch? N?H�ng")
      AddRecipe(788)
      Msg2Player("B�n h�c ���c ph�i ch? B�o Hoa")
      AddRecipe(789)
      Msg2Player("B�n h�c ���c ph�i ch? Uy�n ��ng Li�n Ho�n")
      elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
      AddRecipe(784)
      Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
      AddRecipe(785)
      Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
      AddRecipe(786)
      Msg2Player("B�n h�c ���c ph�i ch? Bi�n B�c �ao")
      AddRecipe(787)
      Msg2Player("B�n h�c ���c ph�i ch? N?H�ng")
      AddRecipe(788)
      Msg2Player("B�n h�c ���c ph�i ch? B�o Hoa")
      AddRecipe(789)
      Msg2Player("B�n h�c ���c ph�i ch? Uy�n ��ng Li�n Ho�n")
      AddRecipe(790)
      Msg2Player("B�n h�c ���c ph�i ch? Huy�t Li�n Ho�n")
      elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
      AddRecipe(784)
      Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
      AddRecipe(785)
      Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
      AddRecipe(786)
      Msg2Player("B�n h�c ���c ph�i ch? Bi�n B�c �ao")
      AddRecipe(787)
      Msg2Player("B�n h�c ���c ph�i ch? N?H�ng")
      AddRecipe(788)
      Msg2Player("B�n h�c ���c ph�i ch? B�o Hoa")
      AddRecipe(789)
      Msg2Player("B�n h�c ���c ph�i ch? Uy�n ��ng Li�n Ho�n")
      AddRecipe(790)
      Msg2Player("B�n h�c ���c ph�i ch? Huy�t Li�n Ho�n")
      AddRecipe(791)
      Msg2Player("B�n h�c ���c ph�i ch? T�i Nguy�t")
      elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B�n h�c ���c ph�i ch? Li�u Di�p Song �ao")
      AddRecipe(783)
      Msg2Player("B�n h�c ���c ph�i ch? Nguy�t Nha Th�ch")
      AddRecipe(784)
      Msg2Player("B�n h�c ���c ph�i ch? ��i Phi Th�ch")
      AddRecipe(785)
      Msg2Player("B�n h�c ���c ph�i ch? H�ng �n �ao")
      AddRecipe(786)
      Msg2Player("B�n h�c ���c ph�i ch? Bi�n B�c �ao")
      AddRecipe(787)
      Msg2Player("B�n h�c ���c ph�i ch? N?H�ng")
      AddRecipe(788)
      Msg2Player("B�n h�c ���c ph�i ch? B�o Hoa")
      AddRecipe(789)
      Msg2Player("B�n h�c ���c ph�i ch? Uy�n ��ng Li�n Ho�n")
      AddRecipe(790)
      Msg2Player("B�n h�c ���c ph�i ch? Huy�t Li�n Ho�n")
      AddRecipe(791)
      Msg2Player("B�n h�c ���c ph�i ch? T�i Nguy�t")
      AddRecipe(792)
      Msg2Player("B�n h�c ���c ph�i ch? �o�n Tr��ng")
      end
     end
    end
      
--�Լ��ܵ�˵����Ϣ
function Weekend()
    if (GetLifeSkillLevel(1, 3) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Say(strTitle.."Ti�n tuy�n chi�n tranh �c li�t, ta c?1 c�ch ch?t�o v?kh?r�t ��c ��o, mu�n truy�n th?cho ng��i, ng��i h�y ch?t�o v?kh?chi vi�n cho ti�n tuy�n gi�p �� tri�u ��nh!", 0)
    	AddRecipe(228)
    	Msg2Player("B�n h�c ���c ph�i ch?- Qu�n d�ng tr��ng ki�m!")
    else
   		Say(strTitle.."Ng��i v�n ch�a h�c k?n�ng Ch?t�o binh kh?ng�n ho�c ch�a �� kinh nghi�m, ta kh�ng th?truy�n th?c�ch ph�i ch?n�y.", 0)
    end
end


--�������Ϣ
function Dating()
	Talk(1,"",strTitle.."���Ҫ���������ױȵ�����������Ҫ��Ӹ������Ӽ������������һЩ�õĲ��ϣ�Ҳ������α����ص�����.")
end

--ȡ������
function SayHello()
end

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang b?b�t qu�i<color>l?huynh �� M�c gia ta v?l�o L�u ?T��ng D��ng, C�m N��ng �� to�n l�c c�ng nhau nghi�n c�u ra t�m huy�t. L�m th?n�o nh�n ���c nh�ng m�n c?linh th�ch ng��i �i h�i truy�n nh�n s?r? n�u ng��i mu�n t�m hi�u l�m th?n�o ch?t�o ���c <color=yellow>trang b?color> kh�m linh th�ch, th?��n ch?ta t�m hi�u nh?",
	4,
	"L�m sao ch?t�o trang b?c?l?kh�m n�m/kongzhuangbeizhizuo",
	"V�t ph�m th�m v�o c?t�c d�ng g?tianjiawu",
	"L�m sao trang b?���c ch?t�o th�nh trang b?B�t Qu�i/xiangqianzhuyi",
	"��n h�i th�m th�i m?/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R�t ��n gi�n, qua nghi�n c�u c�a b�n ta, c�i ti�n ph��ng ph�p ch?t�o ta truy�n th?cho c�c ng��i, b�y gi?ng��i �ang thu th�p nguy�n li�u ?khu v�c thu th�p, nh�ng trang b?ch?t�o ra c?m�c linh kh?t�i �a v?c?th?c?l?kh�m n�m, nh�ng m?c�ng ch�nh v?v�y, nh�ng trang b?c?thu�c t�nh linh kh?kh�ng c�n ch?t�o ���c n�a.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V�n v�t tr�n th?gian ��u c?gi?tr?ri�ng, gi?tr?t�y v�o linh kh?�t hay nhi�u, khi ch?t�o trang b?t�ng v�t ph�m th�m v�o, c?th?t�ng m�c linh kh?t�i �a v?t�ng s?l?kh�m n�m linh th�ch tr�n trang b? M�c linh kh?t�i �a c�a trang b?quy�t ��nh m�c linh kh?�� kh�m n�m linh th�ch, v?s?l?quy�t ��nh n?c?th?kh�m bao nhi�u linh th�ch, c?th?th�nh thu�c t�nh b�t qu�i hay kh�ng, cho n�n n�u ���c th?c?g�ng th�m v�i v�t c?gi?tr?")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."?tr�n �� nh�c ��n r�i, tr�n trang b?c?m�c linh kh?t�i �a v?l?kh�m n�m, 1 trang b?kh�m <color=yellow>3 vi�n<color> linh th�ch, khi m�c linh kh?c�a 3 vi�n linh th�ch b�ng v�i m�c linh kh?t�i �a c�a trang b? s?h�nh th�nh trang b?thu�c t�nh b�t qu�i. Linh th�ch l?s?l?th?m�c linh kh?�m, Linh th�ch l?s?ch�n th?m�c linh kh?d��ng, n�u th?t?Linh Th�ch ���c kh�m kh�ng gi�ng nhau, th?trang b?c?thu�c t�nh b�t qu�i kh�c nhau, tr�n \'B�t qu�i B�o �i�n\' d�nh cho h�u du?c�a C�ng D?Th?Gian c?ghi r�t r?l�m th?n�o �� ch?t�o 1 trang b?c?thu�c t�nh b�t qu�i mong mu�n, c?th�i gian th?xem.")
end
function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 3)
	if (GetLifeSkillLevel(1, 3) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1007) == 0) then
        	AddRecipe(1003)
        	Msg2Player("B�n h�c ���c ph�i ch? V�n nh�n")
        	AddRecipe(1004)
        	Msg2Player("B�n h�c ���c ph�i ch? H�a Tinh")
        	AddRecipe(1014)
        	Msg2Player("B�n h�c ���c ph�i ch? L�ng Phong")
        	AddRecipe(1007)
        	Msg2Player("B�n h�c ���c ph�i ch? C?��nh") 
       else
        	Say(strTitle.."�٣������ˣ��𼱣������������ںܲ�������������г��õĳ�������Ȼ��������.",0)
    end
end
end

function update_max_skill_level()
	Say(strTitle..format("������������ˮƽҪ���ռ����ܴﵽ79�������� %d ��", 1000), 
		2, "�ǵ�/update_max_skill_level_ensure", "����/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 3) < 79 then
		Talk(1,"",format("Hi�n t�i c�p k?n�ng s�n xu�t ch�a ��t c�p %d, kh�ng th?m?r�ng c�p gi�i h�n k?n�ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng�n l��ng kh�ng �� %d ��", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 3, 99);
	Msg2Player("Ch�c m�ng c�p gi�i h�n k?n�ng s�n xu�t �� ��t c�p 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

