Include("\\script\\global\\����������.lua");
Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

--�����б�
SKILLS={
--ؤ������
--�������� (����id=114)
[114]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={3,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ�����Ҿ��飬���ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	 },
--ؤ����� (����id=115)
[115]={
     levelless={3,1,0,114,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
--���߹��� (����id=116)
[116]={
     levelless={3,1,0,115,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--�����ֵ� (����id=117)
[117]={
     levelless={3,1,0,114,2},
     [1]={1,16,3000,60},
     [2]={2,20,3000,60},
     [3]={5,32,0,60},
     },
--������ (����id=118)
[118]={
     levelless={3,1,0,115,4},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={8,36,0,100},
     },
--���־� (����id=119)
[119]={
     levelless={3,1,0,117,2},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--͵��ת�� (����id=120)
[120]={
     levelless={3,1,0,119,1},
     [1]={1,35,50000,500},
     [2]={2,38,15000,500},
     [3]={6,50,0,500},
     },
--����ж�� (����id=121)
[121]={
     levelless={3,1,0,118,6},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--͵�컻�� (����id=122)
[122]={
     levelless={3,1,0,119,5},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={6,63,0,1000},
     },
--�򹷹��� (����id=123)
[123]={
     levelless={3,1,0,116,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--�򹷹��� (����id=124)
[124]={
     levelless={5,4,1,120,6,121,7,122,6,123,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say("<color=green>��Ԫ��<color>������书�����ˣ�",0)
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
		task_005();
		return
	else
		Say("C�ng phu ta l�y nhu th�ng c��ng, linh ho�t kh? l��ng. ��c m�n t�m ph�p c? th? l�i d�ng c�ng phu c�a k? ��ch �� t�n c�ng k? ��ch. Binh kh? th��ng d�ng c�a �� t? b�n ph�i l? <color=yellow>C�n<color>! C�n ta gi�p g? kh�ng?",
			4,
			"����ؤ������/enterwuyi",
			"ѧϰؤ�������书/skilllearn",
			"�ҵõ��˱��������ؼ��б�/change_mistery_book",
			"����к�/no");
	end
end;

canjuan1 = 937
canjuan2 = 938
canjuan3 = 939

-- �һ������ؼ��Ĺ��� =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- �Ͼ�
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- �о�
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- �¾�
	
	if GetPlayerRoute() ~= 12 then	--���ɼ��
		Say("Ng��i kh�ng ph�i l? �� t? c�a b�n m�n, M�t t�ch tr�n ph�i sao c? th? ��a cho ng��i ���c ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- ɶҲû��
		Say("Ng��i ch�a t�ng nh�n ���c quy�n M�t T�ch v? c�ng c�a b�n m�n sao c? th? n�i l? �� c? n??", 0)
		return
	end
	
	Say("Th�ng qua luy�n th�c ng��i �� c? ���c nh�ng trang M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n! �� ta gi�p ng��i ��ng l�i th�nh m�t quy�n m�t t�ch ho�n ch�nh, nh�ng c? th�nh c�ng hay kh�ng c�n ph? thu�c v�o ng��i c? t�m �� c�c trang m�t t�ch kh�ng n�a.", 
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
		AddItem(0, 112, 108, 1)
		Say("Ng��i th�t l? may m�n, ��y l? quy�n M�t t�ch tr�n ph�i ho�n ch�nh!", 0)
		Msg2Player("B�n nh�n ���c m�t quy�n M�t t�ch tr�n ph�i!")
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i 1 M�t t�ch tr�n ph�i c�a C�i Bang ? Y, nChangeType:"..nChangeType);
	else
		WriteLog("[��i m�t t�ch tr�n ph�i]:"..GetName().."��i M�t t�ch tr�n ph�i c�a C�i Bang ? Y th�t b�i, nChangeType:"..nChangeType);
		Talk(1,"","B�o l�i, ��i M�t t�ch tr�n ph�i th�t b�i!");
	end;
end;
-- �һ������ؼ��Ĺ��� =============================================end====


function jingyi()		--�쿴����
--������
end;

function tedian()		--�쿴����
Say("C�ng phu ta l�y nhu th�ng c��ng, linh ho�t kh? l��ng. ��c m�n t�m ph�p c? th? l�i d�ng c�ng phu c�a k? ��ch �� t�n c�ng k? ��ch. Binh kh? th��ng d�ng c�a �� t? b�n ph�i l? c�n!",0)
end;


function enterwuyi()		--��������
	if GetPlayerFaction() ~= 4 then	--���ɼ��
		Say("B�ng h�u n�n t�m Long bang ch? xin gia nh�p m�n ph�i r�i h�y t�m ta b�i s? h�c ngh?!",0)
	elseif   GetPlayerRoute() == 10 then	--δ�����ɵı��ŵ��� 
		if join_route_main(12) == 0 then
			return
		end
		Say("? Y ph�i m�i l? C�i Bang ch�nh t�ng. Ng��i c? th? gia nh�p, ta th�y r�t vui l�ng! Ta ch�nh th�c thu nh�n ng��i l�m �� t?, gi�p ng��i �� th�ng kinh m�ch, <color=yellow>t�y l�i �i�m ti�m n�ng<color>. C�ng phu b�n ph�i l�y <color=yellow>Th�n ph�p<color> l�m g�c! Ng��i �� gia nh�p h? ph�i, c? th? ��n Bang ch? nh�n <color=yellow>Nhi�m v? s? m�n<color>!",0)
		SetPlayerRoute(12)	--ֱ����������
		LearnSkill(114)
		LearnSkill(115)
		AddItem(0,5,29,1,1,4,65,4,66)
		ResetProperty()        --ϴǱ�ܵ�
		TaskTip("B�n �� tr? th�nh �� t? C�i Bang ? Y!")
		TaskTip("B�n �� ���c t�y l�i �i�m ti�m n�ng!")
		TaskTip("B�n �� nh�p m�n! C? th? ��n g�p Bang ch? nh�n nhi�m v?!")
	elseif   GetPlayerRoute() == 12 then
	 	Say("H?! Mau �i luy�n c�ng �i! ��ng c? c? ng�y l��i nh�c, �nh h��ng thanh danh ta!",0)
	else
		Say("Ta ch�ng ph�i s? ph? th�nh gi�o c�a ng��i, ��ng ��n ��y n�nh h�t!",0)
	end
end;

function skilllearn()		--ѧϰ����
	if GetPlayerRoute() ~= 12 then	--���ɼ��
		Say("Ng��i kh�ng ph�i �� t? ta, kh�ng th? h�c v? c�ng C�i Bang ? Y!",0)
	else
		Say("D�u {v} bi�u th? c? th? h�c v? c�ng n�y; d�u m�i t�n bi�u th? c? th? t�ng c�p! Nh�p tr�c ti�p v�o �� t�ng c�p!",0)
		AllowLearnSkill()
	end
end;


--		Say("<color=green>��Ԫ��<color>����Ҫѧϰʲô���ܣ�",11,"��������/tianxing","ؤ�����/gunfa","���߹���/qushe","�����ֵ�/qutao","������/niqiu","���־�/miaoshou","͵��ת��/toulong","����ж��/xiejia","͵�컻��/toutian","�򹷹���/dagougun","�򹷹���/dagouzhen")

function tianxing()
learnskill(114)
end;

function gunfa()
learnskill(115)
end;

function qushe()
learnskill(116)
end;

function qutao()
learnskill(117)
end;

function niqiu()
learnskill(118)
end;

function miaoshou()
learnskill(119)
end;

function toulong()
learnskill(120)
end;

function xiejia()
learnskill(121)
end;

function toutian()
learnskill(122)
end;

function dagougun()
learnskill(123)
end;

function dagouzhen()
learnskill(124)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh�ng ng? th�ng qua vi�c luy�n th�c ng��i c? th? nh�n ���c M�t t�ch tr�n ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Nh�ng tr�n ph�i v? h�c n�y ta c�ng ph�i l�nh ng? m�t th�i gian m�i c? th? truy�n th? ���c, ng��i quay l�i sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 124) then	--�򹷹���
		if (GetSkillLevel("�� C�u c�n ph�p") <= 0) then
			return "��? C�u B�ng tr�n? l? <color=red>tuy�t h�c tr�n ph�i<color> c�a b�n m�n, ch? truy�n cho ng��i t�i gi�i."
		end
	end
end

function afterlearnskill(id)
	if (id == 124) then	--�򹷹���
		if (GetSkillLevel("�� C�u c�n ph�p") == 1) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t kh�ng t?, b��c ��u �� l�nh h�i ��? C�u B�ng tr�n? c�a b�n m�n, th�t hi�m th�y! <enter><color=green>Ng��i ch�i<color>: Nh�ng... th�a s? ph?, v? sao l�c �� t? thi tri�n ��? C�u B�ng tr�n?, n�i kh? trong ng��i b? ph�n t�n? �� nghe danh L�c M�ch Th�n Ki�m c�a ��i L? �o�n Th? t? l�u, ngh? ��n c�ng kh�ng d�m, h�m nay l�i c? d�p th?. <enter>Thi�u hi�p c�n ch�a bi�t �i�u n�y, ��? C�u B�ng tr�n? r�t m�nh, cho d? may m�n h�c ���c, nh�ng ch�a ch�c �i�u khi�n ���c n?. Tinh kh? b�n trong c? th? kh�ng t�ch t? th�nh �s�t khݔ? (m�c s�t kh?), th? kh�ng th? thi tri�n v? c�ng n�y, c�n ti�u hao �s�t khݔ b�n trong. �S�t khݔ g�m 10 ph�n, t�ng khi c�ng ph? s�t th��ng, d�n d�n t�ch t? l�i.", 1, "��ng ?/GiveMomentum")
		elseif (GetSkillLevel("�� C�u c�n ph�p") == 5) then
			Say("Thi�u hi�p qu? nhi�n t? ch�t th�ng minh, ��? C�u B�ng tr�n? �� l�nh h�i ���c 5 ph�n. V? c�ng n�y c? 20 c�p, t? c�p th? 5 tr? �i thi�u hi�p c�n ra s�c luy�n c�ng, ��n m�t m�c nh�t ��nh s? t�ng th�m 1 c�p. T? c�p 10 tr? �i ph�i l�nh h�i M�t t�ch tr�n ph�i c�a b�n m�n, m�i c? th? h�c ���c.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta �ang v�n c�ng ch? d�n ng��i t�ch t? 10 ph�n s�t kh? trong ng��i, �� ng��i th? thi tri�n ��? C�u B�ng tr�n?. <enter><enter>L�u sau...<enter><enter>S�t kh? trong ng��i thi�u hi�p �� h�nh th�nh, l�c n�y c? th? th? thi tri�n ��? C�u B�ng tr�n?. Tuy�t h�c tr�n ph�i c�a b�n m�n uy l�c d�ng m�nh, ch? d�ng �� tr? b�o gi�p k? y�u, thay tr�i h�nh ��o, ��ng h�i ng��i v? t�i, h�y nh? k? l�y...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
end

