--����
--�ص㣺 ����
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1402 = GetTask(1402)

------------�����ǿ����������ĵ�����----------------------------

if ( UWorld1402 == 60 )  then
		Talk(2,"","Ng��i l? T�p Nguy�n Ch�n Nh�n? T�i h? ���c Huy�n Di�t T�n Gi? ch? ��n ��y. Phong �� Qu? Th�nh ��t nhi�n xu�t hi�n t�i nh�n gian, D��ng Nguy�t S? Th�i ph�i t�i h? �i �i�u tra nh�ng c�n ng��i gi�p �� m�i c? th? v�o Qu? Th�nh.","Th? ra l? v�y! Ng��i h�y t�m <color=red>1 c�y Chi�t Xung B�t<color> v? <color=red>1 ph�n Chu Sa<color> v? ��y, ta s? v? cho ng��i 1 l? b�a.","T�i h? tu�n l�nh!")
		SetTask(1402,65)
		--AddNote("��Ҫ1���۳�ʺ�1����ɰ���ü�Ե���˻����������")
		TaskTip("��Ҫ1���۳�ʺ�1����ɰ���ü�Ե���˻��������.")

elseif ( UWorld1402  == 65  and ( GetItemCount(0,9,76) < 1 or GetItemCount(2,2,30) < 1 ) ) then
		Talk(1,"","Ng��i h�y t�m <color=red>1 c�y Chi�t Xung B�t<color> v? <color=red>1 ph�n Chu Sa<color> v? ��y, ta s? vi�t cho ng��i 1 l? ��n �n linh ph?.")
elseif ( UWorld1402  == 65 and GetItemCount(0,9,76) >=1 and GetItemCount(2,2,30) >= 1  ) then
		if  ( DelItem(0,9,76,1) == 1 and  DelItem(2,2,30,1) == 1 )then
					Talk(1,"","Ch�n nh�n! T�i h? �� t�m ���c r�i!","Hay l�m! H�y c�m l�y t�m <color=red>��n �n linh ph?<color> n�y. Ng��i h�nh nh? �� c? <color=red>X? L�i Kim ��n<color> v? <color=red>Thi�n Ph�t Ch�u<color> c�a Nga My v? Thi�u L�m, ph�i mang theo 3 m�n �� b�n m�nh m�i c? th? b�nh an ra v�o Phong �� Qu? Th�nh, <color=yellow>thi�u 1 m�n c�ng kh�ng ���c<color>, h�y nh? l�y!","Ta �� t�ng v�o <color=red>Phong �� Qu? Th�nh<color> m�t l�n, n�n trong r�t l? nguy hi�m, ng��i <color=red>�i�u tra<color> xong l�p t�c quay v? b�o tin cho <color=red>D��ng Nguy�t S? Th�i<color> bi�t.","T�i h? l�p t�c l�n ���ng!") 
					SetTask(1402,70)
					AddItem(2,1,150,1)
					Earn(1000)
					GivePlayerExp(SkeyFDGC,"fengduguicheng9")		--�ᶼ���9
					ModifyReputation(15,0)
					TaskTip("��������������𵤣������3������ȥ�ᶼ���飬Ȼ��ض���������ʦ̫")
		else
					Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end
elseif ( UWorld1402  >= 70 ) then
			Say("��n nh? ta v? <color=red>��n �n linh ph?<color>? Ph�i c? <color=red>1 c�y Chi�t Xung B�t<color> v? <color=red>1 ph�n Chu Sa<color> m�i ���c.",2,"V? ��n �n linh ph?/yes1402_70","Kh�ng c? vi�c g?/no1402_70")
else
		Talk(1,"","Than �i! Tai h�a l�n l�i s�p b�t ��u!")
end
end;

function  yes1402_70()
if ( GetItemCount(0,9,76) >=1 and GetItemCount(2,2,30) >= 1  ) then
		if  ( DelItem(0,9,76,1) == 1 and  DelItem(2,2,30,1) == 1 )then
				Talk(1,"","H�y c�m l�y <color=red>��n �n linh ph?<color>! Ng��i ph�i c? <color=red>X? L�i Kim ��n<color> v? <color=red>Thi�n Ph�t Ch�u<color>, mang theo 3 m�n �� n�y c? th? b�nh an ra v�o Phong �� Qu? Th�nh, h�y nh? k? <color=yellow>thi�u m�t c�ng kh�ng ���c<color>!  ") 
				AddItem(2,1,150,1)
				--AddNote("�õ�һ�����������")
				TaskTip("�õ�һ���������.")
		else
				Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end			
elseif ( GetItemCount(0,9,76) == 0 or GetItemCount(2,2,30) == 0 ) then
		Talk(1,"","Ph�i c? <color=red>1 c�y Chi�t Xung B�t<color> v? <color=red>1 ph�n Chu Sa<color> m�i ���c.")
else
		Talk(1,"","Trong l�ng ta �ang kh�ng vui! Ng��i h�y quay l�i sau �i!")

end
end;

function  no1402_70()
				Talk(1,"","T�i h? ch? ��n tham quan phong c�nh c�a V? �ang.")
end;

