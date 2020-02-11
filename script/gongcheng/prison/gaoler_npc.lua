-- ¹¥³ÇÕ½²¶¿ì
-- lizhi
-- 2007-5-9 9:29

Include("\\script\\gongcheng\\prison\\prison_head.lua")

tCityWarPrison = {730,731,732,733,734}

function main()
	local selTab =
	{
		"B»ng h÷u ta ë ®©y, h·y ®Ó ta vµo th¨m./visit_a_prisoner",
		"Kh«ng cã g×/nothing",
	}
	Say("Lao lý träng ®Þa! L·ng v·ng ë ®©y lµm g×?",getn(selTab),selTab)
end;

function visit_a_prisoner()
	Say("B¹n muèn ®Õn nhµ lao ë thµnh nµo?",
		6,
		"Nhµ lao thµnh thÞ 1/#visit_yes(1)",
		"Nhµ lao thµnh thÞ 2/#visit_yes(2)",
		"Nhµ lao thµnh thÞ 3/#visit_yes(3)",
		"Nhµ lao thµnh thÞ 4/#visit_yes(4)",
		"Nhµ lao thµnh thÞ 5/#visit_yes(5)",
		"Rêi khái/nothing"
		)

end

function visit_yes(nIndex)
	local selTab = 
	{
		"§ång ý/#enter_jail("..nIndex..")",
		"Hñy bá/nothing",
	}
	if GetTrigger(CITYWAR_ENTER_PRISON) == 0 then
		Say("D¹o nµy bæn ®¹i gia h¬i tóng thiÕu, mang ®Õn <color=yellow>1 l­îng<color> cho l·o gia mi uèng r­îu ®i!",getn(selTab),selTab)
	else
		Say("Giao tiÒn råi, sao cßn ch­a vµo?",2,"§i vµo/#enter_jail("..nIndex..")","Rêi khái/nothing")
	end
end

function enter_jail(nIndex)
	CleanInteractive()
	if GetTrigger(CITYWAR_ENTER_PRISON) == 0 then
		if Pay(10000) == 1 then
			CreateTrigger(2, 1805 + nIndex, CITYWAR_ENTER_PRISON)
			NewWorld(tCityWarPrison[nIndex], tCityWarPrisonPos[1], tCityWarPrisonPos[2])
		else
			Talk(1,"","Kh«ng ngê ng­¬i cßn nghÌo h¬n ta n÷a! Th«i kh«ng tiÒn th× cót xÐo ®i!")
		end
	else
		NewWorld(tCityWarPrison[nIndex], tCityWarPrisonPos[1], tCityWarPrisonPos[2])
	end
end
