Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--������ɮ
--�����޺���(����id=33)
[33]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--�߱������ķ� (����id=34)
[34]={
     levelless={3,1,0,33,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--�޺�ȭ (����id=35)
[35]={
     levelless={3,1,0,34,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
       },
--��Ҷ�� (����id=36)
[36]={
     levelless={3,1,0,34,2},
     [1]={1,15,2000,50},
     [2]={2,18,1500,50},
     [3]={7,33,0,50},
     },
--������ (����id=37)
[37]={
     levelless={3,1,0,33,5},
     [1]={1,22,10000,100},
     [2]={2,25,4000,100},
     [3]={6,37,0,100},
     },
--Τ��ȭ (����id=38)
[38]={
     levelless={3,1,0,35,4},
     [1]={1,28,20000,300},
     [2]={2,30,3000,300},
     [3]={9,44,0,300},
     },
--��������� (����id=39)
[39]={
     levelless={3,1,0,36,4},
     [1]={1,31,28000,500},
     [2]={2,33,4000,500},
     [3]={9,47,0,500},
     },
--�޺��� (����id=40)
[40]={
     levelless={3,1,0,37,4},
     [1]={1,37,60000,600},
     [2]={2,40,20000,600},
     [3]={6,52,0,600},
     },
--�������� (����id=41)
[41]={
     levelless={3,1,0,38,6},
     [1]={1,44,140000,800},
     [2]={2,47,40000,800},
     [3]={7,62,0,800},
     },
--��Ӱ�� (����id=42)
[42]={
     levelless={3,1,0,39,6},
     [1]={1,48,180000,1000},
     [2]={2,50,30000,1000},
     [3]={9,64,0,1000},
     },
--������צ�� (����id=43)
[43]={
     levelless={3,1,0,40,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--�������� (����id=44)
[44]={
     levelless={5,3,1,41,7,42,9,43,7},
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
		Say("V? c�ng tr��c ��y r�n luy�n ch�a th�nh th�c sao ta d�m d�y ng��i chi�u m�i, d�c t�c b�t ��t!",0)
	elseif n==6 then
		Say("����������㣬��׬����������!",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu? 5 gi? ch�i, kh�ng th? h�c v? c�ng n�a, h�y ngh? ng�i �� gi? g�n s�c kh�e!")
	 	return
	 end
	Say("A Di �� Ph�t! V? c�ng ta ch? truy�n cho �� t? v? t�ng, ch? y�u l�y n�i kh? h�nh th�nh chi�u th�c, ��nh g�n khi�n ��i ph��ng kh�ng th? ch�ng tr?, ch? y�u d�ng <color=yellow>h? th?<color> n�ng cao l�c ��nh. B�n t�ng gi�p g? ���c cho ng��i?",
		4,
		"����������ɮ/enterwuseng",
		"ѧϰ������ɮ�书/skilllearn",
		"�ҵõ��˱��������ؼ��б�/change_mistery_book",
		"����к�/no")
end;

canjuan1 = 919
canjuan2 = 920
canjuan3 = 921

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 4 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, M�t t�ch tr�n ph�i sao c? th? giao cho ng��i ch??", 0)
		return
	end
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- ɶҲû��
		Say("A di �� ph�t! Ng��i xu�t gia kh�ng ���c n�i d�i. Ng��i ch�a t�ng nh�n trang m�t t�ch n�o sao l�i b�o l? �� c? n??", 0)
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
		AddItem(0, 112, 102, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i 1 M�t t�ch tr�n ph�i c�a Thi�u L�m v? t�ng, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i M�t t�ch tr�n ph�i c�a Thi�u L�m v? t�ng th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","B�o l�i, ��i M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


function shaolinwuseng()	--�쿴����
--������
end;

function tedian()	--�쿴����
Say("V? c�ng ta ch? truy�n cho �� t? v? t�ng, ch? y�u l�y n�i kh? h�nh th�nh chi�u th�c, ��nh g�n khi�n ��i ph��ng kh�ng th? ch�ng tr?, ch? y�u d�ng h? th? n�ng cao l�c ��nh.",0)
end;


function enterwuseng()		--��������
	if GetPlayerFaction() ~= 1 then	--���ɼ��
		Say("Ph�i ph��ng tr��ng cho ph�p gia nh�p Thi�u L�m m�i c? th? ��n ��y b�i s? h�c ngh?.",0)
	elseif   GetPlayerRoute() == 1 then	--δ�����ɵı��ŵ��� 
		if join_route_main(4) == 0 then
			return
		end
		Say("Thi�n tai! Ng��i c? l�ng v�y b�n t�ng nh�t ��nh thu nh�n l�m �� t?, gi�p �� th�ng l�i kinh m�ch <color=yellow>t�y �i�m ti�m n�ng<color>. C�ng phu c�a ta ch? y�u <color=yellow>N�i c�ng<color>, ng��i �� gia nh�p l�u ph�i gi? c? th? ��n g�p ph��ng tr��ng nh�n <color=yellow>Nhi�m v? s? m�n<color>.",0)
		SetPlayerRoute(4)	--ֱ����������
		LearnSkill(33)
		LearnSkill(34)
		AddItem(0,0,3,1,1,4,67,4,68)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? v? t�ng!")
		TaskTip("B�n �� ���c t�y �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C? th? ��n g�p Ph��ng tr��ng nh�n nhi�m v?")
	elseif   GetPlayerRoute() == 4 then
	 	Say("Mau �i luy�n c�ng ��ng �� m�t m�t vi s?.",0)
	else
		Say("Ta kh�ng ph�i s? ph? c�a ng��i, nh�m r�i!",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 4 then	--���ɼ��
		Say("Ng��i kh�ng ph�i �� t? c�a ta kh�ng th? h�c v? c�ng Thi�u L�m v? t�ng.",0)
	else
		Say("K? n�ng n�o d��i g�c ph�i c? d�u m�i t�n th? c? th? h�c, nh�p chu�t �� t�ng c�p",0)
		AllowLearnSkill()
	end
end;



function luohangong()
learnskill(33)
end;

function shenzhao()
learnskill(34)
end;

function luohanquan()
learnskill(35)
end;

function jiayetui()
learnskill(36)
end;

function huiyanzhou()
learnskill(37)
end;

function weituoquan()
learnskill(38)
end;

function wensutui()
learnskill(39)
end;

function luohanzhen()
learnskill(40)
end;

function xumizhang()
learnskill(41)
end;

function wuyinjiao()
learnskill(42)
end;

function longzhuashou()
learnskill(43)
end;

function qianyeshou()
learnskill(44)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 44) then	--��������
		if (GetSkillLevel("Nh? Lai Th�n Ch��ng") <= 0) then
			return "�Nh? Lai Th�n Ch��ng? l? <color=red>tuy�t h�c tr�n ph�i<color> c�a b�n m�n, ch? truy�n cho ng��i t�i gi�i."
		end
	end
end

function afterlearnskill(id)
	if (id == 44) then	--��������
		if (GetSkillLevel("Nh? Lai Th�n Ch��ng") == 1) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t kh�ng t?, b��c ��u �� l�nh h�i �Nh? Lai Th�n Ch��ng? c�a b�n m�n, th�t ��ng n?!<enter><color=green>Ng��i ch�i<color>: Nh�ng... th�a s? ph?, v? sao l�c �� t? thi tri�n �Nh? Lai Th�n Ch��ng?, n�i kh? trong ng��i b? ph�n t�n? �� nghe danh L�c M�ch Th�n Ki�m c�a ��i L? �o�n Th? t? l�u, ngh? ��n c�ng kh�ng d�m, h�m nay l�i c? d�p th?. <enter>Thi�u hi�p c�n ch�a bi�t �i�u n�y, �Nh? Lai Th�n Ch��ng�r�t m�nh, cho d? may m�n h�c ���c, nh�ng ch�a ch�c �i�u khi�n ���c n?. Tinh kh? b�n trong c? th? kh�ng t�ch t? th�nh �s�t khݔ? (m�c s�t kh?), th? kh�ng th? thi tri�n v? c�ng n�y, c�n ti�u hao �s�t khݔ b�n trong. �S�t khݔ g�m 10 ph�n, t�ng khi c�ng ph? s�t th��ng, d�n d�n t�ch t? l�i.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("Nh? Lai Th�n Ch��ng") == 5) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�ng minh, �Nh? Lai Th�n Ch��ng? �� l�nh h�i ���c 5 ph�n. V? c�ng n�y c? 20 c�p, t? c�p 5 tr? �i thi�u hi�p c�n ra s�c luy�n c�ng, ��n m�t m�c nh�t ��nh s? t�ng th�m 1 c�p. T? c�p 10 tr? �i ph�i l�nh h�i M�t t�ch tr�n ph�i c�a b�n m�n, m�i c? th? h�c ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta �ang v�n c�ng ch? d�n ng��i t�ch t? 10 ph�n s�t kh? trong ng��i, �� ng��i th? thi tri�n �Nh? Lai Th�n Ch��ng?. <enter><enter>L�u sau...<enter><enter>S�t kh? trong ng��i thi�u hi�p �� h�nh th�nh, l�c n�y c? th? th? thi tri�n �Nh? Lai Th�n Ch��ng?. Tuy�t h�c tr�n ph�i c�a b�n m�n uy l�c d�ng m�nh, ch? d�ng �� tr? b�o gi�p k? y�u, thay tr�i h�nh ��o, ��ng h�i ng��i v? t�i, h�y nh? k? l�y...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

