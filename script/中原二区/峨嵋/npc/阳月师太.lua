--����
--�ص㣺 ����
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	UWorld1402 = GetTask(1402)
	---------------�����Ǵ򿪷�ħ����ͼ������------------------------------------
	if ( UWorld1402 == 20 )  then
			Talk(3,"","Ng��i l? D��ng Nguy�t S? Th�i? V�n b�i th�y y�u ma ho�nh h�nh ? Giang T�n th�n, ��nh ra tay t��ng tr? nh�ng kh�ng bi�t l�m th? n�o n�n ��n ��y th�nh gi�o s? th�i.","��ng l? nghi�p ch��ng! ��m y�u nghi�t n�y nh�t ��nh l? t? d��i <color=red>Phong Ma ��ng<color> ch�y ra. N�m x�a L�o ni �� giam ch�ng ? �� n�n m�i �� l�i h�u ho�n cho th�n d�n! Ng��i h�y �i l�y <color=red>1 vi�n X? L�i Kim ��n<color>, ta s? l�m ph�p gi�p ng��i ��n <color=red>Phong Ma ��ng<color> di�t tr? y�u ma.","T�i h? �i ngay!")
			SetTask(1402,25)
			--AddNote("ȡ1�������������Ա�õ�����ʦ̫�İ������ܹ����ɳ����ħ����")
			TaskTip("ȡ1�������������Ա�õ�����ʦ̫�İ������ܹ����ɳ����ħ����")
	elseif ( UWorld1402  == 25 and GetItemCount(2,3,7) < 1 ) then
			Talk(1,"","H�y t�m <color=red>1 vi�n X? L�i Kim ��n<color> v?, ta s? l�m ph�p gi�p ng��i v�o <color=red>Phong Ma ��ng<color>.")
	elseif ( UWorld1402  == 25 and GetItemCount(2,3,7) >= 1  ) then
		if  DelItem(2,3,7,1) == 1 then 
				 Talk(4,"","N�m x�a khi ta giam ch�ng trong ��ng �� m�t r�t nhi�u ch�n kh?, b�y gi? kh�ng th? tr�c ti�p ��i ��u v�i ch�ng.","V�y t�i h? ph�i l�m sao?","Hi�n gi? ng��i �� c? th? t? do ra v�o <color=red>Phong Ma ��ng<color>, trong ��ng c? con y�u qu�i t�n l? <color=red>Du H�n<color>, khi n? b? ti�u di�t s? d�n t�t c? s�c m�nh k�t th�nh <color=red>U H�n<color>, ng��i h�y l�y <color=red>10 vi�n<color> cho ta, ta c? th? bi�t ���c t�nh h�nh c�a b�n ch�ng �� t�nh b��c ti�p theo. N�u th�c l�c c�a ng��i ch�a �� th? h�y ��n <color=red>Giang T�n th�n t�m ��i hi�p Tr��ng ��nh (191.167)<color> nh? gi�p ��.","�� t? xin �i ngay!")
				 SetTask(1402,30)
				 --AddItem(1,1,1,1)
				 Earn(1000)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng3")		--�ᶼ���3
				 ModifyReputation(15,0)
				 --AddNote("ȥ��ħ��ȡʮ���λ���Ļ꣬�Ա��֪��һ�����ж�������")
				 TaskTip("ȥ��ħ��ȡʮ���λ���Ļ꣬�Ա��֪��һ�����ж�������")
		else
		 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end
	---------------------�����Ǵ򿪷ᶼ�������ĵ�һ��------------------------------------
	elseif ( UWorld1402  == 30 and GetItemCount(2,1,51) < 10 ) then
			Talk(1,"","<color=red>Du H�n<color> trong <color=red>Phong Ma ��ng<color> khi b? ti�u di�t s? ng�ng t? th�nh <color=red>U H�n<color>, ng��i l�y <color=red>10 vi�n<color> v? cho ta, t? �� ta c? th? bi�t t�nh h�nh c�a b�n ch�ng �� ngh? b��c ti�p theo.")
	elseif ( UWorld1402  == 30 and GetItemCount(2,1,51) > 9  ) then
			if  DelItem(2,1,51,10) == 1 then 
					 Talk(4,"","Hay l�m! Ta c? c�m th�y trong �� c? ch�t s�c m�nh nh? nhoi.","V�y c? th? ch�ng t? �i�u g??","�i�u �� ch�ng t? nh�t ��nh c? k? kh�c m? c�a ��ng Phong Ma. Ng��i mau ��n Phong Ma ��ng h�i <color=red>Lam D? Qu?<color> k? n�o �� m? c�a ��ng.","�� t? xin �i ngay!")
					 SetTask(1402,35)
					 --AddItem(1,1,1,1)
					 Earn(800)
					 GivePlayerExp(SkeyFDGC,"fengduguicheng4")		--�ᶼ���4
					 ModifyReputation(10,0)
					 --AddNote("ȥ��ħ����һ��Ұ�����ʵ�����˭�򿪵ķ�ħ���ڡ�")
					 TaskTip("ȥ��ħ����һ��Ұ�����ʵ�����˭�򿪵ķ�ħ���ڡ�")
			else
			 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
			end
	elseif ( UWorld1402  == 35  ) then
					Talk(1,"","Nh�t ��nh c? k? kh�c m? c�a ��ng Phong Ma. Ng��i mau ��n Phong Ma ��ng h�i <color=red>Lam D? Qu?<color> k? n�o �� m? c�a ��ng.")
	
	---------------------�����Ǵ򿪹�����������----------------------------------------------
	
	elseif ( UWorld1402  == 40  ) then
					    Talk(5,"","Ta d? la ���c tin Phong �� Qu? Th�nh �� xu�t hi�n ? ph�a ��ng Giang T�n th�n, c? th? m�t t�n ma t��ng n�o �� c�a Qu? Th�nh �� m? c�a ��ng Phong Ma.","Kh�ng th? n�o! Ma t��ng c�a Qu? Th�nh kh�ng th? c? s�c m�nh l�n ��n nh? v�y. Tr? phi ch�ng c? <color=red>b�n �� S�n H? X? T�c<color>. Ng��i mau �i �i�u tra r?!","T�i h? �i ngay!","Hi�n gi? ng��i ch�a th? v�o Qu? Th�nh ���c. H�y �i l�y <color=red>2 vi�n X? L�i Kim ��n<color> ��n ��y.","T�i h? �i ngay!")
					    SetTask(1402,45)
					    --AddItem(1,1,1,1)
					    Earn(800)
						GivePlayerExp(SkeyFDGC,"fengduguicheng5")		--�ᶼ���5
					    ModifyReputation(10,0)
					    --AddNote("ȡ����������������ʦ̫����")
					    TaskTip("ȡ����������������ʦ̫����")
	elseif ( UWorld1402  == 45 and GetItemCount(2,3,7) < 2 ) then
			Talk(1,"","Hi�n gi? ng��i ch�a th? v�o Qu? Th�nh ���c. H�y �i l�y <color=red>2 vi�n X? L�i Kim ��n<color> ��n ��y.")
	
	-----------------�����Ǵ򿪹������ĵ��Ĳ�-----------------------------------------------------
	elseif ( UWorld1402  == 45 and GetItemCount(2,3,7) >= 2 ) then
				if  DelItem(2,3,7,1) == 1 then
							Talk(2,"","S? Th�i! ��y l? X? L�i Kim ��n.","Hay l�m! Hai vi�n kim ��n n�y ng��i gi? m�t vi�n �� tr�nh y�u kh? nh�p th?. Ngo�i ra v�i c�ng l�c c�a ta kh�ng �� gi�p ng��i x�m nh�p Qu? Th�nh an to�n. h�y ��n <color=red>Thi�u L�m T?<color> t�m <color=red>Huy�n Di�t T�n Gi?<color>, �ng ta ? trong <color=red>Th�p L�m<color>, v�i c�ng l�c c�a �ng ta c? th? gi�p ng��i v�o Qu? Th�nh.") 
							SetTask(1402,50)
							--AddItem(1,1,1,1)
							Earn(800)
							GivePlayerExp(SkeyFDGC,"fengduguicheng6")		--�ᶼ���6
							ModifyReputation(10,0)
							--AddNote("ȥ�����µ������������������ߣ��Ա��ܹ�ƽ���Ľ���ᶼ��ǡ�")
							TaskTip("ȥ�����µ������������������ߣ��Ա��ܹ�ƽ���Ľ���ᶼ��ǡ�")
				else
							Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
				end
	elseif ( UWorld1402  == 50 ) then
				Talk(1,"","Ng��i ��n <color=red>Thi�u L�m T?<color> t�m <color=red>Huy�n Di�t T�n Gi?<color>, �ng ta ? trong <color=red>Th�p L�m<color>. V�i c�ng l�c c�a �ng ta c? th? gi�p ng��i x�m nh�p Qu? Th�nh an to�n. H�y nh? khi v�o Qu? Th�nh Phong �� nh? �em theo <color=red>1 vi�n X? L�i Kim ��n<color> �� ph�ng th�n.")
	
	------------------�����Ǵ���ʦ��������------------------------------------------------------
	elseif ( UWorld1402 == 75 )  then
			Talk(7,"","S? Th�i! T�i h? v�a t? Phong �� Qu? Th�nh tr? v?. N�i �� kh? nguy hi�m, gi? ph�i l�m sao ��y?","Xem ra ��nh ph�i t�m <color=yellow>c? ta r�i<color>.","<color=yellow>C? ta<color> l? ai?","C? ta ch�nh l? s? mu�i c�a ta, m�c d? v? c�ng cao h�n ta r�t nhi�u nh�ng n�m x�a c? ta �� c�c l�c ph�n ��i ta giam b�n y�u ma ? Phong Ma ��ng. N�m x�a ta tr? tu�i c? ch�p kh�ng nghe c? ta khuy�n n�n g�y ra ��i h�a h�m nay.","Xin h�i qu? t�nh c�a c? ta? T�i h? ��n ��u m�i c? th? t�m ���c c? ta?","C? ta �� b? ta tr�c xu�t kh�i s? m�n, l�c tr��c c? ng��i th�y c? ta ? <color=red>Th�nh ��<color>, t�n t�c gia c�a c? ta l? <color=red>V��ng C�n<color>. Ng��i h�y �i t�m c? ta v? n�i n�m x�a l? do ta kh�ng ��ng v�i c? ta, mong c? ta h�y l�y vi�c c�u sinh linh �� th�n l�m tr�ng v? ch? c�ch �u�i b�n Qu? Th�nh kh�i nh�n gian.","T�i h? �i ngay!")
			SetTask(1402,80)		
			--AddItem(1,1,1,1)
			Earn(1200)
			GivePlayerExp(SkeyFDGC,"fengduguicheng10")		--�ᶼ���10
			ModifyReputation(18,0)
			--AddNote("ȥ�ɶ�������誰�æ��")
			TaskTip("ȥ�ɶ�������誰�æ��")
	else
			Talk(1,"","Nam M? A Di �� Ph�t!")
	end
end;
