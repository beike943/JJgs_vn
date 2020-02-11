Include("\\script\\lib\\globalfunctions.lua");

GIVE_LETTER_ID = 2430
GIVE_LETTER_TIME_ID = 2431
GIVE_MAX = 4

szNpcName = "<color=green>Minh ChÒ Kim S¨n<color>: "

function give_letter()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20090928 or nDate > 20091025 then
		Say(szNpcName.."Hoπt ÆÈng Æ∑ k’t thÛc.",0)
		return
	end	
	local tSay ={
		"T∆ng quµ Æ∆c bi÷t (1 MÀt Hµm S≠ M´n + 1 B∏nh ßÀu Xanh + 1 B∏nh ThÀp C»m)/#give_gift(1)",
		"T∆ng quµ th≠Íng (1 B∏nh ßÀu Xanh + 1 B∏nh ThÀp C»m)/#give_gift(2)",
		"ThÀt ngπi qu∏! Tπi hπ sœ quay lπi sau!/nothing";
	}	
	Say(szNpcName.."ßa tπ! S≠ phÙ cÒa thi’u hi÷p qu∂ thÀt c„ lﬂng!",getn(tSay),tSay);	
end

function give_gift(nIndex)
	local nDate = tonumber(date("%d"))
	local nTaskVal = GetTask(GIVE_LETTER_ID)
	
	if GetByte(nTaskVal, 2) ~= nDate then
		local nVal = SetByte(nTaskVal,1,0)
		SetTask(GIVE_LETTER_ID,SetByte(nVal,2,nDate))		
	end
	
	local nGiveByteVal = GetByte(GetTask(GIVE_LETTER_ID),1)
	if nGiveByteVal >= GIVE_MAX then
		Say(szNpcName.."H´m nay thi’u hi÷p Æ∑ t∆ng quµ cho ta "..GIVE_MAX.." l«n rÂi!",0);	
		return
	end
	
	if GetTime() - GetTask(GIVE_LETTER_TIME_ID) < 3600 then
		local nRemain = GetTask(GIVE_LETTER_TIME_ID) + 3600 - GetTime()
		Say(szNpcName.."ThÍi gian gi˜a 2 l«n t∆ng quµ lµ <color=red>1 giÍ<color>. Thi’u hi÷p cﬂn "..nRemain.." gi©y.",0)
		return
	end
	
	if GetItemCount(2,1,30108) < 1 then
		Say(szNpcName.."Thi’u hi÷p Æ’n ÆÔa vÌi ta ch®ng, sao ta chºng th y thi’u hi÷p mang theo g◊ c∂, hay lµ Æ∑ Æ” r¨i tr™n Æ≠Íng Æ’n Æ©y rÂi?",0)
		return
	end	
	
	if GetItemCount(2,1,30109) < 1 then
		Say(szNpcName.."Thi’u hi÷p Æ’n ÆÔa vÌi ta ch®ng, sao ta chºng th y thi’u hi÷p mang theo g◊ c∂, hay lµ Æ∑ Æ” r¨i tr™n Æ≠Íng Æ’n Æ©y rÂi?",0)
		return
	end	
		
	local nPoint = 0
	if nIndex == 1 then
		if GetItemCount(2,1,1020) < 1 then
			Say(szNpcName.."Thi’u hi÷p Æ’n ÆÔa vÌi ta ch®ng, sao ta chºng th y thi’u hi÷p mang theo g◊ c∂, hay lµ Æ∑ Æ” r¨i tr™n Æ≠Íng Æ’n Æ©y rÂi?",0)
			return
		end
		if DelItem(2,1,30108,1) == 1 and DelItem(2,1,30109,1) == 1 and DelItem(2,1,1020,1) == 1 then
			nPoint = 30
		end	
	elseif nIndex == 2 then
		if DelItem(2,1,30108,1) == 1 and DelItem(2,1,30109,1) == 1 then
			nPoint = 15
		end
	else
		Say(szNpcName.."Thi’u hi÷p Æ’n ÆÔa vÌi ta ch®ng, sao ta chºng th y thi’u hi÷p mang theo g◊ c∂, hay lµ Æ∑ Æ” r¨i tr™n Æ≠Íng Æ’n Æ©y rÂi?",0)
		return	
	end
	SetTask(GIVE_LETTER_ID,SetByte(GetTask(GIVE_LETTER_ID),1,nGiveByteVal + 1))
	SetTask(GIVE_LETTER_TIME_ID,GetTime())
	SetTask(336,GetTask(336) + nPoint)
	Msg2Player("Bπn nhÀn Æ≠Óc "..nPoint.." Æi”m s≠ m´n.")
	Say("ßa tπ! Xin chuy”n lÍi Æ’n S≠ phÙ thi’u hi÷p ta Æ∑ nhÀn Æ≠Óc quµ!",0)
end

function nothing()	
end