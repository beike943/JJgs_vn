function OnUse()
	Say("使用萝卜小礼盒可以获得<color=yellow>一个红萝卜<color>，你要使用吗？",2,
			"我要使用/give_hongluobo",
			"先不使用/end_say"
	)
end

function give_hongluobo()
	if DelItem(2,1,1094,1) == 1 then
		AddItem(2,1,1090,1)
	else
		Say("请确认你身上有萝卜小礼盒！",0)
	end	
end

function end_say()
end