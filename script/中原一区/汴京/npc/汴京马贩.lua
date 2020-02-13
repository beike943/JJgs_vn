Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");

function main()
  	local nTaskValue = FN_GetTaskState(FN_YM);

	if (nTaskValue==3) then
		task_107();
		return
  	end;
	Talk(1,"","这些盗贼太猖獗了，他们没有珍贵的马，也没有朋友。");
--
--	local strSay = {
--		"<color=green>汴京马贩<color>：这位大侠，我这里有大量的千里良驹，保证没有疯牛病和禽流感，您要看看有没有满意的吗？",
--		"我要看看/Buy",
--		"我要喂马/Feed",
--		"我要离开/Leave",
--	}
--	Say(strSay[1], 3, strSay[2], strSay[3], strSay[4])
end

function Buy()
	Sale(54)
	Talk(1,"","这些都是千里马，你选一匹吧!")
end

function Feed()
	local strSay = {
		"客官，您的马有点儿累，需要吃好点的草料哦！<color=red>",
		"<color>你想喂马吗?",
		"是的/FeedYes",
		"我要离开/Leave",
		"客官的马很好，不需要吃更多的草了。",
		"客官，我这里的马草很好，你要喂马吗?",
	}

	local nPrice = GetFeedHorsePrice()
	if nPrice < 0 then
		Talk(1,"",strSay[6])
	elseif nPrice == 0 then
		Talk(1,"",strSay[5])
	else
		Say(strSay[1]..nPrice..strSay[2], 2, strSay[3], strSay[4])
	end
end

function FeedYes()
	local strSay = {
		"好嘞！我来帮您喂马！",
		"客观地说，很少的钱是买不到好的马草的。",
	}
	local nPrice = GetFeedHorsePrice()
	local nMoney = GetCash()

	if nPrice > nMoney then
		Talk(1,"",strSay[2])
	else
		Talk(1,"",strSay[1])
		FeedHorse()
	end
end

function Leave()
end
