Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--��ü����
--��Ů�ľ� (����id=75)
[75]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--������ (����id=76)
[76]={
     levelless={3,1,0,75,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={6,25,0,0},
     	},
--���ҷ��� (����id=77)
[77]={
     levelless={3,1,0,76,2},
     [1]={1,16,3000,50},
     [2]={2,20,3000,50},
     [3]={5,32,0,50},
       },
--��Ů���� (����id=78)
[78]={
     levelless={3,1,0,75,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--��Ԫ�� (����id=79)
[79]={
     levelless={3,1,0,76,3},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
--������� (����id=80)
[80]={
     levelless={3,1,0,76,4},
     [1]={1,23,11000,100},
     [2]={2,27,7000,100},
     [3]={5,39,0,100},
     },
--�����ľ� (����id=81)
[81]={
     levelless={3,1,0,76,4},
     [1]={1,26,15000,200},
     [2]={2,28,2500,200},
     [3]={8,40,0,200},
     },
--������ (����id=82)
[82]={
     levelless={3,1,0,79,3},
     [1]={1,30,27000,300},
     [2]={2,33,9000,300},
     [3]={7,48,0,300},
     },
--��ˮ�� (����id=83)
[83]={
     levelless={3,1,0,81,3},
     [1]={1,34,45000,500},
     [2]={2,36,7000,500},
     [3]={9,50,0,500},
     },
--�ռ����� (����id=84)
[84]={
     levelless={3,2,0,76,6,82,2},
     [1]={1,39,80000,700},
     [2]={2,42,20000,700},
     [3]={6,54,0,700},
     },
--�����ķ� (����id=85)
[85]={
     levelless={3,1,0,83,2},
     [1]={1,43,100000,800},
     [2]={2,47,60000,800},
     [3]={5,59,0,800},
     },
--���ս�� (����id=86)
[86]={
     levelless={3,1,0,80,5},
     [1]={1,48,220000,1000},
     [2]={2,51,70000,1000},
     [3]={6,63,0,1000},
     },
--����ս�� (����id=87)
[87]={
     levelless={3,1,0,80,5},
     [1]={1,50,220000,1200},
     [2]={2,53,70000,1200},
     [3]={6,65,0,1200},
     },
--��ȴ��� (����id=88)
[88]={
     levelless={3,1,0,84,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--������ (����id=89)
[89]={
     levelless={5,4,1,86,6,87,6,85,5,88,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>����ʦ̫<color>������书�����ˣ�",0)
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
	Say("Ph�m l? �� t? b�n ph�i ph�i to�n t�m h��ng Ph�t, l�y Ph�t ph�p �� nh�n. <color=yellow>Ki�m<color> l? v? kh? s? tr��ng c�a b�n ph�i. Kh�ng bi�t ta c? th? gi�p g??",
		4,
		"�����ü���/enterfojia",
		"ѧϰ��ü����书/skilllearn",
		"�ҵõ��˱��������ؼ��Ĳб�/change_mistery_book",
		"����к�/no")
end;

canjuan1 = 928
canjuan2 = 929
canjuan3 = 930

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 8 then	--���ɼ��
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
		AddItem(0, 112, 105, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y M�t t�ch tr�n ph�i Nga My Ph�t gia, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y M�t t�ch tr�n ph�i Nga My Ph�t gia th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","Xin l�i, ��i l�y M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


function fojia()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("Ph�m l? �� t? b�n ph�i ph�i to�n t�m h��ng Ph�t, l�y Ph�t ph�p �� nh�n. <color=yellow>Ki�m<color> l? v? kh? s? tr��ng c�a b�n ph�i.",0)
end;


function enterfojia()		--��������
	if GetPlayerFaction() ~= 3 then	  --���ɼ��
		Say("C? n��ng ph�i ���c s? ��ng ? c�a Ch�n Nh? S? Th�i m�i c? th? gia nh�p Nga My, sau �� m�i c? th? b�i s? h�c ngh?.",0)
	elseif   GetPlayerRoute() == 7 then	--δ�����ɵı��ŵ��� 
		if join_route_main(8) == 0 then
			return
		end
		Say("Tr? ma v? ��o l? b�n ph�n c�a �� t? Nga My. Ng��i c? quy�t t�m nh? th? ta r�t vui m�ng. Vi s? ch�nh th�c nh�n ng��i l�m �� t? v? gi�p ng��i �� th�ng kinh m�ch, <color=yellow>t�y l�i �i�m ti�m n�ng<color>. B�n m�n l�y <color=yellow>N�i c�ng<color> l�m g�c, sau n�y h�y c? g�ng luy�n t�p. Gi? ng��i c? th? ��n g�p Ch��ng m�n �� ti�p nh�n <color=yellow>Nhi�m v? s? m�n<color>.",0)
		SetPlayerRoute(8)	--ֱ����������
		LearnSkill(75)
		LearnSkill(76)
		AddItem(0,2,16,1,1,4,67,4,68)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? Ph�t gia Nga My")
		TaskTip("B�n �� ���c t�y �i�m ti�m n�ng.")
		TaskTip("B�n �� nh�p m�n! C? th? ��n g�p Ch��ng m�n nh�n nhi�m v?")
	elseif   GetPlayerRoute() == 8 then
	 	Say("H�y c? g�ng luy�n c�ng! Kh�ng ch�ng c? ng�y ng��i s? thay vi s? ph�t d��ng b�n ph�i.",0)
	else
		Say("S? ph? c�a ng��i l? Hu? �m S? Th�i m�i ph�i.",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 8 then	--���ɼ��
		Say("Ng��i kh�ng ph�i �� t? c�a ta, kh�ng th? h�c v? c�ng Nga My Ph�t gia.",0)
	else
		Say("G�c ph�i ph�a d��i bi�u t��ng v? c�ng xu�t hi�n d�u m�i t�n bi�u th? c? th? h�c v? c�ng n�y, nh�n chu�t �� t�ng c�p.",0)
		AllowLearnSkill()
	end
end;




function sunv()
learnskill(75)
end;

function guanyin()
learnskill(76)
end;

function foyi()
learnskill(77)
end;

function yunv()
learnskill(78)
end;

function duyuan()
learnskill(79)
end;

function puzhao()
learnskill(80)
end;

function lianhua()
learnskill(81)
end;

function qingyin()
learnskill(82)
end;

function liushui()
learnskill(83)
end;

function puji()
learnskill(84)
end;

function bumie()
learnskill(85)
end;

function zhanqi()
learnskill(86)
end;

function zhanyi()
learnskill(87)
end;

function dabei()
learnskill(88)
end;

function wanxiang()
learnskill(89)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 89) then	--������
		if (GetSkillLevel("V�n T��ng Th�n C�ng") <= 0) then
			return "\'V�n T��ng th�n c�ng\' l? <color=red>Tuy�t h�c tr�n ph�i<color>, kh�ng ph�i �� t? b�n m�n th? kh�ng th? n�m ���c."
		end
	end
end

function afterlearnskill(id)
	if (id == 89) then	--������
		if (GetSkillLevel("V�n T��ng Th�n C�ng") == 1) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�m s�u, �� b��c ��u l�nh ng? ���c \'V�n T��ng th�n c�ng\', th�t ��ng n?! <enter><color=green>Ng��i ch�i<color>: Nh�ng....s? ph?, t�i sao khi con th? thi tri�n \'V�n T��ng th�n c�ng\', n�i kh? ph�n t�n, kh? m? thi tri�n? Nghe n�i L�c M�ch Th�n Ki�m ? �o�n Th?, �� ao ��c t? l�u, h�m nay m�i th? ���c. <enter>\'V�n T��ng th�n c�ng\' r�t l�i h�i, cho d? c? may m�n h�c ���c, mu�n s? d�ng th�nh th�o, �� kh�ng ph�i l? chuy�n d?.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("V�n T��ng Th�n C�ng") == 5) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�ng minh, \'V�n T��ng th�n c�ng\' �� l�nh h�i ���c 5 ph�n. C�n xa m�i ��t ��n c�nh gi�i cao nh�t. Lo�i v? c�ng n�y g�m 20 c�p, 5 c�p sau c�n thi�u hi�p kh? luy�n h�n n�a, 10 c�p cu�i c�n c? m�t t�ch tr�n ph�i m�i l�nh h�i ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th�i ���c, �� ta gi�p ng��i thi tri�n \'V�n T��ng th�n c�ng\'. <enter><enter>R�t l�u....<enter><enter>���c r�i, s�t kh? �� h�nh th�nh, c? th? th? thi tri�n \'V�n T��ng th�n c�ng\'. Tuy�t h�c tr�n ph�i r�t m�nh, d�ng �� tr? gian di�t b�o, thay tr�i h�nh ��o, kh�ng h�i ng��i v? t�i...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

