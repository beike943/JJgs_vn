EXT_POINT_DLTC = 6

function take_gift_dltc()
	local nExtVal = GetExtPoint(6)
	local nLevel = GetLevel()
	
	if (nLevel >= 10) then
		if (nExtVal >= 1 and nExtVal <= 100) then
			Say("Chóc mõng b»ng h÷u ®· tróng th­ëng <color=Gold>"..nExtVal.."<color> ThÇn N«ng §¬n. B»ng h÷u muèn nhËn th­ëng kh«ng?",2, "Ta muèn nhËn phÇn th­ëng!/Confirm","HiÖn t¹i ta ch­a cÇn/SayNo")
		else
			Say("ChØ cã ng­êi tróng th­ëng míi nhËn ®­îc quµ!",0)
			Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn quµ.")
		end
	else
		Say("§¼ng cÊp 10 trë lªn míi ®­îc nhËn quµ!",0)		
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn quµ.")
	end
end


function Confirm()
	local nExtVal = GetExtPoint(6)
	local nLevel = GetLevel()
	local nFreeItemRoom = GetFreeItemRoom() 
		
	if (nLevel >= 10) then
		if (nExtVal >= 1 and nExtVal <= 100) then
			if (nFreeItemRoom >=  nExtVal) then
				PayExtPoint(EXT_POINT_DLTC, nExtVal)
			else
				Say("Hµnh trang cña b»ng h÷u chØ cã <color=Gold>"..nFreeItemRoom.." « trèng<color> nªn chØ nhËn ®­îc <color=Gold>"..nFreeItemRoom.."<color> ThÇn N«ng §¬n. Sau khi nhËn th­ëng h·y s¾p xÕp l¹i hµnh trang råi ®Õn gÆp ta.",2,"§ång ý/#SayYes("..nFreeItemRoom..")","§Ó ta s¾p xÕp l¹i hµnh trang/SayNo")					
			end		
		else
			Say("ChØ cã ng­êi tróng th­ëng míi nhËn ®­îc quµ!",0)
			Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn quµ.")
		end
	else
		Say("§¼ng cÊp 10 trë lªn míi ®­îc nhËn quµ!",0)		
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn quµ.")
	end
end

function SayYes(nFreeItemRoom)
	if (GetFreeItemRoom() >= nFreeItemRoom) then		
		PayExtPoint(EXT_POINT_DLTC, nFreeItemRoom)
	else	
		Say("Hµnh trang cña b»ng h÷u kh«ng ®ñ "..nFreeItemRoom.." « trèng.",0)
		Msg2Player("Hµnh trang cña b¹n kh«ng ®ñ « trèng.")
		return
	end	
end

function SayNo()

end

