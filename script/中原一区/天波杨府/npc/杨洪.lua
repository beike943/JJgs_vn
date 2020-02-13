function main()
	if (GetSex()==2 and GetPlayerFaction() == 6) then
		Say("小姑娘, 是要出去吗?",2,"嗯，麻烦杨管家了/outyangmen","不用，我是来看看杨管家!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 6) then
		Say("小姑娘, 是要出去吗?",2,"嗯，麻烦杨管家了/outyangmen","不用，我是来看看杨管家!/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 6) then
		Say("小兄弟, 是要出去吗?",2,"嗯，麻烦杨管家了/outyangmen","不用，我是来看看杨管家!/no")
	else
		Say("小兄弟, 是要出去吗?",2,"嗯，麻烦杨管家了/outyangmen","不用，我是来看看杨管家!/no")
	end
end;


function outyangmen()
	if(GetPKValue() >3 ) then
		Msg2Player("恶人不得出入天波杨府.")	
	else
    		SetFightState(0)
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else   
			NewWorld(200, 1249,2732)
		end
	end
end;

