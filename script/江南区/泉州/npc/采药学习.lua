-- =========================================
-- File : ��ԭһ�����꾩����ҩѧϰ.lua
-- Name : ��ҩʦ
-- ID   : 0, 4
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL	= 1925		-- �䷽ѧϰ�������
LEVELTASKID49		= 516		-- ����ת���
TASK49_BEGGING		= 1933		-- 49����������ʼ��ʾ
FORGETMAIN_NUM		= 1940		-- ���������ܴ���
FORGETOHTER_NUM		= 1941		-- ���������ܴ���

strName = "";
strTitle = "";

--*****************************************MAIN����*****************************************
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
	
	-----------------------------------------��������-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
        Say(strTitle.."��<color=yellow>10 ��<color> ��ȥ<color=yellow>�ɶ�<color> �� <color=yellow>�η�ҽ��<color> ���� <color=yellow>���������<color>!", 0)
        TaskTip("10����ȥ�ɶ����η�ҽ��.")       
        return 
    end
    
	--��ʾ���76�������䷽����
	local nGene,nSKIllId = GetMainLifeSkill()
	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId);
		return
	end	

---------------------------------------------���Ի�-------------------------------------------
    Say(strTitle.."��ֻ���ҩ������ɣ�!",
		6,
		"ѧϰ�ɼ�����./luaLearnLifeSkill",
		"ȥ�ɼ���ͼ1/GotoWorld_Confirm1",
		"ȥ�ɼ���ͼ2/GotoWorld_Confirm2",
		"ȥ�ɼ���ͼ3/GotoWorld_Confirm3",
		"������ҩ����/forget_life_skill",
		"���������Ϣ/Info",
		"û����/Main_Exit");
end;

-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 4) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- ������
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."����ɼ��ˣ�"..(nForgetTimes + 1)..", ng��i h�y k?n�ng thu th�p, ta ph�i thu"..nShouldPay.." l��ng, ng��i suy ngh?k?ch�a?",
			2,
			"������ˣ����˰�/forget_now",
			"������/SayHello")
	else
		Say(strTitle.."�㱾��Ҳ����ɼ������������⵷��!", 0)
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
	
	if (GetLifeSkillLevel(0, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 4)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("���˲ɼ�����")				
			end
		else
			Say(strTitle.."���˲ɼ�����", 0)
		end
	end
end;



--**********************************************����ѧϰ����***************************************
-- ѧϰ�����
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."10�����µ����Ҳ��̣�", 0)
		return
	end

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - ��ҩ
	if (GetLifeSkillLevel(0, 4) > 0) then
        Say (strTitle.."���Ѿ�ѧ���˰�", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."���Ѿ�ѧ�������ɼ������ˣ���ѧ���۰�",0)
		return
	end
	
	Say(strTitle.."ȷ��Ҫѧϰ<color=yellow>�ɼ�<color>��",
    	2,
    	"��Ҫѧϰ/LearnYes",
    	"������ѧ��/LearnNo")
end;
--ѧϰ����
function LearnYes()
	if (GetLifeSkillLevel(0, 4) > 0) then
		Say (strTitle.."Ng��i �� h�c ���c t�t c?k?n�ng h�i thu�c!", 0)
	else
		if (LearnLifeSkill(0, 4, 1, 79, 0)) then
			AddItem(0, 200, 16, 1, 1)
        	Msg2Player("�Ѿ�ѧ������")
    	end
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."��ѧ�ǶԵ�", 0)
end;



-- ȷ��ȥ��Ӧ�һ��ص�=====================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."ȥ�ɼ���ͼ1�� <color=yellow>Nam H�e c�c<color> ������ <color=yellow>Ba ��u<color>, <color=yellow>T�ng H�ng Hoa<color>, <color=yellow>C�t C�nh<color> v?<color=yellow>Ho�ng li�n<color>. Nh?mang theo <color=yellow>Cu�c thu�c<color>!",
		2,
		"���ھ�ȥ/#GotoWorld(714, 1511, 3004)",
		"�Ȳ�ȥ��/Main_Exit");
end;
function GotoWorld_Confirm2()
	Say(strTitle.."ȥ�ɼ���ͼ2�� <color=yellow>H�m U c�c<color> ������ <color=yellow>X�c ve<color>, <color=yellow>�i�n th�t<color> v?<color=yellow>Xuy�n s�n gi�p<color>. Nh?mang theo <color=yellow>Cu�c thu�c<color>!",
		2,
		"���ھ�ȥ/#GotoWorld(719, 1708, 3396)",
		"�Ȳ�ȥ��/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."ȥ�ɼ���ͼ3��<color=yellow>Hi�n Vi�n c�c<color> ������ <color=yellow>X?h��ng<color>, <color=yellow>gan g�u<color> v?<color=yellow>Nh�n s�m<color>. Nh?l�y <color=yellow>cu�c thu�c<color> m�i c?th?h�i thu�c!",	2,
		"���ھ�ȥ/#GotoWorld(724, 1721, 3386)",
		"�Ȳ�ȥ��/Main_Exit");
end;
-- ȥ��Ӧ�Ĺһ��ص�
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
				
		NewWorld(MapID,x,y)
end;


-- ���������Ϣ
function Info()
	--Say(strTitle.."<color=yellow>H�i thu�c<color> l?m�t trong <color=yellow>6<color> k?n�ng thu th�p trong h?th�ng k?n�ng s�ng. H�c ���c k?n�ng n�y c?th?nh�n ���c v�t li�u <color=yellow>luy�n ��n<color>. Ng��i c?th?��n <color=yellow>ti�m t�p h�a<color> mua c�ng c?h�i thu�c <color=yellow>s?c�p<color> �� l�n n�i t�m thu�c!", 0);
	Say(strTitle.."<color=yellow>�ɼ���������������ҾͲ���˵�ˡ�<color>", 0);

end;

-- ʲôҲ�����Ŀպ���
function Main_Exit()
end;

