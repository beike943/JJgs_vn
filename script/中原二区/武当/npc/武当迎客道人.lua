function main()
	if (GetSex()==2 and GetPlayerFaction() == 2) then
		Say("S≠ muÈi muËn hπ s¨n?",2,"Phi“n Mπc s≠ ca/outwudang","Ta Æ’n th®m S≠ ca th´i mµ!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 2) then
		Say("C´ n≠¨ng t◊m ta c„ vi÷c g◊?",2,"Phi“n Æπo tr≠Îng Æ≠a tπi hπ xuËng nÛi/outwudang","Kh´ng c„ vi÷c g◊!/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 2) then
		Say("S≠ Æ÷ muËn lŒn ra ngoµi ch¨i?",2,"ß÷ phÙng m÷nh hπ s¨n/outwudang","Kh´ng c„ vi÷c g◊!/no")
	else
		Say("ßπi hi÷p! B«n Æπo c„ th” giÛp g◊?",2,"Phi“n Æπo tr≠Îng Æ≠a tπi hπ xuËng nÛi/outwudang","Kh´ng c„ vi÷c g◊!/no")
	end
end;


function outwudang()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng≠Íi lµm vi÷c ∏c c m ra vµo th´n tr n.")	
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

