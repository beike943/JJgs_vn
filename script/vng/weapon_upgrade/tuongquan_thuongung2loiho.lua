Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Häc trß thî rÌn L­u: <color>"

tbLoiHoTuongQuan = {
	[0] = {
		[100] = {
			[30033] = {1,30215},	-- {Material, nP}
			[30034] = {1,30216},
			[30035] = {1,30217},
			[30036] = {1,30218},
			[30045] = {1,30227},
			[30046] = {1,30228},
			[30047] = {1,30229},
			[30048] = {1,30230},
		},
		[101] = {
			[30033] = {1,30215},
			[30034] = {1,30216},
			[30035] = {1,30217},
			[30036] = {1,30218},
			[30045] = {1,30227},
			[30046] = {1,30228},
			[30047] = {1,30229},
			[30048] = {1,30230},
		},
		[103] = {
			[30033] = {1,30215},
			[30034] = {1,30216},
			[30035] = {1,30217},
			[30036] = {1,30218},
			[30045] = {1,30227},
			[30046] = {1,30228},
			[30047] = {1,30229},
			[30048] = {1,30230},
		},
		[102] = {
			[30052] = {2,30157},
			[30053] = {2,30158},
			[30054] = {2,30159},
			[30055] = {2,30160},
			[30056] = {2,30161},
			[30057] = {2,30162},
			[30058] = {2,30163},
			[30059] = {2,30164},
			[30060] = {2,30165},
			[30061] = {2,30166},
			[30062] = {2,30167},
			[30063] = {2,30168},
			------------ Lieu
			[30088] = {2,30193},
			[30089] = {2,30194},
			[30090] = {2,30195},
			[30091] = {2,30196},
			[30092] = {2,30197},
			[30093] = {2,30198},
			[30094] = {2,30199},
			[30095] = {2,30200},
			[30096] = {2,30201},
			[30097] = {2,30202},
			[30098] = {2,30203},
			[30099] = {2,30204},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	if tbLoiHoTuongQuan[genre] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Th­¬ng ¦ng Nguyªn So¸i.")
		return 0
	end
	if tbLoiHoTuongQuan[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Th­¬ng ¦ng Nguyªn So¸i.")
		return 0
	end
	if tbLoiHoTuongQuan[genre][detail][particular] == nil then
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
	if tbLoiHoTuongQuan[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30499,77}}, {gdp={2,1,1006,8}}}, task={{707, 77000, "TÝch lòy chiÕn tr­êng"}}},
	}
	local nIndex = tbLoiHoTuongQuan[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	local szItemName = GetItemName(nG,nD,tbLoiHoTuongQuan[nG][nD][nP][2])
	LIB_Award.szLogTitle = "NANG CAP THUONG UNG TUONG QUAN - LOI HO TUONG QUAN"
	LIB_Award.szLogAction = "thµnh c«ng"
	local tbNewItem = {item={{gdp={nG, nD, tbLoiHoTuongQuan[nG][nD][nP][2], 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy <color=yellow>" .. szItemName .. "<color> cña ng­¬i.")
	return 1
end
