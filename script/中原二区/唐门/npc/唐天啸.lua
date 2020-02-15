Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ����ʦ������Ľű�ͷ�ļ�

--�����б�
SKILLS={
--����
--���Ű��� (����id=58)
[58]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--���������� (����id=59)
[59]={
     levelless={3,1,0,60,1},
     [1]={1,14,3000,50},
     [2]={2,16,500,50},
     [3]={9,30,0,50},
     	},
--���� (����id=60)
[60]={
     levelless={3,1,0,58,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
       },
--���̹� (����id=61)
[61]={
     levelless={3,1,0,58,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--�ⶾ���� (����id=62)
[62]={
     levelless={3,1,0,60,2},
     [1]={1,17,5000,60},
     [2]={2,21,3000,60},
     [3]={5,33,0,60},
     },
--������ (����id=63)
[63]={
     levelless={3,1,0,58,4},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
--�����ƽ��� (����id=64)
[64]={
     levelless={3,1,0,61,2},
     [1]={1,22,10000,100},
     [2]={2,25,4000,100},
     [3]={6,37,0,100},
     },
--׷�ļ� (����id=65)
[65]={
     levelless={3,1,0,59,3},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={6,40,0,200},
     },
--������� (����id=66)
[66]={
     levelless={3,1,0,63,2},
     [1]={1,27,18000,300},
     [2]={2,30,6000,300},
     [3]={6,42,0,300},
     },
--���Ĵ� (����id=67)
[67]={
     levelless={3,1,0,64,2},
     [1]={1,30,27000,500},
     [2]={2,33,9000,500},
     [3]={7,48,0,500},
     },
--�㶾���� (����id=68)
[68]={
     levelless={3,1,0,62,4},
     [1]={1,34,45000,500},
     [2]={2,38,15000,500},
     [3]={5,50,0,500},
     },
--����� (����id=69)
[69]={
     levelless={3,1,0,66,2},
     [1]={1,36,55000,600},
     [2]={2,39,18000,600},
     [3]={6,51,0,600},
     },
--�����滨�� (����id=70)
[70]={
     levelless={3,1,0,65,4},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--��ɳ��Ӱ (����id=71)
[71]={
     levelless={3,1,0,68,2},
     [1]={1,45,160000,800},
     [2]={2,48,50000,800},
     [3]={6,60,0,800},
     },
--������ (����id=72)
[72]={
     levelless={3,2,0,67,5,69,3},
     [1]={1,50,280000,1000},
     [2]={2,53,90000,1000},
     [3]={7,68,0,1000},
     },
--���컨�� (����id=73)
[73]={
     levelless={3,1,0,70,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--������ (����id=74)
[74]={
     levelless={5,3,1,73,7,71,6,72,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>����Х<color>������书�����ˣ�",0)
	if n==2 then
		Say("��ĵȼ����㣬��ӱ�Ŭ��!",0)
	elseif n==3 then
		Say("��ľ���ֵ���㣬��ӱ�Ŭ��!",0)
	elseif n==4 then
		Say("����������㣬�����Ŭ��!",0)
	elseif n==5 then
		Say("V? c�ng tr��c ��y vi s? d�y ng��i ch�a luy�n th�nh, kh�ng th? d�y ng��i v? c�ng m�i!",0)
	elseif n==6 then
		Say("����������㣬��׬��Ǯ����",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu? 5 gi? ch�i, kh�ng th? h�c v? c�ng n�a, h�y ngh? ng�i �� gi? g�n s�c kh�e!")
	 	return
	 end
	local nTaskValue = FN_GetTaskState(FN_TM)
	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue<8) then
		Say("T�ng qu�n Y d��c ph�ng ���ng Xu�n �ang ch? m�t lo�i thu�c m�i. H�y ��n �� xem th?.",0);
		return
	else
		Say("V? c�ng b�n m�n nh? nh�ng linh ho�t, c? th? t�n c�ng k? ��ch t? xa, <color=yellow>c�m b�y<color> ��c m�n c? th? l�m ti�u hao s�c l�c ��ch. �� t? b�n m�n th��ng d�ng <color=yellow>�m kh?<color> l�m v? kh? ch�nh. Ta c? th? gi�p g??",
			4,
			"�������Ű���/entertangmen",
			"ѧϰ���Ű����书/skilllearn",
			"�ҵõ��˱��������ؼ��Ĳб�/change_mistery_book",
			"����к�/no");
	end
end;

canjuan1 = 925
canjuan2 = 926
canjuan3 = 927

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 6 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, M�t t�ch tr�n ph�i sao c? th? giao cho ng��i ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- ɶҲû��
		Say("Ng��i ch�a t�ng nh�n ���c trang m�t t�ch v? c�ng n�o sao c? th? n�i l? �� c? n??", 0)
		return
	end
	
	Say("Th�t kh�ng ng? th�ng qua luy�n th�c ng��i l�i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Ta s? gi�p ng��i ��ng l�i th�nh m�t quy�n ho�n ch�nh nh�ng th�nh c�ng hay kh�ng c�n xem ng��i c? may m�n kh�ng n�a.", 
		2,
		"��a c�c trang s�ch cho s? ph?/hand_up_book",
		"Kh�ng c�n ��u/no")
end;

-- ���б�����ʦ��
function hand_up_book()
	Say("N�u nh? ng��i c? �� 3 t�p Th��ng_Trung_H?, ta nh�t ��nh s? ��ng l�i th�nh m�t quy�n ho�n ch�nh cho ng��i.", 
		2,
		"��ng ? ��ng s�ch/confirm_change_book",
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
		AddItem(0, 112, 104, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y 1 ���ng M�n M�t t�ch tr�n ph�i, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y ���ng M�n M�t t�ch tr�n ph�i th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","Xin l�i, ��i l�y M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


function tangmenskill()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("V? c�ng b�n m�n nh? nh�ng linh ho�t, c? th? t�n c�ng k? ��ch t? xa, <color=yellow>c�m b�y<color> ��c m�n c? th? l�m ti�u hao s�c l�c ��ch. �� t? b�n m�n th��ng d�ng �m kh? l�m v? kh? ch�nh.",0)
end;


function entertangmen()		--��������
	if GetPlayerFaction() ~= 5 then	--���ɼ��
		Say("Ng��i ph�i ���c L�o l�o ��ng ? m�i c? th? gia nh�p ���ng M�n, sau �� m�i c? th? ��n t�m ta b�i s? h�c ngh?.",0)
	elseif   GetPlayerRoute() == 5 then	--δ�����ɵı��ŵ��� 
		if join_route_main(6) == 0 then
			return
		end
		Say("L�o l�o �� ��ng ?! V�y ta ch�nh th�c nh�n ng��i l�m �� t? v? �� th�ng kinh m�ch cho ng��i, <color=yellow>t�y l�i �i�m ti�m n�ng<color>. B�n ph�i l�y <color=yellow>Th�n ph�p<color> l�m tr�ng, sau n�y h�y c? g�ng r�n luy�n. Gi? ng��i c? th? ��n t�m L�o l�o nh�n <color=yellow>Nhi�m v? m�n ph�i<color>.",0)
		SetPlayerRoute(6)	--ֱ����������
		LearnSkill(58)
		LearnSkill(60)
		AddItem(0,1,42,1,1,4,65,4,66)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? ���ng M�n!")
		TaskTip("B�n �� ���c t�y l�i �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C? th? ��n g�p Ch��ng m�n nh�n nhi�m v?")
	else
	 	Say("H�y c? g�ng luy�n t�p, mai sau ph�t d��ng quang ��i b�n m�n.",0)

	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 6 then	--���ɼ��
		Say("Ng��i kh�ng ph�i �� t? c�a ta! Ta kh�ng th? d�y ng��i.",0)
	else
		Say("G�c ph�i ph�a d��i bi�u t��ng v? c�ng xu�t hi�n d�u {v} bi�u th? c? th? h�c v? c�ng n�y, d�u m�i t�n bi�u th? c? th? t�ng c�p, nh�p tr�c ti�p v�o �� t�ng c�p.",0)
		AllowLearnSkill()
	end
end;


function xinfa()
learnskill(58)
end;

function zhizuo()
learnskill(59)
end;

function xinyan()
learnskill(60)
end;

function duci()
learnskill(61)
end;

function jiedu()
learnskill(62)
end;

function gouhun()
learnskill(63)
end;

function jiguan()
learnskill(64)
end;

function zhuixin()
learnskill(65)
end;

function mingcha()
learnskill(66)
end;

function chuanxin()
learnskill(67)
end;

function cuidu()
learnskill(68)
end;

function duopo()
learnskill(69)
end;

function baoyu()
learnskill(70)
end;

function sheying()
learnskill(71)
end;


function suoming()
learnskill(72)
end;

function mantian()
learnskill(73)
end;

function xixing()
learnskill(74)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 74) then	--������
		if (GetSkillLevel("H�p Tinh Tr�n") <= 0) then
			return "\'H�p Tinh Tr�n\' l? <color=red>Tuy�t h�c tr�n ph�i<color>, kh�ng ph�i �� t? b�n m�n th? kh�ng th? n�m ���c."
		end
	end
end

function afterlearnskill(id)
	if (id == 74) then	--������
		if (GetSkillLevel("H�p Tinh Tr�n") == 1) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�m s�u, �� b��c ��u l�nh ng? ���c \'H�p Tinh Tr�n\', th�t ��ng n?! <enter><color=green>Ng��i ch�i<color>: Nh�ng...s? ph?, t�i sao khi con th? thi tri�n \'H�p Tinh Tr�n\', n�i kh? ph�n t�n, kh? m? thi tri�n? Nghe n�i L�c M�ch Th�n Ki�m ? �o�n Th?, �� ao ��c t? l�u, h�m nay m�i th? ���c. <enter>\'H�p Tinh Tr�n\' r�t l�i h�i, cho d? c? may m�n h�c ���c, mu�n s? d�ng th�nh th�o, �� kh�ng ph�i l? chuy�n d?.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("H�p Tinh Tr�n") == 5) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�ng minh, \'H�p Tinh Tr�n\' �� l�nh h�i ���c 5 ph�n. C�n xa m�i ��t ��n c�nh gi�i cao nh�t. Lo�i v? c�ng n�y g�m 20 c�p, 5 c�p sau c�n thi�u hi�p kh? luy�n h�n n�a, 10 c�p cu�i c�n c? m�t t�ch tr�n ph�i m�i l�nh h�i ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th�i ���c, �� ta gi�p ng��i thi tri�n \'H�p Tinh Tr�n\'. <enter><enter>R�t l�u....<enter><enter>���c r�i, s�t kh? �� h�nh th�nh, c? th? th? thi tri�n \'H�p Tinh Tr�n\'. Tuy�t h�c tr�n ph�i r�t m�nh, d�ng �� tr? gian di�t b�o, thay tr�i h�nh ��o, kh�ng h�i ng��i v? t�i...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

