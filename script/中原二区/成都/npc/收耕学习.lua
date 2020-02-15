-- =========================================
-- File : ��ԭ�������ɶ����ո�ѧϰ.lua
-- Name : �����
-- ID   : 0, 3
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �����������
TASK49_BEGGING			= 1933		-- ��������ʼ
FORGETMAIN_NUM			= 1940		-- ���������ܴ���
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
strName = "";
strTitle = "";

--*****************************************MAIN����*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","��5Сʱ����Ϣһ�°�!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-------------------------------------------��������-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 1) then
        Say(strTitle.."�� <color=yellow>10��<color> �Ժ�ȥ <color=yellow>�ɶ�<color> �� <color=yellow>D�η�ҽ��<color> ѧϰ <color=yellow>�����<color>!", 0)
        TaskTip("10���󵽳ɶ����η�ҽ��.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 1) then
        Talk(1, "QUSTION",strTitle.."���������������ԡ�")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."��ѧϰ���������� ���ڲ���ʱ�����!", 0)
    	return
    end
    
	----------------------------��ʾ���76�������䷽����--------------------------
	local nGene, nSkillID = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nGene, nSkillID)
	if (nGene == 1 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillID)
		return
	end
	
	---------------------------------------------���Ի�------------------------------------------
	Say(strTitle.."��ѧ�ո���?",
		6,
		"ѧϰ�ո�/luaLearnLifeSkill",
		"ȥ�ɼ���ͼ (s?c�p)/GotoWorld_Confirm1",
		"ȥ�ɼ���ͼ (trung c�p)/GotoWorld_Confirm2",
		"ȥ�ɼ���ͼ (cao c�p)/GotoWorld_Confirm3",
		"�����ո�����/forget_life_skill",
		"�ո����ܽ���/Info",
       	"û����/Main_Exit"
		);

end;


-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 3) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- ������
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."��y l?l�n th?"..(nForgetTimes + 1)..", ng��i h�y k?n�ng thu th�p, ta ph�i thu"..nShouldPay.." l��ng, ng��i suy ngh?k?ch�a?",
			2,
			"������!/forget_now",
			"������!/SayHello")
	else
		Say(strTitle.."����������ո���!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- ������
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(0, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(516, 0)
				Msg2Player("���Ѿ������ո�����")				
			end
		else
			Say(strTitle.."��û�д��㹻��Ǯ�� ��Ǯ��", 0)
		end
	end
end;


-- -------------------------------ѧϰ�����-------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."10���Ժ��������Ұ�!", 0)
		return
	end

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - �ո�
	if (GetLifeSkillLevel(0, 3) > 0) then
        Say (strTitle.."���Ѿ�ѧ���˰�!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."���Ѿ�ѧϰ��2���ռ����ܣ��޷���ѧϰ!",0)
		return
	end

    Say(strTitle.."<color=yellow>�ո�<color> �����������ռ����ܡ� ����ѧϰ��?",
    	2,
    	"�ǵ�ѧϰ/LearnYes",
    	"��ѧ��/LearnNo")
end;
--ѧϰ����
function LearnYes(MaxLvl,nMain)
	if (GetLifeSkillLevel(0, 3) > 0) then
		Say (strTitle.."���Ѿ�ѧ�������и�������!", 0)
	else
		if (LearnLifeSkill(0, 3, 1, 79, 0)) then
			AddItem(0, 200, 13, 1, 1)
        	Msg2Player("���Ѿ�ѧϰ���ռ����ܣ��ո�")
    	end
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."��ϸ����������",0)
end



-- ȷ��ȥ��Ӧ�һ��ص�
function GotoWorld_Confirm1()
	Say(strTitle.."������ <color=yellow>Thanh Th�y th�n<color> ���֣� �ǵط��кܶ� <color=yellow>Quang Th�ng Ma<color>, <color=yellow>M�c nh?color>, <color=yellow>Khuynh Ly ��u<color>, <color=yellow>N�m ��<color>, <color=yellow>Nhi�u minh ��u<color>, <color=yellow>M�ng tr�c<color>, <color=yellow>Dung tr�ch c�c<color> v?<color=yellow>H?ti�u<color>. Nh?mang theo <color=yellow>Cu�c<color>!",
		2,
		"ȥ/#GotoWorld(713,1477,2948)",
		"��ȥ/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."������ <color=yellow>Doanh D�n th�n<color> ���֣� �ǵط��кܶ� �� c?nhi�u <color=yellow>M�a<color>, <color=yellow>Di�n Tinh M�ch<color> v?<color=yellow>Thu�n h�a m�ch<color>. Nh?mang theo <color=yellow>Cu�c<color>!",
		2,
		"ȥ/#GotoWorld(718,1708,3405)",
		"��ȥ/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."������ <color=yellow>Lam Nh�c th�n<color> ���֣� �ǵط��кܶ� �� c?nhi�u <color=yellow>Du long t�c<color>, <color=yellow>Ph�ng Qu�n T�c<color> v?<color=yellow>Dao Chi T�c<color>. Nh?mang theo <color=yellow>Cu�c<color>!",
		2,
		"ȥ/#GotoWorld(723,1700,3448)",
		"��ȥ/Main_Exit")
end;
-- ȥ��Ӧ�Ĺһ��ص�
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;


-- ���������Ϣ
function Info()
	Say(strTitle.."<color=yellow>�ո�<color> �� <color=yellow>6<color> ���ռ�����֮һ��ѧϰ�˼�������Ի��<color=yellow>��⿲���<color>. �����ȥ <color=yellow>�ӻ���<color> ���� <color=yellow>�ո�����<color> !", 0)
end;
-- ʲôҲ�����Ŀպ���
function Main_Exit()
end;


--******************************************�������񲿷�*****************************************
--�����������⺯��
function QUSTION()
		Say(strTitle.."����1: ����ʹ����������?",4,
		"1. �򿪼����û�����./QUS_ERROR",
		"2. ѧϰ����δ����µ�ʹ�ü��ɽ���֮��./QUS_ERROR",
		"3. ѧϰ����ռ����б�Ҫ�Ĳ��ϣ�Ȼ��򿪼���ʹ�ý��棨�ԣ�./QUS2_GOTO",
		"4. �㿴�����ҵ��ǻ���/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."����2: ������������������?",4,
		"1. ��ժ�̲ݣ�ɹ�ڣ���������������⿣����ˣ�����������/QUS_ERROR",
		"2. �������ھ򣬸��֣�ɹ�ڣ��ۻᣬ˿��/QUS_ERROR",
		"3. ���쳤���������������������������������⿣�ҽҩ���Ƽף��ԣ�/QUS3_GOTO",
		"4. .����������������������⿣�׼��ҩƷ��ɹ�ڣ��ռ�ҩƷ��˿�����/QUS_ERROR")
end

function QUS3_GOTO()
		Say(strTitle.."����3: ��һ����ר���ǿ�����ľ����ô���Ĳ��Ͽ���������ʲô?",4,
		"1. ���쳤װ�׺�װ��/QUS_ERROR",
		"2. ��⿺���������/QUS_ERROR",
		"3. ���������Ͷ��������ԣ�/QUS4_GOTO",
		"4. ����װ�׺ͻ����/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."����4: ������ѧϰ�Ʒ�������������Ҫѧϰʲô����?",4,
		"1. ����װ��/QUS_ERROR",
		"2. Ch?d��c/QUS_ERROR",
		"3. ���/QUS_ERROR",
		"4. ���飨�ԣ�/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."����5: �����������Ĺ����У����������ǿ�������ܵĲ��ϡ� ���ʣ��ҿ�����Ӷ��ٲ���?",4,
		"1. 6 ��/QUS_ERROR",
		"2. 8 ��/QUS_ERROR",
		"3. 10 �֣��ԣ�/QUS_PASS",
		"4. 12 ��/QUS_ERROR")
end
function QUS_PASS()
		Say(strTitle.."�ܺã�ȥ <color=yellow>�꾩<color>��<color=yellow>���ε���<color> �˽�һ��!",0)
		SetTask(ID_LEARNLIFESKILL,2)
		TaskTip("ȥ�꾩�� ���ε���")
end
function QUS_ERROR()
		Say(strTitle.."���ƺ�����������һ����֪�� ������ <color=yellow> �η�ҽ��<color> ȥ!",0)
end

