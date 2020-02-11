EXT_POINT_TTVL = 5

BIT_LEVEL_20 = 1
BIT_LEVEL_30 = 2
BIT_LEVEL_40 = 3
BIT_LEVEL_50 = 4

function take_gift_ttvl()
local gift = {			    
			    	"PhÇn th­ëng cÊp 20/#processIndex(1)",
				"PhÇn th­ëng cÊp 30/#processIndex(2)",
				"PhÇn th­ëng cÊp 40/#processIndex(3)",
				"PhÇn th­ëng cÊp 50/#processIndex(4)",
				"HiÖn t¹i ta ch­a cÇn/OnCancel"				
	}
	
	Say(	"Ng­êi ch¬i tõ cÊp <color=Gold>20<color>, <color=Gold>30<color>, <color=Gold>40<color> vµ <color=Gold>50<color> trë lªn sÏ nhËn ®­îc phÇn th­ëng Th¸ch Thøc Vâ L©m trong thêi gian tõ 01/12/2007 - 01/01/2008. B»ng h÷u chän phÇn th­ëng nµo? ",getn(gift),gift)

end

function processIndex(nIndex)
	local nLevel = GetLevel()
	local nExtVal = GetExtPoint(EXT_POINT_TTVL)
	
	if (nIndex == 1) then
		if (nLevel >= 20) then
			if (GetBit(nExtVal, BIT_LEVEL_20) == 0) then
				if (GetFreeItemRoom() >= 2) then					
					AddExtPoint(EXT_POINT_TTVL, 1)
				else
					Say("Hµnh trang ng­¬i kh«ng ®ñ 2 « trèng!",0)
					Msg2Player("Hµnh trang b¹n kh«ng ®ñ « trèng.")
					return
				end
			else
				Say("Ch¼ng ph¶i tµi kho¶n cña ng­¬i ®· nhËn phÇn th­ëng nµy råi sao?",0)
				Msg2Player("B¹n ®· nhËn phÇn th­ëng nµy råi.")
				return			
			end				
		else
			Say("§¹t ®Õn cÊp 20 råi h·y ®Õn t×m ta!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn nhËn phÇn th­ëng.")
			return
		end
	
	elseif (nIndex == 2) then
		if (nLevel >= 30) then
			if (GetBit(nExtVal, BIT_LEVEL_30) == 0) then
				if (GetFreeItemRoom() >= 5) then
					AddExtPoint(EXT_POINT_TTVL, 2)
				else
					Say("Hµnh trang ng­¬i kh«ng ®ñ 5 « trèng!",0)
					Msg2Player("Hµnh trang b¹n kh«ng ®ñ « trèng.")
					return
				end
			else
				Say("Ch¼ng ph¶i tµi kho¶n cña ng­¬i ®· nhËn phÇn th­ëng nµy råi sao?",0)
				Msg2Player("B¹n ®· nhËn phÇn th­ëng nµy råi.")
				return			
			end				
		else
			Say("§¹t ®Õn cÊp 30 råi h·y ®Õn t×m ta!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn nhËn phÇn th­ëng.")
			return
		end
	
	elseif (nIndex == 3) then
		if (nLevel >= 40) then
			if (GetBit(nExtVal, BIT_LEVEL_40) == 0) then
				if (GetFreeItemRoom() >= 7) then
					AddExtPoint(EXT_POINT_TTVL, 4)
				else
					Say("Hµnh trang ng­¬i kh«ng ®ñ 7 « trèng!",0)
					Msg2Player("Hµnh trang b¹n kh«ng ®ñ « trèng.")
					return
				end
			else
				Say("Ch¼ng ph¶i tµi kho¶n cña ng­¬i ®· nhËn phÇn th­ëng nµy råi sao?",0)
				Msg2Player("B¹n ®· nhËn phÇn th­ëng nµy råi.")
				return			
			end				
		else
			Say("§¹t ®Õn cÊp 40 råi h·y ®Õn t×m ta!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn nhËn phÇn th­ëng.")
			return
		end
	
	elseif (nIndex == 4) then
		if (nLevel >= 50) then
			if (GetBit(nExtVal, BIT_LEVEL_50) == 0) then
				if (GetFreeItemRoom() >= 9) then
					AddExtPoint(EXT_POINT_TTVL, 8)
				else
					Say("Hµnh trang ng­¬i kh«ng ®ñ 9 « trèng!",0)
					Msg2Player("Hµnh trang b¹n kh«ng ®ñ « trèng.")
					return
				end
			else
				Say("Ch¼ng ph¶i tµi kho¶n cña ng­¬i ®· nhËn phÇn th­ëng nµy råi sao?",0)
				Msg2Player("B¹n ®· nhËn phÇn th­ëng nµy råi.")
				return			
			end				
		else
			Say("§¹t ®Õn cÊp 50 råi h·y ®Õn t×m ta!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn nhËn phÇn th­ëng.")
			return
		end	
	else
		Say("Cã lçi x¶y ra, xin liªn hÖ GM ®Ó gi¶i quyÕt!",0)
		WriteLog(date("%Y%m%d%H")..GetAccount()..":"..GetName().." bŞ lçi nhËn phÇn th­ëng Th¸ch thøc vâ l©m.")		
	end

end