Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");

szNpcName = "<color=green>H‰c trﬂ thÓ rÃn L≠u: <color>"
tbDieuDuong = {
	[0] = {
		[100] = {
			[3128] = 1,[3129] = 1,[3130] = 1,[3131] = 1,[3132] = 1,[3133] = 1,[3134] = 1,[3135] = 1,[3136] = 1,[3137] = 1,[3138] = 1,[3139] = 1,[3140] = 1,[3141] = 1,[3142] = 1,[3143] = 1,[3144] = 1,[3145] = 1,[3146] = 1,[3147] = 1,
			[3148] = 1,[3149] = 1,[3150] = 1,[3151] = 1,[3152] = 1,[3153] = 1,[3154] = 1,[3155] = 1,[3156] = 1,[3157] = 1,[3158] = 1,[3159] = 1,[3160] = 1,[3161] = 1,[3162] = 1,[3163] = 1,[3164] = 1,[3165] = 1,[3166] = 1,[3167] = 1,
			[3168] = 1,[3169] = 1,[3170] = 1,[3171] = 1,[3172] = 1,[3173] = 1,[3174] = 1,[3175] = 1,[3176] = 1,[3177] = 1,[3178] = 1,[3179] = 1,[3180] = 1,[3181] = 1,[3182] = 1,[3183] = 1,[3184] = 1,[3185] = 1,[3186] = 1,[3187] = 1,
			[3188] = 1,[3189] = 1,[3190] = 1,[3191] = 1,
		},
		[101] = {
			[3128] = 1,[3129] = 1,[3130] = 1,[3131] = 1,[3132] = 1,[3133] = 1,[3134] = 1,[3135] = 1,[3136] = 1,[3137] = 1,[3138] = 1,[3139] = 1,[3140] = 1,[3141] = 1,[3142] = 1,[3143] = 1,[3144] = 1,[3145] = 1,[3146] = 1,[3147] = 1,
			[3148] = 1,[3149] = 1,[3150] = 1,[3151] = 1,[3152] = 1,[3153] = 1,[3154] = 1,[3155] = 1,[3156] = 1,[3157] = 1,[3158] = 1,[3159] = 1,[3160] = 1,[3161] = 1,[3162] = 1,[3163] = 1,[3164] = 1,[3165] = 1,[3166] = 1,[3167] = 1,
			[3168] = 1,[3169] = 1,[3170] = 1,[3171] = 1,[3172] = 1,[3173] = 1,[3174] = 1,[3175] = 1,[3176] = 1,[3177] = 1,[3178] = 1,[3179] = 1,[3180] = 1,[3181] = 1,[3182] = 1,[3183] = 1,[3184] = 1,[3185] = 1,[3186] = 1,[3187] = 1,
			[3188] = 1,[3189] = 1,[3190] = 1,[3191] = 1,
		},
		[103] = {
			[3128] = 1,[3129] = 1,[3130] = 1,[3131] = 1,[3132] = 1,[3133] = 1,[3134] = 1,[3135] = 1,[3136] = 1,[3137] = 1,[3138] = 1,[3139] = 1,[3140] = 1,[3141] = 1,[3142] = 1,[3143] = 1,[3144] = 1,[3145] = 1,[3146] = 1,[3147] = 1,
			[3148] = 1,[3149] = 1,[3150] = 1,[3151] = 1,[3152] = 1,[3153] = 1,[3154] = 1,[3155] = 1,[3156] = 1,[3157] = 1,[3158] = 1,[3159] = 1,[3160] = 1,[3161] = 1,[3162] = 1,[3163] = 1,[3164] = 1,[3165] = 1,[3166] = 1,[3167] = 1,
			[3168] = 1,[3169] = 1,[3170] = 1,[3171] = 1,[3172] = 1,[3173] = 1,[3174] = 1,[3175] = 1,[3176] = 1,[3177] = 1,[3178] = 1,[3179] = 1,[3180] = 1,[3181] = 1,[3182] = 1,[3183] = 1,[3184] = 1,[3185] = 1,[3186] = 1,[3187] = 1,
			[3188] = 1,[3189] = 1,[3190] = 1,[3191] = 1,
		},
		[0] = {[8993] = 1, [8998] = 1,},
		[1] = {[8995] = 1,},
		[2] = {[8996] = 1, [9000] = 1, [9006] = 1,},
		[3] = {[8992] = 1, [9007] = 1,},
		[4] = {[9003] = 1,},
		[5] = {[8999] = 1,},
		[6] = {[9002] = 1,},
		[7] = {[9004] = 1,},
		[8] = {[8994] = 1,},
		[9] = {[9001] = 1, [9008] = 1,},
		[10] = {[8997] = 1,},
		[11] = {[9005] = 1, [9009] = 1,},
		[12] = {[9011] = 1},
		[13] = {[9010] = 1,},
	},
}


function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbDieuDuong[genre] == nil then
		Talk(1,"",szNpcName .. "Ta chÿ nhÀn ÆÊi trang bﬁ/vÚ kh› Di÷u D≠¨ng.")
		return 0
	end
	if tbDieuDuong[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta chÿ nhÀn ÆÊi trang bﬁ/vÚ kh› Di÷u D≠¨ng.")
		return 0
	end
	if tbDieuDuong[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta chÿ nhÀn ÆÊi trang bﬁ/vÚ kh› Di÷u D≠¨ng.")
		return 0
	end
	if GetEquipAttr(idx,2) < 13 then
		Talk(1,"",szNpcName .. "Trang bﬁ ph∂i Æ≠Óc c≠Íng h„a 13 trÎ l™n.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang ho∆c s¯c l˘c kh´ng ÆÒ, ng≠¨i h∑y sæp x’p lπi nh–!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nItemIndex, nG, nD, nP = tbUpgradeList[1][1], tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbDieuDuong[nG][nD][nP] == nil then
		return 0
	end
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,95,204,1}, name="Thi™n Cang L÷nh"}, {gdp={2,1,30370,1}, name="Thi™n M´n Kim L÷nh"}, {gdp={2,1,1005,5}, name="Chi’n Th«n Hoµn"}, {gdp={2,1,30499,50}, name="Hu©n Ch≠¨ng Anh HÔng"}}},
		[2] = {item={{gdp={2,95,204,1}, name="Thi™n Cang L÷nh"}, {gdp={2,1,30370,1}, name="Thi™n M´n Kim L÷nh"}, {gdp={2,1,1005,7}, name="Chi’n Th«n Hoµn"}, {gdp={2,1,30499,50}, name="Hu©n Ch≠¨ng Anh HÔng"}}},
	}
	local nNguyenlieu = 1
	if nD ~= 100 and nD ~= 101 and nD ~= 103 then
		nNguyenlieu = 2
	end
--	local nIndex = tbThuongUngTuongQuan[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nNguyenlieu])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	if GetEquipAttr(nItemIndex,2) >= 14 then
		nLevel = 7
	end
	local nBody = GetBody()
	local nRoute = GetPlayerRoute()
	local tbNewItem = {}
	if nD == 100 or nD == 101 or nD == 103 then
		if tbTrangBiChienCuong[nD] == nil or tbTrangBiChienCuong[nD][nBody] == nil or tbTrangBiChienCuong[nD][nBody][nRoute] == nil then
			return 0
		end
		tbNewItem = tbTrangBiChienCuong[nD][nBody][nRoute]
	else
		if tbVuKhiChienCuong[nBody] == nil or tbVuKhiChienCuong[nBody][nRoute] == nil then
			return 0
		end
		tbNewItem = tbVuKhiChienCuong[nBody][nRoute]
	end
	LIB_Award.szLogTitle = "NANG CAP DIEU DUONG  - CHIEN CUONG"
	LIB_Award.szLogAction = "thµnh c´ng"
	tbNewItem["item"][1]["gdp"][13] = nLevel
	LIB_Award:PayMaterial(tbMaterial[nNguyenlieu])
	DelItemByIndex(nItemIndex,-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N©ng c p thµnh c´ng, h∑y nhÀn l y trang bﬁ Chi’n CuÂng cÒa ng≠¨i.")
	return 1
end
