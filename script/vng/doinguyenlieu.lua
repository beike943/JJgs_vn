Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");
tbNoel69 = {
	[1] = {[1] = {nExp = 50000000}, nRate = 45},
	[2] = {[1] = {nExp = 60000000}, nRate = 15},
	[3] = {[1] = {nExp = 70000000}, nRate = 10},
	[4] = {[1] = {nExp = 80000000}, nRate = 10},
	[5] = {[1] = {nExp = 90000000}, nRate = 10},
	[6] = {[1] = {nExp = 100000000}, nRate = 5},
	[7] = {[1] = {nExp = 200000000}, nRate = 4.46},
	[8] = {[1] = {fn="TrangBiDieuDuong_NgauNhien()"}, nRate = 0.1},
	[9] = {[1] = {item={{gdp={2,1,30470,1}, nExpired = 7*24*3600}}}, nRate = 0.1},
	[10] = {[1] = {item={{gdp={2,1,30497 ,300}}}}, nRate = 0.1},
	[11] = {[1] = {item={{gdp={2,95,204,1}}}}, nRate = 0.1},
	[12] = {[1] = {item={{gdp={2,1,30370,1}}}}, nRate = 0.1},
	[13] = {[1] = {item={{gdp={2,1,1068,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
	[14] = {[1] = {item={{gdp={2,1,1067,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
	[15] = {[1] = {item={{gdp={2,1,1113,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
	[16] = {[1] = {item={{gdp={2,1,504,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
}

tbNoel690 = {
	[1] = {[1] = {nExp = 300000000}, nRate = 24},
	[2] = {[1] = {nExp = 400000000}, nRate = 25},
	[3] = {[1] = {nExp = 500000000}, nRate = 25},
	[4] = {[1] = {fn="TrangBiDieuDuong_NgauNhien()"}, nRate = 25},
	[5] = {[1] = {item={{gdp={2,1,30345,1}, nExpired = 30*24*3600}}}, nRate = 1},
}

tbAward = {
	nCheckExp = 0,
	item = {{gdp={2,0,1082,8}, name ="Th¸i DÞch Hçn Nguyªn §å"}},
	nExp = 200000,
	nChankhi = 6,
	nPetExp = 3,
	nPetLinhluc = 1,
}
tbFinalAward = {
	nChankhi = 20000,
	nPetExp = 2000,
	nPetLinhluc = 500,
}

tbExpMaterial = {
	[1] = {{item={{gdp={2,95,204,1}, name="Thiªn Cang LÖnh"}}}, {nCheckExp = 0, nExp = 555000000}, "NhËn 555000000 Exp (tiªu hao 1 Thiªn Cang LÖnh)"},
	[2] = {{item={{gdp={2,1,30370,1}, name="Thiªn M«n Kim LÖnh"}}}, {nCheckExp = 0, nExp = 470000000}, "NhËn 470000000 Exp (tiªu hao 1 Thiªn M«n Kim LÖnh)"},
	[3] = {{item={{gdp={2,1,1009,1}, name="Thiªn Th¹ch Tinh Th¹ch"}}}, {nCheckExp = 0, nExp = 2900000}, "NhËn 2900000 Exp (tiªu hao 1 Thiªn Th¹ch Tinh Th¹ch)"},	
}


tbAward2a = {
	nCheckExp = 0,
	nExp = 3000000,
	item = {{gdp={2,1,30191,3}, name ="Ng«i sao may m¾n", nExpired = 15*24*3600}, {gdp={2,1,30154,30}, name ="N÷ Oa B¶o H¹p", nExpired = 15*24*3600}},
}

tbAward2b = {
	nCheckExp = 0,
	nExp = 6000000,
	item = {{gdp={2,1,30351,6}, name ="Båi Nguyªn §¬n", nExpired = 15*24*3600}, {gdp={2,1,30352,6}, name ="Tø Linh Quy Nguyªn §¬n", nExpired = 15*24*3600}, {gdp={2,1,30191,6}, name ="Ng«i sao may m¾n", nExpired = 15*24*3600}},
}

tbExpMaterial2 = {
	[1] = {{{2,1,1068,1}}, tbAward2a, "§æi 01 Thiªn th¹ch linh th¹ch lÊy nhu yÕu phÈm"},
	[2] = {{{2,1,1067,1}}, tbAward2b, "§æi 01 §Þnh hån thiªn th¹ch thÇn th¹ch ®Ó nhËn lÊy nhu yÕu phÈm"},
}

tbExpMaterialQuanDung = {
	[1] = {{{2,0,307,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "§æi 7.900.000: cÇn 240 Kho¸ng Th¹ch Qu©n Dông, 24 vµng, 5 xu vËt phÈm"},
	[2] = {{{2,0,308,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "§æi 7.900.000: cÇn 240 Gç Qu©n Dông, 24 vµng, 5 xu vËt phÈm"},
	[3] = {{{2,0,309,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "§æi 7.900.000: cÇn 240 Lóa M¹ch Qu©n Dông, 24 vµng, 5 xu vËt phÈm"},
	[4] = {{{2,0,310,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "§æi 7.900.000: cÇn 240 Thuéc Da Qu©n Dông, 24 vµng, 5 xu vËt phÈm"},
	[5] = {{{2,0,311,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "§æi 7.900.000: cÇn 240 T¬ T»m Qu©n Dông, 24 vµng, 5 xu vËt phÈm"},
	[6] = {{{2,0,312,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "§æi 7.900.000: cÇn 240 D­îc Th¶o Qu©n Dông, 24 vµng, 5 xu vËt phÈm"},
	[7] = {{{2,0,313,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "§æi 7.900.000: cÇn 240 Linh HuyÕt Qu©n Dông, 24 vµng, 5 xu vËt phÈm"},
}

tbAward60Event = {
	nCheckExp = 0,
	nExp = 30000000,
	nChankhi = 3000,
	nGold = 3000000,
	item = {{gdp={2,1,30230,30}, name = "xu vËt phÈm"}},
}
tbExpMaterialEventT5 = {
	[1] = {{{2,1,30517,60}}, tbAward60Event, "Nép 60 Sir« Ngò S¾c"},
	[2] = {{{2,1,30518,60}}, tbAward60Event, "Nép 60 Kem Que CÇu Vßng"},
}

tbRandomAward = {
	[1] = {[1] = {item={{gdp={2,1,30424,1}, name = "C­êng Hãa phï cÊp 12", nExpired = 7*24*3600}}},nRate = 1.00},
	[2] = {[1] = {item={{gdp={2,1,30425,1}, name = "C­êng Hãa phï cÊp 13", nExpired = 7*24*3600}}},nRate = 1.00},
	[3] = {[1] = {item={{gdp={2,1,30426,1}, name = "C­êng Hãa phï cÊp 14", nExpired = 7*24*3600}}},nRate = 1.00},
	[4] = {[1] = {item={{gdp={2,1,30427,1}, name = "C­êng Hãa phï cÊp 15", nExpired = 7*24*3600}}},nRate = 1.00},
	[5] = {[1] = {item={{gdp={2,1,30428,1}, name = "Ma ®ao th¹ch cÊp 1", nExpired = 7*24*3600}}}, nRate = 1.00},
	[6] = {[1] = {item={{gdp={2,1,30429,1}, name = "Ma ®ao th¹ch cÊp 2", nExpired = 7*24*3600}}}, nRate = 1.00},
	[7] = {[1] = {item={{gdp={2,1,30430,1}, name = "Ma ®ao th¹ch cÊp 3", nExpired = 7*24*3600}}}, nRate = 1.00},
	[8] = {[1] = {item={{gdp={2,1,3380,1}, name = "Tói Cöu ChuyÓn", nExpired = 7*24*3600}}}, nRate = 2.00},
	[9] = {[1] = {item={{gdp={2,1,536,1}, name = "Tö Kim Hång Bao (Trèng)", nExpired = 7*24*3600}}}, nRate = 6.00},
	[10] = {[1] = {item={{gdp={2,1,538,1}, name = "Hoµng Kim Hång Bao (Trèng)", nExpired = 7*24*3600}}}, nRate = 6.00},
	[11] = {[1] = {item={{gdp={2,1,30228,1}, name = "B¹ch Kim Hång Bao (Trèng)", nExpired = 7*24*3600}}}, nRate = 6.00},
	[12] = {[1] = {item={{gdp={2,1,30491,1}, name = "VÐ TiÕu Y (Vµng)", nExpired = 7*24*3600}}}, nRate = 2.00},
	[13] = {[1] = {item={{gdp={2,1,30492,1}, name = "VÐ TiÕu Y (B¹c)", nExpired = 7*24*3600}}}, nRate = 3.00},
	[14] = {[1] = {item={{gdp={2,1,30493,1}, name = "VÐ TiÕu Y (§ång)", nExpired = 7*24*3600}}}, nRate = 3.00},
	[15] = {[1] = {item={{gdp={2,1,30305,1}, name = "Linh Th¹ch bao cÊp 7", nExpired = 7*24*3600}}}, nRate = 12.00},
	[16] = {[1] = {item={{gdp={2,1,30458,1}, name = "Tô Linh Hoµn", nExpired = 7*24*3600}}}, nRate = 4.00},
	[17] = {[1] = {item={{gdp={2,1,30459,1}, name = "§¹i Tô Linh Hoµn", nExpired = 7*24*3600}}}, nRate = 3.00},
	[18] = {[1] = {item={{gdp={2,1,30460,1}, name = "Tô Linh Tiªn §¬n", nExpired = 7*24*3600}}}, nRate = 1.00},
	[19] = {[1] = {nExp = 500000}, nRate = 6.00},
	[20] = {[1] = {nExp = 1000000}, nRate = 15.00},
	[21] = {[1] = {nExp = 10000000}, nRate = 6.00},
	[22] = {[1] = {fn = "RandomBook()"}, nRate = 18.00},
}

function Trade_Material2Exp_Menu()
	local tbSay = {}
--	if GetTask(TSK_DOINGUYENLIEU) >= 500 and floor(GetTask(TSK_DOINGUYENLIEU)/1000) == 0 then
--		tinsert(tbSay, "NhËn th­ëng ®æi 500 lÇn/TradeMaterial_FilnalAward")
--	end
	for i=1, getn(tbExpMaterial) do
		tinsert(tbSay, tbExpMaterial[i][3].."/#TradeMaterial_Done("..i..")")
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("NÕu c¸c h¹ kiÕm cho ta nh÷ng nguyªn liÖu ta cÇn, ta sÏ sÏ cã hËu t¹ xøng ®¸ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done(nOption)
--	if GetTask(TSK_DOINGUYENLIEU) >= 500 then
--		Talk(1,"","C¸c h¹ ®· ®æi 500 lÇn, ta ch¼ng cßn ®ñ phÇn th­ëng cho c¸c h¹ n÷a.")
--		return 0
--	end
	if gf_JudgeRoomWeight(2,100) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbExpMaterial[nOption][1])
	if nCheck == 0 then
		return
	end
	if LIB_Award:PayMaterial(tbExpMaterial[nOption][1]) == 1 then
		LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 12"
		LIB_Award.szLogAction = "§æi thµnh c«ng"
		gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "§æi nguyªn liÖu dßng "..nOption)
		LIB_Award:Award(tbExpMaterial[nOption][2])
	end	
	Trade_Material2Exp_Menu()
end


function TradeMaterial_FilnalAward()
	if mod(GetTask(TSK_DOINGUYENLIEU),1000) < 500 then
		Talk(1,"","C¸c h¹ ch­a ®æi ®ñ 500 lÇn, sao ®· muèn nhËn th­ëng?")
		return 0
	end
	if floor(GetTask(TSK_DOINGUYENLIEU)/1000) > 0 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	SetTask(TSK_DOINGUYENLIEU, GetTask(TSK_DOINGUYENLIEU) + 1000)
	LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 5"
	LIB_Award.szLogAction = "thµnh c«ng"
	LIB_Award:Award(tbFinalAward)
	TradeMaterial_PetBonus(tbFinalAward)
	Talk(1,"","NhËn phÇn th­ëng ®æi nguyªn liÖu 500 lÇn thµnh c«ng.")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "PhÇn th­ëng cuèi")
end


function RandomBook()
	local tbBook = {
		[1] = {[1] = {item={{gdp={0,107,204,1}, name="Kim Cang B¸t Nh· Ch©n QuyÓn"}}}, nRate = 7.00},
		[2] = {[1] = {item={{gdp={0,107,205,1}, name="TiÒm Long Tóc DiÖt Ch©n QuyÓn"}}}, nRate = 8.00},
		[3] = {[1] = {item={{gdp={0,107,206,1}, name="V« TrÇn Bå §Ò Ch©n QuyÓn"}}}, nRate = 7.00},
		[4] = {[1] = {item={{gdp={0,107,207,1}, name="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}}, nRate = 7.00},
		[5] = {[1] = {item={{gdp={0,107,208,1}, name="Nh­ ý Kim §Ønh Ch©n QuyÓn"}}}, nRate = 7.00},
		[6] = {[1] = {item={{gdp={0,107,209,1}, name="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"}}}, nRate = 8.00},
		[7] = {[1] = {item={{gdp={0,107,210,1}, name="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"}}}, nRate = 7.00},
		[8] = {[1] = {item={{gdp={0,107,211,1}, name="Quú Thiªn Du Long Ch©n QuyÓn"}}}, nRate = 7.00},
		[9] = {[1] = {item={{gdp={0,107,212,1}, name="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"}}}, nRate = 7.00},
		[10] = {[1] = {item={{gdp={0,107,213,1}, name="Qu©n Tö §íi Phong Ch©n QuyÓn"}}}, nRate = 7.00},
		[11] = {[1] = {item={{gdp={0,107,214,1}, name="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"}}}, nRate = 7.00},
		[12] = {[1] = {item={{gdp={0,107,215,1}, name="Xuyªn V©n L¹c Hång Ch©n QuyÓn"}}}, nRate = 7.00},
		[13] = {[1] = {item={{gdp={0,107,216,1}, name="HuyÒn Minh Phong Ma Ch©n QuyÓn"}}}, nRate = 7.00},
		[14] = {[1] = {item={{gdp={0,107,217,1}, name="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"}}}, nRate = 7.00},
		[15] = {[1] = {item={{gdp={0,107,218,1}, name="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}}, nRate = 0},
		[16] = {[1] = {item={{gdp={0,107,222,1}, name="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}}, nRate = 0},
		[17] = {[1] = {item={{gdp={0,107,223,1}, name="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}}, nRate = 0},						
	}
	LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 5"
	LIB_Award.szLogAction = "thµnh c«ng"
	LIB_Award:AwardByRate(tbBook)
end


function TradeMaterial_PetBonus(tbAwardList)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	-- Award Exp Pet
	if type(tbAwardList["nPetExp"])=="number" then
		if nCurPetLevel >= 1 then
			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (tbAwardList["nPetExp"] * 100))
			Msg2Player("B¹n nhËn ®­îc "..tbAwardList["nPetExp"].." ®iÓm n©ng cÊp b¹n ®ång hµnh")
			gf_WriteLogEx("DOI NGUYEN LIEU THANG 5", "thµnh c«ng", tbAwardList["nPetExp"], "®iÓm n©ng cÊp pet")
		end
	end
	-- Award Linh luc Pet
	if type(tbAwardList["nPetLinhluc"])=="number" then
		if nCurPetLevel >= 2 then
			Pet_AddGP(tbAwardList["nPetLinhluc"])
			Msg2Player("B¹n nhËn ®­îc "..tbAwardList["nPetLinhluc"].." ®iÓm linh lùc pet")
			gf_WriteLogEx("DOI NGUYEN LIEU THANG 5", "thµnh c«ng", tbAwardList["nPetLinhluc"], "®iÓm linh lùc pet")
		end
	end
end


-- §æi nguyªn liÖu §­êng Minh Thµnh
function Trade_Material_Menu2()
	local tbSay = {}
	for i=1, getn(tbExpMaterial2) do
		tinsert(tbSay, tbExpMaterial2[i][3].."/#TradeMaterial_Done2("..i..")")
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("NÕu c¸c h¹ kiÕm cho ta nh÷ng nguyªn liÖu ta cÇn, ta sÏ sÏ cã hËu t¹ xøng ®¸ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done2(nOption)
	if gf_JudgeRoomWeight(33,100) == 0 then
		Talk(1,"","Hµnh trang cÇn 33 «, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local tbNguyenLieu = tbExpMaterial2[nOption]
	for i=1,getn(tbNguyenLieu[1]) do
		if type(tbNguyenLieu[1][i]) == "table" then
			if GetItemCount(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3]) < tbNguyenLieu[1][i][4] then
				Talk(1,"","C¸c h¹ kh«ng ®em ®ñ nguyªn liÖu, vui lßng kiÓm tra l¹i.")
				return 0
			end
		elseif type(tbNguyenLieu[1][i]) == "number" then
			if GetCash() < tbNguyenLieu[1][i] then
				Talk(1,"","C¸c h¹ kh«ng ®em ®ñ vµng, vui lßng kiÓm tra l¹i.")
				return 0
			end
		end
	end
	
	LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 5"
	LIB_Award.szLogAction = "thµnh c«ng"
	tbAward = tbNguyenLieu[2]
	if LIB_Award:Award(tbAward) == 1 then
		gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "§­êng Minh Thµnh c«ng thøc "..nOption)
		for i=1,getn(tbNguyenLieu[1]) do
			if type(tbNguyenLieu[1][i]) == "table" then
				DelItem(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3],tbNguyenLieu[1][i][4])
			elseif type(tbNguyenLieu[1][i]) == "number" then
				Pay(tbNguyenLieu[1][i])
			end
		end
	end
	Trade_Material_Menu2()
end


-- §æi nguyªn liÖu Th­¬ng Nh©n ThÇn BÝ - BiÖn Kinh
function Trade_Material_Menu3()
	local tbSay = {}
	for i=1, getn(tbExpMaterialQuanDung) do
		tinsert(tbSay, tbExpMaterialQuanDung[i][3].."/#TradeMaterial_Done3("..i..")")
	end
	tinsert(tbSay,"NhËn phÇn th­ëng nép 30 lÇn/TradeMaterial_Done3_FinalAward")
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("NÕu c¸c h¹ kiÕm cho ta nh÷ng nguyªn liÖu ta cÇn, ta sÏ sÏ cã hËu t¹ xøng ®¸ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done3(nOption)
	local nCount = mod(floor(GetTask(TSK_THUQUANDUNG)/10),100)
	if nCount >= 30 then
		Talk(1,"","H«m nay c¸c h¹ chØ ®­îc ®æi 30 lÇn, mai h·y quay l¹i nhÐ!")
		return 0
	end
	
	if TradeMaterial_Core(nOption, tbExpMaterialQuanDung[nOption], "THU DOI QUAN DUNG") == 1 then
		nCount = (nCount + 1)*10 + mod(GetTask(TSK_THUQUANDUNG),10)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/1000)*1000 + nCount)
		gf_WriteLogEx("THU DOI QUAN DUNG", "thµnh c«ng", 1, "Th­¬ng Nh©n ThÇn BÝ")
		Trade_Material_Menu3()
	end
end


function TradeMaterial_Done3_FinalAward()
	local nSoLanNop = mod(floor(GetTask(TSK_THUQUANDUNG)/10),100)
	if nSoLanNop < 30 then
		Talk(1,"","H«m nay c¸c h¹ ch­a nép ®ñ 30 lÇn, h·y cè g¾ng thªm nhÐ!")
		return 0
	end
	
	local nCount = mod(GetTask(TSK_THUQUANDUNG),10)
	if nCount > 0 then
		Talk(1,"","PhÇn th­ëng h«m nay c¸c h¹ ®· nhËn råi.!")
		return 0
	end
	
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	 
	tbAward = {
		nCheckExp = 0,
		nExp = 33000000,
		nChankhi = 330,
	}
	LIB_Award.szLogTitle = "THU DOI QUAN DUNG PHAN THUONG CUOI"
	LIB_Award.szLogAction = "thµnh c«ng"
	if LIB_Award:Award(tbAward) == 1 then
		AddItem(2,1,30164 + mod(random(0,1000),20), 33)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/10)*10 + 1)
		gf_WriteLogEx("THU DOI QUAN DUNG PHAN THUONG CUOI", "thµnh c«ng", 1, "Th­¬ng Nh©n ThÇn BÝ")
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng nép 30 lÇn nguyªn liÖu qu©n dông.")
	end
end


-- Nép event th¸ng 5
function Trade_Material_Menu4()
	local tbSay = {}
	for i=1, getn(tbExpMaterialEventT5) do
		local nHeso = 10^(i+2)
		local nCount  = mod(floor(GetTask(TSK_THUQUANDUNG)/nHeso),10)
		tinsert(tbSay, tbExpMaterialEventT5[i][3].."("..nCount.."/6)/#TradeMaterial_Done4("..i..")")
	end
	tinsert(tbSay,"NhËn phÇn th­ëng nép 6 lÇn c¶ 2 lo¹i/TradeMaterial_Done4_FinalAward")
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("NÕu c¸c h¹ kiÕm cho ta nh÷ng nguyªn liÖu ta cÇn, ta sÏ sÏ cã hËu t¹ xøng ®¸ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done4(nOption)
	if GetTask(2813) < 2000 or GetTask(2814) < 2000 then
		Talk(1,"","C¸c h¹ ch­a sö dông ®ñ 2000 vËt phÈm event mçi lo¹i.")
		return 0
	end
	
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	
	local nHeso = 10^(nOption+2)
	local nCount  = mod(floor(GetTask(TSK_THUQUANDUNG)/nHeso),10)
	if nCount >= 6 then
		Talk(1,"","C¸c h¹ chØ ®­îc ®æi 6 lÇn cho lo¹i vËt phÈm nµy.")
		return 0
	end
	
	if TradeMaterial_Core(nOption, tbExpMaterialEventT5[nOption], "MO RONG EVENT THANG 5") == 1 then
		nCount = (nCount + 1)*nHeso + mod(GetTask(TSK_THUQUANDUNG),nHeso)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/(nHeso*10))*nHeso*10 + nCount)
		if nOption == 1 then
			gf_WriteLogEx("MO RONG EVENT THANG 5", "thµnh c«ng", 1, "Siro Ngò S¾c")
		else
			gf_WriteLogEx("MO RONG EVENT THANG 5", "thµnh c«ng", 1, "Kem Que CÇu Vång")
		end
		Trade_Material_Menu4()
	end
end


function TradeMaterial_Done4_FinalAward()
	local nSoLanNop = mod(floor(GetTask(TSK_THUQUANDUNG)/1000),100)
	if nSoLanNop < 66 then
		Talk(1,"","C¸c h¹ ch­a nép ®ñ 6 lÇn cho mçi lo¹i vËt phÈm, h·y cè g¾ng thªm nhÐ!")
		return 0
	end
	
	local nCount = mod(floor(GetTask(TSK_THUQUANDUNG)/100000),10)
	if nCount > 0 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!")
		return 0
	end
	
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	
	tbAward = {
		nCheckExp = 0,
		nExp = 500000000,
		item = {
			{gdp={2,95,204,2}, name = "Thiªn Cang LÖnh"}, 
			{gdp={2,1,30370,2}, name = "Thiªn M«n Kim LÖnh"},
		},
	}
	LIB_Award.szLogTitle = "MO RONG EVENT THANG 5 PHAN THUONG CUOI"
	LIB_Award.szLogAction = "thµnh c«ng"
	if LIB_Award:Award(tbAward) == 1 then
		SetTask(TSK_THUQUANDUNG, GetTask(TSK_THUQUANDUNG) + 100000)
		gf_WriteLogEx("MO RONG EVENT THANG 5 PHAN THUONG CUOI", "thµnh c«ng", 1, "Th­¬ng Nh©n ThÇn BÝ")
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng nép 6 lÇn Event.")
	end
end


function TradeMaterial_Core(nOption, tbNguyenLieu, szLogTitle)
	for i=1,getn(tbNguyenLieu[1]) do
		if type(tbNguyenLieu[1][i]) == "table" then
			if GetItemCount(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3]) < tbNguyenLieu[1][i][4] then
				Talk(1,"","C¸c h¹ kh«ng ®em ®ñ nguyªn liÖu, vui lßng kiÓm tra l¹i.")
				return 0
			end
		elseif type(tbNguyenLieu[1][i]) == "number" then
			if GetCash() < tbNguyenLieu[1][i] then
				Talk(1,"","C¸c h¹ kh«ng ®em ®ñ vµng, vui lßng kiÓm tra l¹i.")
				return 0
			end
		end
	end
	
	LIB_Award.szLogTitle = szLogTitle
	LIB_Award.szLogAction = "thµnh c«ng"
	tbAward = tbNguyenLieu[2]
	if LIB_Award:Award(tbAward) == 1 then
		for i=1,getn(tbNguyenLieu[1]) do
			if type(tbNguyenLieu[1][i]) == "table" then
				DelItem(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3],tbNguyenLieu[1][i][4])
			elseif type(tbNguyenLieu[1][i]) == "number" then
				Pay(tbNguyenLieu[1][i])
			end
		end
	end
	return 1
end

--Nép Event th¸ng 8
function Event_Phu_Thang8()
	local tbSay = {}

	tinsert(tbSay,"NhËn 19 triÖu ®iÓm kinh nghiÖm (tiªu hao 1 Thiªn th¹ch tinh th¹ch + 1 xu vËt phÈm)/#change_nguyenlieu_thang8(1)")
	tinsert(tbSay,"NhËn 390.000 ®iÓm kinh nghiÖm (tiªu hao 1 M¶nh thiªn th¹ch + 1 xu vËt phÈm)/#change_nguyenlieu_thang8(2)")
	tinsert(tbSay,"NhËn 290.000 ®iÓm kinh nghiÖm (tiªu hao 1 Thiªn th¹ch + 1 xu vËt phÈm)/#change_nguyenlieu_thang8(3)")
	tinsert(tbSay,"NhËn 1 B¸nh Trung Thu Socola (tiªu hao 1 M¶nh thiªn th¹ch + 2 Thiªn th¹ch + 1 vµng )/change_banhtrungthu")
--	tinsert(tbSay,"Nép 1 Sinh Tè ThËp CÈm/#submit_nguyenlieu(1)")
--	tinsert(tbSay,"NhËn th­ëng nép 2000 Sinh Tè ThËp C¶m (30.000 ®iÓm ch©n khÝ/#get_award_thang7(1)")
--	tinsert(tbSay,"Nép 1 Tr¸i C©y DÇm/#submit_nguyenlieu(2)")
--	tinsert(tbSay,"NhËn th­ëng nép 2000 Tr¸i C©y DÇm (30.000 ®iÓm ch©n khÝ/#get_award_thang7(2)")
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("NÕu c¸c h¹ kiÕm cho ta nh÷ng nguyªn liÖu ta cÇn, ta sÏ sÏ cã hËu t¹ xøng ®¸ng.", getn(tbSay), tbSay)
end
function change_nguyenlieu_thang8(nType)
	local tNguyenlieu = {
										[1] = {2,1,1009,1," Thiªn th¹ch tinh th¹ch", 1, 19000000},
										[2] = {2,2,7,1," M¶nh thiªn th¹ch", 1, 390000},
										[3] = {2,2,8,1," Thiªn th¹ch", 1, 290000},
							}
	if GetItemCount(tNguyenlieu[nType][1],tNguyenlieu[nType][2],tNguyenlieu[nType][3]) < tNguyenlieu[nType][4] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tNguyenlieu[nType][4]..tNguyenlieu[nType][5])
		return
	end
	if GetItemCount(2,1,30230) < tNguyenlieu[nType][6] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tNguyenlieu[nType][6].." xu vËt phÈm")
		return
	end
	if DelItem(tNguyenlieu[nType][1],tNguyenlieu[nType][2],tNguyenlieu[nType][3],tNguyenlieu[nType][4]) == 1 and DelItem(2,1,30230,tNguyenlieu[nType][6]) == 1 then
		ModifyExp(tNguyenlieu[nType][7])
		Msg2Player("§æi thµnh c«ng "..tNguyenlieu[nType][7].." ®iÓm kinh nghiÖm")
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "nép thµnh c«ng", 1, "®æi thµnh c«ng 1"..tNguyenlieu[nType][5])
		WriteLogEx("LOG XU VAT PHAM","§æi nguyªn liÖu th¸ng 8 lo¹i "..tNguyenlieu[nType][5])
	else
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "nép kh«ng thµnh c«ng", 1, "Kh«ng thµnh c«ng lo¹i"..tNguyenlieu[nType][5])
	end
	Event_Phu_Thang8()
end
function change_banhtrungthu()
	if gf_JudgeRoomWeight(2,10) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	if GetItemCount(2,2,7) < 1 or GetItemCount(2,2,8) < 2 or GetCash() < 10000 then
		Talk(1,"","B¹n kh«ng mang theo ®ñ nguyªn liÖu ®Ó ®æi B¸nh Trung Thu Socola")
		return
	end
	if DelItem(2,2,7,1) == 1 and DelItem(2,2,8,2) == 1 then
		Pay(10000)
		gf_AddItemEx2({2,1,30571 ,1}, "§æi b¸nh socola th¸ng 8", "EVENT PHU THEM THANG 8 BK", "§æi b¸nh Trung thu Socola")
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "nép thµnh c«ng", 1, "§æi b¸nh trung thu Socola thµnh c«ng")
	else
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "nép kh«ng thµnh c«ng", 1, "§æi b¸nh trung thu Socola kh«ng thµnh c«ng")
	end
	Event_Phu_Thang8()
end

function submit_nguyenlieu(nType)
	local nCout_sinhto = mod(GetTask(2713),10000)
	local nCout_traicay = floor(GetTask(2713)/10000)
	if nType == 1 then
		if GetItemCount(2,1,30552) < 1 then
			Talk(1,"","C¸c h¹ kh«ng ®em Sinh Tè ThËp CÈm, vui lßng kiÓm tra l¹i.")
			return 0
		end
		DelItem(2,1,30552,1)
		ModifyExp(550000)
		AwardGenuineQi(10)
		if nCout_sinhto < 2000 then
			SetTask(2713, GetTask(2713)+1)
		end		
		nCout_sinhto = mod(GetTask(2713),10000)
		if nCout_sinhto == 2000 then
			local nCheck_sinhto = gf_GetTaskByte(2731, 2)
			if nCheck_sinhto< 2 then
				gf_SetTaskByte(2731, 2, 1)
			end
		end
		gf_WriteLogEx("EVENT PHU THEM THANG 7", "nép thµnh c«ng", 1, "nép thµnh c«ng 1 sinh tè")
		Msg2Player("Nép thµnh c«ng 1 Sinh Tè ThËp CÈm: "..nCout_sinhto.."/2000")

	elseif nType == 2 then
		if GetItemCount(2,1,30553) < 1 then
			Talk(1,"","C¸c h¹ kh«ng ®em Tr¸i C©y DÇm, vui lßng kiÓm tra l¹i.")
			return 0
		end
		DelItem(2,1,30553,1)
		ModifyExp(550000)
		AwardGenuineQi(10)
		if nCout_traicay < 2000 then
			SetTask(2713, nCout_sinhto + (nCout_traicay+1)*10000)
		end		
		nCout_traicay = floor(GetTask(2713)/10000)
		if nCout_traicay == 2000 then
			local nCheck_traicay = gf_GetTaskByte(2731, 3)
			if nCheck_traicay < 2 then
				gf_SetTaskByte(2731, 3, 1)
			end
		end
		gf_WriteLogEx("EVENT PHU THEM THANG 7", "nép thµnh c«ng", 1, "nép thµnh c«ng 1 tr¸i c©y dÇm")
		Msg2Player("Nép thµnh c«ng 1 Tr¸i C©y DÇm: "..nCout_traicay.."/2000")

	end
	Event_Phu_Thang8()
end
function get_award_thang7(nType)
 	local nCheckKinhMach = MeridianGetLevel()
 	if nCheckKinhMach < 1 then
		Talk(1,"","§¹i hiÖp ch­a kÝch ho¹t kinh m¹ch nªn kh«ng thÓ nhËn th­ëng !!!!")
		return 0
	end	
	if nType == 1 then
		 local nCheck_sinhto = gf_GetTaskByte(2731, 2)
		 if nCheck_sinhto < 1 then
		 	Talk(1,"","C¸c h¹ ch­a nép ®ñ 2000 Sinh Tè ThËp CÈm.")
			return 0
		 end		 
		 if nCheck_sinhto > 1 then
		 	Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
			return 0
		 end
		 
		 gf_SetTaskByte(2731, 2, 2)
		 AwardGenuineQi(30000)
		 gf_WriteLogEx("EVENT PHU THEM THANG 7", "thµnh c«ng", 1, "NhËn th­ëng mèc 2000 Sinh Tè")
	elseif nType == 2 then
		local nCheck_traicay = gf_GetTaskByte(2731, 3)
		 if nCheck_traicay < 1 then
		 	Talk(1,"","C¸c h¹ ch­a nép ®ñ 2000 Tr¸i C©y DÇm.")
			return 0
		 end		 		
		if nCheck_traicay > 1 then
			Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
			return 0
		end
		gf_SetTaskByte(2731, 3, 2)
		 AwardGenuineQi(30000)
		 gf_WriteLogEx("EVENT PHU THEM THANG 7", "thµnh c«ng", 1, "NhËn th­ëng mèc 2000 Tr¸i c©y")
	end

end

function noel_get_1_time()
	local nCount = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 5, 4)
	local nCountAll = mod(GetTask(TSK_NOEL_DIEUDUONG), 1000)
	if GetItemCount(2,1,30611) < 1 then
		Talk(1,"","§¹i hiÖp kh«ng cã 1 Hép Quµ Gi¸ng Sinh.")
		return 0
	end
	if nCount >= 69 then
		Talk(1,"","H«m nay ®¹i hiÖp ®· nép ®ñ 69 hép Quµ Gi¸ng Sinh.")
		return 0
	end
	if nCountAll >= 690 then
		Talk(1,"","§¹i hiÖp ®· nép ®ñ 690 hép Quµ Gi¸ng Sinh.")
		return 0
	end
	if DelItem(2,1,30611,1) == 1 then
		ModifyExp(690000)
		AwardGenuineQi(4)
		if nCountAll < 690 then
			SetTask(TSK_NOEL_DIEUDUONG, GetTask(TSK_NOEL_DIEUDUONG)+1)
			VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, nCount+1, 5, 4)
		end
		gf_WriteLogEx("NOEL DOI DIEU DUONG", "thµnh c«ng", 1, "Nép 1 hép quµ")
	else
		gf_WriteLogEx("NOEL DOI DIEU DUONG", "thµnh c«ng", 1, "Nép 1 hép quµ thÊt b¹i")
	end
	 
end

function noel_get_1_day()
	local nCheck = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 6, 6)
	local nCount = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 5, 4)
	if nCheck == 1 then
		Talk(1,"","H«m nay §¹i hiÖp ®· nhËn th­ëng råi, h·y quay l¹i vµo ngµy mai")
		return 0
	end
	if nCount < 69 then
		Talk(1,"","H«m nay §¹i hiÖp ch­a nép ®ñ 69 hép quµ gi¸ng sinh")
		return 0
	end
	if gf_Judge_Room_Weight(4, 100," ") ~= 1 then
        	return
    end
	--Add phÇn th­ëng
	LIB_Award.szLogTitle = "DOI EVENT NHAN DIEU DUONG 69"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByRate(tbNoel69)
	----------
	VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 1, 6, 6)
	gf_WriteLogEx("NOEL DOI DIEU DUONG", "thµnh c«ng", 1, "NhËn th­ëng nép 69 hép mçi ngµy")	
end

function noel_get_all()
	local nCheck = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 7, 7)
	local nCount = mod(GetTask(TSK_NOEL_DIEUDUONG), 1000)
	if nCheck == 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn th­ëng råi !!!!")
		return 0
	end
	if nCount < 690 then
		Talk(1,"","§¹i hiÖp ch­a nép ®ñ 690 hép quµ gi¸ng sinh")
		return 0
	end
	if gf_Judge_Room_Weight(4, 100," ") ~= 1 then
        	return
    end
	--Add phÇn th­ëng
	LIB_Award.szLogTitle = "DOI EVENT NHAN DIEU DUONG 690"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByRate(tbNoel690)
	AwardGenuineQi(10000)
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 10000)
	else
		SetTask(701,GetTask(701) - 10000)
	end
	Msg2Player("B¹n nhËn ®­îc 10000 ®iÓm c«ng tr¹ng")
	----------
	VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 1, 7, 7)
	gf_WriteLogEx("NOEL DOI DIEU DUONG", "thµnh c«ng", 1, "NhËn th­ëng nép 690")	
end

function show_noel_get_info()
	local nCount = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 5, 4)
	local nCountAll = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 3, 1)
	local nGetDaily = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 6, 6)
	local nGetFinal = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 7, 7)

	Talk(1, "", "Th«ng tin chi tiÕt nép vËt phÈm:\n Tæng sè lÇn ®· nép: "..nCountAll.."\n Sè lÇn nép trong ngµy: "..nCount)
end

function TrangBiDieuDuong_NgauNhien()
	local tbDieuDuongRandom = {
		 [1] = {[1] = {item={{gdp={0,100,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [2] = {[1] = {item={{gdp={0,100,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [3] = {[1] = {item={{gdp={0,100,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [4] = {[1] = {item={{gdp={0,100,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [5] = {[1] = {item={{gdp={0,100,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [6] = {[1] = {item={{gdp={0,100,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [7] = {[1] = {item={{gdp={0,100,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [8] = {[1] = {item={{gdp={0,100,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [9] = {[1] = {item={{gdp={0,100,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [10] = {[1] = {item={{gdp={0,100,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [11] = {[1] = {item={{gdp={0,100,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [12] = {[1] = {item={{gdp={0,100,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [13] = {[1] = {item={{gdp={0,100,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [14] = {[1] = {item={{gdp={0,100,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [15] = {[1] = {item={{gdp={0,100,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [16] = {[1] = {item={{gdp={0,100,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [17] = {[1] = {item={{gdp={0,100,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [18] = {[1] = {item={{gdp={0,100,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [19] = {[1] = {item={{gdp={0,100,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [20] = {[1] = {item={{gdp={0,100,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [21] = {[1] = {item={{gdp={0,100,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [22] = {[1] = {item={{gdp={0,100,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [23] = {[1] = {item={{gdp={0,100,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [24] = {[1] = {item={{gdp={0,100,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [25] = {[1] = {item={{gdp={0,100,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [26] = {[1] = {item={{gdp={0,100,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [27] = {[1] = {item={{gdp={0,100,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [28] = {[1] = {item={{gdp={0,100,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [29] = {[1] = {item={{gdp={0,100,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [30] = {[1] = {item={{gdp={0,100,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [31] = {[1] = {item={{gdp={0,100,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [32] = {[1] = {item={{gdp={0,100,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [33] = {[1] = {item={{gdp={0,100,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [34] = {[1] = {item={{gdp={0,100,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [35] = {[1] = {item={{gdp={0,100,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [36] = {[1] = {item={{gdp={0,100,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [37] = {[1] = {item={{gdp={0,100,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [38] = {[1] = {item={{gdp={0,100,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [39] = {[1] = {item={{gdp={0,100,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [40] = {[1] = {item={{gdp={0,100,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [41] = {[1] = {item={{gdp={0,100,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [42] = {[1] = {item={{gdp={0,100,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [43] = {[1] = {item={{gdp={0,100,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [44] = {[1] = {item={{gdp={0,100,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [45] = {[1] = {item={{gdp={0,100,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [46] = {[1] = {item={{gdp={0,100,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [47] = {[1] = {item={{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [48] = {[1] = {item={{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [49] = {[1] = {item={{gdp={0,100,3176,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [50] = {[1] = {item={{gdp={0,100,3177,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [51] = {[1] = {item={{gdp={0,100,3178,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [52] = {[1] = {item={{gdp={0,100,3179,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [53] = {[1] = {item={{gdp={0,100,3180,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [54] = {[1] = {item={{gdp={0,100,3181,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [55] = {[1] = {item={{gdp={0,100,3182,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [56] = {[1] = {item={{gdp={0,100,3183,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [57] = {[1] = {item={{gdp={0,100,3184,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [58] = {[1] = {item={{gdp={0,100,3185,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [59] = {[1] = {item={{gdp={0,100,3186,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [60] = {[1] = {item={{gdp={0,100,3187,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [61] = {[1] = {item={{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [62] = {[1] = {item={{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [63] = {[1] = {item={{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [64] = {[1] = {item={{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [65] = {[1] = {item={{gdp={0,103,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [66] = {[1] = {item={{gdp={0,103,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [67] = {[1] = {item={{gdp={0,103,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [68] = {[1] = {item={{gdp={0,103,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [69] = {[1] = {item={{gdp={0,103,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [70] = {[1] = {item={{gdp={0,103,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [71] = {[1] = {item={{gdp={0,103,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [72] = {[1] = {item={{gdp={0,103,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [73] = {[1] = {item={{gdp={0,103,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [74] = {[1] = {item={{gdp={0,103,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [75] = {[1] = {item={{gdp={0,103,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [76] = {[1] = {item={{gdp={0,103,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [77] = {[1] = {item={{gdp={0,103,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [78] = {[1] = {item={{gdp={0,103,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [79] = {[1] = {item={{gdp={0,103,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [80] = {[1] = {item={{gdp={0,103,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [81] = {[1] = {item={{gdp={0,103,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [82] = {[1] = {item={{gdp={0,103,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [83] = {[1] = {item={{gdp={0,103,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [84] = {[1] = {item={{gdp={0,103,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [85] = {[1] = {item={{gdp={0,103,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [86] = {[1] = {item={{gdp={0,103,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [87] = {[1] = {item={{gdp={0,103,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [88] = {[1] = {item={{gdp={0,103,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [89] = {[1] = {item={{gdp={0,103,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [90] = {[1] = {item={{gdp={0,103,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [91] = {[1] = {item={{gdp={0,103,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [92] = {[1] = {item={{gdp={0,103,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [93] = {[1] = {item={{gdp={0,103,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [94] = {[1] = {item={{gdp={0,103,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [95] = {[1] = {item={{gdp={0,103,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [96] = {[1] = {item={{gdp={0,103,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [97] = {[1] = {item={{gdp={0,103,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [98] = {[1] = {item={{gdp={0,103,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [99] = {[1] = {item={{gdp={0,103,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [100] = {[1] = {item={{gdp={0,103,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [101] = {[1] = {item={{gdp={0,103,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [102] = {[1] = {item={{gdp={0,103,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [103] = {[1] = {item={{gdp={0,103,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [104] = {[1] = {item={{gdp={0,103,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [105] = {[1] = {item={{gdp={0,103,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [106] = {[1] = {item={{gdp={0,103,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [107] = {[1] = {item={{gdp={0,103,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [108] = {[1] = {item={{gdp={0,103,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [109] = {[1] = {item={{gdp={0,103,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [110] = {[1] = {item={{gdp={0,103,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [111] = {[1] = {item={{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [112] = {[1] = {item={{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [113] = {[1] = {item={{gdp={0,103,3176,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [114] = {[1] = {item={{gdp={0,103,3177,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [115] = {[1] = {item={{gdp={0,103,3178,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [116] = {[1] = {item={{gdp={0,103,3179,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [117] = {[1] = {item={{gdp={0,103,3180,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [118] = {[1] = {item={{gdp={0,103,3181,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [119] = {[1] = {item={{gdp={0,103,3182,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [120] = {[1] = {item={{gdp={0,103,3183,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [121] = {[1] = {item={{gdp={0,103,3184,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [122] = {[1] = {item={{gdp={0,103,3185,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [123] = {[1] = {item={{gdp={0,103,3186,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [124] = {[1] = {item={{gdp={0,103,3187,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [125] = {[1] = {item={{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [126] = {[1] = {item={{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [127] = {[1] = {item={{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [128] = {[1] = {item={{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [129] = {[1] = {item={{gdp={0,101,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [130] = {[1] = {item={{gdp={0,101,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [131] = {[1] = {item={{gdp={0,101,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [132] = {[1] = {item={{gdp={0,101,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [133] = {[1] = {item={{gdp={0,101,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [134] = {[1] = {item={{gdp={0,101,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [135] = {[1] = {item={{gdp={0,101,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [136] = {[1] = {item={{gdp={0,101,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [137] = {[1] = {item={{gdp={0,101,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [138] = {[1] = {item={{gdp={0,101,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [139] = {[1] = {item={{gdp={0,101,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [140] = {[1] = {item={{gdp={0,101,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [141] = {[1] = {item={{gdp={0,101,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [142] = {[1] = {item={{gdp={0,101,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [143] = {[1] = {item={{gdp={0,101,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [144] = {[1] = {item={{gdp={0,101,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [145] = {[1] = {item={{gdp={0,101,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [146] = {[1] = {item={{gdp={0,101,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [147] = {[1] = {item={{gdp={0,101,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [148] = {[1] = {item={{gdp={0,101,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [149] = {[1] = {item={{gdp={0,101,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [150] = {[1] = {item={{gdp={0,101,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [151] = {[1] = {item={{gdp={0,101,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [152] = {[1] = {item={{gdp={0,101,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [153] = {[1] = {item={{gdp={0,101,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [154] = {[1] = {item={{gdp={0,101,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [155] = {[1] = {item={{gdp={0,101,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [156] = {[1] = {item={{gdp={0,101,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [157] = {[1] = {item={{gdp={0,101,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [158] = {[1] = {item={{gdp={0,101,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [159] = {[1] = {item={{gdp={0,101,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [160] = {[1] = {item={{gdp={0,101,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [161] = {[1] = {item={{gdp={0,101,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [162] = {[1] = {item={{gdp={0,101,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [163] = {[1] = {item={{gdp={0,101,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [164] = {[1] = {item={{gdp={0,101,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [165] = {[1] = {item={{gdp={0,101,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [166] = {[1] = {item={{gdp={0,101,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [167] = {[1] = {item={{gdp={0,101,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [168] = {[1] = {item={{gdp={0,101,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [169] = {[1] = {item={{gdp={0,101,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [170] = {[1] = {item={{gdp={0,101,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [171] = {[1] = {item={{gdp={0,101,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [172] = {[1] = {item={{gdp={0,101,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [173] = {[1] = {item={{gdp={0,101,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [174] = {[1] = {item={{gdp={0,101,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [175] = {[1] = {item={{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [176] = {[1] = {item={{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [177] = {[1] = {item={{gdp={0,101,3176,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [178] = {[1] = {item={{gdp={0,101,3177,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [179] = {[1] = {item={{gdp={0,101,3178,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [180] = {[1] = {item={{gdp={0,101,3179,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [181] = {[1] = {item={{gdp={0,101,3180,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [182] = {[1] = {item={{gdp={0,101,3181,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [183] = {[1] = {item={{gdp={0,101,3182,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [184] = {[1] = {item={{gdp={0,101,3183,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [185] = {[1] = {item={{gdp={0,101,3184,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [186] = {[1] = {item={{gdp={0,101,3185,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [187] = {[1] = {item={{gdp={0,101,3186,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [188] = {[1] = {item={{gdp={0,101,3187,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [189] = {[1] = {item={{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [190] = {[1] = {item={{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [191] = {[1] = {item={{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [192] = {[1] = {item={{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [193] = {[1] = {item={{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [194] = {[1] = {item={{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [195] = {[1] = {item={{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [196] = {[1] = {item={{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [197] = {[1] = {item={{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [198] = {[1] = {item={{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [199] = {[1] = {item={{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [200] = {[1] = {item={{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [201] = {[1] = {item={{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [202] = {[1] = {item={{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [203] = {[1] = {item={{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [204] = {[1] = {item={{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [205] = {[1] = {item={{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [206] = {[1] = {item={{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [207] = {[1] = {item={{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [208] = {[1] = {item={{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [209] = {[1] = {item={{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [210] = {[1] = {item={{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
	}
	LIB_Award:AwardByRate(tbDieuDuongRandom)
end