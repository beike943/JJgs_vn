Include("\\script\\vng\\lib\\vnglib_award.lua");

tPai =
{
	[469] = {"Dïng 1 B¸t Qu¸i bµi - Cµn ®æi 30 v¹n kinh nghiÖm, mçi ngµy ®æi ®­îc tèi ®a 20 lÇn", "GiveExp(300000, 20)"		},
	[470] = {"Dïng 1 B¸t Qu¸i bµi - Kh«n ®æi 5 ®iÓm danh väng, mçi ngµy ®æi ®­îc tèi ®a 20 lÇn", "GiveReputation(5, 20)"   },
	[471] = {"Dïng 1 B¸t Qu¸i bµi - Kh¶m ®æi 3 Thiªn th¹ch, mçi ngµy ®æi ®­îc tèi ®a 20 lÇn", "GiveYuntie(3, 20)"          },
	[472] = {"Dïng 1 B¸t Qu¸i bµi - §oµi ®æi nguyªn liÖu cÊp 76, mçi ngµy ®æi ®­îc tèi ®a 30 lÇn", "GiveWeaponMaterial(30)"   },
	[473] = {"Dïng 1 B¸t Qu¸i bµi - Ly t¨ng 500000 ®iÓm kinh nghiÖm, mçi ngµy ®æi tèi ®a 10 lÇn", "GiveExp3(500000, 10)"       },
	[474] = {"Dïng 1 B¸t Qu¸i bµi - ChÊn ®æi ngùa cÊp 70, mçi ngµy ®æi ®­îc tèi ®a 5 lÇn", "GiveHorse(5)"            },
	[475] = {"Dïng 1 B¸t Qu¸i bµi - CÊn ®æi Th¸i H­ B¸t Qu¸i bµi, mçi ngµy ®æi ®­îc tèi ®a 10 lÇn", "GiveOtherPai(10)"         },
	[476] = {"Dïng 1 B¸t Qu¸i bµi - Tèn ®æi 500 v¹n kinh nghiÖm, mçi ngµy ®æi ®­îc tèi ®a 5 lÇn", "GiveExp2(5000000, 5)"       },
}

-- Õâ¸öÊýÖµÒÔºóÌ«ÐéÅÆÊýÁ¿±ä»¯ÒÔºóÒªÐÞ¸Ä
MAX_ITEM_COUNT = 8

function GetAwardPai()
	-- ËÑË÷ÉíÉÏµÄÌ«Ðé°ËØÔÅÆ
	local nCount = 1
	local tItem = {}
	for index, value in tPai do
		if GetItemCount(2, 1, index) > 0 then
			tItem[nCount] = value[1].."/#UsePaiGetAward("..index..")"
			nCount = nCount + 1
		end
	end
	tItem[nCount] = "Kh«ng ®æi/end_say"
	if nCount <= MAX_ITEM_COUNT then
		Say("Ng­¬i muèn dïng Th¸i H­ B¸t Qu¸i lo¹i nµo ®æi phÇn th­ëng?", getn(tItem), tItem)
	else
		tinsert(tItem, 1, "Dïng mét bé Th¸i H­ B¸t Qu¸i bµi ®æi trang søc Th¸i H­/UseAllGetAward")
		tinsert(tItem, 2, "Dïng mét bé Th¸i H­ B¸t Qu¸i bµi ®æi phÇn th­ëng/UseAllGetAward_new")
		Say("Ng­¬i ®· cã mét bé Th¸i H­ B¸t Qu¸i bµi cã thÓ chän ®æi 1 mãn trang søc Th¸i H­ hoÆc dïng tõng mãn ®æi phÇn th­ëng.", getn(tItem), tItem)
	end
end

function UsePaiGetAward(nIndex)
	if tPai[nIndex] == nil then
		return
		WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."§­êng dÉn ®æi B¸t Qu¸i bµi phi ph¸p, thêi gian : "..date("%H%M"))
	end
	
	if GetItemCount(2, 1, nIndex) <= 0 then
		Say("Ng­¬i kh«ng mang <color=yellow>"..tPai[nIndex].."<color>, kh«ng thÓ ®æi th­ëng.", 0)
		return
	end
	
	dostring(tPai[nIndex][2])
end

function UseAllGetAward()
	local tRing = 
	{
		"Th¸i H­ HuyÔn Ngäc (søc m¹nh)/#GiveTaixuRing(29)",
		"Th¸i H­ HuyÔn §¸i (th©n ph¸p)/#GiveTaixuRing(30)",
		"Th¸i H­ HuyÔn Hoµn (g©n cèt)/#GiveTaixuRing(31)",
		"Th¸i H­ HuyÔn Béi (néi c«ng)/#GiveTaixuRing(32)",
		"Th¸i H­ HuyÔn Giíi (Linh ho¹t)/#GiveTaixuRing(33)",
		"Th¸i H­ HuyÔn §¹i (®éc)/#GiveTaixuRing(34)",
		"Th¸i H­ HuyÔn Th¹ch (s¸t th­¬ng)/#GiveTaixuRing(35)",
		"Quay l¹i sau!/end_say"
	}
	Say("Ng­¬i muèn ®æi trang søc nµo? Tr­íc khi ®æi xem l¹i hµnh trang vµ søc lùc!", getn(tRing), tRing)
end

function GiveTaixuRing(nIndex)
	local tName =
	{
		[29] = "B¹n muèn ®æi <color=yellow>Th¸i H­ HuyÔn ngäc (søc m¹nh)<color> chø?",
		[30] = "B¹n muèn ®æi <color=yellow>Th¸i H­ HuyÔn ®¸i (th©n ph¸p)<color> chø?",
		[31] = "B¹n muèn ®æi <color=yellow>Th¸i H­ HuyÔn hoµn (g©n cèt)<color> chø?",
		[32] = "B¹n muèn ®æi <color=yellow>Th¸i H­ HuyÔn béi (néi c«ng)<color> chø?",
		[33] = "B¹n muèn ®æi <color=yellow>Th¸i H­ HuyÔn giíi (Linh ho¹t)<color> chø?",
		[34] = "B¹n muèn ®æi <color=yellow>Th¸i H­ HuyÔn ®¹i (®éc)<color> chø?",
		[35] = "B¹n muèn ®æi <color=yellow>Th¸i H­ HuyÔn th¹ch (s¸t th­¬ng)<color> chø?",
	}
	Say("<color=green>ThÇn Du Ch©n Nh©n<color>:"..tName[nIndex], 2, "§óng/#GiveTaixuRing_yes("..nIndex..")", "§Ó ta suy nghÜ l¹i/UseAllGetAward")
end

function GiveTaixuRing_yes(nIndex)
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, h·y s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	
	local nMax = 1
	local nChance = gf_GetTaskByte(TSK_THAIHU_DOITHUONG, 1)
	
	if nChance >= nMax then
		Talk(1,"", "Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn trang søc Th¸i H­, ngµy mai h·y quay l¹i!")
		return 0
	end

	local nCount = 1
	for index, value in tPai do
		if GetItemCount(2, 1, index) > 0 then
			nCount = nCount + 1
		end
	end
	if nCount <= MAX_ITEM_COUNT then
		Talk(1,"", "Ng­¬i kh«ng ®ñ mét bé Th¸i H­ B¸t Qu¸i bµi, kh«ng thÓ ®æi trang søc Th¸i H­.")
		return 0
	end

	for index, value in tPai do
		DelItem(2, 1, index, 1)
	end	
	
	nChance = nChance + 1
	gf_SetTaskByte(TSK_THAIHU_DOITHUONG, 1, nChance)
	
	local nRet = 0
	nRet = AddItem(0, 102, nIndex, 1, 1, -1, -1, -1, -1, -1, -1)
	if nRet == 0 then
		WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."NhËn trang søc Th¸i H­ thÊt b¹i, thêi gian : "..date("%H%M"))
	else
		local tName =
		{
			[29] = "Th¸i H­ HuyÔn Ngäc",
			[30] = "Th¸i H­ HuyÔn §¸i ",
			[31] = "Th¸i H­ HuyÔn Hoµn",
			[32] = "Th¸i H­ HuyÔn Béi",
			[33] = "Th¸i H­ HuyÔn Giíi",
			[34] = "Th¸i H­ HuyÔn §¹i",
			[35] = "Th¸i H­ HuyÔn Th¹ch",
		}
		gf_WriteLogEx("DOI THUONG THAI HU HUYEN CANH", "nhËn", 1, tName[nIndex])
--		WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."§· ®æi 1"..tName[nIndex]..", thêi gian : "..date("%H%M"))
	end
end


function UseAllGetAward_new()
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, h·y s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local nMax = 1
	local nChance = gf_GetTaskByte(TSK_THAIHU_DOITHUONG, 2)
	
	if nChance >= nMax then
		Talk(1,"", "Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn phÇn th­ëng Th¸i H­, ngµy mai h·y quay l¹i!")
		return 0
	end

	local nCount = 1
	for index, value in tPai do
		if GetItemCount(2, 1, index) > 0 then
			nCount = nCount + 1
		end
	end
	if nCount <= MAX_ITEM_COUNT then
		Talk(1,"", "Ng­¬i kh«ng ®ñ mét bé Th¸i H­ B¸t Qu¸i bµi, kh«ng thÓ ®æi trang søc Th¸i H­.")
		return 0
	end

	nChance = nChance + 1

	local tbAward = {
		item = {{gdp={2,1,30341,2}, name="Tµng R­¬ng"}},
		--nExp = 10000000,
		nQuancong = 200,
		nChankhi = 200,
		nSumon = 20,
		nDanhvong = 20,
	}
	LIB_Award.szLogTitle = "DOI THUONG THAI HU HUYEN CANH"
	LIB_Award.szLogAction = "nhËn"
	if LIB_Award:Award(tbAward) == 1 then
		ModifyExp(10000000)
		gf_SetTaskByte(TSK_THAIHU_DOITHUONG, 2, nChance)	
		for index, value in tPai do
			DelItem(2, 1, index, 1)
		end
	end
end


-- ¼ÇÂ¼ÁìÈ¡Ã¿ÌìÁìÈ¡´ÎÊýÈÎÎñ±äÁ¿µÄÓÃ·¨£¬ÕâÀïËùËµµÄÎ»±íÊ¾Ê®½øÖÆµÄÎ»
-- ºó3Î»±íÊ¾ÁìÈ¡Ê±¿ÌÎª¸ÃÄêµÄµÚ¼¸Ìì£¬½ô½Ó×ÅÇ°ËÄÎ»±íÊ¾Äê£¬ÔÙÍùÇ°µÄÎ»±íÊ¾ÁìÈ¡´ÎÊý
function GiveExp(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1786)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn 30 v¹n kinh nghiÖm, ngµy mai h·y quay l¹i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 469, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1786, nValue)
		ModifyExp(nExp)
		WriteLog("**Th¸i H­ HuyÔn C¶nh"..GetName().."§· nhËn "..nExp.." ®iÓm kinh nghiÖm, thêi gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveExp2(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1788)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn 500 v¹n kinh nghiÖm, ngµy mai h·y quay l¹i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 476, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1788, nValue)
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
		WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."§· nhËn "..nExp.." ®iÓm kinh nghiÖm, thêi gian :  : "..date("%H%M"))
	end
end

function GiveExp3(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1791)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.."nhËn 500000 ®iÓm kinh nghiÖm råi, ngµy mai l¹i ®Õn nhÐ!", 0)
		return
	end
	local nRet = DelItem(2, 1, 473, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1791, nValue)
		ModifyExp(nExp)
		WriteLog("**Th¸i H­ HuyÔn C¶nh"..GetName().."§· nhËn "..nExp.." ®iÓm kinh nghiÖm, thêi gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveReputation(nReputation, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1787)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.."danh väng, ngµy mai h·y quay l¹i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 470, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1787, nValue)
		ModifyReputation(nReputation, 0)
		Talk(1,"", "B¹n nhËn ®­îc "..nReputation.." ®iÓm danh väng")
		WriteLog("**Th¸i H­ HuyÔn C¶nh"..GetName().."§· nhËn "..nReputation.." ®iÓm danh väng, thêi gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveYuntie(nCount, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1789)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))

	if gf_Judge_Room_Weight(5, 100) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, h·y s¾p xÕp l¹i hµnh trang.")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn Thiªn th¹ch, ngµy mai h·y quay l¹i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 471, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1789, nValue)
		
		AddItem(2, 2, 8, nCount, 1)
		WriteLog("**Th¸i H­ HuyÔn C¶nh"..GetName().."§· nhËn "..nCount.." Thiªn th¹ch, thêi gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveWeaponMaterial(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1790)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	if gf_Judge_Room_Weight(7, 100) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, h·y s¾p xÕp l¹i hµnh trang.")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn nguyªn liÖu cÊp 76, ngµy mai h·y quay l¹i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 472, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1790, nValue)
	
		local nCount = 0
		for i = 66, 69 do
			nCount = mod(random(25677), 4) + 1
			AddItem(2, 2, i, nCount, 1)
		end
		GetAwardPai()
	end
end

function GiveHorse(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1792)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	if gf_Judge_Room_Weight(2, 100) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, h·y s¾p xÕp l¹i hµnh trang.")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn ngùa cÊp 70, ngµy mai h·y quay l¹i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 474, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1792, nValue)
		
		local nArea = random(1, 100)
		local nRet = 0
		if nArea <= 40 then
			nRet = AddItem(0, 105, 9, 1, 1, -1, -1, -1, -1, -1, -1)
		elseif nArea <= 80 then
			nRet = AddItem(0, 105, 11, 1, 1, -1, -1, -1, -1, -1, -1)
		else
			nRet = AddItem(0, 105, 12, 1, 1, -1, -1, -1, -1, -1, -1)
		end
		if nRet == 0 then
			WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."§æi ngùa cÊp 60 thÊt b¹i, thêi gian : "..date("%H%M"))
		else
			WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."§æi ngùa cÊp 60 thµnh c«ng, thêi gian : "..date("%H%M"))
		end
		GetAwardPai()
	end
end

function GiveOtherPai(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1793)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin lçi! H«m nay ng­¬i ®· ®æi"..nChance.." lÇn Th¸i H­ B¸t Qu¸i bµi, ngµy mai h·y quay l¹i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 475, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1793, nValue)
		
		local nArea = random(1, 100)
		local nRet = 0
		if nArea <= 20 then
			nRet = AddItem(2, 1, 469, 1, 1)
		elseif nArea <= 40 then
			nRet = AddItem(2, 1, 470, 1, 1)
		elseif nArea <= 55 then
			nRet = AddItem(2, 1, 471, 1, 1)
		elseif nArea <= 70 then
			nRet = AddItem(2, 1, 472, 1, 1)
		elseif nArea <= 85 then
			nRet = AddItem(2, 1, 473, 1, 1)
		elseif nArea <= 90 then
			nRet = AddItem(2, 1, 474, 1, 1)
		elseif nArea <= 95 then
			nRet = AddItem(2, 1, 475, 1, 1)
		else
			nRet = AddItem(2, 1, 476, 1, 1)
		end
		if nRet == 0 then
			WriteLog("**Th¸i H­ HuyÔn C¶nh "..GetName().."§æi Th¸i H­ B¸t Qu¸i thÊt b¹i, thêi gian : "..date("%H%M"))
		else
			WriteLog("**Th¸i H­ HuyÔn C¶nh"..GetName().."§æi Th¸i H­ B¸t Qu¸i thµnh c«ng, thêi gian : "..date("%H%M"))
		end
		GetAwardPai()
	end
end


function end_say()
end
