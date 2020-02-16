Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\global\\����������.lua")
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, kh�ng th� h�c v� c�ng n�a, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
  local nTaskValue = FN_GetTaskState(FN_YM);
  local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValuem==1) then
		task_003();
		return
	elseif (nTaskValuem==2) then
		Say("Tri�u Ph� � Bi�n Kinh",0);
		return
	elseif (nTaskValuem==3) then
		Say("C�m qu�n � ch�nh m�n ho�ng cung",0);
		return
	elseif (nTaskValuem==4) then
		Say("��n Bi�n Kinh t�m Tri�u Ph�",0);
		return
  elseif (nTaskValuem==5) then
		task_011();
		return
	elseif (nTaskValuem==6) then
		task_013();
	return
	elseif (nTaskValuem==7) then
		Say("��n b�m b�o Xa Th�i Qu�n",0);
		return
	elseif GetTask(1401) == 135 or GetTask(1401) == 125 then --�������������
		Talk(1,"","<color=green>M�c Qu� Anh<color>: nghe n�i l�n n�y ng��i mu�n tham gia ph� Thi�n M�n Tr�n? Chuy�n n�y kh�ng ph�i tr� ��a ngay c� ta c�ng ch�a c� n�m ch�c ph�n th�ng d� �� n�m r� m�i y�u �i�m c�a Thi�n M�n Tr�n. V� th� ta �� l�nh cho <color=yellow>Phi�u K� t��ng qu�n Qu�ch Qu�n B�ng<color> ��n <color=yellow>T��ng D��ng [178,175]<color> l�p n�n Thi�n M�n Tr�n,d�nh cho qu�n s� ng�y ��m r�n luy�nmong s�m t�m ra c�ch ph� gi�i huy�n c�, thi�u hi�p n�u mu�n tham gia th� h�y ��n �� r�n luy�n tr��c.");
		SetTask(1401,136);
		GivePlayerExp(SkeyTianmenzhen,"guojunpen")
		TaskTip("T�m Qu�ch Qu�n B�ng (T��ng D��ng [178,175]) h�i th�m v� t�nh h�nh Thi�n M�n Tr�n.");
		return 0;	
	elseif GetTask(1401) == 138 then
		Talk(8,"","<color=green>M�c Qu� Anh<color>: l�n n�y thi�u hi�p v��t �i n�m ���c bao nhi�u kh� n�ng chi�n th�ng?","<color=green> <color>: Kho�n 50 ph�n tr�m c� h�i, ho�c �t h�n.","<color=green>M�c Qu� Anh<color>: ch�ng l� l�i l� v� m�nh b�n �� S�n H� X� T�c?","<color=green> <color>: ��ng v�y.","<color=green>M�c Qu� Anh<color>: qu�n ta th�m t� h�i b�o, m�nh b�n �� S�n H� X� T�c �� b� b� m�t mang ��n Nh�n M�n Quan r�i.","<color=green> <color>: th� t��ng qu�n c� bi�t c� th� m�nh b�n �� �� ���c ��a ��n n�i n�o?","<color=green>M�c Qu� Anh<color>: c� l� gi� �� ��n Th�o Nguy�n r�i, thi�u hi�p h�y ��n �� xem th� n�o.","<color=green> <color>: �a t� t��ng qu�n!")
		SetTask(1401,139);
		GivePlayerExp(SkeyTianmenzhen,"yanwushengli")
		TaskTip("T�m qu�n quan qu�n Li�u (Nh�n M�n Quan [194,195]) �o�t l�i b�n �� S�n H� X� T�c.");
		return 0;	
	elseif GetTask(1401) == 140 then
		Talk(4,"","<color=green>M�c Qu� Anh<color>: xem ra qu�n Li�u �� ��i h��ng �i,  b�n �� �� b� h� t�ng chuy�n v� r�i.","<color=green> <color>: �i ch�! Ch�ng l� ta l�i kh�ng th� t�m ra b�n �� S�n H� X� T�c.","<color=green>M�c Qu� Anh<color>: thi�u hi�p ch� lo �u,  ng�y sau n�u mu�n th�m th�nh th�m th�ng tin h�y ��n ��y t�m ta.","<color=green> <color>: ch� ��nh nh� v�y, �a t� t��ng qu�n!");
		SetTask(1401,141);
		GivePlayerExp(SkeyTianmenzhen,"huibingmuguiying")
		return 0;
	end;
	
	if  GetSex()==1 then
		if (nTaskValue>=8) or (nTaskValue==0) then
		Say("D��ng M�n cung k� d�nh cho <color=yellow>�� t� cung k�<color> tu luy�n, ch� y�u kh�ng ch� ��i ph��ng b�o v� b�n m�nh. S� d�ng <color=yellow>Cung<color> l�m v� kh�. Ta gi�p g� ���c cho ng��i?",
			4,
			"Tham ki�n gi�o ��u/entersujia",
			"H�c v� c�ng D��ng M�n cung k�/skilllearn",
			"Ta nh�n ���c m�t quy�n M�t t�ch tr�n ph�i/change_mistery_book",
			"Tham ki�n t��ng qu�n/no")
		else
			Say("M�c Qu� Anh: Ng��i �i b�o danh sau �� quay l�i.",0);
		end
	end 
		  
	if  GetSex()==2 then
		if (nTaskValuem>=8) or (nTaskValuem==0) then
		Say("D��ng M�n cung k� d�nh cho <color=yellow>�� t� cung k�<color> tu luy�n, ch� y�u kh�ng ch� ��i ph��ng b�o v� b�n m�nh. S� d�ng <color=yellow>Cung<color> l�m v� kh�. Ta gi�p g� ���c cho ng��i?",
			4,
			"Tham ki�n gi�o ��u/entersujia",
			"H�c v� c�ng D��ng M�n cung k�/skilllearn",
			"Ta nh�n ���c m�t quy�n M�t t�ch tr�n ph�i/change_mistery_book",
			"Tham ki�n t��ng qu�n/no")
	   end;
	end;
end	
	
canjuan1 = 949
canjuan2 = 950
canjuan3 = 951

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 18 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l� �� t� c�a ta, M�t t�ch tr�n ph�i sao c� th� giao cho ng��i ch�?", 0)
		return
	end	

	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- ɶҲû��
		Say("Ng��i ch�a t�ng nh�n ���c trang m�t t�ch v� c�ng n�o sao c� th� n�i l� �� c� n�?", 0)
		return
	end
	
	Say("Th�t kh�ng ng� th�ng qua luy�n th�c ng��i l�i c� th� nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l� �� �� c�a b�n m�n. Ta s� gi�p ng��i ��ng l�i th�nh m�t quy�n ho�n ch�nh nh�ng th�nh c�ng hay kh�ng c�n xem ng��i c� may m�n kh�ng n�a.", 
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
		AddItem(0, 112, 112, 1)
		Say("Ng��i th�t l� may m�n, ��y l� quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i 1 M�t t�ch tr�n ph�i c�a D��ng M�n cung k�, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i M�t t�ch tr�n ph�i c�a D��ng M�n cung k� th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","B�o l�i, ��i M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


--�����б�
SKILLS={
--����ǹ��
--��ҹ��ķ� (����id=733)
[733]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--��ҹ����ܾ� (����id=734)
[734]={
     levelless={3,1,0,733,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--��������� (����id=735)
[735]={
     levelless={3,1,0,734,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
       },
--��������� (����id=736)
[736]={
     levelless={3,1,0,734,2},
     [1]={1,16,3000,50},
     [2]={2,19,2000,50},
     [3]={6,31,0,50},
     },
--��һ����� (����id=737)
[737]={
     levelless={3,1,0,734,4},
     [1]={1,20,8000,100},
     [2]={2,23,2500,100},
     [3]={7,38,0,100},
     },
--��Ҳ��Ƽ� (����id=738)
[738]={
     levelless={3,1,0,737,1},
     [1]={1,24,13000,180},
     [2]={2,26,2500,180},
     [3]={8,38,0,180},
     },
--������Ŷ� (����id=739)
[739]={
     levelless={3,1,0,736,3},
     [1]={1,28,20000,300},
     [2]={2,32,12000,300},
     [3]={5,44,0,300},
     },
--��������� (����id=740)
[740]={
     levelless={3,1,0,737,4},
     [1]={1,33,40000,500},
     [2]={2,35,7000,500},
     [3]={9,49,0,500},
     },
--������� (����id=741)
[741]={
     levelless={3,1,0,735,6},
     [1]={1,38,70000,600},
     [2]={2,40,12000,600},
     [3]={8,52,0,600},
     },
--��һ���� (����id=742)
[742]={
     levelless={3,1,0,739,4},
     [1]={1,44,140000,800},
     [2]={2,47,40000,800},
     [3]={6,59,0,800},
     },
--��������� (����id=743)
[743]={
     levelless={3,1,0,739,5},
     [1]={1,48,250000,1000},
     [2]={2,51,60000,1000},
     [3]={7,66,0,1000},
     },
--�����Ӱ�� (����id=744)
[744]={
     levelless={3,3,0,738,6,740,6,741,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--�������� (����id=745)
[745]={
     levelless={5,3,0,742,6,743,7,744,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>�¹�Ӣ<color>������书�����ˣ�",0)
	if n==2 then
		Say("��ng c�p c�a ng��i ch�a ��, c� g�ng th�m nh�!",0)
	elseif n==3 then
		Say("�i�m kinh nghi�m c�a ng��i ch�a ��, c� g�ng th�m nh�!",0)
	elseif n==4 then
		Say("�i�m danh v�ng c�a ng��i kh�ng ��, c�n t�ch l�y th�m nh�!",0)
	elseif n==5 then
		Say("V� c�ng l�c tr��c ta d�y c�n ch�a h�c xong sao h�c ���c c�i m�i, mau r�n luy�n th�m �i!",0)
	elseif n==6 then
		Say("Ng�n l��ng c�a ng��i kh�ng ��, t�m �� r�i h�y quay l�i nh�!",0)
	else
	end
end;



function shaolinsujia()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("V� c�ng ta d�y thu�c D��ng M�n cung k� ch� y�u kh�ng ch� ��i ph��ng b�o v� b�n m�nh, l�y cung l�m v� kh�.",0)
end;


function entersujia()		--��������
	if GetPlayerFaction() ~= 6 then	--���ɼ��
		Say("Mau t�m Xa Th�i Qu�n gia nh�p D��ng M�n r�i ��n g�p ta!",0)
	elseif   GetPlayerRoute() == 16 then	--δ�����ɵı��ŵ��� 
		if join_route_main(18) == 0 then
			return
		end
		Say("T�t! Ng��i �� gia nh�p D��ng M�n sau n�y c� th� theo ta h�c ngh�, ta s� gi�p �� th�ng l�i kinh m�ch <color=yellow>t�y �i�m ti�m n�ng<color>. V� c�ng cung k� ch� y�u <color=yellow>Th�n ph�p<color> l�m ch�. Gi� c� th� ��n g�p Xa Th�i Qu�n nh�n <color=yellow>Nhi�m v� s� m�n<color>.",0)
		SetPlayerRoute(18)	--ֱ����������
		LearnSkill(733)
		AddItem(0,4,108,1,1,4,65,4,66)
		AddItem(0,105,10,1)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("Ng��i �� tr� th�nh �� t� D��ng M�n cung k�!")
		TaskTip("B�n �� ���c t�y �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C� th� ��n g�p Xa Th�i Qu�n nh�n nhi�m v�.")
	elseif   GetPlayerRoute() == 18 then
	 	Say("Mau �i luy�n c�ng ��ng �� m�t m�t vi s�.",0)
	else
		Say("Ta kh�ng ph�i l� s� ph� c�a ng��i, nh�m r�i!",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 18 then	--���ɼ��
		Say("Ng��i kh�ng ph�i �� t� cung k� kh�ng th� h�c v� c�ng D��ng M�n cung k�.",0)
	else
		Say("K� n�ng n�o d��i g�c ph�i c� d�u m�i t�n th� c� th� h�c, nh�p chu�t �� t�ng c�p",0)
		AllowLearnSkill()
	end
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng� th�ng qua vi�c luy�n th�c ng��i c� th� nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l� �� �� c�a b�n m�n. Nh�ng tr�n ph�i v� h�c n�y ta c�ng ph�i l�nh ng� m�t th�i gian m�i c� th� truy�n th� ���c, ng��i quay l�i sau nh�!",0)
end;

function beforelearnskill(id)
	if (id == 745) then	--��������
		if (GetSkillLevel("B� V��ng T��ng Ph�ng Ti�n") <= 0) then
			return "�B� V��ng T��ng Ph�ng Ti�n� l� <color=red>tuy�t h�c tr�n ph�i<color> c�a b�n m�n, ch� truy�n cho ng��i t�i gi�i."
		end
	end
end

function afterlearnskill(id)
	if (id == 745) then	--��������
		if (GetSkillLevel("B� V��ng T��ng Ph�ng Ti�n") == 1) then
			Say("Thi�u hi�p qu� nhi�n t� ch�t kh�ng t�, b��c ��u �� l�nh h�i �B� V��ng T��ng Ph�ng Ti�n� c�a b�n m�n, th�t ��ng n�!<enter><color=green>Ng��i ch�i<color>: Nh�ng... th�a s� ph�, v� sao l�c �� t� thi tri�n �B� V��ng T��ng Ph�ng Ti�n�, n�i kh� trong ng��i b� ph�n t�n? �� nghe danh L�c M�ch Th�n Ki�m c�a ��i L� �o�n Th� t� l�u, ngh� ��n c�ng kh�ng d�m, h�m nay l�i c� d�p th�. <enter>Thi�u hi�p c�n ch�a bi�t �i�u n�y, �B� V��ng T��ng Ph�ng Ti�n�r�t m�nh, cho d� may m�n h�c ���c, nh�ng ch�a ch�c �i�u khi�n ���c n�. Tinh kh� b�n trong c� th� kh�ng t�ch t� th�nh �s�t khݔ? (m�c s�t kh�), th� kh�ng th� thi tri�n v� c�ng n�y, c�n ti�u hao �s�t khݔ b�n trong. �S�t khݔ g�m 10 ph�n, t�ng khi c�ng ph� s�t th��ng, d�n d�n t�ch t� l�i.", 1, "��ng �/GiveMomentum")
		elseif (GetSkillLevel("B� V��ng T��ng Ph�ng Ti�n") == 5) then
			Say("Thi�u hi�p qu� nhi�n t� ch�t th�ng minh, �B� V��ng T��ng Ph�ng Ti�n� �� l�nh h�i ���c 5 ph�n. V� c�ng n�y c� 20 c�p, t� c�p 5 tr� �i thi�u hi�p c�n ra s�c luy�n c�ng, ��n m�t m�c nh�t ��nh s� t�ng th�m 1 c�p. T� c�p 10 tr� �i ph�i l�nh h�i M�t t�ch tr�n ph�i c�a b�n m�n, m�i c� th� h�c ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta �ang v�n c�ng ch� d�n ng��i t�ch t� 10 ph�n s�t kh� trong ng��i, �� ng��i th� thi tri�n �B� V��ng T��ng Ph�ng Ti�n�. <enter><enter>L�u sau...<enter><enter>S�t kh� trong ng��i thi�u hi�p �� h�nh th�nh, l�c n�y c� th� th� thi tri�n �B� V��ng T��ng Ph�ng Ti�n�. Tuy�t h�c tr�n ph�i c�a b�n m�n uy l�c d�ng m�nh, ch� d�ng �� tr� b�o gi�p k� y�u, thay tr�i h�nh ��o, ��ng h�i ng��i v� t�i, h�y nh� k� l�y...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh� s� ph� truy�n cho", "momentumtip")
end

