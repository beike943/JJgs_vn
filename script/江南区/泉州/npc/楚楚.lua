--����ָ��
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if ((Uworld1 == 1) and (HaveItem(0)>0)) then
		Say("лл�㡣 �Ҹе��ܹµ���ϣ�����˷��� ����֪����ν�����",2,"��֪��/yes","û��Ҫ!/no")
	DelItem(0)
	SetTask(1,2)
	else
		Talk(1,"","���죬�ұ���μ�Tri Chau�����磡 �Ҳ�֪����ʲô�� ���鷳!")
	end
end;


function yes()
	Talk(1,"no","����������ѧϰ���������������.���� Ctrl �Ҽ�������ɫ�鿴. ������ͨ�����·�ʽ���������죺������������ѡ������� ˫��Ҫ��ʾ�Ľ�ɫ���ƣ���������Ƶ����������ҵ������Խ���ʵʱ����!")
	AddGoldItem(0,10);
end

function no()
	Talk(1,"","��....")
end