function main()
	if (GetSex()==2 and GetPlayerFaction() == 5) then
		Say("S≠ muÈi muËn rÍi kh·i Æ©y?",2,"Lµm phi“n s≠ t˚!/outtangmen","Ta Æ’n th®m S≠ t˚ th´i mµ!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 5) then
		Say("C´ n≠¨ng t◊m ta c„ vi÷c g◊?",2,"Phi“n t˚ t˚ Æ≠a ta rÍi ß≠Íng M´n/outtangmen","Kh´ng c„ g◊/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 5) then
		Say("S≠ Æ÷ lπi muËn trËn ra ngoµi ch¨i µ?",2,"ß÷ phÙng m÷nh hπ s¨n/outtangmen","Kh´ng c„ vi÷c g◊/no")
	else
		Say("C´ng tˆ! Ta c„ th” giÛp g◊?",2,"Phi“n c´ n≠¨ng Æ≠a ta mÈt Æoπn/outtangmen","Kh´ng c„ g◊/no")
	end
end;


function outtangmen()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng≠Íi lµm vi÷c ∏c c m ra vµo th´n tr n.")	
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
end;

function no()
end;

