function main()
	if	GetPlayerFaction() == 3 then
		Say("ʦ�ã�Ҫ��������ɽ��?",2,"�ţ��ͷ�ʦ��������ɽ������£�/outemei","�������ݷý��ģ�/no_emei")
	else
		Say("<color=green>�Ǻ�<color>: ����ʲô��",2,"��ɽ��/outemei","���ã�����������/no_other")
	end
end;

function outemei()
	if(GetPKValue() >3 ) then
		Msg2Player("��ɱ��̫�أ�������ɽ")	
	else
    SetFightState(0)
		i=random(1,4)
		if i==2 then
			NewWorld(300, 1677 ,3671)
		elseif i==3 then
			NewWorld(300, 1681 ,3464)
		else 
			NewWorld(300, 1911 ,3442)
		end
	end
end

function no_emei()
	Say("���",0)
end;


function no_other()
	Say("<color=green>�Ǻ�<color>:�ټ�",0)
end;