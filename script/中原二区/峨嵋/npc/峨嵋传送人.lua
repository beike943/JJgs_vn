function main()
	if	GetPlayerFaction() == 3 then
		Say("����ɽ��?",2,"�ţ��鷳ʦ����!/outemei","���ã���������!/no_emei")
	else
		Say("<color=green>Nghi Ho?<color>: ����ɽ��?",2,"�ţ��鷳ʦ����!/outemei","���ã���������/no_other")
	end
end;

function outemei()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng?��i l?m vi?c ?c c?m ra v?o th?n tr?n.")	
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
	Say("��a t? S? mu��i c? l?ng!",0)
end;


function no_other()
	Say("<color=green>Nghi Ho?<color>: M��i thi?u hi?p v?o trong.",0)
end;