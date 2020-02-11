--3/8ÐÅÎï
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\lib\\talktmp.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(115) ~= 1 then
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông")
		return
	end
	local tempSay = {};
	tempSay.msg = format("Sö dông <color=green>%s<color> ®æi phÇn th­ëng, hiÖn t¹i cã <color=green>%d<color> c¸i", "8/3 tÝn vËt", GetItemCount(2, 1, 30636))
	tempSay.sel = {
		{"500000 ®iÓm kinh nghiÖm"..format("(tiªu hao %d )", 1), "#do_exchange_letter(1)"},
		{"1000000000 ®iÓm kinh nghiÖm"..format("(tiªu hao %d )", 999), "#do_exchange_letter(2)"},
		{"N«ng thÇn ®¬n *1"..format("(tiªu hao %d )", 10), "#do_exchange_letter(3)"},
		{"Tiªu kiÕp t¸n *1"..format("(tiªu hao %d )", 9), "#do_exchange_letter(4)"},
		{"MËt tÞch s­ m«n cao cÊp cÊp 70*7"..format("(tiªu hao %d )", 100), "#do_exchange_letter(5)"},
		{"qu©n c«ng ch­¬ng*1"..format("(tiªu hao %d )", 29), "#do_exchange_letter(6)"},
		{"vÐ tiÓu y vµng*1"..format("(tiªu hao %d )", 2000), "#do_exchange_letter(7)"},
		{"vÐ tiÓu y b¹c*1"..format("(tiªu hao %d )", 250), "#do_exchange_letter(8)"},
		{"vÐ tiÓu y ®ång*1"..format("(tiªu hao %d )", 30), "#do_exchange_letter(9)"},
		{"®¹i qu©n c«ng ch­¬ng*1"..format("(tiªu hao %d )", 150), "#do_exchange_letter(10)"},
		{"qu©n c«ng ch­¬ng huy hoµng*1"..format("(tiªu hao %d )", 750), "#do_exchange_letter(11)"},
		{"ma tinh*100"..format("(tiªu hao %d )", 300), "#do_exchange_letter(12)"},
		{"thiªn th¹ch linh thach*1"..format("(tiªu hao %d )", 5900), "#do_exchange_letter(13)"},
		{"®Þnh hån thiªn th¹ch thÇn th¹ch*1"..format("(tiªu hao %d )", 5900), "#do_exchange_letter(14)"},
		{"®¹i ®Þnh hån thiªn th¹ch thÇn th¹ch*1"..format("(tiªu hao %d )", 5900), "#do_exchange_letter(15)"},
		{"tÆng vò khÝ diÖu d­¬ng theo m«n ph¸i*1"..format("(tiªu hao %d )", 6996), "#do_exchange_letter(16)"},
		{"chuyÓn sinh ®¬n*1"..format("(tiªu hao %d )", 3900), "#do_exchange_letter(17)"},
		{"s¸ch pet tÝnh n¨ng cÊp 2 ngÉu nhiªn*1"..format("(tiªu hao %d )", 200), "#do_exchange_letter(18)"},
		{"s¸ch pet tÝnh n¨ng cÊp 3 ngÉu nhiªn*1"..format("(tiªu hao %d )", 300), "#do_exchange_letter(19)"},
		{"s¸ch pet tÝnh n¨ng cÊp 4 ngÉu nhiªn*1"..format("(tiªu hao %d )", 800), "#do_exchange_letter(20)"},
		{"\nKÕt thóc ®èi tho¹i", "nothing"}
	}
	temp_Talk(tempSay);
end

function do_exchange_letter(nIndex)
	local tAward = {
		[1] = {2, 1, 500000, 1},
		[2] = {2, 999, 1000000000, 1},
		[3] = {1, 10, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
		[4] = {1, 9, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
		[5] = {31, 100, "ahf_Get70GaojiMiji(1, 7, 1)", 1},
		[6] = {1, 29, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
		[7] = {1, 2000, "VÐ TiÕu Y Vµng", {2, 1, 30491, 1}, 7 * 24 * 3600},
		[8] = {1, 250, "VÐ TiÕu Y B¹c", {2, 1, 30492, 1}, 7 * 24 * 3600},
		[9] = {1, 30, "VÐ TiÕu Y §ång", {2, 1, 30493, 1}, 7 * 24 * 3600},
		[10] = {1, 150, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		[11] = {1, 750, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		[12] = {1, 300, "Ma Tinh", {2, 1, 30497, 100}, 0},
		[13] = {1, 5900, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 15 * 24 * 3600},
		[14] = {1, 5900, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 15 * 24 * 3600},
		[15] = {1, 5900, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 15 * 24 * 3600},
		[16] = {31, 6996, "ahf_GetYaoYangWeaponRand(1)", 1},
		[17] = {1, 3900, "ChuyÓn Sinh §¬n ", {2, 1, 30345, 1}, 60 * 24 * 3600},
		[18] = {31, 200, "ahf_GetPetBook(2)", 1},
		[19] = {31, 300, "ahf_GetPetBook(3)", 1},
		[20] = {31, 800, "ahf_GetPetBook(4)", 1},
	}
	if not nIndex or nIndex < 1 or nIndex > getn(tAward) then
		return
	end 
	if gf_Judge_Room_Weight(7, 200, "") ~= 1 then
		return
	end
	if GetItemCount(2, 1, 30636) < tAward[nIndex][2] then
		Talk(1,"",format("trong tói %s sè l­îng kh«ng ®ñ %d", "8/3 tÝn vËt", tAward[nIndex][2]))
		return
	end
	if DelItem(2, 1, 30636, tAward[nIndex][2]) ~= 1 then
		return
	end
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "2XU vËt phÈm", "sö dông tÝn vËt 8/3", nIndex)
end