Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--�嶾а��
--���ķ� (����id=364)
[364]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--�嶾���� (����id=365)
[365]={
     levelless={3,1,0,364,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--������ (����id=366)
[366]={
     levelless={2,1,0,364,1},
     [1]={1,12,0,0},
     [2]={1,12,0,0},
     },
--��ʬ�� (����id=367)
[367]={
     levelless={3,1,0,364,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={6,27,0,30},
     },
--ʬ���� (����id=368)
[368]={
     levelless={3,1,0,364,3},
     [1]={1,16,3000,50},
     [2]={2,19,2000,50},
     [3]={7,34,0,50},
     },
--ʬ���� (����id=369)
[369]={
     levelless={3,1,0,368,1},
     [1]={1,20,8000,100},
     [2]={2,24,4500,100},
     [3]={5,36,0,100},
     },
--��ʬа�� (����id=370)
[370]={
     levelless={3,1,0,365,6},
     [1]={1,23,11000,180},
     [2]={2,25,2500,180},
     [3]={8,37,0,180},
     },
--Ԧʬ�� (����id=371)
[371]={
     levelless={3,1,0,367,4},
     [1]={1,26,15000,220},
     [2]={2,29,9000,220},
     [3]={6,41,0,220},
     },
--�򶾶����� (����id=372)
[372]={
     levelless={3,1,0,370,3},
     [1]={1,30,27000,300},
     [2]={2,33,9000,300},
     [3]={7,48,0,300},
     },
--��а������ (����id=373)
[373]={
     levelless={3,1,0,370,4},
     [1]={1,34,45000,500},
     [2]={2,38,15000,500},
     [3]={5,50,0,500},
     },
--��ʬа�� (����id=374)
[374]={
     levelless={3,1,0,369,4},
     [1]={1,38,70000,600},
     [2]={2,41,25000,600},
     [3]={7,56,0,600},
     },
--а��� (����id=375)
[375]={
     levelless={3,1,0,371,5},
     [1]={1,43,100000,800},
     [2]={2,46,50000,800},
     [3]={7,58,0,800},
     },
--а���� (����id=376)
[376]={
     levelless={3,2,0,372,5,373,3},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={7,66,0,1000},
     },
--ʬ��ħ�� (����id=377)
[377]={
     levelless={3,1,0,374,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--����ħ�� (����id=775)
[775]={
     levelless={5,3,1,375,6,376,7,377,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>����<color>������书�����ˣ�",0)
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
	Say("B�n ��u tr�u m�t ng�a kh�p n�i ��u b? ta sai khi�n. T? thi ho�n h�n, sai khi�n thi th? gi�t ng��i tr��ng ph�i ta ��u tinh th�ng. �� t? t? hi�p n�n d�ng <color=yellow>song �ao<color>. Ch�ng hay ta c? th? gi�p g? cho ng��i?",
		4,
		"�����嶾а��/enterxiexia",
		"ѧϰ�嶾а���书/skilllearn",
		"�ҵõ��˱��������ؼ��Ĳб�/change_mistery_book",
		"����к�/no")
end;

canjuan1 = 955
canjuan2 = 956
canjuan3 = 957

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 20 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, M�t t�ch tr�n ph�i sao c? th? giao cho ng��i ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- ɶҲû��
		Say("Ng��i ch�a t�ng nh�n ���c trang m�t t�ch v? c�ng n�o sao c? th? n�i l? �� c? n??", 0)
		return
	end
	
	Say("Th�t kh�ng ng? th�ng qua luy�n th�c ng��i l�i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Ta s? gi�p ng��i ��ng l�i th�nh m�t quy�n ho�n ch�nh nh�ng th�nh c�ng hay kh�ng c�n xem ng��i c? may m�n kh�ng.", 
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
		AddItem(0, 112, 113, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."�� ��i 1 Ng? ��c T? Hi�p M�t t�ch tr�n ph�i, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i Ng? ��c T? Hi�p M�t t�ch tr�n ph�i th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","��i M�t t�ch tr�n ph�i th�t b�i r�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====

function tedian()		--�쿴����
Say("�� t? ta thi�n d�ng t? thu�t, gi�t ng��i trong nh�y m�t khi�n ��i ph��ng kh�ng k�p tr? tay. Luy�n ��n c�nh gi�i t�i cao tinh th�ng ��c m�n tuy�t k?, c? th? sai khi�n ng��i ch�t. Cho d? cao th? tuy�t ��nh nghe danh �� khi�p s?.",0)
end;


function enterxiexia()		--��������
	if GetPlayerFaction() ~= 7 then	--���ɼ��
		Say("Tr��c ti�n, ng��i ph�i g�p B�ch gi�o ch? xin gia nh�p b�n gi�o, r�i m�i quay l�i ��y b�i s? h�c ngh?.",0)
	elseif   GetPlayerRoute() == 19 then	--δ�����ɵı��ŵ��� 
		if join_route_main(20) == 0 then
			return
		end
		Say("Tr��ng ph�i ta c? th? sai khi�n thi th?, ng��i nghe qua �� khi�p s?. Ngo�i thi�n ph? b�m sinh ra c�n ph�i th�t nh�n n�i. Th�y ng��i th�nh t�m nh? th?, ta ch�nh th�c thu nh�n ng��i l�m �� t?. ��u ti�n ta gi�p ng��i <color=yellow>T�y �i�m ti�m n�ng<color>. V? c�ng b�n gi�o l�y <color=yellow>Th�n ph�p<color>, <color=yellow>S�c m�nh<color>, <color=yellow>N�i c�ng<color> l�m c? s?. Gi? c? th? ��n g�p B�ch gi�o ch? nh�n <color=yellow>Nhi�m v? s? m�n<color>.",0)
		SetPlayerRoute(20)	--ֱ����������
		LearnSkill(13)--����צ��ͨ����
		LearnSkill(364)
		LearnSkill(365)
		AddItem(0,7,1,1,1,4,65,4,66)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? Ng? ��c t? hi�p!")
		TaskTip("B�n �� ���c t�y �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C? th? ��n g�p B�ch gi�o ch? nh�n nhi�m v?")
	elseif   GetPlayerRoute() == 20 then
	 	Say("Sai khi�n thi th? ph�i th�t tinh th�ng n�u kh�ng s? r�t nguy hi�m, ng��i h�y �i luy�n t�p th�m!",0)
	else
		Say("Ng��i l? �� t? c�a Li�u Th��ng Ch?, sao ��n ch? ta l�m chi!",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 20 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, kh�ng th? h�c v? c�ng Ng? ��c t? hi�p.",0)
	else
		Say("K? n�ng n�o d��i g�c ph�i c? d�u m�i t�n th? c? th? h�c, nh�p chu�t �� t�ng c�p",0)
		AllowLearnSkill()
	end
end;

--ϴǱ�ܵ�
function resetpoint()

	if GetPlayerRoute() == 20 then
		if GetTask(1150) == 0 then
			Say("V? c�ng b�n gi�o l�y <color=yellow>Th�n ph�p<color>, <color=yellow>S�c m�nh<color>, <color=yellow>N�i c�ng<color> l�m c? s?. Ng��i ch? c? <color=yellow>1 l�n<color>c? h�i t�y �i�m. H�y suy ngh? th�t k?!",
		2,
		"T�y �i�m/confirm_reset",
		"Ch�a mu�n t�y �i�m./no");
		else
			Say("Ta �� gi�p ng��i ti�n h�nh t�y �i�m, kh�ng ���c c�ng sai �i�m n�a nh?!",0);
		end
	else
		Say("Ng��i kh�ng ph�i l? <color=green>�� t? t? hi�p<color>, tha l�i cho ta kh�ng th? gi�p ng��i t�y �i�m.",0);
	end
end

function confirm_reset()

	Say("Ng��i �� t�y �i�m ti�m n�ng th�nh c�ng, v? c�ng tr��ng ph�i ta l�y <color=yellow>Th�n ph�p<color>, <color=yellow>S�c m�nh<color> v? <color=yellow>N�i c�ng<color> l�m c? b�n, l�n n�y kh�ng n�n c�ng sai nh?!",0);
	ResetProperty()
	SetTask(1150,1);
	
end

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 775) then	--����ħ��
		if (GetSkillLevel("V? Thi�n Ma C�ng") <= 0) then
			return "V? Thi�n Ma C�ng' l? <color=red>Tuy�t h�c tr�n ph�i<color> c�a b�n m�n , kh�ng ph�i ng��i c�a b�n m�n kh�ng ���c h�c."
		end
	end
end

function afterlearnskill(id)
	if (id == 775) then	--����ħ��
		if (GetSkillLevel("V? Thi�n Ma C�ng") == 1) then
			Say("T? ch�t c�a con qu? kh�ng t�i, c? b�n �� l�nh h�i ���c 'V? Thi�n Ma C�ng' c�a b�n m�n, qu? l? hi�m c?!<enter><color=green>Ng��i ch�i<color>: Nh�ng? s? ph?, l�c con th? thi tri�n �V? Thi�n Ma C�ng?, th�y n�i kh? trong ng��i kh�ng th? t? l�i r�t kh? thi tri�n? Nay con �� bi�t ���c c�m gi�c kh�ng th? ph�t ra nh? L�c M�ch Th�n Ki�m c�a ��i L? �o�n Th?.<enter>V�y l? con kh�ng bi�t r�i, 'V? Thi�n Ma C�ng' uy l�c r�t l�n, h�c r�i mu�n t? do thi tri�n c�ng kh�ng ph�i chuy�n d?. Tinh kh? trong ng��i kh�ng th? t? l�i l? 's�t kh?'? (Tr? s�t kh?), kh�ng ph�t ���c. Mu�n thi tri�n th? ph�i ti�u t�n 's�t kh?'. 'S�t kh?' g�m 10 ph�n, c? th? t�ng l�n l�c ��nh b�i ��i ph��ng ho�c t? l�i d�n d�n.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("V? Thi�n Ma C�ng") == 5) then
			Say("V? Thi�n Ma C�ng' �� l�nh h�i ��n c�p 5 con qu? l? th�ng minh, nh�ng c�p sau n�y l? do con si�ng n�ng r�n luy�n r�i. N? c? t�t c? 20 c�p, sau khi luy�n ��n �� thu�n th�c nh�t ��nh s? qua c�p m�i. 10 c�p cu�i c�ng ph�i tham kh�o M�t t�ch tr�n ph�i c�a b�n m�n m�i c? th? l�nh ng?.", 0)
		end
	end
end

function GiveMomentum()
	Say("���c r�i, b�y gi? ta s? v�n c�ng �� s�t kh? trong ng��i con t? l�i �� con th? thi tri�n 'V? Thi�n Ma C�ng'.<enter><enter>M�t th�i gian sau?<enter><enter>���c r�i, s�t kh? trong ng��i con �� h�nh th�nh, c? th? th? thi tri�n 'V? Thi�n Ma C�ng'. H�y nh? l�y tuy�t h�c tr�n ph�i c�a b�n m�n uy l�c r�t l�n h�y d�ng �� gi�p �� k? y�u, thay tr�i h�nh ��o, kh�ng l�m h�i ng��i v? t�i....", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

