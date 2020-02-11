-- Created by TuanNA5
-- Give player award for 3rd BHTA

EXT_MATTICH = -1
EXT_NHANSAM = 5
BHTA_DATE_START = 10051400
BHTA_DATE_END = 10051624

tPrize ={
	{"M¶nh MËt TÞch ThÊt L¹c",{2,1,1088},1,1,EXT_MATTICH},
	{"Nh©n S©m V¹n N¨m",{2,1,30071},1,1,EXT_NHANSAM}
}

function get_prize()
	local tSay = {
--		"NhËn M¶nh MËt TÞch ThÊt L¹c/#processIndex(1)",
		"NhËn Nh©n S©m V¹n N¨m/#processIndex(2)",
		"KÕt thóc ®èi tho¹i/nothing",
	}	
	Say("Thêi gian nhËn th­ëng vËt phÈm Bang Héi Tinh Anh 3 tõ <color=red>14/05/2010 - 16/05/2010<color>, c¸c h¹ nhËn phÇn th­ëng nµo?",getn(tSay),tSay)
end


function processIndex(nIndex)		
	local nExtVal = GetExtPoint(tPrize[nIndex][5])
	local nFreeItemRoom = GetFreeItemRoom()
	
	if (nExtVal >= 1) then
		if ((nFreeItemRoom >=  tPrize[nIndex][3]) and (GetCurItemWeight() + nExtVal*tPrize[nIndex][4] <= GetMaxItemWeight())) then
			PayExtPoint(tPrize[nIndex][5], nExtVal)
		else			
			Say("Søc lùc hoÆc hµnh trang cña c¸c h¹ kh«ng ®ñ.",0)
			Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
			return			
		end		
	else
		Say("ChØ cã ng­êi tham gia Bang Héi Tinh Anh 3 míi ®­îc nhËn!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
	end
end