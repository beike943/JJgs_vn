Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Häc trß thî rÌn L­u: <color>"
tbNguyenSoai = {
	[0] = {
		[100] = {
			[3024] = {1,30037},	-- {Material, nP}
			[3025] = {1,30038},
			[3026] = {1,30039},
			[3027] = {1,30040},
			[3028] = {1,30049},
			[3029] = {1,30050},
			[3030] = {1,30051},
			[3031] = {1,30052},
		},
		[101] = {
			[3024] = {1,30037},
			[3025] = {1,30038},
			[3026] = {1,30039},
			[3027] = {1,30040},
			[3028] = {1,30049},
			[3029] = {1,30050},
			[3030] = {1,30051},
			[3031] = {1,30052},
		},
		[103] = {
			[3024] = {1,30037},
			[3025] = {1,30038},
			[3026] = {1,30039},
			[3027] = {1,30040},
			[3028] = {1,30049},
			[3029] = {1,30050},
			[3030] = {1,30051},
			[3031] = {1,30052},
		},
		[102] = {
			[3056] = {2,30064},
			[3060] = {2,30068},
			[3064] = {2,30072},            
			[3068] = {2,30076},
			[3057] = {2,30065},
			[3061] = {2,30069},
			[3065] = {2,30073},
			[3069] = {2,30077},
			[3058] = {2,30066},
			[3062] = {2,30070},
			[3066] = {2,30074},
			[3070] = {2,30078},
			[3059] = {2,30067},
			[3063] = {2,30071},
			[3067] = {2,30075},
			[3071] = {2,30079},
			------------ Lieu
			[3072] = {2,30100},
			[3076] = {2,30112},
			[3080] = {2,30104},
			[3084] = {2,30108},
			[3073] = {2,30101},
			[3077] = {2,30113},
			[3081] = {2,30105},
			[3085] = {2,30109},
			[3074] = {2,30102},
			[3078] = {2,30114},
			[3082] = {2,30106},
			[3086] = {2,30110},
			[3075] = {2,30103},
			[3079] = {2,30115},
			[3083] = {2,30107},
			[3087] = {2,30111},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	if tbNguyenSoai[genre] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Tèng/Liªu §¹i Nguyªn So¸i.")
		return 0
	end
	if tbNguyenSoai[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Tèng/Liªu §¹i Nguyªn So¸i.")
		return 0
	end
	if tbNguyenSoai[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Tèng/Liªu §¹i Nguyªn So¸i.")
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
	if tbNguyenSoai[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,504,9}, name="N÷ Oa Tinh Th¹ch"}, {gdp={2,95,204,19}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,29}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,30230,3900}, name="Xu VËt PhÈm"}}},
		[2] = {item={{gdp={2,1,504,9}, name="N÷ Oa Tinh Th¹ch"}, {gdp={2,95,204,21}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,29}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,30230,7900}, name="Xu VËt PhÈm"}}},
	}
	local nIndex = tbNguyenSoai[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	local szItemName = GetItemName(nG,nD,tbNguyenSoai[nG][nD][nP][2])
	LIB_Award.szLogTitle = "NANG CAP DAI NGUYEN SOAI - THUONG UNG NGUYEN SOAI 100"
	LIB_Award.szLogAction = "thµnh c«ng"
	local tbNewItem = {item={{gdp={nG, nD, tbNguyenSoai[nG][nD][nP][2], 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}, name = szItemName}}}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy <color=yellow>" .. szItemName .. "<color> cña ng­¬i.")
	return 1
end
