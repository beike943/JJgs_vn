Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");

szNpcName = "<color=green>Th­¬ng Nh©n B¶o R­¬ng: <color>"
tbNguLong = {
	[0] = {
		[100] = {
			[30017] = 1,
			[30018] = 1,
			[30019] = 1,
			[30020] = 1,
			[30021] = 1,
			[30022] = 1,
			[30023] = 1,
			[30024] = 1,
		},
		[101] = {
			[30017] = 1,
			[30018] = 1,
			[30019] = 1,
			[30020] = 1,
			[30021] = 1,
			[30022] = 1,
			[30023] = 1,
			[30024] = 1,
		},
		[103] = {
			[30017] = 1,
			[30018] = 1,
			[30019] = 1,
			[30020] = 1,
			[30021] = 1,
			[30022] = 1,
			[30023] = 1,
			[30024] = 1,
		},
	},
}


function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbNguLong[genre] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Ngù Long T­íng Qu©n.")
		return 0
	end
	if tbNguLong[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Ngù Long T­íng Qu©n.")
		return 0
	end
	if tbNguLong[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang bÞ Ngù Long T­íng Qu©n.")
		return 0
	end
	if GetEquipAttr(idx,2) < 11 then
		Talk(1,"",szNpcName .. "Trang bÞ ph¶i ®­îc c­êng hãa 11 trë lªn.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nItemIndex, nG, nD, nP = tbUpgradeList[1][1], tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbNguLong[nG][nD][nP] == nil then
		return 0
	end
	-------------------- Check material ----------------------------
	local tbMaterial = {
		item={{gdp={2,1,1005,4}, name="ChiÕn ThÇn Hoµn"}, {gdp={2,1,30498,100}, name="Huy Ch­¬ng Dòng SÜ"}},
	}
	
	local nCheck = LIB_Award:CheckMaterial(tbMaterial)
	if nCheck == 0 then
		return 0
	end
	
	local nBody = GetBody()
	local nRoute = GetPlayerRoute()
	if tbTrangBiChienCuong[nD] == nil or tbTrangBiChienCuong[nD][nBody] == nil or tbTrangBiChienCuong[nD][nBody][nRoute] == nil then
		return 0
	end

	LIB_Award.szLogTitle = "NANG CAP NGU LONG  - CHIEN CUONG"
	LIB_Award.szLogAction = "thµnh c«ng"
	LIB_Award:PayMaterial(tbMaterial)
	DelItemByIndex(nItemIndex,-1)
	LIB_Award:Award(tbTrangBiChienCuong[nD][nBody][nRoute])
	Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy trang bÞ ChiÕn Cuång cña ng­¬i.")
	return 1
end
