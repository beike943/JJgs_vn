Include("\\script\\global\\����������.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--�䵱����
--�䵱���� (����id=125)
[125]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--�䵱���� (����id=126)
[126]={
     levelless={3,1,0,125,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={8,24,0,0},
     	},
--���⽣�� (����id=127)
[127]={
     levelless={3,1,0,126,3},
     [1]={1,15,3000,60},
     [2]={2,17,800,60},
     [3]={8,29,0,60},
     },
--δ�뽣�� (����id=128)
[128]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--���ƽ��� (����id=129)
[129]={
     levelless={3,1,0,126,3},
     [1]={1,15,3000,60},
     [2]={2,17,800,60},
     [3]={8,29,0,60},
     },
--���潣�� (����id=130)
[130]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--���׽��� (����id=131)
[131]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--�����ķ� (����id=132)
[132]={
     levelless={3,1,0,125,6},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={9,38,0,100},
     },
--̫�彣�� (����id=133)
[133]={
     levelless={3,1,0,127,6},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--���ν��� (����id=134)
[134]={
     levelless={3,1,0,128,6},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--��˪���� (����id=135)
[135]={
     levelless={3,1,0,129,6},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--�������� (����id=136)
[136]={
     levelless={3,1,0,130,6},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--���佣�� (����id=137)
[137]={
     levelless={3,1,0,131,6},
     [1]={1,30,27000,500},
     [2]={2,34,10000,500},
     [3]={5,46,0,500},
     },
--������ (����id=138)
[138]={
     levelless={3,1,0,125,6},
     [1]={1,36,55000,600},
     [2]={2,40,30000,600},
     [3]={5,52,0,600},
     },
--�����ǽ��� (����id=139)
[139]={
     levelless={3,1,0,126,6},
     [1]={1,41,100000,800},
     [2]={2,44,30000,800},
     [3]={6,56,0,800},
     },
--̫�����彣 (����id=140)
[140]={
     levelless={3,1,0,133,5},
     [1]={1,46,150000,1000},
     [2]={2,49,42000,1000},
     [3]={7,64,0,1000},
     },
--����ʮ���� (����id=141)
[141]={
     levelless={3,1,0,134,5},
     [1]={1,47,180000,1000},
     [2]={2,50,45000,1000},
     [3]={7,65,0,1000},
     },
--���������� (����id=142)
[142]={
     levelless={3,1,0,135,5},
     [1]={1,46,150000,1000},
     [2]={2,49,42000,1000},
     [3]={7,64,0,1000},
     },
--���崿���� (����id=143)
[143]={
     levelless={3,1,0,136,5},
     [1]={1,47,180000,1000},
     [2]={2,50,45000,1000},
     [3]={7,65,0,1000},
     },
--���Խ��� (����id=144)
[144]={
     levelless={3,1,0,137,5},
     [1]={1,48,200000,1000},
     [2]={2,51,48000,1000},
     [3]={7,66,0,1000},
     },
--�����߽ؽ� (����id=145)
[145]={
     levelless={3,1,0,139,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--����̫���� (����id=146)
[146]={
     levelless={5,6,1,140,7,141,7,142,7,143,7,144,7,145,7},
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
	Say("D? kh? ng? ki�m, ki�m kh? h�p nh�t, h? ph�i ta l? ki�m kh?, m��n <color=yellow>ki�m<color> ph�t ra ki�m kh?. Kh�ng bi�t ta c? th? gi�p g??",
		4,
		"�����䵱����/enterdaojia",
		"ѧϰ�䵱�����书/skilllearn",
		"�ҵõ��˱��������ؼ��Ĳб�/change_mistery_book",
		"����������к�/no")
end;

canjuan1 = 940
canjuan2 = 941
canjuan3 = 942

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 14 then	--���ɼ��
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
	Say("N�u c? �� 3 t�p Th��ng_Trung_H?, ta nh�t ��nh s? gi�p ng��i ��ng l�i th�nh m�t quy�n ho�n ch�nh", 
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
		AddItem(0, 112, 109, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y M�t t�ch tr�n ph�i V? �ang ��o gia, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i l�y M�t t�ch tr�n ph�i V? �ang ��o gia th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","Xin l�i, ��i l�y M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


function daojia()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("D? kh? ng? ki�m, ki�m kh? h�p nh�t, h? ph�i ta l? ki�m kh?, m��n ki�m ph�t ra ki�m kh?.",0)
end;


function enterdaojia()		--��������
	if GetPlayerFaction() ~= 2 then	--���ɼ��
		Say("Ng��i ph�i ���c V? �ang ch��ng m�n T? H�c Ch�n Nh�n ch�p thu�n m�i ���c gia nh�p V? �ang, sau �� c? th? ��n t�m ta b�i s? h�c ngh?.",0)
	elseif   GetPlayerRoute() == 13 then	--δ�����ɵı��ŵ��� 
		if join_route_main(14) == 0 then
			return
		end
		Say("Vi s? ch�nh th�c nh�n ng��i l�m �� t? v? gi�p ng��i �� th�ng kinh m�ch, <color=yellow>t�y l�i �i�m ti�m n�ng<color>. V? c�ng h? ph�i l�y <color=yellow>N�i c�ng<color> l�m tr�ng. Sau n�y h�y c? g�ng r�n luy�n! Gi? ng��i c? th? ��n g�p Ch��ng m�n ti�p nh�n <color=yellow>Nhi�m v? m�n ph�i<color>.",0)
		SetPlayerRoute(14)	--ֱ����������
		LearnSkill(125)
		LearnSkill(126)
		AddItem(0,2,16,1,1,4,67,4,68)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? V? �ang ��o gia!")
		TaskTip("B�n ��  ���c t�y �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C? th? t�m Ch��ng m�n nh�n nhi�m v? ")
	elseif   GetPlayerRoute() == 14 then
	 	Say("H�y c? g�ng luy�n t�p! Mai n�y ph�t d��ng quang ��i b�n ph�i.",0)
	else
		Say("Ta ch? l? s? b? c�a ng��i! Kh�ng ph�i s? ph? c�a ng��i! Sao c? qu�n ho�i v�y?",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 14 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, kh�ng th? h�c v? c�ng V? �ang ��o gia.",0)
	else
		Say("G�c ph�i ph�a d��i bi�u t��ng v? c�ng xu�t hi�n d�u {v} bi�u th? c? th? h�c v? c�ng n�y, d�u m�i t�n bi�u th? c? th? t�ng c�p, nh�p tr�c ti�p v�o �� t�ng c�p.",0)
		AllowLearnSkill()
	end
end;


function jianjing()
learnskill(125)
end;

function jianfa()
learnskill(126)
end;

function liuguang()
learnskill(127)
end;

function weiyang()
learnskill(128)
end;

function rouyun()
learnskill(129)
end;

function lieyan()
learnskill(130)
end;

function benlei()
learnskill(131)
end;

function wuwo()
learnskill(132)
end;

function taiqing()
learnskill(133)
end;

function chanmeng()
learnskill(134)
end;

function luoshuang()
learnskill(135)
end;

function yanyang()
learnskill(136)
end;

function xuanwu()
learnskill(137)
end;

function yujian()
learnskill(138)
end;

function zhengfan()
learnskill(139)
end;

function taiyi()
learnskill(140)
end;

function shenmen()
learnskill(141)
end;

function dining()
learnskill(142)
end;

function tianqing()
learnskill(143)
end;


function bagua()
learnskill(144)
end;

function zhenwu()
learnskill(145)
end;

function wushang()
learnskill(146)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 146) then	--����̫����
		if (GetSkillLevel("V? Th��ng Th�i C�c Ki�m") <= 0) then
			return "\'V? Th��ng Th�i C�c Ki�m\' l? <color=red>Tuy�t h�c tr�n ph�i<color>, kh�ng ph�i �� t? b�n m�n th? kh�ng th? n�m ���c."
		end
	end
end

function afterlearnskill(id)
	if (id == 146) then	--����̫����
		if (GetSkillLevel("V? Th��ng Th�i C�c Ki�m") == 1) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�m s�u, �� b��c ��u l�nh ng? ���c \'V? Th��ng Th�i C�c Ki�m\', th�t ��ng n?! <enter><color=green>Ng��i ch�i<color>: Nh�ng....s? ph?, t�i sao khi con th? thi tri�n \'V? Th��ng Th�i C�c Ki�m\', n�i kh? ph�n t�n, kh? m? thi tri�n? Nghe n�i L�c M�ch Th�n Ki�m ? �o�n Th?, �� ao ��c t? l�u, h�m nay m�i th? ���c. <enter>\'V? Th��ng Th�i C�c Ki�m\' r�t l�i h�i, cho d? c? may m�n h�c ���c, mu�n s? d�ng th�nh th�o, �� kh�ng ph�i l? chuy�n d?.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("V? Th��ng Th�i C�c Ki�m") == 5) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�ng minh, \'V? Th��ng Th�i C�c Ki�m\' �� l�nh h�i ���c 5 ph�n. C�n xa m�i ��t ��n c�nh gi�i cao nh�t. Lo�i v? c�ng n�y g�m 20 c�p, 5 c�p sau c�n thi�u hi�p kh? luy�n h�n n�a, 10 c�p cu�i c�n c? m�t t�ch tr�n ph�i m�i l�nh h�i ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th�i ���c, �� ta v�n c�ng gi�p ng��i thi tri�n \'V? Th��ng Th�i C�c Ki�m\'.<enter><enter>R�t l�u....<enter><enter>���c r�i, s�t kh? �� h�nh th�nh, c? th? th? thi tri�n \'V? Th��ng Th�i C�c Ki�m\'. Tuy�t h�c tr�n ph�i r�t m�nh, d�ng �� tr? gian di�t b�o, thay tr�i h�nh ��o, kh�ng h�i ng��i v? t�i...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

