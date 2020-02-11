Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Häc trß thî rÌn L­u: <color>"

tbLoiHoNguyenSoai = { --Change dainguyensoi to loihonguyensoi
	[0] = {
		[100] = {
			[3024] = {1,30219},	-- {Material, nP}
			[3025] = {1,30220},
			[3026] = {1,30221},
			[3027] = {1,30222},
			[3028] = {1,30231},
			[3029] = {1,30232},
			[3030] = {1,30233},
			[3031] = {1,30234},
		},
		[101] = {
			[3024] = {1,30219},
			[3025] = {1,30220},
			[3026] = {1,30221},
			[3027] = {1,30222},
			[3028] = {1,30231},
			[3029] = {1,30232},
			[3030] = {1,30233},
			[3031] = {1,30234},
		},
		[103] = {
			[3024] = {1,30219},
			[3025] = {1,30220},
			[3026] = {1,30221},
			[3027] = {1,30222},
			[3028] = {1,30231},
			[3029] = {1,30232},
			[3030] = {1,30233},
			[3031] = {1,30234},
		},
		[102] = {
			[3056] = {1,30169},
			[3057] = {1,30170},
			[3058] = {1,30171},
			[3059] = {1,30172},
			[3060] = {1,30173},
			[3061] = {1,30174},
			[3062] = {1,30175},
			[3063] = {1,30176},
			[3064] = {1,30177},            
			[3065] = {1,30178},
			[3066] = {1,30179},
			[3067] = {1,30180},
			[3068] = {1,30181},
			[3069] = {1,30182},
			[3070] = {1,30183},
			[3071] = {1,30184},
			------------ Lieu
			[3072] = {1,30205},
			[3073] = {1,30206},
			[3074] = {1,30207},
			[3075] = {1,30208},
			[3076] = {1,30209},
			[3077] = {1,30210},
			[3078] = {1,30211},
			[3079] = {1,30212},
			[3080] = {1,30213},
			[3081] = {1,30214},
			[3082] = {1,30215},
			[3083] = {1,30216},
			[3084] = {1,30217},
			[3085] = {1,30218},
			[3086] = {1,30219},
			[3087] = {1,30220},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	if tbLoiHoNguyenSoai[genre] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ §¹i Tèng-Liªu Nguyªn So¸i.")
		return 0
	end
	if tbLoiHoNguyenSoai[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ §¹i Tèng-Liªu Nguyªn So¸i.")
		return 0
	end
	if tbLoiHoNguyenSoai[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ §¹i Tèng-Liªu Nguyªn So¸i.")
		return 0
	end
	
	if detail ~= 102 then
		if GetEquipAttr(idx,2) < 13 then
			Talk(1,"",szNpcName .. "Trang bÞ ph¶i ®­îc c­êng hãa 13 trë lªn.")
			return 0
		end
	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbLoiHoNguyenSoai[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30499,200}}, {gdp={2,1,1006,16}}}, task={{707, 120000, "TÝch lòy chiÕn tr­êng"}}},
	}
	local nIndex = tbLoiHoNguyenSoai[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	local szItemName = GetItemName(nG,nD,tbLoiHoNguyenSoai[nG][nD][nP][2])
	LIB_Award.szLogTitle = "NANG CAP DAI NGUYEN SOAI - LOI HO NGUYEN SOAI"
	LIB_Award.szLogAction = "thµnh c«ng"
	local tbNewItem = {item={{gdp={nG, nD, tbLoiHoNguyenSoai[nG][nD][nP][2], 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy <color=yellow>" .. szItemName .. "<color> cña ng­¬i.")
	return 1
end
