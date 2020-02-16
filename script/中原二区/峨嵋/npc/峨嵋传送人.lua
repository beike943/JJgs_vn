function main()
	if	GetPlayerFaction() == 3 then
		Say("师妹，要我送你下山吗?",2,"嗯，劳烦师姐送我下山处理点事！/outemei","我是来拜访姐姐的！/no_emei")
	else
		Say("<color=green>仪和<color>: 你有什么事",2,"下山！/outemei","不用，我来看看。/no_other")
	end
end;

function outemei()
	if(GetPKValue() >3 ) then
		Msg2Player("你杀气太重，不能上山")	
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
	Say("你乖",0)
end;


function no_other()
	Say("<color=green>仪和<color>:再见",0)
end;