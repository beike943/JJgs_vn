function main()
	if (GetSex()==2 and GetPlayerFaction() == 2) then
		Say("��Ҫ��ɽ��?",2,"��,�鷳ʦ����/outwudang","����,��������ʦ��!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 2) then
		Say("��Ҫ��ɽ��?",2,"��,�鷳ʦ����/outwudang","����,��������ʦ��!/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 2) then
		Say("��Ҫ��ɽ��?",2,"��,�鷳ʦ����/outwudang","����,��������ʦ��!/no")
	else
		Say("��Ҫ��ɽ��?",2,"��,�鷳ʦ����/outwudang","����,��������ʦ��!/no")
	end
end;


function outwudang()
	if(GetPKValue() >3 ) then
		Msg2Player("���˲��ó����䵱��.")	
	else
    SetFightState(0)
		i=random(1,4)
		if i==1 then
			NewWorld(350, 1518 ,3050)
		elseif i==2 then
			NewWorld(350, 1362 ,3053)
		elseif i==3 then
			NewWorld(350, 1332 ,2865)
		else 
			NewWorld(350, 1542 ,2865)
		end
	end
end

function no()
end;

