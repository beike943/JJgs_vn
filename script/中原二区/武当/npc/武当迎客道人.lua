function main()
	if (GetSex()==2 and GetPlayerFaction() == 2) then
		Say("是要下山吗?",2,"嗯,麻烦师兄了/outwudang","不用,我来看看师兄!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 2) then
		Say("是要下山吗?",2,"嗯,麻烦师兄了/outwudang","不用,我来看看师兄!/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 2) then
		Say("是要下山吗?",2,"嗯,麻烦师兄了/outwudang","不用,我来看看师兄!/no")
	else
		Say("是要下山吗?",2,"嗯,麻烦师兄了/outwudang","不用,我来看看师兄!/no")
	end
end;


function outwudang()
	if(GetPKValue() >3 ) then
		Msg2Player("恶人不得出入武当派.")	
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

