-- Event HÌ NgËp Trµn - Vui Rén Rµng 11/06/2008 - 20/07/2008

Include("\\script\\online\\promotionhe\\vuihe_head.lua");

function RequestEventHeGift()
	if (IsEventHeStart() == 1) then
		local tGift1 = {			    
						"PhÇn th­ëng Ch­ëng M«n §Æc Phong LÖnh/#ProcessIndexHe(1)",
						"PhÇn th­ëng Phong Th­ëng LÖnh ChiÕn Tr­êng/GetSongLiao",
						"PhÇn th­ëng B¶o R­¬ng Tµng KiÕm Hoa Khè/#ProcessIndexHe(4)",
						"PhÇn th­ëng ThÇn N«ng §¬n/#ProcessIndexHe(5)",
						"PhÇn th­ëng B¹ch C©u Hoµn/#ProcessIndexHe(6)",						
						"HiÖn t¹i ta ch­a muèn nhËn/SayNo",
						}
		
		Say("Ng­êi ch¬i trong thêi gian tõ <color=Gold>11/06/2008 - 13/07/2008<color> tham gia ch­¬ng tr×nh quay sè tróng th­ëng <color=Gold>HÌ Rén Rµng - Vui NgËp Trµn<color> sÏ cã c¬ héi nhËn ®­îc c¸c phÇn th­ëng hÊp dÉn. Thêi gian nhËn th­ëng tõ <color=Gold>11/06/2008 - 20/07/2008<color>. B»ng h÷u nhËn phÇn th­ëng nµo? ",getn(tGift1),tGift1)
	end
end

function GetSongLiao()
	local tGift2 = {			    
					"Phong Th­ëng LÖnh Tiªn Phong - Tèng/#ProcessIndexHe(2)",
					"Phong Th­ëng LÖnh Tiªn Phong - Liªu/#ProcessIndexHe(3)",					
					"HiÖn t¹i ta ch­a muèn nhËn/SayNo",
					}
	
	Say("B»ng h÷u nhËn phong th­ëng lÖnh nµo?",getn(tGift2),tGift2)

end

function ProcessIndexHe(nIndex)		
		local nExtVal = GetExtPoint(tEventHeGift[nIndex][4])
		local nFreeItemRoom = GetFreeItemRoom()
		
		if (nExtVal >= 1) then
			if nIndex == 2 then
				SetTask(2428,1)
			else
				if nIndex == 3 then
					SetTask(2428,2)
				end
			end
			
			if ((nFreeItemRoom >=  nExtVal*tEventHeGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tEventHeGift[nIndex][3] <= GetMaxItemWeight())) then
				if PayExtPoint(tEventHeGift[nIndex][4], nExtVal) == 1 then
					WriteLog("[Vui He]\t"..GetAccount().."\t"..GetName().."\t ®· nhËn ®­îc "..nExtVal.." "..tEventHeGift[nIndex][1])				
				end
			else
				if ((nFreeItemRoom <  nExtVal*tEventHeGift[nIndex][2])  and (nFreeItemRoom > 0)) then
					Say("Chóc mõng b»ng h÷u ®· tróng th­ëng "..nExtVal.." "..tEventHeGift[nIndex][1]..". Hµnh trang cña b»ng h÷u chØ cã <color=Gold>"..nFreeItemRoom.." « trèng<color> nªn chØ nhËn ®­îc <color=Gold>"..nFreeItemRoom.."<color> "..tEventHeGift[nIndex][1]..". Sau khi nhËn th­ëng h·y s¾p xÕp l¹i hµnh trang råi ®Õn gÆp ta.",2,"§ång ý/#SayYesHe("..nIndex..","..GetFreeItemRoom()..")","§Ó ta s¾p xÕp l¹i hµnh trang/SayNoHe")
				else
					Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
					Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
					return			
				end
			end		
		else
			Say("ChØ cã ng­êi tróng th­ëng míi ®­îc nhËn quµ!",0)
			Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		end
end

function SayYesHe(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tEventHeGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tEventHeGift[nIndex][3] <= GetMaxItemWeight())) then
		if PayExtPoint(tEventHeGift[nIndex][4], nFreeItemRoom) == 1 then
			WriteLog("[Vui He]\t"..GetAccount().."\t"..GetName().."\t ®· nhËn ®­îc "..nFreeItemRoom.." "..tEventHeGift[nIndex][1])				
		end
	else
		Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
		Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
		return
	end
end


function SayNoHe()	
end