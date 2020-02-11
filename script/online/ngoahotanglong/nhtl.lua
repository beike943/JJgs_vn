-- Event Ngäa Hæ Tµng Long -  Vâ l©m lÖnh bµi 11/06/2008 - 31/12/2008

Include("\\script\\online\\ngoahotanglong\\nhtl_head.lua");

function RequestEventGift()
	if (IsEventStart() == 1) then
		local tGift1 = {			    
						"PhÇn th­ëng ThÇn N«ng §¬n/#ProcessIndex(1)",
						"PhÇn th­ëng B¹ch C©u Hoµn/#ProcessIndex(2)",
						"PhÇn th­ëng Trang bÞ/GetFactionItem",
						"HiÖn t¹i ta ch­a muèn nhËn/SayNo",
						}
		
		Say("Ng­êi ch¬i trong thêi gian tõ <color=Gold>11/06/2008 - 31/12/2008<color> së h÷u thÎ tµi kho¶n <color=Gold>Vâ L©m LÖnh Bµi<color> sÏ cã c¬ héi nhËn ®­îc c¸c phÇn th­ëng hÊp dÉn vµ trang bÞ m«n ph¸i. B»ng h÷u nhËn phÇn th­ëng nµo? ",getn(tGift1),tGift1)
	end
end


function GetFactionItem()
	local tGift2 = {			    
					"Trang bÞ m«n ph¸i S¬ cÊp/#ProcessIndexItem(1)",
					"Trang bÞ m«n ph¸i Trung cÊp/#ProcessIndexItem(2)",
					"Trang bÞ Tµng KiÕm/#ProcessIndexItem(3)",
					"HiÖn t¹i ta ch­a muèn nhËn/SayNo",
					}
	
	Say("B»ng h÷u nhËn trang bÞ nµo?",getn(tGift2),tGift2)
end


function ProcessIndex(nIndex)	
	if (CheckAccount() == 1) then	
			local nExtVal = GetExtPoint(tEventGift[nIndex][4])
			local nFreeItemRoom = GetFreeItemRoom()
			
			if (nExtVal >= 1) then
				if ((nFreeItemRoom >=  nExtVal*tEventGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tEventGift[nIndex][3] <= GetMaxItemWeight())) then
					if PayExtPoint(tEventGift[nIndex][4], nExtVal) == 1 then
						WriteLog("[Ngäa Hæ Tµng Long]\t"..GetAccount().."\t"..GetName().."\t ®· nhËn ®­îc "..nExtVal.." "..tEventGift[nIndex][1])				
					end
				else
					if ((nFreeItemRoom <  nExtVal*tEventGift[nIndex][2])  and (nFreeItemRoom > 0)) then
						Say("Chóc mõng b»ng h÷u ®· tróng th­ëng "..nExtVal.." "..tEventGift[nIndex][1]..". Hµnh trang cña b»ng h÷u chØ cã <color=Gold>"..nFreeItemRoom.." « trèng<color> nªn chØ nhËn ®­îc <color=Gold>"..nFreeItemRoom.."<color> "..tEventGift[nIndex][1]..". Sau khi nhËn th­ëng h·y s¾p xÕp l¹i hµnh trang råi ®Õn gÆp ta.",2,"§ång ý/#SayYes("..nIndex..","..GetFreeItemRoom()..")","§Ó ta s¾p xÕp l¹i hµnh trang/SayNo")
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
	else
			Say("Tµi kho¶n cña b»ng h÷u kh«ng cã Vâ L©m LÖnh Bµi!",0)
			Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
	end
end


function ProcessIndexItem(nIndex)	
	if (CheckAccount() == 1) then	
		local strTalk = "PhÇn th­ëng "..tEventFactionGift[nIndex][1].." bao gåm "..tEventFactionGift[nIndex][2].." . §Ó nhËn ®­îc phÇn th­ëng nµy b»ng h÷u ph¶i cã <color=Gold>tµi kho¶n Vâ L©m LÖnh Bµi<color> vµ <color=Gold>®¼ng cÊp nh©n vËt tõ cÊp "..tEventFactionGift[nIndex][3].." trë lªn<color>. Chó ý s¾p xÕp hµnh trang tr­íc khi nhËn th­ëng."		
		Say(strTalk, 2, "Ta muèn nhËn!/#GetGift("..nIndex..")", "§Ó ta s¾p xÕp l¹i hµnh trang/SayNo")	
	else
		Say("Tµi kho¶n cña b»ng h÷u kh«ng cã Vâ L©m LÖnh Bµi!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
	end
end


function GetGift(nIndex)
	local nExtVal = GetExtPoint(NHTL_EXT_POINT_FACTION)
	if (nIndex >= 1) and (nIndex <= 3) and (nExtVal < 16) then
		local nFaction = GetPlayerRoute()
		if  CheckFaction(nFaction) == 1 then
			local nLevel = GetLevel() 
			if nLevel  >= tEventFactionGift[nIndex][3] then			
				local nExtBit  = GetBit(nExtVal, tEventFactionGift[nIndex][4])			
				if nExtBit == 0 then
					local nFreeItemRoom = GetFreeItemRoom()								
					if nFreeItemRoom >= tEventFactionGift[nIndex][6] then				
						AddExtPoint(NHTL_EXT_POINT_FACTION,  tEventFactionGift[nIndex][5])
					else
						Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
						Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
					end			
				else
					Say("Ch¼ng ph¶i b»ng h÷u ®· nhËn phÇn th­ëng nµy råi sao?!",0)
					Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
				end		
			else
				Say("H·y rÌn luyÖn thªm råi ®Õn gÆp ta!",0)
				Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
			end
		else
			Say("B»ng h÷u ch­a gia nhËp m«n ph¸i nªn kh«ng ®­îc nhËn th­ëng.",0)
			Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		end
	else
		WriteLog("[Ngäa Hæ Tµng Long]\t"..GetAccount().."\t"..GetName().."\t trÞ sè nIndex tr¶ vÒ sai.")
	end
end


function SayYes(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tEventGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tEventGift[nIndex][3] <= GetMaxItemWeight())) then
		if PayExtPoint(tEventGift[nIndex][4], nFreeItemRoom) == 1 then
			WriteLog("[Ngäa Hæ Tµng Long]\t"..GetAccount().."\t"..GetName().."\t ®· nhËn ®­îc "..nFreeItemRoom.." "..tEventGift[nIndex][1])
		end
	else
		Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
		Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
		return
	end
end


function SayNo()	
end