--����ָ��
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 6  then
		Say("��ȥ�䵱ѧϰ�书��ÿ���˵�����! V� c�ng b�n ph�i n�i ngo�i t��ng t�, h� th�c t��ng sinh. Tr�ng ti�u huynh �� t� ch�t tinh th�m nh�ng xem ra ch�a �� c�n c�! Chi b�ng h�y h�c hai chi�u c�ng phu c� b�n c�a L�o Nhi T� xem th�c l�c th� n�o!",2,"Mu�n/yes","Kh�ng c�n ��u!/no")
	SetTask(1,7)
	else
		Talk(1,"","����ô���ͽ�ܣ���û���˶����Ǹе�����!")
	end
end;


function yes()
	Talk(1,"no","��Ҫ������ϰ�������������ܣ����������˼ڤ��ֱ������ָ��� ÿ����Ҫ����!")
	AddMagic(151,1);
	AddMagic(153,1);
end

function no()
	Talk(1,"","�Ҹ���ҩ����ϰ壬���Ĵ����ǳ���Ч�����ָ���������!")
end




		