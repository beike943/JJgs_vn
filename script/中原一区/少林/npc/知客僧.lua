function main()
	if	GetPlayerFaction() == 1 then
		Say("S≠ Æ÷ muËn xuËng nÛi kh´ng?",2,"MuËn!/outshaolin","Ta Æ’n th®m S≠ huynh th´i mµ!/no_shaolin")
	else
		Say("A Di ßµ PhÀt! ß≠Óc th› chÒ hπ cË Thi’u L©m, thÀt l y lµm vinh d˘ cho bÊn t˘ qu∏, ti”u t®ng lµm sao c„ th” tı chËi Æ≠Óc ch¯?",2,"Phi“n Æπi s≠ Æ≠a tπi hπ xuËng nÛi/outshaolin","Tπi hπ muËn tham quan Thi’u L©m/no_other")
	end
end;

function outshaolin()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng≠Íi lµm vi÷c ∏c c m ra vµo th´n tr n.")	
	else
    SetFightState(0)
		i=random(1,4)
    if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else   
			NewWorld(200, 1249 ,2732)
		end
	end
end;


function no_shaolin()
	Say("ßa tπ!",0)
end;

function no_other()
	Say("A Di ßµ PhÀt! MÍi th› chÒ vµo trong!",0)
end;