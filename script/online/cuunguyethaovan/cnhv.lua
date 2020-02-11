-- Event Cöu NguyÖt H¶o VËn 29/08/2008 - 30/09/2008
-- Created by TuanNA5

Include("\\script\\online\\cuunguyethaovan\\cnhv_head.lua");

function RequestEventCNHV()
	if (IsEventCNHVStart() == 1) then
		local tGift1 = {			    
						"PhÇn th­ëng MËt TÞch S­ M«n/RequestFactionBook1",
						"PhÇn th­ëng TÈy Tñy Linh §¬n/#ProcessCNHVIndex(4)",
						"PhÇn th­ëng Bång Lai Tiªn §¬n/#ProcessCNHVIndex(5)",
						"PhÇn th­ëng Tam Thanh Hoµn/#ProcessCNHVIndex(6)",
						"PhÇn th­ëng ThÇn N«ng §¬n/#ProcessCNHVIndex(1)",
						"PhÇn th­ëng B¹ch C©u Hoµn/#ProcessCNHVIndex(2)",						
						"HiÖn t¹i ta ch­a muèn nhËn/SayNoCNHV",
						}		
		Say("Trong thêi gian tõ <color=Gold>05/09/2008 - 30/09/2008<color>, ng­êi ch¬i tham gia ch­¬ng tr×nh khuyÕn m·i <color=Gold>Cöu NguyÖt H¶o VËn<color> sÏ cã c¬ héi nhËn ®­îc c¸c phÇn th­ëng hÊp dÉn vµ gi¸ trÞ. Thêi h¹n nhËn th­ëng ®Õn <color=Gold>24:00 07/10/2008<color>. B»ng h÷u nhËn phÇn th­ëng nµo? ",getn(tGift1),tGift1)
	end
end

function RequestFactionBook1()
	local tGift2 = {}
	
	for i=1,7  do
		tGift2[i] = tBookList[i][1].."/#ProcessCNHVIndex(3,"..i..")"	
	end
	
	tGift2[getn(tGift2) + 1]  = "Xem trang sau/RequestFactionBook2"
	tGift2[getn(tGift2) + 1]  = "HiÖn t¹i ta ch­a muèn nhËn/SayNoCNHV"
	
	Say("Ng­êi ch¬i tróng th­ëng <color=Gold>MËt TÞch S­ M«n<color> cã thÓ nhËn nhiÒu lÇn t­¬ng øng víi sè lÇn tróng th­ëng. Mçi lÇn nhËn tèi ®a <color=red>1 mËt tÞch<color>. B»ng h÷u nhËn mËt tÞch nµo?",getn(tGift2),tGift2)
end

function RequestFactionBook2()
	local tGift3 = {}
	local nBook = 0
	
	for i=1,7  do
		nBook = i + 7
		tGift3[i] = tBookList[nBook][1].."/#ProcessCNHVIndex(3,"..nBook..")"	
	end
	
	tGift3[getn(tGift3) + 1]  = "Xem trang tr­íc/RequestFactionBook1"
	tGift3[getn(tGift3) + 1]  = "HiÖn t¹i ta ch­a muèn nhËn/SayNoCNHV"
	
	Say("Ng­êi ch¬i tróng th­ëng <color=Gold>MËt TÞch S­ M«n<color> cã thÓ nhËn nhiÒu lÇn t­¬ng øng víi sè lÇn tróng th­ëng. Mçi lÇn nhËn tèi ®a <color=red>1 mËt tÞch<color>. B»ng h÷u nhËn mËt tÞch nµo?",getn(tGift3),tGift3)
end


function ProcessCNHVIndex(nIndex,nChoice)	
	local nExtVal = GetExtPoint(tEventCNHVGift[nIndex][4])
	local nFreeItemRoom = GetFreeItemRoom()		
	
	if (nExtVal >= 1) then	
		if nIndex == 3 and nChoice > 0 then
			SetTask(2429,nChoice)			
			if ((nFreeItemRoom >=  tEventCNHVGift[nIndex][2]) and (GetCurItemWeight() + tEventCNHVGift[nIndex][3] <= GetMaxItemWeight())) then
				PayExtPoint(tEventCNHVGift[nIndex][4], 1) 				
			else
				Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
				Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
				return
			end			
		else
			SetTask(2429,0)			
			if ((nFreeItemRoom >=  nExtVal*tEventCNHVGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tEventCNHVGift[nIndex][3] <= GetMaxItemWeight())) then
				if PayExtPoint(tEventCNHVGift[nIndex][4], nExtVal) == 1 then
					if nIndex == 1 or nIndex == 2 then
						WriteLog( "[Cuu Nguyet Hao Van]\t"..GetAccount().."\t"..GetName().."\tnhËn".."\t"..nExtVal.."\t"..tEventCNHVGift[nIndex][1].."\t".."\t".."\t".."\t".."\t".."\t")
					end
				end
			else
				if ((nFreeItemRoom <  nExtVal*tEventCNHVGift[nIndex][2])  and (nFreeItemRoom > 0)) then
					Say("Chóc mõng b»ng h÷u ®· tróng th­ëng "..nExtVal.." "..tEventCNHVGift[nIndex][1]..". Hµnh trang cña b»ng h÷u chØ cã <color=Gold>"..nFreeItemRoom.." « trèng<color> nªn chØ nhËn ®­îc <color=Gold>"..nFreeItemRoom.."<color> "..tEventCNHVGift[nIndex][1]..". Sau khi nhËn th­ëng h·y s¾p xÕp l¹i hµnh trang råi ®Õn gÆp ta.",2,"§ång ý/#SayYesCNHV("..nIndex..","..GetFreeItemRoom()..")","§Ó ta s¾p xÕp l¹i hµnh trang/SayNoCNHV")
				else
					Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
					Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
					return			
				end
			end		
		end				
		
	else
		Say("ChØ cã ng­êi tróng th­ëng míi ®­îc nhËn quµ!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
	end
end


function SayYesCNHV(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tEventCNHVGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tEventCNHVGift[nIndex][3] <= GetMaxItemWeight())) then
		if PayExtPoint(tEventCNHVGift[nIndex][4], nFreeItemRoom) == 1 then
			if nIndex == 1 or nIndex == 2 then
				WriteLog( "[Cuu Nguyet Hao Van]\t"..GetAccount().."\t"..GetName().."\tnhËn".."\t"..nExtVal.."\t"..tEventCNHVGift[nIndex][1].."\t".."\t".."\t".."\t".."\t".."\t")
			end
		end
	else
		Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
		Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
		return
	end
end

function SayNoCNHV()	
end