Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--�嶾��ʦ
--�ٹ��ľ� (����id=347)
[347]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--�¹��ط� (����id=348)
[348]={
     levelless={3,1,0,347,1},
     [1]={1,10,0,0},
     [2]={2,20,100000,0},
     [3]={4,40,0,0},
     	},
--ι����ĸ (����id=349)
[349]={
     levelless={2,1,0,347,1},
     [1]={1,10,0,0},
     [2]={1,10,0,0},
      },
--���� (����id=350)
[350]={
     levelless={2,1,0,349,1},
     [1]={1,10,0,0},
     [2]={1,10,0,0},
     },
--��� (����id=351)
[351]={
     levelless={3,1,0,347,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
     },
--�������� (����id=352)
[352]={
     levelless={3,1,0,349,1},
     [1]={1,12,1500,30},
     [2]={2,13,500,30},
     [3]={10,21,0,30},
     },
--���צ (����id=353)
[353]={
     levelless={3,1,0,351,2},
     [1]={1,15,2000,50},
     [2]={2,18,1500,50},
     [3]={6,30,0,50},
     },
--���� (����id=354)
[354]={
     levelless={3,1,0,347,3},
     [1]={1,17,5000,60},
     [2]={2,20,2000,60},
     [3]={7,35,0,60},
     },
--Ѫ���� (����id=355)
[355]={
     levelless={3,1,0,352,4},
     [1]={1,21,10000,100},
     [2]={2,25,4000,100},
     [3]={5,37,0,100},
     },
--Ѫ�� (����id=356)
[356]={
     levelless={3,1,0,354,2},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={7,43,0,200},
     },
--��� (����id=357)
[357]={
     levelless={3,1,0,347,6},
     [1]={1,29,20000,300},
     [2]={2,32,8000,300},
     [3]={7,47,0,300},
     },
--ʬ�� (����id=358)
[358]={
     levelless={3,1,0,356,2},
     [1]={1,33,40000,500},
     [2]={2,38,12000,500},
     [3]={7,51,0,500},
     },
--���� (����id=359)
[359]={
     levelless={3,1,0,357,2},
     [1]={1,37,60000,600},
     [2]={2,40,18000,600},
     [3]={7,55,0,600},
     },
--�Ĺ� (����id=360)
[360]={
     levelless={3,1,0,358,2},
     [1]={1,40,90000,700},
     [2]={2,43,24000,700},
     [3]={7,58,0,700},
     },
--���ʴ�� (����id=361)
[361]={
     levelless={3,1,0,353,6},
     [1]={1,44,140000,800},
     [2]={2,46,30000,800},
     [3]={8,58,0,800},
     },
--�ù� (����id=362)
[362]={
     levelless={3,1,0,359,3},
     [1]={1,48,220000,1000},
     [2]={2,51,70000,1000},
     [3]={7,66,0,1000},
     },
--�Q�� (����id=363)
[363]={
     levelless={3,3,0,360,4,361,4,362,2},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--��Ӱħ�� (����id=774)
[774]={
     levelless={5,1,0,363,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>������<color>������书�����ˣ�",0)
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
	Say("T�y Nam r�ng thi�n n��c ��c, l? n�i sinh ra thu�t d�ng ��c c�a ph�i ta, b�t k? cao th? n�o d�nh ��c v�o l? v? ph��ng c�u ch�a. �� t? ta ��u ph�i bi�t d�ng <color=yellow>tr�o<color>. C�n ta gi�p vi�c chi c? n�i?",
		6,
		"�����嶾��ʦ/entergushi",
		"ѧϰ�嶾��ʦ�书/skilllearn",
		"�� t? mu�n m��n quy�n C? Kinh/requestbook",
		"�ҵõ��˱��������ؼ��Ĳб�/change_mistery_book",
		"H�y ��a ta 1 Th�n M�c V��ng ��nh/get_guding",
		"����к�/no")
end;

function get_guding()
	local nPlayerRoute = GetPlayerRoute();
	if nPlayerRoute ~= 21 then
		Say("<color=green>Li�u T�n Tr�c<color>: Ng��i kh�ng ph�i �� t? c�a ta, Th�n M�c V��ng ��nh sao c? th? ��a cho ng��i ch?!", 0)
		return 0;
	end;
	if GetItemCount(2,0,1063) >= 1 then
		Talk(1,"","<color=green>Li�u T�n Tr�c<color>: Ng��i �� c? 1 Th�n M�c V��ng ��nh r�i.");
		return 0;
	end;
	AddItem(2,0,1063,1);
	Msg2Player("B�n nh�n ���c 1 Th�n M�c V��ng ��nh");
end;

canjuan1 = 952
canjuan2 = 953
canjuan3 = 954

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 21 then	--���ɼ��
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
		AddItem(0, 112, 114, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."�� ��i 1 Ng? ��c C? S? M�t t�ch tr�n ph�i, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i Ng? ��c C? S? M�t t�ch tr�n ph�i th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","��i M�t t�ch tr�n ph�i th�t b�i r�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====

function tedian()		--�쿴����
Say("V? c�ng tinh hoa c�a tr��ng ph�i ta ch? y�u ph? thu�c v�o c? m�u, ch? c�n chuy�n t�m d�ng n�i l�c nu�i d��ng, nh�t ��nh c? th? sai khi�n ch�ng l�m nh�ng vi�c ch�ng ta mu�n. M�t khi �� tr�ng ��c c�a ta th? ngay c? cao th? c�ng ph�i b? tay ch�u ch�t. �� t? c�a ta ��u ph�i bi�t d�ng ��c tr�o.",0)
end;


function entergushi()		--��������
	if GetPlayerFaction() ~= 7 then	--���ɼ��
		Say("Tr��c ti�n ph�i g�p B�ch gi�o ch? xin gia nh�p b�n gi�o, r�i m�i quay l�i ��y b�i s? h�c ngh?.",0)
	elseif   GetPlayerRoute() == 19 then	--δ�����ɵı��ŵ��� 
		if join_route_main(21) == 0 then
			return
		end
		Say("Luy�n ��c ph�i th�t nh�n n�i. Th�y ng��i th�nh t�m nh? th?, ta ch�nh th�c thu nh�n ng��i l�m �� t?. ��u ti�n ta gi�p ng��i <color=yellow>T�y l�i �i�m ti�m n�ng<color>. V? c�ng b�n gi�o l�y <color=yellow>Linh ho�t<color> l�m c? s?. ��y l? quy�n <color=yellow>C? Kinh<color>, ng��i h�y t? t? nghi�n c�u, ��ng l�m ta th�t v�ng! Gi? c? th? ��n g�p B�ch gi�o ch? nh�n <color=yellow>Nhi�m v? s? m�n<color>.",0)
		SetPlayerRoute(21)	--ֱ����������
		LearnSkill(14)--����˫����ͨ����
		LearnSkill(347)
		LearnSkill(351)
		AddItem(2,0,385,1)
		AddItem(2,0,1063,1);	--����һ����ľ����
		AddItem(0,11,1,1,1,4,65,4,66)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? Ng? ��c C? s?!")
		TaskTip("B�n �� ���c t�y l�i ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C? th? ��n g�p B�ch gi�o ch? nh�n nhi�m v?")
	elseif   GetPlayerRoute() == 21 then
	 	Say("Luy�n ��c kh�ng th? g�p r�t n�u kh�ng d? b? t�u h�a nh�p ma, ng��i h�y t? t? m? nghi�n c�u!",0)
	else
		Say("Ng��i l? �� t? c�a Ng? Th��ng Ch?, ��n ch? ta l�m g??",0)
		
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 21 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, kh�ng th? h�c v? c�ng Ng? ��c c? s?.",0)
	else
		Say("K? n�ng n�o d��i g�c ph�i c? d�u m�i t�n th? c? th? h�c, nh�p chu�t �� t�ng c�p",0)
		AllowLearnSkill()
	end
end;

function requestbook()

	if GetPlayerRoute() ~= 21 then
		Say("Ng��i kh�ng ph�i �� t? c�a ta, kh�ng th? m��n C? Kinh.",0);
	else
		Say("��y l? quy�n C? Kinh, s�ch ch? nam v? c�ng nh�p m�n c�a b�n gi�o, ng��i h�y t? t? nghi�n c�u, kh�ng ���c �� m�t ��y!",0);
		AddItem(2,0,385,1);
	end
end

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 774) then	--��Ӱħ��
		if (GetSkillLevel("V? �nh Ma C?") <= 0) then
			return "V? �nh Ma C?' l? <color=red>Tuy�t h�c tr�n ph�i<color> c�a b�n m�n, kh�ng ph�i ng��i c�a b�n m�n kh�ng ���c h�c."
		end
	end
end

function afterlearnskill(id)
	if (id == 774) then	--��Ӱħ��
		if (GetSkillLevel("V? �nh Ma C?") == 1) then
			Say("T? ch�t c�a con qu? kh�ng t�i, c? b�n �� l�nh h�i ���c 'V? Thi�n Ma C�ng' c�a b�n m�n, qu? l? hi�m c?!<enter><color=green>Ng��i ch�i<color>: Nh�ng? s? ph?, l�c con th? thi tri�n �V? Thi�n Ma C�ng?, th�y n�i kh? trong ng��i kh�ng th? t? l�i r�t kh? thi tri�n? Nay con �� bi�t ���c c�m gi�c kh�ng th? ph�t ra nh? L�c M�ch Th�n Ki�m c�a ��i L? �o�n Th?.<enter>V�y l? con kh�ng bi�t r�i, 'V? Thi�n Ma C�ng' uy l�c r�t l�n, h�c r�i mu�n t? do thi tri�n c�ng kh�ng ph�i chuy�n d?. Tinh kh? trong ng��i kh�ng th? t? l�i l? 's�t kh?'? (Tr? s�t kh?), kh�ng ph�t ���c. Mu�n thi tri�n th? ph�i ti�u t�n 's�t kh?'. 'S�t kh?' g�m 10 ph�n, c? th? t�ng l�n l�c ��nh b�i ��i ph��ng ho�c t? l�i d�n d�n.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("V? �nh Ma C?") == 5) then
			Say("V? �nh Ma C?' �� l�nh h�i ��n c�p 5 con qu? l? th�ng minh, nh�ng c�p sau n�y l? do con si�ng n�ng r�n luy�n r�i. N? c? t�t c? 20 c�p, sau khi luy�n ��n �� thu�n th�c nh�t ��nh s? qua c�p m�i. 10 c�p cu�i c�ng ph�i tham kh�o M�t t�ch tr�n ph�i c�a b�n m�n m�i c? th? l�nh ng?.", 0)
		end
	end
end

function GiveMomentum()
	Say("���c r�i, b�y gi? ta s? v�n c�ng �� s�t kh? trong ng��i con t? l�i �� con th? thi tri�n 'V? �nh Ma C?'.<enter><enter>M�t th�i gian sau?<enter><enter>���c r�i, s�t kh? trong ng��i con �� h�nh th�nh, c? th? th? thi tri�n 'V? �nh Ma C?'. H�y nh? l�y tuy�t h�c tr�n ph�i c�a b�n m�n uy l�c r�t l�n h�y d�ng �� gi�p �� k? y�u, thay tr�i h�nh ��o, kh�ng l�m h�i ng��i v? t�i....", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

