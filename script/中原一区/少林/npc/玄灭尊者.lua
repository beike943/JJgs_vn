--����
--�ص㣺 ����
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1402 = GetTask(1402)

-------------------�򿪹��������岽---------------------------------------------
if ( UWorld1402 == 50  )  then
		Talk(2,"","S? ph? ch�c l? Huy�n Di�t T�n Gi?! D��ng Nguy�t s? th�i ti�n c? ta ��n �i�u tra vi�c Phong �� Qu? th�nh ��t nhi�n xu�t hi�n ? Giang T�n Th�n. V�i s�c l�c c�a S? th�i k�t h�p v�i X? L�i kim ��n v�n ch�a �� c�n ���c s? gi�p �� c�a s? ph?!","Ra l? v�y! Kh�ng ng? Phong �� Qu? th�nh l�i xu�t hi�n ? nh�n gian. Th? ch? h�y gi�p ta t�m <color=red>2 x�u Thi�n Ph�t ch�u<color> v? tr��c ��!","T�i h? �i ngay!")
		SetTask(1402,55)
		--AddItem(1,1,1,1)
		Earn(800)
		GivePlayerExp(SkeyFDGC,"fengduguicheng7")		--�ᶼ���7
		ModifyReputation(11,0)
		--AddNote("��Ҫȥȡ2�����ֵ�����鵽�����������")
		TaskTip("��Ҫȥȡ2�����ֵ�����鵽������������.")	
		
elseif ( UWorld1402  == 55 and GetItemCount(2,3,4) < 2 ) then
		Talk(1,"","Mau t�m <color=red>2 chu�i Thi�n Ph�t ch�u<color> v?!")
elseif ( UWorld1402  == 55 and GetItemCount(2,3,4) >= 2 ) then
		if  DelItem(2,3,4,1) == 1 then
				Talk(5,"","Thi�n Ph�t ch�u ��y!","C�t m�t c�i �i ta s? ph? ph�p c�i kia �� y�u ma kh�ng nh�p ���c v�o ng��i. Nh? l�y! Ph�p thu�t ta ch? gi�p ng��i ph�ng th�n ch? kh�ng th? �i l�i trong Qu? th�nh.","V�y ph�i l�m sao?","Ng��i ph�i ��n <color=red>V? �ang<color> t�m <color=red>T�p Nguy�n ch�n nh�n<color> th�nh <color=red>��n �n linh ph?<color> m�i c? th? �i l�i trong Qu? th�nh.","T�i h? �i ngay!") 
				SetTask(1402,60)
				--AddItem(1,1,1,1)
				Earn(1000)
				GivePlayerExp(SkeyFDGC,"fengduguicheng8")		--�ᶼ���8
				ModifyReputation(12,0)
				--AddNote("��ȥ�䵱ɽ�Ҽ�Ե���ˣ���һ����������Ϳ���ƽ���ĳ����ڷᶼ����ˡ�")
				TaskTip("��ȥ�䵱ɽ�Ҽ�Ե���ˣ���һ����������Ϳ���ƽ���ĳ����ڷᶼ�����.")
		else
				Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end
elseif ( UWorld1402  == 60 ) then
		Talk(1,"","Ng��i ph�i ��n <color=red>V? �ang<color> t�m <color=red>T�p Nguy�n ch�n nh�n<color> th�nh <color=red>��n �n linh ph?<color> m�i ���c.")
else
		Talk(1,"","Ta c? c�m gi�c th�m h�a s�p �p ��n!")
end
end;
