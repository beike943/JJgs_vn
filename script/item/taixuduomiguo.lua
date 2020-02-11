
-- Ì«Ðé¶àÃÜ¹û
TAIXU_TIME = 1782		--¼ÇÂ¼×î½üÒ»´Î½øÈëÌ«Ðé»Ã¾³µÄÊ±¼ä
EAT_TIME_TODAY = 1795	-- µ±ÌìÊ¹ÓÃÌ«Ðé¶àÃÜ¹ûµÄ´ÎÊý
MASK = 10000000

MAX_ENTER_CHANCE = 200

function OnUse(nItemIndex)
	local nValue = GetTask(EAT_TIME_TODAY)
	local nChance = floor(nValue / MASK)
	local nDate = mod(nValue, MASK)
	
	local nNow = tonumber(date("%y%m%d"))
	local nDuration = nNow - GetTask(TAIXU_TIME)
	if nNow <= nDate and nChance >= MAX_ENTER_CHANCE then
		WriteLog("<Th¸i H­ §a MËt Qu¶>"..GetName().."Trong mét ngµy sö dông qu¸"..MAX_ENTER_CHANCE.." lÇn")
		Msg2Player("B¹n sö dông qu¸ nhiÒu Th¸i H­ §a MËt Qu¶, kh«ng thÓ tiÕp tôc sö dông")
	elseif nDuration > 0 then
		Msg2Player("H«m nay b¹n vÉn vµo ®­îc Th¸i H­ HuyÔn c¶nh, kh«ng cÇn dïng Th¸i H­ §a MËt Qu¶")
	else
		if DelItem(2,1,387, 1) == 1 then
			SetTask(TAIXU_TIME, 0)
			if nNow > nDate then
				nChance = 1
			else
				nChance = nChance + 1
			end
			SetTask(EAT_TIME_TODAY, nNow + 10000000 * nChance)
			Msg2Player("Thµnh c«ng sö dông Th¸i H­ §a MËt Qu¶, cã thÓ tiÕp tôc vµo Th¸i H­ HuyÔn c¶nh")
		else
			Msg2Player("B¹n kh«ng cã Th¸i H­ §a MËt Qu¶")
		end
	end
end
