Include("\\script\\global\\����������.lua");
Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--ؤ�ﾻ��
--�������� (����id=103)
[103]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	 },
--ؤ���Ʒ� (����id=104)
[104]={
     levelless={3,1,0,103,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
--ͨ��ȭ (����id=105)
[105]={
     levelless={3,1,0,103,1},
     [1]={1,12,1500,30},
     [2]={2,16,1500,30},
     [3]={5,28,0,30},
     },
--ǧ��բ (����id=106)
[106]={
     levelless={3,1,0,109,3},
     [1]={1,34,45000,500},
     [2]={2,37,15000,500},
     [3]={7,52,0,500},
     },
--����ȭ (����id=107)
[107]={
     levelless={3,1,0,104,4},
     [1]={1,22,10000,100},
     [2]={2,26,6000,100},
     [3]={5,38,0,100},
     },
--���������� (����id=108)
[108]={
     levelless={3,1,0,105,3},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--��ң�� (����id=109)
[109]={
     levelless={3,1,0,103,2},
     [1]={1,17,5000,60},
     [2]={2,21,3000,60},
     [3]={5,33,0,60},
     },
--����ȭ�� (����id=110)
[110]={
     levelless={3,1,0,107,4},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={6,55,0,700},
     },
--��� (����id=111)
[111]={
     levelless={3,1,0,106,3},
     [1]={1,48,200000,1000},
     [2]={2,50,40000,1000},
     [3]={8,62,0,1000},
     },
--��ȭ (����id=112)
[112]={
     levelless={3,3,1,107,5,108,6,106,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--����ʮ���� (����id=113)
[113]={
     levelless={5,3,1,110,6,111,8,112,7},
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
	local nTaskValue = FN_GetTaskState(FN_GB);
	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_006();
		return
	else
		Say("V? c�ng h? ta s�c m�nh v? song, Gi�ng Long Th�p B�t Ch��ng uy ch�n thi�n h?. Binh kh? th��ng d�ng c�a �� t? ta l? <color=yellow>H? Th?<color> n�ng cao n�ng l�c t�n c�ng! C�n ta gi�p g? kh�ng?",
			4,
			"����ؤ�ﾻ��/enterjingyi",
			"ѧϰؤ�ﾻ���书/skilllearn",
			"�ҵõ��˱��������ؼ��б�/change_mistery_book",
			"����к�/no");
	end
end;


canjuan1 = 934
canjuan2 = 935
canjuan3 = 936

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 11 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a ta, M�t t�ch tr�n ph�i sao c? th? giao cho ng��i ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- ɶҲû��
		Say("Ng��i ch�a t�ng nh�n ���c trang m�t t�ch v? c�ng n�o sao c? th? n�i l? �� c? n??", 0)
		return
	end
	
	Say("Th�ng qua luy�n th�c ng��i �� c? nh�ng trang M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n! �� ta gi�p ng��i ��ng l�i th�nh m�t quy�n m�t t�ch ho�n ch�nh, nh�ng ph�i c? �� 3 quy�n (th��ng_trung _h?)", 
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
		AddItem(0, 112, 107, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i 1 M�t t�ch tr�n ph�i c�a C�i Bang T�nh Y, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i M�t t�ch tr�n ph�i c�a C�i Bang T�nh Y th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","B�o l�i, ��i M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


function jingyi()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("V? c�ng h? ta s�c m�nh v? song, Gi�ng Long Th�p B�t Ch��ng uy ch�n thi�n h?. Binh kh? th��ng d�ng c�a �� t? ta l? H? Th?!",0)
end;


function enterjingyi()		--��������
	if GetPlayerFaction() ~= 4 then	--���ɼ��
		Say("B�ng h�u n�n t�m Long bang ch? xin gia nh�p m�n ph�i r�i h�y t�m ta b�i s? h�c ngh?!",0)
	elseif   GetPlayerRoute() == 10 then	--δ�����ɵı��ŵ��� 
		if join_route_main(11) == 0 then
			return
		end
		Say("Gia nh�p T�nh Y ph�i ta, qu? l? s�ng su�t! Ta ch�nh th�c thu nh�n ng��i l�m �� t?, gi�p ng��i �� th�ng kinh m�ch, <color=yellow>t�y l�i �i�m ti�m n�ng<color>. C�ng phu b�n ph�i l�y <color=yellow>S�c m�nh<color> l�m g�c! Gi? ng��i c? th? ��n Bang ch? nh�n <color=yellow>Nhi�m v? s? m�n<color>!",0)
		SetPlayerRoute(11)	--ֱ����������
		LearnSkill(103)
		LearnSkill(104)
		AddItem(0,0,3,1,1,4,65,4,66)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? C�i Bang T�nh y!")
		TaskTip("B�n �� ���c t�y �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C? th? ��n g�p Bang ch? nh�n nhi�m v?!")
	elseif   GetPlayerRoute() == 11 then
	 	Say("H?! Mau �i luy�n c�ng �i! ��ng c? c? ng�y l��i nh�c, �nh h��ng thanh danh ta!",0)
	else
		Say("Ta ch�ng ph�i s? ph? th�nh gi�o c�a ng��i, ��ng ��n ��y n�nh h�t!",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 11 then	--���ɼ��
		Say("Ng��i kh�ng ph�i �� t? ta, kh�ng th? h�c v? c�ng C�i Bang T�nh y!",0)
	else

		Say("D�u {v} bi�u th? c? th? h�c v? c�ng n�y; d�u m�i t�n bi�u th? c? th? t�ng c�p! Nh�p tr�c ti�p v�o �� t�ng c�p!",0)
		AllowLearnSkill()
	end
end;

function huntian()
learnskill(103)
end;

function zhangfa()
learnskill(104)
end;

function tongbi()
learnskill(105)
end;

function qianjinza()
learnskill(106)
end;

function bawang()
learnskill(107)
end;

function qinna()
learnskill(108)
end;

function xiaoyao()
learnskill(109)
end;

function liuhe()
learnskill(110)
end;

function zuidie()
learnskill(111)
end;

function zuiqian()
learnskill(112)
end;

function xianglong()
learnskill(113)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 113) then	--����ʮ����
		if (GetSkillLevel("Gi�ng Long Th�p B�t Ch��ng") <= 0) then
			return "�Gi�ng Long Th�p B�t Ch��ng? l? <color=red>tuy�t h�c tr�n ph�i<color> c�a b�n m�n, ch? truy�n cho ng��i t�i gi�i."
		end
	end
end

function afterlearnskill(id)
	if (id == 113) then	--����ʮ����
		if (GetSkillLevel("Gi�ng Long Th�p B�t Ch��ng") == 1) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t kh�ng t?, b��c ��u �� l�nh h�i �Gi�ng Long Th�p B�t Ch��ng? c�a b�n m�n, th�t ��ng n?!<enter><color=green>Ng��i ch�i<color>: Nh�ng... th�a s? ph?, v? sao l�c �� t? thi tri�n �Gi�ng Long Th�p B�t Ch��ng?, n�i kh? trong ng��i b? ph�n t�n? �� nghe danh L�c M�ch Th�n Ki�m c�a ��i L? �o�n Th? t? l�u, ngh? ��n c�ng kh�ng d�m, h�m nay l�i c? d�p th?. <enter>Thi�u hi�p c�n ch�a bi�t �i�u n�y, �Gi�ng Long Th�p B�t Ch��ng? r�t m�nh, cho d? may m�n h�c ���c, nh�ng ch�a ch�c �i�u khi�n ���c n?. Tinh kh? b�n trong c? th? kh�ng t�ch t? th�nh �s�t khݔ? (m�c s�t kh?), th? kh�ng th? thi tri�n v? c�ng n�y, c�n ti�u hao �s�t khݔ b�n trong. �S�t khݔ g�m 10 ph�n, t�ng khi c�ng ph? s�t th��ng, d�n d�n t�ch t? l�i.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("Gi�ng Long Th�p B�t Ch��ng") == 5) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�ng minh, �Gi�ng Long Th�p B�t Ch��ng? �� l�nh h�i ���c 5 ph�n. V? c�ng n�y c? 20 c�p, t? c�p 5 tr? �i thi�u hi�p c�n ra s�c luy�n c�ng, ��n m�t m�c nh�t ��nh s? t�ng th�m 1 c�p. T? c�p 10 tr? �i ph�i l�nh h�i M�t t�ch tr�n ph�i c�a b�n m�n, m�i c? th? h�c ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta �ang v�n c�ng ch? d�n ng��i t�ch t? 10 ph�n s�t kh? trong ng��i, �� ng��i th? thi tri�n �Gi�ng Long Th�p B�t Ch��ng?. <enter><enter>L�u sau...<enter><enter>S�t kh? trong ng��i thi�u hi�p �� h�nh th�nh, l�c n�y c? th? th? thi tri�n �Gi�ng Long Th�p B�t Ch��ng?. Tuy�t h�c tr�n ph�i c�a b�n m�n uy l�c d�ng m�nh, ch? d�ng �� tr? b�o gi�p k? y�u, thay tr�i h�nh ��o, ��ng h�i ng��i v? t�i, h�y nh? k? l�y...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

