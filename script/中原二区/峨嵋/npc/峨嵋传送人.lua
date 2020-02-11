function main()
	if	GetPlayerFaction() == 3 then
		Say("S­ muéi muèn xuèng nói µ?",2,"PhiÒn ®¹i tû ®­a ta xuèng nói!/outemei","Ta ®Õn th¨m S­ tû th«i mµ!/no_emei")
	else
		Say("<color=green>Nghi Hoµ<color>: ThiÕu hiÖp t×m bÇn ni cã viÖc g× kh«ng?",2,"Xin ®­a t¹i h¹ xuèng nói!/outemei","§Õn chiªm ng­ìng c¶nh PhËt/no_other")
	end
end;

function outemei()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng­êi lµm viÖc ¸c cÊm ra vµo th«n trÊn.")	
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
	Say("§a t¹ S­ muéi cã lßng!",0)
end;


function no_other()
	Say("<color=green>Nghi Hoµ<color>: Mêi thiÕu hiÖp vµo trong.",0)
end;