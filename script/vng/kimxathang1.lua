Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");

szLogTitle = "KIM XA THANG 1"
TSKTEMP_KIMXATHANG1 = 118

tbKimXa3sao = {
	[1] = {item={{gdp={0,152,4,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,153,4,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,154,4,1,1,-1,-1,-1,-1,-1,-1,-1}}}},
	[2] = {item={{gdp={0,152,5,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,153,5,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,154,5,1,1,-1,-1,-1,-1,-1,-1,-1}}}},
	[3] = {item={{gdp={0,152,6,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,153,6,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,154,6,1,1,-1,-1,-1,-1,-1,-1,-1}}}},
	[4] = {item={{gdp={0,152,7,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,153,7,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,154,7,1,1,-1,-1,-1,-1,-1,-1,-1}}}},
	[5] = {item={{gdp={0,152,8,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,153,8,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,154,8,1,1,-1,-1,-1,-1,-1,-1,-1}}}},
	[6] = {item={{gdp={0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1}}, {gdp={0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1}}}},
}

tbMenuKimXa = {
	[1] = {"Kim ChÕ Ngò Hµnh", 29, 169}, -- {trang bi, so trai cay, so xu}
	[2] = {"Méc ChÕ Ngò Hµnh", 29, 169},
	[3] = {"Thñy ChÕ Ngò Hµnh", 29, 169},
	[4] = {"Háa ChÕ Ngò Hµnh", 29, 169},
	[5] = {"Thæ ChÕ Ngò Hµnh", 29, 169},
	[6] = {"¢m ChÕ Ngò Hµnh", 69, 369},
}

tbFinalAward = {
	nExp = 100000000,
	nChankhi = 10000,
	nQuancong = 10000,
	nSumon = 1000,
	nDanhvong = 1000,
	nPetExp = 100,
	nPetLinhluc = 10,
}

tbSachPet2 = {
	[1] = {item={{gdp={2,150,2,1}}}},
	[2] = {item={{gdp={2,150,6,1}}}},
	[3] = {item={{gdp={2,150,10,1}}}},
	[4] = {item={{gdp={2,150,14,1}}}},
	[5] = {item={{gdp={2,150,18,1}}}},
	[6] = {item={{gdp={2,150,22,1}}}},
	[7] = {item={{gdp={2,150,26,1}}}},
	[8] = {item={{gdp={2,150,30,1}}}},
	[9] = {item={{gdp={2,150,34,1}}}},
	[10] = {item={{gdp={2,150,38,1}}}},
	[11] = {item={{gdp={2,150,42,1}}}},
	[12] = {item={{gdp={2,150,46,1}}}},
	[13] = {item={{gdp={2,150,50,1}}}},
	[14] = {item={{gdp={2,150,54,1}}}},
	[15] = {item={{gdp={2,150,58,1}}}},
}

tbSachPet3 = {
	[1] = {item={{gdp={2,150,3,1}}}},
	[2] = {item={{gdp={2,150,7,1}}}},
	[3] = {item={{gdp={2,150,11,1}}}},
	[4] = {item={{gdp={2,150,15,1}}}},
	[5] = {item={{gdp={2,150,19,1}}}},
	[6] = {item={{gdp={2,150,23,1}}}},
	[7] = {item={{gdp={2,150,27,1}}}},
	[8] = {item={{gdp={2,150,31,1}}}},
	[9] = {item={{gdp={2,150,35,1}}}},
	[10] = {item={{gdp={2,150,39,1}}}},
	[11] = {item={{gdp={2,150,43,1}}}},
	[12] = {item={{gdp={2,150,47,1}}}},
	[13] = {item={{gdp={2,150,51,1}}}},
	[14] = {item={{gdp={2,150,55,1}}}},
	[15] = {item={{gdp={2,150,59,1}}}},
}

tbSachPet4 = {
	[1] = {item={{gdp={2,150,4,1}}}},
	[2] = {item={{gdp={2,150,8,1}}}},
	[3] = {item={{gdp={2,150,12,1}}}},
	[4] = {item={{gdp={2,150,16,1}}}},
	[5] = {item={{gdp={2,150,20,1}}}},
	[6] = {item={{gdp={2,150,24,1}}}},
	[7] = {item={{gdp={2,150,28,1}}}},
	[8] = {item={{gdp={2,150,32,1}}}},
	[9] = {item={{gdp={2,150,36,1}}}},
	[10] = {item={{gdp={2,150,40,1}}}},
	[11] = {item={{gdp={2,150,44,1}}}},
	[12] = {item={{gdp={2,150,48,1}}}},
	[13] = {item={{gdp={2,150,52,1}}}},
	[14] = {item={{gdp={2,150,56,1}}}},
	[15] = {item={{gdp={2,150,60,1}}}},
}
	
szNpcName = "<color=green>§­êng Minh Thµnh<color>: "

function KimXaThang1_Menu()
	local tbSay = {}
	for i=1,getn(tbMenuKimXa) do
		tinsert(tbSay, "NhËn bé trang bÞ Kim Xµ - ".. tbMenuKimXa[i][1] .."/#KimXaThang1_Form("..i..")")
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNpcName.."Ta cã rÊt nhiÒu trang bÞ Kim Xµ, c¸c h¹ nÕu tÆng ta Ýt ®Æc s¶n, ta cã thÓ tÆng l¹i c¸c h¹.", getn(tbSay), tbSay)
end


function KimXaThang1_Form(nOption)
	if VNG_GetTaskPos(TSK_KIMXATHANG1,nOption,nOption) ~= 0 then
		Talk(1,"","H«m nay c¸c h¹ ®· nhËn bé trang bÞ nµy, mai h·y quay l¹i nhÐ.")
		return 0
	end
	
	if gf_Judge_Room_Weight(3, 300) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMenuKimXa[nOption][3] then
		Talk(1,"","C¸c h¹ kh«ng cã ®ñ <color=yellow>"..tbMenuKimXa[nOption][3].." "..GetItemName(2,1,30230).."<color>.")
		return 0
	end
	
	SetTaskTemp(TSKTEMP_KIMXATHANG1, nOption)
	local tbSay = {}
	tbSay[0] = "H·y chän lo¹i tr¸i c©y c¸c h¹ muèn tÆng ta."
	for i = 30164, 30183 do
		if GetItemCount(2,1,i) >= tbMenuKimXa[nOption][2] then
			tinsert(tbSay, "Ta muèn ®æi "..tbMenuKimXa[nOption][2].." "..GetItemName(2,1,i).." vµ "..tbMenuKimXa[nOption][3].." "..GetItemName(2,1,30230).."/#KimXaThang1_Done("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function KimXaThang1_Done(nP)
	local nIDAward = GetTaskTemp(TSKTEMP_KIMXATHANG1)
	if nIDAward == 0 or nIDAward == nil then
		return 0
	end
	
	if VNG_GetTaskPos(TSK_KIMXATHANG1,nIDAward,nIDAward) ~= 0 then
		Talk(1,"","H«m nay c¸c h¹ ®· nhËn bé trang bÞ nµy, mai h·y quay l¹i nhÐ.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMenuKimXa[nIDAward][3] then
		Talk(1,"","C¸c h¹ kh«ng cã ®ñ <color=yellow>"..tbMenuKimXa[nIDAward][3].." "..GetItemName(2,1,30230).."<color>.")
		return 0
	end
	
	if GetItemCount(2,1,nP) < tbMenuKimXa[nIDAward][2] then
		Talk(1,"","C¸c h¹ kh«ng cã ®ñ <color=yellow>"..tbMenuKimXa[nIDAward][2].." "..GetItemName(2,1,nP).."<color>.")
		return 0
	end
	
	if gf_Judge_Room_Weight(3, 300) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	
	if DelItem(2,1,30230,tbMenuKimXa[nIDAward][3]) == 1 and DelItem(2,1,nP,tbMenuKimXa[nIDAward][2]) == 1 then
		LIB_Award.szLogTitle = "KIM XA THANG 1"
		LIB_Award.szLogAction = "nhËn"
		VNG_SetTaskPos(TSK_KIMXATHANG1, 1, nIDAward, nIDAward)
		LIB_Award:Award(tbKimXa3sao[nIDAward])
	end
end


function KimXaThang1_FinalAward()
	if VNG_GetTaskPos(TSK_KIMXATHANG1,7,7) ~= 0 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng h«m nay råi.")
		return 0
	end
	
	if mod(GetTask(TSK_KIMXATHANG1),1000000) ~= 111111 then
		Talk(1,"","C¸c h¹ ch­a nhËn ®ñ 6 lo¹i trang bÞ Kim Xµ.")
		return 0
	end
	
	if GetItemCount(2,1,1009) < 19 then
		Talk(1,"","C¸c h¹ kh«ng cã 19 Thiªn Th¹ch Tinh Th¹ch..")
		return 0
	end
	
	if gf_Judge_Room_Weight(3, 300) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	
	VNG_SetTaskPos(TSK_KIMXATHANG1, 1, 7,7)
	DelItem(2,1,1009,19)
	LIB_Award:Award(tbFinalAward)
	local nRand = mod(random(0,1000),15) + 1
	LIB_Award:Award(tbSachPet2[nRand])
	local nRand = mod(random(0,1000),15) + 1
	LIB_Award:Award(tbSachPet3[nRand])
	local nRand = mod(random(0,1000),15) + 1
	LIB_Award:Award(tbSachPet4[nRand])
end