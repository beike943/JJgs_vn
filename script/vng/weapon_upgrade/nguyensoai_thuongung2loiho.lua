Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Häc trß thî rÌn L­u: <color>"
tbLoiHoNguyenSoai = {
	[0] = {
		[100] = {
			[30037] = {1,30219},	-- {Material, nP}
			[30038] = {1,30220},
			[30039] = {1,30221},
			[30040] = {1,30222},
			[30049] = {1,30231},
			[30050] = {1,30232},
			[30051] = {1,30233},
			[30052] = {1,30234},
		},
		[101] = {
			[30037] = {1,30219},
			[30038] = {1,30220},
			[30039] = {1,30221},
			[30040] = {1,30222},
			[30049] = {1,30231},
			[30050] = {1,30232},
			[30051] = {1,30233},
			[30052] = {1,30234},
		},
		[103] = {
			[30037] = {1,30219},
			[30038] = {1,30220},
			[30039] = {1,30221},
			[30040] = {1,30222},
			[30049] = {1,30231},
			[30050] = {1,30232},
			[30051] = {1,30233},
			[30052] = {1,30234},
		},
		[102] = {
			[30064] = {1,30169},
			[30065] = {1,30170},
			[30066] = {1,30171},
			[30067] = {1,30172},
			[30068] = {1,30173},
			[30069] = {1,30174},
			[30070] = {1,30175},
			[30071] = {1,30176},
			[30072] = {1,30177},            
			[30073] = {1,30178},
			[30074] = {1,30179},
			[30075] = {1,30180},
			[30076] = {1,30181},
			[30077] = {1,30182},
			[30078] = {1,30183},
			[30079] = {1,30184},
			------------ Lieu
			[30100] = {1,30205},
			[30101] = {1,30206},
			[30102] = {1,30207},
			[30103] = {1,30208},
			[30104] = {1,30209},
			[30105] = {1,30210},
			[30106] = {1,30211},
			[30107] = {1,30212},
			[30108] = {1,30213},
			[30109] = {1,30214},
			[30110] = {1,30215},
			[30111] = {1,30216},
			[30112] = {1,30217},
			[30113] = {1,30218},
			[30114] = {1,30219},
			[30115] = {1,30220},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	if tbLoiHoNguyenSoai[genre] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Th­¬ng ¦ng Nguyªn So¸i.")
		return 0
	end
	if tbLoiHoNguyenSoai[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Th­¬ng ¦ng Nguyªn So¸i.")
		return 0
	end
	if tbLoiHoNguyenSoai[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Th­¬ng ¦ng Nguyªn So¸i.")
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
		[1] = {item={{gdp={2,1,30499,120}}, {gdp={2,1,1006,12}}}, task={{707, 120000, "TÝch lòy chiÕn tr­êng"}}},
	}
	local nIndex = tbLoiHoNguyenSoai[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	local szItemName = GetItemName(nG,nD,tbLoiHoNguyenSoai[nG][nD][nP][2])
	LIB_Award.szLogTitle = "NANG CAP THUONG UNG NGUYEN SOAI - LOI HO NGUYEN SOAI"
	LIB_Award.szLogAction = "thµnh c«ng"
	local tbNewItem = {item={{gdp={nG, nD, tbLoiHoNguyenSoai[nG][nD][nP][2], 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy <color=yellow>" .. szItemName .. "<color> cña ng­¬i.")
	return 1
end
