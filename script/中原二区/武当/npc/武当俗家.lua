Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--�䵱�׼�
--�䵱�澭 (����id=147)
[147]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--�䵱�ʷ� (����id=148)
[148]={
     levelless={3,1,0,147,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--̫����ң�� (����id=149)
[149]={
     levelless={3,1,0,148,1},
     [1]={1,12,1500,30},
     [2]={2,16,1500,30},
     [3]={5,28,0,30},
       },
--�������� (����id=150)
[150]={
     levelless={3,1,0,147,2},
     [1]={1,16,3000,60},
     [2]={2,19,2000,60},
     [3]={6,31,0,60},
     },
--������ (����id=151)
[151]={
     levelless={3,1,0,150,1},
     [1]={1,21,10000,100},
     [2]={2,26,5000,100},
     [3]={4,36,0,100},
     },
--���Ǿ� (����id=152)
[152]={
     levelless={3,1,0,148,6},
     [1]={1,25,15000,300},
     [2]={2,28,5000,300},
     [3]={7,43,0,300},
     },
--������ (����id=153)
[153]={
     levelless={3,1,0,149,3},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--������ (����id=154)
[154]={
     levelless={3,1,0,149,4},
     [1]={1,31,28000,500},
     [2]={2,34,10000,500},
     [3]={7,49,0,500},
     },
--���������� (����id=155)
[155]={
     levelless={3,1,0,151,3},
     [1]={1,36,55000,600},
     [2]={2,39,30000,600},
     [3]={7,54,0,600},
     },
--��Ӱ�� (����id=156)
[156]={
     levelless={3,1,0,152,4},
     [1]={1,42,110000,800},
     [2]={2,45,50000,800},
     [3]={6,57,0,800},
     },
--Ǭ���� (����id=157)
[157]={
     levelless={3,1,0,151,4},
     [1]={1,48,250000,1000},
     [2]={2,51,100000,1000},
     [3]={6,63,0,1000},
     },
--�����޼��� (����id=158)
[158]={
     levelless={3,2,0,153,6,154,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--̫���� (����id=159)
[159]={
     levelless={5,3,1,156,6,157,6,158,7},
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
	Say("H? ph�i ta b�n th�n linh ho�t, chi�u s? nhanh, chu�n, m�nh m?. V? kh? �� t? h? ph�i th��ng s? d�ng v? kh? l? <color=yellow>b�t<color>. Kh�ng bi�t ta c? th? gi�p g??",
		4,
		"�����䵱�׼�/entersujia",
		"ѧϰ�䵱�׼��书/skilllearn",
		"�ҵõ��˱��������ؼ��Ĳб�/change_mistery_book",
		"����������к�/no")
end;

canjuan1 = 943
canjuan2 = 944
canjuan3 = 945

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 15 then	--���ɼ��
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
	Say("N�u nh? ng��i c? �� 3 t�p Th��ng_Trung_H?, ta nh�t ��nh s? ��ng l�i th�nh m�t quy�n ho�n", 
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
		AddItem(0, 112, 110, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y M�t t�ch tr�n ph�i V? �ang t�c gia, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y M�t t�ch tr�n ph�i V? �ang t�c gia th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","Xin l�i, ��i l�y M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


function sujia()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("H? ph�i ta b�n th�n linh ho�t, chi�u s? nhanh, chu�n, m�nh m?. V? kh? �� t? h? ph�i th��ng s? d�ng v? kh? l? b�t. Kh�ng bi�t ta c? th? gi�p g??",0)
end;


function entersujia()		--��������
	if GetPlayerFaction() ~= 2 then	--���ɼ��
		Say("Ng��i ph�i ���c V? �ang ch��ng m�n T? H�c Ch�n Nh�n ch�p thu�n m�i ���c gia nh�p V? �ang, sau �� c? th? ��n t�m ta b�i s? h�c ngh?.",0)
	elseif   GetPlayerRoute() == 13 then	--δ�����ɵı��ŵ��� 
		if join_route_main(15) == 0 then
			return
		end
		Say("Vi s? ch�nh th�c nh�n ng��i l�m �� t? v? gi�p ng��i �� th�ng kinh m�ch, <color=yellow>T�y l�i �i�m ti�m n�ng<color>. V? c�ng h? ph�i xem tr�ng <color=yellow>Linh ho�t<color>. Sau n�y h�y c? g�ng r�n luy�n! Gi? ng��i c? th? ��n g�p Ch��ng m�n ti�p nh�n <color=yellow>Nhi�m v? m�n ph�i<color>.",0)
		SetPlayerRoute(15)	--ֱ����������
		LearnSkill(147)
		LearnSkill(148)
		AddItem(0,9,75,1,1,4,65,4,66)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? V? �ang t�c gia!")
		TaskTip("B�n �� ���c t�y �i�m ti�m n�ng.")
		TaskTip("B�n �� nh�p m�n! C? th? t�m Ch��ng m�n nh�n nhi�m v? ")
	elseif   GetPlayerRoute() == 15 then
	 	Say("H?! Sao kh�ng tranh th? th�i gian luy�n c�ng, c? ng�y c? l�m bi�ng sao c? ti�n ��?",0)
	else
		Say("Ng��i l? ��o gia �� t?, ph�i g�i ta l? s? th�c m�i ph�i!",0)
		
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 15 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, kh�ng th? h�c v? c�ng V? �ang t�c gia.",0)
	else
		Say("G�c ph�i ph�a d��i bi�u t��ng v? c�ng xu�t hi�n d�u {v} bi�u th? c? th? h�c v? c�ng n�y, d�u m�i t�n bi�u th? c? th? t�ng c�p, nh�p tr�c ti�p v�o �� t�ng c�p.",0)
		AllowLearnSkill()
	end
end;



function qijing()
learnskill(147)
end;

function bifa()
learnskill(148)
end;

function taiyi()
learnskill(149)
end;

function liuqi()
learnskill(150)
end;

function tiyun()
learnskill(151)
end;

function qixing()
learnskill(152)
end;

function shaoyang()
learnskill(153)
end;

function shaoyin()
learnskill(154)
end;

function qixingzhen()
learnskill(155)
end;

function canyin()
learnskill(156)
end;

function qiankun()
learnskill(157)
end;

function wuji()
learnskill(158)
end;

function taiji()
learnskill(159)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Cu�i c�ng ng��i c�ng �� nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 159) then	--̫����
		if (GetSkillLevel("Th�i C�c Th�n C�ng") <= 0) then
			return "\'Th�i C�c Th�n C�ng\' l? <color=red>Tuy�t h�c tr�n ph�i<color>, kh�ng ph�i �� t? b�n m�n th? kh�ng th? n�m ���c."
		end
	end
end

function afterlearnskill(id)
	if (id == 159) then	--̫����
		if (GetSkillLevel("Th�i C�c Th�n C�ng") == 1) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�m s�u, �� b��c ��u l�nh ng? ���c \'Th�i C�c Th�n C�ng\', th�t ��ng n?! <enter><color=green>Ng��i ch�i<color>: Nh�ng....s? ph?, t�i sao khi con th? thi tri�n \'Th�i C�c Th�n C�ng\', n�i kh? ph�n t�n, kh? m? thi tri�n? Nghe n�i L�c M�ch Th�n Ki�m ? �o�n Th?, �� ao ��c t? l�u, h�m nay m�i th? ���c. <enter>\'Th�i C�c Th�n C�ng\' r�t l�i h�i, cho d? c? may m�n h�c ���c, mu�n s? d�ng th�nh th�o, �� kh�ng ph�i l? chuy�n d?.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("Th�i C�c Th�n C�ng") == 5) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�ng minh, \'Th�i C�c Th�n C�ng\' �� l�nh h�i ���c 5 ph�n. C�n xa m�i ��t ��n c�nh gi�i cao nh�t. Lo�i v? c�ng n�y g�m 20 c�p, 5 c�p sau c�n thi�u hi�p kh? luy�n h�n n�a, 10 c�p cu�i c�n c? m�t t�ch tr�n ph�i m�i l�nh h�i ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th�i ���c, �� ta v�n c�ng gi�p ng��i thi tri�n \'Th�i C�c Th�n C�ng\'.<enter><enter>R�t l�u....<enter><enter>���c r�i, s�t kh? �� h�nh th�nh, c? th? th? thi tri�n \'Th�i C�c Th�n C�ng\'. Tuy�t h�c tr�n ph�i r�t m�nh, d�ng �� tr? gian di�t b�o, thay tr�i h�nh ��o, kh�ng h�i ng��i v? t�i...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

