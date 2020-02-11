EXT_POINT_QTVL = 4

START_DATE_QTVL = 2007120500
END_DATE_QTVL = 2007120900

PRIZE_QTVL = 3

function take_gift_qtvl()
	local nExtVal = GetExtPoint(EXT_POINT_QTVL)	
	
	if (nExtVal == 1) then
			if (GetFreeItemRoom() >=  PRIZE_QTVL) then
				PayExtPoint(EXT_POINT_QTVL, nExtVal)
			else
				Say("Hµnh trang b»ng h÷u kh«ng ®ñ "..PRIZE_QTVL.." chç trèng.",0)
				Msg2Player("Hµnh trang cña b¹n kh«ng ®ñ chç trèng.")
				return
			end		
	else
		Say("ChØ cã ng­êi ®¨ng nhËp vµo ngµy 01/12/2007 míi nhËn ®­îc quµ!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn quµ.")
	end
end
