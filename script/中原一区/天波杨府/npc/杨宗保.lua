Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, kh�ng th� h�c v� c�ng n�a, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
  local nTaskValue = FN_GetTaskState(FN_YM);
  local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValue==1) then
		task_103();
		return
	elseif (nTaskValue==2) then
		Say("T�o B�n � th�nh Bi�n Kinh.",0);
		return
	elseif (nTaskValue==3) then
		Say("Ng��i B�n ng�a � Bi�n Kinh c�ch c�ng binh b� kh�ng xa!",0);
		return
	elseif (nTaskValue==4) then
		Say("H�y ��n T�o B�n h�i b�o chuy�n chi�n m�!",0);
		return
  elseif (nTaskValue==5) then
		task_111();
		return
	elseif (nTaskValue==6) then
		task_113();
		return
	elseif (nTaskValue==7) then
		Say("Gi� c� th� ��n g�p Xa Th�i Qu�n r�i!",0);
		return
	end;
	
	if  GetSex()==1 then
		if (nTaskValue>=8) or (nTaskValue==0) then
		Say("D��ng M�n th��ng k� ta �� c�c <color=yellow>�� t� th��ng k�<color> luy�n t�p! Gi�i v� x�ng pha chi�n tr�n, gi�t gi�c l�p c�ng! <color=yellow>Tr��ng th��ng<color> l� v� kh� chuy�n d�ng! C� mu�n ta gi�p g� kh�ng?",
			4,
			"Tham ki�n gi�o ��u/entersujia",
			"H�c v� c�ng Th��ng K� D��ng M�n/skilllearn",
			"Ta nh�n ���c m�t quy�n M�t t�ch tr�n ph�i/change_mistery_book",
			"Tham ki�n t��ng qu�n/no")
		end
	end 
		  
	if  GetSex()==2 then
		if (nTaskValuem>=8) or (nTaskValuem==0) then
		Say("D��ng M�n th��ng k� ta �� c�c <color=yellow>�� t� th��ng k�<color> luy�n t�p! Gi�i v� x�ng pha chi�n tr�n, gi�t gi�c l�p c�ng! <color=yellow>Tr��ng th��ng<color> l� v� kh� chuy�n d�ng! C� mu�n ta gi�p g� kh�ng?",
			4,
			"Tham ki�n gi�o ��u/entersujia",
			"H�c v� c�ng Th��ng K� D��ng M�n/skilllearn",
			"Ta nh�n ���c m�t quy�n M�t t�ch tr�n ph�i/change_mistery_book",
			"Tham ki�n t��ng qu�n/no")
		else
			Say("Ng��i �i b�o danh sau �� quay l�i.",0);
   		end;
	end;
end	
	
canjuan1 = 946
canjuan2 = 947
canjuan3 = 948

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 17 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l� �� t� c�a ta, M�t t�ch tr�n ph�i sao c� th� giao cho ng��i ch�?", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- ɶҲû��
		Say("Ng��i ch�a t�ng nh�n ���c trang m�t t�ch v� c�ng n�o sao c� th� n�i l� �� c� n�?", 0)
		return
	end
	
	Say("Th�t kh�ng ng� th�ng qua luy�n th�c ng��i l�i c� th� nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l� �� �� c�a b�n m�n. Ta s� gi�p ng��i ��ng l�i th�nh m�t quy�n ho�n ch�nh nh�ng th�nh c�ng hay kh�ng c�n t�y v�o may m�n!", 
		2,
		"��a c�c trang s�ch cho s� ph�/hand_up_book",
		"Kh�ng c�n ��u/no")
end;

-- ���б�����ʦ��
function hand_up_book()
	Say("N�u nh� ng��i c� �� 3 t�p Th��ng_Trung_H�, ta nh�t ��nh s� ��ng l�i th�nh m�t quy�n ho�n ch�nh cho ng��i.", 
		2,
		"��ng � ��ng s�ch/confirm_change_book",
		"Kh�ng c�n ��u/no")
end;

-- ȷ���һ������ؼ�
function confirm_change_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	local nSel = random(1, 100)
	local nCanChange = 0
	local nChangeType = 0;
	if (nBook1 >= 1 and nBook2 >= 1 and nBook3 >= 1) then	-- ȫ�룬100%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1) then
			nCanChange = 1
		end
		nChangeType = 1;
	elseif (nBook1 >= 1 and nBook2 >= 1) then				-- ���У�5%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 5) then
			nCanChange = 1
		end
		nChangeType = 2;
	elseif (nBook1 >= 1 and nBook3 >= 1) then				-- ���£�50%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 50) then
			nCanChange = 1
		end
		nChangeType = 3;
	elseif (nBook2 >= 1 and nBook3 >= 1) then				-- ���£�60%
		if (DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 60) then
			nCanChange = 1
		end
		nChangeType = 4;
	elseif (nBook1 >= 1) then								-- �ϣ�1%
		if (DelItem(2, 1, canjuan1, 1) == 1 and nSel == 1) then
			nCanChange = 1
		end
		nChangeType = 5;
	elseif (nBook2 >= 1) then								-- �У�3%
		if (DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 3) then
			nCanChange = 1
		end
		nChangeType = 6;
	elseif (nBook3 >= 1) then								-- �£�40%
		if (DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 40) then
			nCanChange = 1
		end
		nChangeType = 7;
	end
	
	if (nCanChange == 1) then		-- ���Ը��ؼ�
		AddItem(0, 112, 111, 1)
		Say("Ng��i th�t l� may m�n, ��y l� quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i 1 M�t t�ch tr�n ph�i c�a D��ng M�n th��ng k�, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i M�t t�ch tr�n ph�i c�a D��ng M�n th��ng k� th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","B�o l�i, ��i M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


--�����б�
SKILLS={
--����ǹ��
--���ǹ�ķ� (����id=720)
[720]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--���ǹ���ܾ� (����id=721)
[721]={
     levelless={3,1,0,720,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--����Ʒ��� (����id=722)
[722]={
     levelless={3,1,0,721,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
       },
--���Ԧ���� (����id=723)
[723]={
     levelless={3,1,0,721,3},
     [1]={1,16,3000,50},
     [2]={2,18,1200,50},
     [3]={8,30,0,50},
     },
--��ұ����� (����id=724)
[724]={
     levelless={3,1,0,721,4},
     [1]={1,20,8000,100},
     [2]={2,23,2500,100},
     [3]={7,38,0,100},
     },
--���ս���� (����id=725)
[725]={
     levelless={3,1,0,721,6},
     [1]={1,24,13000,180},
     [2]={2,27,4500,180},
     [3]={6,39,0,180},
     },
--�����ս�� (����id=726)
[726]={
     levelless={3,1,0,723,5},
     [1]={1,29,20000,300},
     [2]={2,33,15000,300},
     [3]={5,45,0,300},
     },
--������ǹ (����id=727)
[727]={
     levelless={3,1,0,722,6},
     [1]={1,34,45000,500},
     [2]={2,37,15000,500},
     [3]={7,52,0,500},
     },
--���Ӣ���� (����id=728)
[728]={
     levelless={3,1,0,725,4},
     [1]={1,38,70000,600},
     [2]={2,41,25000,600},
     [3]={6,53,0,600},
     },
--��ҵ���ǹ (����id=729)
[729]={
     levelless={3,1,0,724,6},
     [1]={1,44,140000,800},
     [2]={2,47,40000,800},
     [3]={6,59,0,800},
     },
--��������� (����id=730)
[730]={
     levelless={3,2,0,726,4,728,2},
     [1]={1,48,250000,1000},
     [2]={2,51,100000,1000},
     [3]={6,63,0,1000},
     },
--���·���ǹ (����id=731)
[731]={
     levelless={3,2,0,727,6,729,3},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--��������ǹ (����id=732)
[732]={
     levelless={5,2,1,730,6,731,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}



function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>���ڱ�<color>������书�����ˣ�",0)
	if n==2 then
		Say("��ng c�p c�a ng��i ch�a ��, c� g�ng th�m nh�!",0)
	elseif n==3 then
		Say("�i�m kinh nghi�m c�a ng��i ch�a ��, c� g�ng th�m nh�!",0)
	elseif n==4 then
		Say("�i�m danh v�ng c�a ng��i kh�ng ��, c�n t�ch l�y th�m nh�!",0)
	elseif n==5 then
		Say("V� c�ng tr��c ��y r�n luy�n ch�a th�nh th�c sao ta d�m d�y ng��i chi�u m�i, d�c t�c b�t ��t!",0)
	elseif n==6 then
		Say("Ng�n l��ng c�a ng��i kh�ng ��, t�m �� r�i h�y quay l�i nh�!",0)
	else
	end
end;



function shaolinsujia()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("V� c�ng ta d�y ng��i thu�c D��ng M�n th��ng k�, x�ng pha chi�n tr�n, gi�t gi�c l�p c�ng l� �u �i�m! Tr��ng th��ng l� v� kh� chuy�n d�ng!",0)
end;


function entersujia()		--��������
	if GetPlayerFaction() ~= 6 then	--���ɼ��
		Say("H�y t�m Xa Th�i Qu�n xin gia nh�p D��ng M�n r�i ��n ��y h�c v� ngh�!",0)
	elseif   GetPlayerRoute() == 16 then	--δ�����ɵı��ŵ��� 
		if join_route_main(17) == 0 then
			return
		end
		Say("T�t! Sau n�y theo ta h�c v� c�ng! Ta �� gi�p ng��i �� th�ng kinh m�ch, <color=yellow>t�y l�i �i�m ti�m n�ng<color>. V� c�ng Th��ng K� l�y <color=yellow>S�c m�nh<color> l�m g�c! Gi� ng��i c� th� ��n Xa Th�i Qu�n nh�n <color=yellow>Nhi�m v� s� m�n<color>!",0)
		SetPlayerRoute(17)	--ֱ����������
		LearnSkill(720)
		AddItem(0,105,10,1)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr� th�nh �� t� D��ng M�n th��ng k�!")
		TaskTip("B�n �� ���c t�y l�i �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C� th� ��n g�p Xa Th�i Qu�n nh�n nhi�m v�.")
	elseif   GetPlayerRoute() == 17 then
	 	Say("Ng��i ph�i si�ng n�ng luy�n t�p, ��ng �� m�t m�t ta!",0)
	else
		Say("Ta kh�ng ph�i l� s� ph� c�a ng��i, nh�m r�i!",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 17 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l� th��ng k� �� t�, kh�ng th� h�c v� c�ng th��ng k� c�a D��ng M�n",0)
	else
		Say("G�c ph�i d��i c�a h�nh t��ng v� c�ng c� d�u *v*, bi�u th� c� th� h�c; d�u m�i t�n bi�u th� c� th� t�ng c�p! Nh�p tr�c ti�p v�o �� th�ng",0)
		AllowLearnSkill()
	end
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng� th�ng qua vi�c luy�n th�c ng��i c� th� nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l� �� �� c�a b�n m�n. Nh�ng tr�n ph�i v� h�c n�y ta c�ng ph�i l�nh ng� m�t th�i gian m�i c� th� truy�n th� ���c, ng��i quay l�i sau nh�!",0)
end;

function beforelearnskill(id)
	if (id == 732) then	--��������ǹ
		if (GetSkillLevel("Li�n Ho�n To�n Long th��ng") <= 0) then
			return "�Li�n Ho�n To�n Long Th��ng� l� <color=red>tuy�t h�c tr�n ph�i<color> c�a b�n m�n, ch� truy�n cho ng��i t�i gi�i."
		end
	end
end

function afterlearnskill(id)
	if (id == 732) then	--��������ǹ
		if (GetSkillLevel("Li�n Ho�n To�n Long th��ng") == 1) then
			Say("Thi�u hi�p qu� nhi�n t� ch�t kh�ng t�, b��c ��u �� l�nh h�i �Li�n Ho�n To�n Long Th��ng� c�a b�n m�n, th�t ��ng n�!<enter><color=green>Ng��i ch�i<color>: Nh�ng... th�a s� ph�, v� sao l�c �� t� thi tri�n �Li�n Ho�n To�n Long Th��ng�, n�i kh� trong ng��i b� ph�n t�n? �� nghe danh L�c M�ch Th�n Ki�m c�a ��i L� �o�n Th� t� l�u, ngh� ��n c�ng kh�ng d�m, h�m nay l�i c� d�p th�. <enter>Thi�u hi�p c�n ch�a bi�t �i�u n�y, �Li�n Ho�n To�n Long Th��ng�r�t m�nh, cho d� may m�n h�c ���c, nh�ng ch�a ch�c �i�u khi�n ���c n�. Tinh kh� b�n trong c� th� kh�ng t�ch t� th�nh �s�t khݔ? (m�c s�t kh�), th� kh�ng th� thi tri�n v� c�ng n�y, c�n ti�u hao �s�t khݔ b�n trong. �S�t khݔ g�m 10 ph�n, t�ng khi c�ng ph� s�t th��ng, d�n d�n t�ch t� l�i.", 1, "��ng �/GiveMomentum")
		elseif (GetSkillLevel("Li�n Ho�n To�n Long th��ng") == 5) then
			Say("Thi�u hi�p qu� nhi�n t� ch�t th�ng minh, �Li�n Ho�n To�n Long Th��ng� �� l�nh h�i ���c 5 ph�n. V� c�ng n�y c� 20 c�p, t� c�p 5 tr� �i thi�u hi�p c�n ra s�c luy�n c�ng, ��n m�t m�c nh�t ��nh s� t�ng th�m 1 c�p. T� c�p 10 tr� �i ph�i l�nh h�i M�t t�ch tr�n ph�i c�a b�n m�n, m�i c� th� h�c ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta �ang v�n c�ng ch� d�n ng��i t�ch t� 10 ph�n s�t kh� trong ng��i, �� ng��i th� thi tri�n �Li�n Ho�n To�n Long Th��ng�. <enter><enter>L�u sau...<enter><enter>S�t kh� trong ng��i thi�u hi�p �� h�nh th�nh, l�c n�y c� th� th� thi tri�n �Li�n Ho�n To�n Long Th��ng�. Tuy�t h�c tr�n ph�i c�a b�n m�n uy l�c d�ng m�nh, ch� d�ng �� tr� b�o gi�p k� y�u, thay tr�i h�nh ��o, ��ng h�i ng��i v� t�i, h�y nh� k� l�y...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh� s� ph� truy�n cho", "momentumtip")
end

