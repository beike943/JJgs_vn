function main()
	Say("��������ʲô��?",
		2,
		"���빺��ʦ����Ʒ/baishibuy",
		"�ҹ�䣬û��/qita")
end

function baishibuy()
		Say("�������ϵȵ�װ������Ʒ���۸�40������Ҫ����?",
		2,
		"��/buyshimen",
		"����/meiqian")
end

function buyshimen()
		Say("��������Ҫ����Ʒ!", 0);
		Pay(40)	
		AddItem(0,2,14,1)
		AddItem(2,1,12,1)		
end;

function meiqian()
		Say("����Ǯ����.", 0);	
end;

	
function qita()
	i=random(1,3)
	if i == 1 then
		Say("M?c d? Minh Nguy?t ta ch? l�� m��t ti��u ?1o ??ng nh-ng c?ng l�� ?? t? ph?i Va ��ang, ng-?i xem th-��ng ta ��?",0)
	elseif	i == 2 then
		Say("Minh nguy?t c? th��i h��u, b? t?u v��n thanh thian. H?m ?? s- ph? nh��t ??nh ?�� u��ng say nan m��i ??t cho ta tan ??.",0)
	else
		Say("Kh?ng c? vi?c g�� th�� ??ng phi?n ta thanh tu",0)
	end
end;

