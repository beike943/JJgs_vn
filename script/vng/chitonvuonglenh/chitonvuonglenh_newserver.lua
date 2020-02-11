Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");

-- Task 2667, 2668, 2669
IP_TIME_LIMIT = 7246800--2592000
IP_ONLINE_TIME = 2536
szNPCName = "<color=green>Anh/ChÞ Chñ Phßng M¸y: <color>"
szLogTitle = "CHI TON VUONG LENH"
szLogTitle1 = "CHI TON VUONG LENH BK"
LIB_Award.szLogTitle = szLogTitle .. " NEW SERVER"
LIB_Award.szLogAction = "nhËn"

tbChiTonPhanThuong = {
	[1] = {fn="ChiTonNew_PhanThuong99()"},
	[2] = {fn="ChiTonNew_PhanThuong199()"},
	[3] = {fn="ChiTonNew_PhanThuong299()"},
	[4] = {fn="ChiTonNew_PhanThuong399()"},
	[5] = {fn="ChiTonNew_PhanThuong499()"},
	[6] = {nCheckExp = 0, nChankhi = 20000, nExp = 50000000, fn="ChiTonNew_ThuongTraiCay()"},
	[7] = {nCheckExp = 0, nExp = 50000000},
	[8] = {nCheckExp = 0, nExp = 100000000},
	[9] = {nCheckExp = 0, item={{gdp={2,1,1068,1}, name="Thiªn Th¹ch Linh Th¹ch", nExpired = 7*24*3600}}, nChankhi = 10000, nExp = 100000000},
	[10] = {nCheckExp = 0, nChankhi = 10000, nExp = 100000000, fn="ChiTonNew_NonDieuDuong()"},
	[11] = {nCheckExp = 0, item={{gdp={2,1,1067,1}, name="§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", nExpired=7*24*3600}}, nChankhi = 10000, nExp = 100000000},
	[12] = {nCheckExp = 0, nChankhi = 10000, nExp = 100000000, fn="ChiTonNew_AoDieuDuong()"},
	[13] = {nCheckExp = 0, item={{gdp={2,1,1068,1}, name="Thiªn Th¹ch Linh Th¹ch", nExpired=7*24*3600}}, nChankhi = 10000, nExp = 200000000},
	[14] = {nCheckExp = 0, nExp = 200000000, fn="ChiTonNew_QuanDieuDuong()"},
	[15] = {nCheckExp = 0, item={{gdp={2,1,1113,1}, name="§¹i §Þnh Hån", nExpired=7*24*3600}}, nChankhi = 10000, nExp = 300000000},
	[16] = {nCheckExp = 0, item={{gdp={0,112,78,1}, name="L¨ng Ba Vi Bé"}}, nChankhi = 20000, nExp = 500000000, fn="ChiTonNew_ThuongTraiCay()"},
	[17] = {nCheckExp = 0, nChankhi = 30000, nExp = 500000000, fn="ChiTonNew_MatTichMonPhai70(10)"},
	[18] = {nCheckExp = 0, item={{gdp={0,112,158,1}, name="L¨ng Ba Vi Bé toµn tËp"}}, nExp = 500000000},
	[19] = {item={{gdp={2,1,30497,500}, name="Ma Tinh"}, {gdp={2,1,1113,1}, name="§¹i §Þnh Hån", nExpired = 7*24*3600}}, nChankhi = 100000, fn="ChiTonNew_VuKhiDieuDuong(); ChiTonNew_HoanThanhPS1Part1()"},
--	[20] = {nCheckExp = 0, nExp = 3000000000, fn="ChiTonNew_KichHoatKinhMach(3)"},
--	[21] = {nCheckExp = 0, item={{gdp={2,1,30497,2}, name="Ma Tinh"}, {gdp={2,1,30132,500}, name="Vâ L©m B¶o H¹p"}}, nExp = 690000000},
}

tbDieuKienHoanThanh = {
	[6] = {nDanhvong = 4000},
	[7] = {nSumon = 4000},
	[8] = {nQuancong =50000},
	[9] = {nDanhvong = 6000, nSumon = 6000, nQuancong = 70000},
	[10] = {nDanhvong = 8000, nSumon = 8000, nQuancong = 100000},
	[11] = {nDanhvong = 10000, nSumon = 10000, nQuancong = 120000},
	[12] = {nDanhvong = 12000, nSumon = 12000, nQuancong = 140000},
--	[13] = {nQuancong = 150000},
	[14] = {nQuancong = 150000},
	[15] = {nDanhvong = 14000, nSumon = 14000},
	[16] = {nDanhvong = 15000, nSumon = 15000, nQuancong = 160000},
	[18] = {nQuancong = 180000},
	[19] = {nQuancong = 200000},
}

tbHanhTrang = {
	[1] = {38,500},
	[2] = { 26,1000},
	[3] = { 26,500},
	[4] = { 26,500},
	[5] = { 26,500},
	[6] = { 26,500},
	[7] = { 26,500},
	[8] = { 26,500},
	[9] = { 26,500},
	[10] = { 26,500},
	[11] = { 26,500},
	[12] = { 26,500},
	[13] = { 26,500},
	[14] = { 26,500},
	[15] = { 26,500},
	[16] = { 26,500},
	[17] = { 26,500},
	[18] = { 26,500},
	[19] = { 26,500},
--	[20] = { 26,500},
}
tbHoTroPhaiMoi = {
	[1] = {80, {item={{gdp={2,1,30071,100}, name="Nh©n S©m V¹n N¨m"}}, fn="AddItem(2,1,30132,8888)"}, 12, 250},
	[2] = {85, {nDanhvong = 2000, nSumon = 2000}, 0,250},
	[3] = {88, {item={{gdp={2,1,30497,100}, name="Ma Tinh"}}, nQuancong = 30000}, 2,250},
	[4] = {90, {item={{gdp={2,1,30071,200}, name="Nh©n S©m V¹n N¨m"}}, fn="ChiTonNew_KichHoatKinhMach(1)"}, 2,250},
	[5] = {96, {nChankhi = 100000}, 2,250},
	[6] = {99, {nCheckExp = 0, item={{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n", nExpired = 60*24*3600}}, nExp=1600000000, fn="ChiTonNew_KichHoatKinhMach(2)"}, 2, 250},
}

tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
	
function ChiTonNewServer_Menu()
	local nIndex = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT)*100 + GetPlayerRebornParam(0)*100 + GetLevel()
	local nStepID = ChiTonNew_GetStep()
	local tbSay = {}
	if nStepID < 19 then
		for i= nStepID, getn(tbMission) do
			if tbMission[i] ~= nil then
				if tbMission[i][1] <= nIndex and nIndex <= tbMission[i][2] then
					tinsert(tbSay, tbMission[i][3].."/#ChiTonNew_NhanNhiemVuTheoLevel("..i..")")
				end
			end
		end
	end
--	if nStepID >= 19 then
--		Talk(1,"","NhiÖm vô chç ta hiÖn thêi ®· hÕt, khi nµo cã nhiÖm vô míi ta sÏ th«ng b¸o cho ng­¬i.")
--		return
--	end
	tinsert(tbSay, "Tr¶  nhiÖm vô ®ang thùc hiÖn/ChiTonNew_TraNhiemVu_Menu")
	tinsert(tbSay, "NhËn hç trî ph¸i míi/ChiTonNew_HoTroPhaiMoi")
	tinsert(tbSay, "NhËn hç trî server míi/ChiTonNew_HoTroServerMoi")
	tinsert(tbSay, "Ta ch­a muèn nhËn/gf_DoNothing")
	Say("NÕu c¸c h¹ thùc hiÖn ®Çy ®ñ yªu cÇu cña ta, phÇn th­ëng sÏ kh«ng nhá.", getn(tbSay), tbSay)
end


function ChiTonNew_NhanNhiemVuTheoLevel(nIndex)
	if ChiTonNew_CheckNewServer() ~= 1 then
		Talk(1,"","C¸c h¹ ch­a kÝch ho¹t tÝnh n¨ng ChÝ T«n V­¬ng LÖnh server míi.")
		return 0
	end
	local nStepID = ChiTonNew_GetStep()
	if nStepID >= nIndex then
		Talk(1,"","C¸c h¹ ®· nhËn hoÆc hoµn thµnh nhiÖm vô nµy")
		return 0
	end
	if nStepID > 0 and GetTask(TSK_CHITONNEW2) > 0 then
		Talk(1,"","NhiÖm vô hiÖn t¹i ch­a xong, c¸c h¹ kh«ng thÓ nhËn nhiÖm vô míi")
		return 0
	end
	VNG_SetTaskPos(TSK_CHITONNEW1, nIndex, 2,1)
	SetTask(TSK_CHITONNEW2, tbMission[nIndex][4])
	Talk(1,"","NhËn nhiÖm vô thµnh c«ng, h·y mau ®i thùc hiÖn")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, tbMission[1][3])
end


function ChiTonNew_TraNhiemVu_Menu()
	if ChiTonNew_CheckNewServer() ~= 1 then
		Talk(1,"","C¸c h¹ ch­a kÝch ho¹t tÝnh n¨ng ChÝ T«n V­¬ng LÖnh server míi.")
		return 0
	end
	local nRoute = GetPlayerRoute() or 0
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ tr¶ nhiÖm vô.")
		return 0
	end
	local nStepID = ChiTonNew_GetStep()
	if tbDieuKienHoanThanh[nStepID] ~= nil then
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbDieuKienHoanThanh[nStepID])
		if nCheck ~= 1 then
			return 0
		end
	end
	local tbSay = {}
--	if tbMissionPart[nStepID] == nil then
--		Talk(1,"","NhiÖm vô kh«ng ®ßi hái thùc hiÖn yªu cÇu kh¸c, h·y mau tr¶ nhiÖm vô.")
--		return 0
--	end
	ChiTonNew_CheckPassivePart()
	local szMsg = "<color=yellow>"..tbMission[nStepID][3].."<color>, c¸c h¹ cÇn ph¶i thùc hiÖn c¸c yªu cÇu sau:\n"
	if tbMissionPart[nStepID] ~= nil then
		for i=1, getn(tbMissionPart[nStepID]) do
			local nPart = VNG_GetTaskPos(TSK_CHITONNEW2, tbMissionPart[nStepID][i][2], tbMissionPart[nStepID][i][3])
			szMsg = szMsg .. i.." - "..tbMissionPart[nStepID][i][1]..": "
			if nPart == 0 then
				szMsg = szMsg .. "<color=green>Hoµn thµnh<color>\n"
			else
				szMsg = szMsg  .. "cßn <color=red>"..nPart.."<color> lÇn\n"
			end
		end
	end
	if GetTask(TSK_CHITONNEW2) == 0 then
		tinsert(tbSay,"NhËn phÇn th­ëng vËt phÈm/ChiTonNew_NhanThuongTheoLevel")
		local nChuyenSinh = GetTranslifeCount()
		if nStepID <= 5 and nStepID >= nChuyenSinh then
			tinsert(tbSay,"NhËn phÇn th­ëng chuyÓn sinh/ChuyenSinhForm")
		end
		tinsert(tbSay, "Ta ch­a muèn nhËn/gf_DoNothing")
		Say("NhiÖm vô ®· hoµn thµnh, h·y mau nhËn th­ëng.", getn(tbSay), tbSay)
	else
		Talk(1,"",szMsg)
	end
end


function ChiTonNew_CheckPassivePart()
	local nStepID = ChiTonNew_GetStep()
	if nStepID == 1 then
		if GetTongName() ~= "" then
			ChiTonNew_SetMissionPart(7)
		end
		if GetSkillLevel(20) > 0 then
			ChiTonNew_SetMissionPart(8)
		end
	elseif nStepID == 2 then
		if mod(GetTask(TASK_VNG_PET), 100) > 0 then
			ChiTonNew_SetMissionPart(5)
		end
	elseif nStepID == 19 then
		if GetTask(TSK_USEFRUIT_FLAG_1) == 1010101010 and GetTask(TSK_USEFRUIT_FLAG_2) == 1010101010 and GetTask(TSK_USEFRUIT_FLAG_3) == 1010101010 and GetTask(TSK_USEFRUIT_FLAG_4) == 1010101010 then
			ChiTonNew_SetMissionPart(3)
		end
		if GetTask(TSK_CS6_TULINH) > 0 then
			ChiTonNew_SetMissionPart(2)
		end
	end
end


function ChiTon_Test()
	local nStepID = ChiTonNew_GetStep()
	local nSubPart = getn(tbMissionPart[nStepID])
	AskClientForNumber("ChiTonNew_SetMissionPart", 1, nSubPart, "(1-"..nSubPart..":")
end


--=================== function phat thuong ==================
function ChiTonNew_NhanThuongTheoLevel()
	local nIndex = ChiTonNew_GetStep()
	if tbChiTonPhanThuong[nIndex] == nil then
		return 0
	end
	if ChiTonNew_CheckNewServer() ~= 1 then
		return 0
	end
	if ChiTonNew_GetAward() >= nIndex then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	if gf_JudgeRoomWeight(tbHanhTrang[nIndex][1],tbHanhTrang[nIndex][2],"") == 0 then
		Talk(1,"","Hµnh trang cÇn <color=yellow>".. tbHanhTrang[nIndex][1] .."<color> « trèng, <color=yellow>".. tbHanhTrang[nIndex][2] .."<color> ®é nÆng, vui lßng s¾p xÕp l¹i")
		return 0
	end
	LIB_Award:Award(tbChiTonPhanThuong[nIndex])
	ChiTonNew_SetAward(nIndex)
	if nIndex > 5 then
		gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "NhËn th­ëng "..tbMission[nIndex][3])
	end
end


function ChiTonNew_PhanThuong99()
	local tbAward = {nCheckExp = 0, 
			item={{gdp={0,105,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Phiªu Vò", nExpired = 30*24*3600}, 
				{gdp={2,0,138,2}, name="B¸t B¶o TÈy Tñy Tiªn §¬n", nExpired = 30*24*3600}, 
				{gdp={2,1,503,4}, name="V« NgÊn Thñy", nExpired = 30*24*3600}},
			nExp = 500000000,
	}
	ChiTonNew_MatTichMonPhai70(10)
	ChiTonNew_YeuQuyet()
	ChiTonNew_MatTichTranPhai()
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(1)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "NhËn th­ëng "..tbMission[1][3])
end


function ChiTonNew_PhanThuong199()
	local tbAward = {nChankhi = 10000}
	ChiTonNew_MatTichMonPhai70(10)
	ChiTonNew_NhanThuongThienNghia()
	ChiTonNew_KichHoatKinhMach(1)
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(2)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "NhËn th­ëng "..tbMission[2][3])
end


function ChiTonNew_PhanThuong299()
	local tbAward = {nCheckExp = 0, nExp = 690000000, nChankhi = 10000}
	ChiTonNew_KichHoatKinhMach(2)
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(3)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "NhËn th­ëng "..tbMission[3][3])
end


function ChiTonNew_PhanThuong399()
	local tbAward = {nCheckExp = 0, nGold = 500000,  nExp = 790000000}
	ChiTonNew_VuKhiCuuChau()
	ChiTonNew_NgocBoiCuuChau()
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(4)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "NhËn th­ëng "..tbMission[4][3])
end


function ChiTonNew_PhanThuong499()
	local tbAward = {nCheckExp = 0, nGold = 500000,  nExp = 1000000000, nChankhi = 20000}
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(5)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "NhËn th­ëng "..tbMission[5][3])
end


--========================
function ChiTonNew_MatTichMonPhai70(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nQty}, name="Kim Cang B¸t Nh· Ch©n QuyÓn"}}},
		[4] = {item={{gdp={0,107,205, nQty}, name="TiÒm Long Tóc DiÖt Ch©n QuyÓn"}}},
		[3] = {item={{gdp={0,107,206, nQty}, name="V« TrÇn Bå §Ò Ch©n QuyÓn"}}},
		[6] = {item={{gdp={0,107,207, nQty}, name="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}},
		[8] = {item={{gdp={0,107,208, nQty}, name="Nh­ ý Kim §Ønh Ch©n QuyÓn"}}},
		[9] = {item={{gdp={0,107,209, nQty}, name="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"}}},
		[11] = {item={{gdp={0,107,210, nQty}, name="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"}}},
		[12] = {item={{gdp={0,107,211, nQty}, name="Quú Thiªn Du Long Ch©n QuyÓn"}}},
		[14] = {item={{gdp={0,107,212, nQty}, name="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"}}},
		[15] = {item={{gdp={0,107,213, nQty}, name="Qu©n Tö §íi Phong Ch©n QuyÓn"}}},
		[17] = {item={{gdp={0,107,214, nQty}, name="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"}}},
		[18] = {item={{gdp={0,107,215, nQty}, name="Xuyªn V©n L¹c Hång Ch©n QuyÓn"}}},
		[20] = {item={{gdp={0,107,216, nQty}, name="HuyÒn Minh Phong Ma Ch©n QuyÓn"}}},
		[21] = {item={{gdp={0,107,217, nQty}, name="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"}}},
		[23] = {item={{gdp={0,107,218, nQty}, name="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}},
		[29] = {item={{gdp={0,107,222, nQty}, name="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}},
		[30] = {item={{gdp={0,107,223, nQty}, name="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end


function ChiTonNew_YeuQuyet()
	local tbYeuQuyet = {
		[2] = {1,10},
		[4] = {11,20},
		[3] = {21,31},
		[6] = {32,46},
		[8] = {47,59},
		[9] = {60,70},
		[11] = {71,79},
		[12] = {80,88},
		[14] = {89,108},
		[15] = {109,119},
		[17] = {120,130},
		[18] = {131,141},
		[20] = {142,154},
		[21] = {155,168},
		[23] = {169,182},
		[29] = {219,229},
		[30] = {230,240},
	}
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		return 0
	end
	for i=tbYeuQuyet[nRoute][1], tbYeuQuyet[nRoute][2] do
		AddItem(2,6,i,1)
	end
end


function ChiTonNew_MatTichTranPhai()
	local tbTranPhai = {
		[2] = {item={{gdp={0, 112, 101, 1}, name= "DÞch C©n Kinh"}}},
		[4] = {item={{gdp={0, 112, 102, 1},name= "Nh­ Lai ThÇn Ch­ëng"}}},
		[3] = {item={{gdp={0, 112, 103, 1},name= "TÈy Tñy Kinh"}}},
		[6] = {item={{gdp={0, 112, 104, 1},name= "HÊp Tinh TrËn"}}},
		[8] = {item={{gdp={0, 112, 105, 1},name= "V¹n T­íng ThÇn C«ng"}}},
		[9] = {item={{gdp={0, 112, 106, 1},name= "Thiªn ¢m TrÊn Hån Khóc"}}},
		[11] = {item={{gdp={0, 112, 107, 1},name= "Gi¸ng Long ThËp B¸t Ch­ëng"}}},
		[12] = {item={{gdp={0, 112, 108, 1},name= "§¶ CÈu C«n TrËn"}}},
		[14] = {item={{gdp={0, 112, 109, 1},name= "V« Th­îng Th¸i Cùc KiÕm"}}},
		[15] = {item={{gdp={0, 112, 110, 1},name= "Th¸i Cùc ThÇn C«ng"}}},
		[17] = {item={{gdp={0, 112, 111, 1},name= "Liªn Hoµn Toµn Long Th­¬ng"}}},
		[18] = {item={{gdp={0, 112, 112, 1},name= "B¸ V­¬ng T­êng Phông TiÔn"}}},
		[20] = {item={{gdp={0, 112, 113, 1},name= "V« Thiªn Ma C«ng"}}},
		[21] = {item={{gdp={0, 112, 114, 1},name= "V« ¶nh Ma Cæ"}}},
		[23] = {item={{gdp={0,112,192,1},name= "Phong L«i Ch©u"}}},
		[29] = {item={{gdp={0,112,196,1},name= "Phông Minh Phæ"}}},
		[30] = {item={{gdp={0,112,197,1},name= "Hoa Tiªn T©m Kinh"}}},
	}
	LIB_Award:AwardByRoute(tbTranPhai)
end


function ChiTonNew_NhanThuongThienNghia()
	local tbThienNghia1_B1 = {item = {
			{gdp={0,100,3034,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3034,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3034,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},
			{gdp={0,100,3037,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3037,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3037,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},},
	}
	local tbThienNghia1_B2 = {item = {
			{gdp={0,100,3040,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3040,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3040,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},
			{gdp={0,100,3043,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3043,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3043,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
				
	}
	local tbThienNghia1_B3 = {item = {
			{gdp={0,100,3046,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3046,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3046,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},
			{gdp={0,100,3049,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3049,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3049,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghia1_B4 = {item = {
			{gdp={0,100,3052,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3052,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3052,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},
			{gdp={0,100,3055,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3055,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3055,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghiaSet1 = {
		[1] = tbThienNghia1_B1,
		[2] = tbThienNghia1_B2,
		[3] = tbThienNghia1_B3,
		[4] = tbThienNghia1_B4,
	}
	local tbNgocBoiThienNghia = {item={
		{gdp={0,102,3122,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thiªn NghÜa- HuyÒn Th¹ch Kim Ngäc"},
		{gdp={0,102,3125,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thiªn NghÜa- PhØ Thóy Ngäc §íi"},
		{gdp={0,102,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thiªn NghÜa- NguyÖt Hoa Thñy Bèi"},
		{gdp={0,102,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thiªn NghÜa- Cöu ¦u Háa Giíi"},
		{gdp={0,102,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thiªn NghÜa- Ng­ng Ngäc Thæ Hoµn"},
	}}
	local VuKhiThienNghia = {
		[2] = {item={{gdp={0,3,8894,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-L­u Ly Giíi §ao"}}},
		[3] = {item={{gdp={0,8,8910,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Kinh L«i ThiÒn Tr­îng"}}},
		[4] = {item={{gdp={0,0,8876,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-L«i ¢m Nang Thñ"}}},
		[6] = {item={{gdp={0,1,8880,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-¢m D­¬ng Xuyªn ¶nh"}}},
		[8] = {item={{gdp={0,2,8887,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Tõ Hµn ¢m KiÕm"}}},
		[9] = {item={{gdp={0,10,8919,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Cöu Hoµn Bèi CÇm"}}},
		[11] = {item={{gdp={0,0,8877,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Quy L©n Hé Thñ"}}},
		[12] = {item={{gdp={0,5,8901,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-TrÊn Ng¹o C«n"}}},
		[14] = {item={{gdp={0,2,8888,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-ThuÇn Phong KiÕm"}}},
		[15] = {item={{gdp={0,9,8915,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Tinh §Èu ChuyÓn Bót"}}},
		[17] = {item={{gdp={0,6,8904,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Ph¸ Qu©n TrËn Th­¬ng"}}},
		[18] = {item={{gdp={0,4,8898,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Truy MÖnh Cung"}}},
		[20] = {item={{gdp={0,7,8907,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-ThiÖp Cèt HuyÕt §ao"}}},
		[21] = {item={{gdp={0,11,8924,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-LuyÖn Hån HuyÕt Tr¶o"}}},
		[23] = {item={{gdp={0,2,8889,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Ngù Thiªn Phong KiÕm"}}},
		[25] = {item={{gdp={0,3,8895,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-ThÇn DiÖm Thiªn §ao"}}},
		[26] = {item={{gdp={0,9,8916,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-ThÇn Phong Ph¸n Bót"}}},
		[27] = {item={{gdp={0,11,8925,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-ThÇn Linh Chó Tr¶o"}}},
		[29] = {item={{gdp={0,13,8931,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Linh Lung Chi"}}},
		[30] = {item={{gdp={0,12,8928,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thiªn NghÜa-Cöu Tiªu S¸o"}}},
	}
	LIB_Award:AwardByBody(tbThienNghiaSet1)
	LIB_Award:Award(tbNgocBoiThienNghia)
	LIB_Award:AwardByRoute(VuKhiThienNghia)
end


function ChiTonNew_KichHoatKinhMach(nMeridianLevel)
	local nCurrentLevel = MeridianGetLevel() + 1
	for i=nCurrentLevel, nMeridianLevel do
		MeridianUpdateLevel()
	end
end


function ChiTonNew_VuKhiCuuChau()
	local tbVuKhiCuuChau = {
		[2] = {item={{gdp={0,3,8932,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-L­u Ly Giíi §ao"}}},
		[4] = {item={{gdp={0,0,8933,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-L«i ¢m Nang Thñ"}}},
		[3] = {item={{gdp={0,8,8934,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Kinh L«i ThiÒn Tr­îng"}}},
		[6] = {item={{gdp={0,1,8935,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-¢m D­¬ng Xuyªn ¶nh"}}},
		[8] = {item={{gdp={0,2,8936,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Tõ Hµn ¢m KiÕm"}}},
		[9] = {item={{gdp={0,10,8937,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu Hoµn Bèi CÇm"}}},
		[11] = {item={{gdp={0,0,8938,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Quy L©n Hé Thñ"}}},
		[12] = {item={{gdp={0,5,8939,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-TrÊn Ng¹o C«n"}}},
		[14] = {item={{gdp={0,2,8940,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-ThuÇn Phong KiÕm"}}},
		[15] = {item={{gdp={0,9,8941,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Tinh §Èu ChuyÓn Bót"}}},
		[17] = {item={{gdp={0,6,8942,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ph¸ Qu©n TrËn Th­¬ng"}}},
		[18] = {item={{gdp={0,4,8943,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Truy MÖnh Cung"}}},
		[20] = {item={{gdp={0,7,8944,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-ThiÖp Cèt HuyÕt §ao"}}},
		[21] = {item={{gdp={0,11,8945,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-LuyÖn Hån HuyÕt Tr¶o"}}},
		[23] = {item={{gdp={0,2,8946,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ngù Thiªn Phong KiÕm"}}},
--		[25] = {item={{gdp={0,3,8947,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-ThÇn DiÖm Thiªn §ao"}}},
--		[26] = {item={{gdp={0,9,8948,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-ThÇn Phong Ph¸n Bót"}}},
--		[27] = {item={{gdp={0,11,8949,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-ThÇn Linh Chó Tr¶o"}}},
		[29] = {item={{gdp={0,13,8950,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Linh Lung Chi"}}},
		[30] = {item={{gdp={0,12,8951,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu Tiªu S¸o"}}},
	}
	LIB_Award:AwardByRoute(tbVuKhiCuuChau)
end


function ChiTonNew_NgocBoiCuuChau()
	local tbNgocBoiCuuChau = {
		[2] = {item={{gdp={0,102,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn"}, {gdp={0,102,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc"}}},
		[3] = {item={{gdp={0,102,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn"}, {gdp={0,102,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}}},
		[4] = {item={{gdp={0,102,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}, {gdp={0,102,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}}},
		[6] = {item={{gdp={0,102,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}, {gdp={0,102,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc"}}},
		[8] = {item={{gdp={0,102,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn"}, {gdp={0,102,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}}},
		[9] = {item={{gdp={0,102,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}, {gdp={0,102,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}}},
		[11] = {item={{gdp={0,102,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn"}, {gdp={0,102,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc"}}},
		[12] = {item={{gdp={0,102,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}, {gdp={0,102,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}}},
		[14] = {item={{gdp={0,102,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}, {gdp={0,102,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}}},
		[15] = {item={{gdp={0,102,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}, {gdp={0,102,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}}},
		[17] = {item={{gdp={0,102,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn"}, {gdp={0,102,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc"}}},
		[18] = {item={{gdp={0,102,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}, {gdp={0,102,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc"}}},
		[20] = {item={{gdp={0,102,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}, {gdp={0,102,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}}},
		[21] = {item={{gdp={0,102,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}, {gdp={0,102,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}}},
		[23] = {item={{gdp={0,102,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-NguyÖt Hoa Thñy Béi"}, {gdp={0,102,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}}},
		[25] = {item={{gdp={0,102,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}, {gdp={0,102,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc"}}},
		[26] = {item={{gdp={0,102,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}, {gdp={0,102,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}}},
		[27] = {item={{gdp={0,102,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn"}, {gdp={0,102,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}}},
		[29] = {item={{gdp={0,102,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-PhØ Thóy Méc §íi"}, {gdp={0,102,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc"}}},
		[30] = {item={{gdp={0,102,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn"}, {gdp={0,102,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Cöu Ch©u-Cöu ¦u Háa Giíi"}}},
	}
	LIB_Award:AwardByRoute(tbNgocBoiCuuChau)
end


--====================== function chuyen sinh ================

function ChuyenSinhForm()
	local nChuyenSinhStep = ChiTonNew_GetStep()
	local nAwardIndex = ChiTonNew_GetAward()
	if nChuyenSinhStep ~= nAwardIndex then
		Talk(1,"","C¸c h¹ h·y nhËn phÇn th­ëng vËt phÈm tr­íc, sau ®ã quay l¹i ®©y.")
		return 0
	end
	local tSay = {
		"V·n bèi muèn tu luyÖn theo h­íng Long Tö!/#ChiTonNew_ChuyenSinh(1,"..nChuyenSinhStep..")",
		"V·n bèi muèn tu luyÖn theo h­íng Hæ Tö!/#ChiTonNew_ChuyenSinh(2,"..nChuyenSinhStep..")",
		"V·n bèi muèn tu luyÖn theo h­íng Phông Tö!/#ChiTonNew_ChuyenSinh(4,"..nChuyenSinhStep..")",
		"V·n bèi muèn tu luyÖn theo h­íng ¦ng Tö!/#ChiTonNew_ChuyenSinh(3,"..nChuyenSinhStep..")",
		"Giíi thiÖu c¸c h­íng tu luyÖn/view_info",
		"V·n bèi suy nghÜ l¹i ®·./nothing",
	}
	Say(szNpcName.."Hçn Nguyªn C«ng thùc chÊt cã 4 h­íng tu luyÖn, ng­¬i muèn theo h­íng nµo?",getn(tSay),tSay)
end


function ChiTonNew_ChuyenSinh(nType, nStep)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc chuyÓn sinh")
		return
	end	
	if nType <= 0 then
		return
	end
	if GetTranslifeCount()	>= nStep then
		Talk(1,"","Ng­¬i ®· luyÖn thµnh bÝ kÝp chuyÓn sinh nµy, kh«ng thÓ luyÖn l¹i.")
		return
	end
	if gf_JudgeRoomWeight(5,300,szNpcName) == 0 then
		return
	end
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	
	local nRoute = GetPlayerRoute()
	-- Set sè lÇn chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, nStep)
	-- Set h­íng chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	local nTransCount = nStep
--	if GetTranslifeCount() == 1 then			
--		local nTransCount = GetTranslifeCount()	
	if nTransCount == 1 then
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nhËn ngo¹i trang",0,1)
		end
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		if GetStoreBoxPageCount() < 4 then
			SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		end
		SetTaskTrans()
		ResetProperty()
		SetLevel(90,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø nhÊt...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 2 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
--	elseif GetTranslifeCount() == 2 then		
	elseif nTransCount  == 2 then		
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nhËn ngo¹i trang",0,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
--		SetTaskTrans()
		ResetProperty()
		SetLevel(88,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø hai...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 4 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
--	elseif GetTranslifeCount() ==3 then
	elseif nTransCount  ==3 then
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, Pnew, nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"V¨n Sö Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
--		SetTaskTrans()
		ResetProperty()
		SetLevel(86,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø ba...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 6 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
--	elseif GetTranslifeCount() == 4 then
	elseif nTransCount == 4 then
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (561 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Thiªn ¢m Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
--		SetTaskTrans()
		ResetProperty()
		SetLevel(84,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø t­...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 8 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
--	elseif  GetTranslifeCount() == 5 and GetTaskTrans() == 36 then
	elseif  nTransCount == 5 then
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 561 + GetBody()
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
--		SetTaskTrans()
		ResetProperty()
		SetLevel(79,0)
		Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø t­...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 8 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	else
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng qu¶ lµ tuyÖt thÕ vâ c«ng cña trung nguyªn!")
		return
	end	
end


function ChiTonNew_HoTroPhaiMoi()
	local nServerID = GetGlbValue(1023)
	if ChiTonNew_CheckNewServer() ~= 1 then
		return 0
	end
	local nRoute = GetPlayerRoute()
	if nRoute ~= 23 and nRoute ~= 29 and nRoute ~= 30 then
		Talk(1,"","Hç trî nµy chØ dµnh cho <color=yellow>C«n L«n Thiªn S­, Thóy Yªn Vò Tiªn vµ Thóy Yªn Linh N÷<color>.")
		return 0
	end
	local tbSay = {}
	for i=1, getn(tbHoTroPhaiMoi) do
		tinsert(tbSay, "NhËn hç trî ®¼ng cÊp "..tbHoTroPhaiMoi[i][1].."/#ChiTonNew_HoTroPhaiMoi_Nhan("..i..")")
	end
	tinsert(tbSay, "Ta ch­a muèn nhËn/gf_DoNothing")
	Say("Ta muèn chia sÎ khã kh¨n víi mét sè m«n ph¸i cßn non trÎ trªn giang hå. Ng­¬i h·y nhËn lÊy hç trî, ®õng ng¹i.", getn(tbSay), tbSay)
end


function ChiTonNew_HoTroPhaiMoi_Nhan(nIndex)
	if gf_GetTaskBit(TSK_CHITONNEW3, nIndex) == 1 then
		Talk(1,"","PhÇn hç trî nµy ng­¬i ®· nhËn råi, kh«ng thÓ nhËn thªm lÇn n÷a.")
		return 0
	end
	if GetLevel() < tbHoTroPhaiMoi[nIndex][1] then
		Talk(1,"","§¼ng cÊp hiÖn t¹i cña ng­¬i ch­a thÓ nhËn hç trî, h·y cè g¾ng thªm.")
		return 0
	end
	if gf_Judge_Room_Weight(tbHoTroPhaiMoi[nIndex][3], tbHoTroPhaiMoi[nIndex][4]) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	LIB_Award:Award(tbHoTroPhaiMoi[nIndex][2])
	gf_SetTaskBit(TSK_CHITONNEW3, nIndex, 1, 0)
	Talk(1,"","NhËn thµnh c«ng phÇn hç trî m«n ph¸i míi.")
end


function ChiTonNew_ThuongTraiCay()
	for i = 30164, 30183 do
		AddItem(2,1,i,40)
	end
end


function ChiTonNew_NonDieuDuong()
	local tbItem = {
		[1] = {
			[2] = {item={{gdp={0,103,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o"}}},
			[4] = {item={{gdp={0,103,3130,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o"}}},
			[3] = {item={{gdp={0,103,3132,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o"}}},
			[6] = {item={{gdp={0,103,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"}}},
			[11] = {item={{gdp={0,103,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"}}},
			[12] = {item={{gdp={0,103,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt C©n"}}},
			[14] = {item={{gdp={0,103,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"}}},
			[15] = {item={{gdp={0,103,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"}}},
			[18] = {item={{gdp={0,103,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"}}},
			[20] = {item={{gdp={0,103,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"}}},
			[21] = {item={{gdp={0,103,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"}}},
			[23] = {item={{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n"}}},
			[25] = {item={{gdp={0,103,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"}}},
			[26] = {item={{gdp={0,103,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"}}},
			[27] = {item={{gdp={0,103,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,103,3129,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o"}}},
			[4] = {item={{gdp={0,103,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o"}}},
			[3] = {item={{gdp={0,103,3133,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o"}}},
			[6] = {item={{gdp={0,103,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"}}},
			[11] = {item={{gdp={0,103,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"}}},
			[12] = {item={{gdp={0,103,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt C©n"}}},
			[14] = {item={{gdp={0,103,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"}}},
			[15] = {item={{gdp={0,103,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"}}},
			[18] = {item={{gdp={0,103,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"}}},
			[20] = {item={{gdp={0,103,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"}}},
			[21] = {item={{gdp={0,103,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"}}},
			[23] = {item={{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n"}}},
			[25] = {item={{gdp={0,103,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"}}},
			[26] = {item={{gdp={0,103,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"}}},
			[27] = {item={{gdp={0,103,3185,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,103,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"}}},
			[8] = {item={{gdp={0,103,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m"}}},
			[9] = {item={{gdp={0,103,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m"}}},
			[11] = {item={{gdp={0,103,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"}}},
			[12] = {item={{gdp={0,103,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt C©n"}}},
			[14] = {item={{gdp={0,103,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"}}},
			[15] = {item={{gdp={0,103,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"}}},
			[18] = {item={{gdp={0,103,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"}}},
			[20] = {item={{gdp={0,103,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"}}},
			[21] = {item={{gdp={0,103,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"}}},
			[25] = {item={{gdp={0,103,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"}}},
			[26] = {item={{gdp={0,103,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"}}},
			[27] = {item={{gdp={0,103,3186,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"}}},
			[29] = {item={{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m"}}},
			[30] = {item={{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,103,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"}}},
			[8] = {item={{gdp={0,103,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m"}}},
			[9] = {item={{gdp={0,103,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m"}}},
			[11] = {item={{gdp={0,103,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"}}},
			[12] = {item={{gdp={0,103,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt C©n"}}},
			[14] = {item={{gdp={0,103,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"}}},
			[15] = {item={{gdp={0,103,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"}}},
			[18] = {item={{gdp={0,103,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"}}},
			[20] = {item={{gdp={0,103,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"}}},
			[21] = {item={{gdp={0,103,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n"}}},
			[25] = {item={{gdp={0,103,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n"}}},
			[26] = {item={{gdp={0,103,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n"}}},
			[27] = {item={{gdp={0,103,3187,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n"}}},
			[29] = {item={{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m"}}},
			[30] = {item={{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m"}}},
		}
	}
	local nBody = GetBody()
	LIB_Award:AwardByRoute(tbItem[nBody])
end


function ChiTonNew_AoDieuDuong()
	tbItem = {
		[1] = {
			[2] = {item={{gdp={0,100,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo"}}},
			[4] = {item={{gdp={0,100,3130,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo"}}},
			[3] = {item={{gdp={0,100,3132,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo"}}},
			[6] = {item={{gdp={0,100,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"}}},
			[11] = {item={{gdp={0,100,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"}}},
			[12] = {item={{gdp={0,100,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Y"}}},
			[14] = {item={{gdp={0,100,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"}}},
			[15] = {item={{gdp={0,100,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"}}},
			[17] = {item={{gdp={0,100,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"}}},
			[18] = {item={{gdp={0,100,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"}}},
			[20] = {item={{gdp={0,100,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"}}},
			[21] = {item={{gdp={0,100,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"}}},
			[23] = {item={{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo"}}},
			[25] = {item={{gdp={0,100,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"}}},
			[26] = {item={{gdp={0,100,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"}}},
			[27] = {item={{gdp={0,100,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,100,3129,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo"}}},
			[4] = {item={{gdp={0,100,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo"}}},
			[3] = {item={{gdp={0,100,3133,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo"}}},
			[6] = {item={{gdp={0,100,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"}}},
			[11] = {item={{gdp={0,100,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"}}},
			[12] = {item={{gdp={0,100,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Y"}}},
			[14] = {item={{gdp={0,100,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"}}},
			[15] = {item={{gdp={0,100,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"}}},
			[17] = {item={{gdp={0,100,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"}}},
			[18] = {item={{gdp={0,100,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"}}},
			[20] = {item={{gdp={0,100,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"}}},
			[21] = {item={{gdp={0,100,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"}}},
			[23] = {item={{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo"}}},
			[25] = {item={{gdp={0,100,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"}}},
			[26] = {item={{gdp={0,100,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"}}},
			[27] = {item={{gdp={0,100,3185,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,100,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"}}},
			[8] = {item={{gdp={0,100,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt V©n Th¸nh C« Y"}}},
			[9] = {item={{gdp={0,100,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y"}}},
			[11] = {item={{gdp={0,100,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"}}},
			[12] = {item={{gdp={0,100,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Y"}}},
			[14] = {item={{gdp={0,100,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"}}},
			[15] = {item={{gdp={0,100,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"}}},
			[17] = {item={{gdp={0,100,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"}}},
			[18] = {item={{gdp={0,100,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"}}},
			[20] = {item={{gdp={0,100,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"}}},
			[21] = {item={{gdp={0,100,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"}}},
			[25] = {item={{gdp={0,100,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"}}},
			[26] = {item={{gdp={0,100,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"}}},
			[27] = {item={{gdp={0,100,3186,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"}}},
			[29] = {item={{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Tª V©n Tiªn Tö Y"}}},
			[30] = {item={{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Phi H¹ Tiªn Tö Y"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,100,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"}}},
			[8] = {item={{gdp={0,100,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt V©n Th¸nh C« Y"}}},
			[9] = {item={{gdp={0,100,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y"}}},
			[11] = {item={{gdp={0,100,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"}}},
			[12] = {item={{gdp={0,100,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Y"}}},
			[14] = {item={{gdp={0,100,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"}}},
			[15] = {item={{gdp={0,100,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"}}},
			[17] = {item={{gdp={0,100,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"}}},
			[18] = {item={{gdp={0,100,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"}}},
			[20] = {item={{gdp={0,100,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"}}},
			[21] = {item={{gdp={0,100,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y"}}},
			[25] = {item={{gdp={0,100,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y"}}},
			[26] = {item={{gdp={0,100,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo"}}},
			[27] = {item={{gdp={0,100,3187,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo"}}},
			[29] = {item={{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Tª V©n Tiªn Tö Y"}}},
			[30] = {item={{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Phi H¹ Tiªn Tö Y"}}},
		},
	}
	local nBody = GetBody()
	LIB_Award:AwardByRoute(tbItem[nBody])
end


function ChiTonNew_QuanDieuDuong()
	local tbItem = {
		[1] = {
			[2] = {item={{gdp={0,101,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"}}},
			[4] = {item={{gdp={0,101,3130,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"}}},
			[3] = {item={{gdp={0,101,3132,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"}}},
			[6] = {item={{gdp={0,101,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"}}},
			[11] = {item={{gdp={0,101,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"}}},
			[12] = {item={{gdp={0,101,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Trang"}}},
			[14] = {item={{gdp={0,101,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"}}},
			[15] = {item={{gdp={0,101,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"}}},
			[17] = {item={{gdp={0,101,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"}}},
			[18] = {item={{gdp={0,101,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"}}},
			[20] = {item={{gdp={0,101,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"}}},
			[21] = {item={{gdp={0,101,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"}}},
			[23] = {item={{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"}}},
			[25] = {item={{gdp={0,101,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"}}},
			[26] = {item={{gdp={0,101,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"}}},
			[27] = {item={{gdp={0,101,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,101,3129,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"}}},
			[4] = {item={{gdp={0,101,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"}}},
			[3] = {item={{gdp={0,101,3133,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"}}},
			[6] = {item={{gdp={0,101,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"}}},
			[11] = {item={{gdp={0,101,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"}}},
			[12] = {item={{gdp={0,101,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Trang"}}},
			[14] = {item={{gdp={0,101,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"}}},
			[15] = {item={{gdp={0,101,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"}}},
			[17] = {item={{gdp={0,101,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"}}},
			[18] = {item={{gdp={0,101,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"}}},
			[20] = {item={{gdp={0,101,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"}}},
			[21] = {item={{gdp={0,101,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"}}},
			[23] = {item={{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"}}},
			[25] = {item={{gdp={0,101,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"}}},
			[26] = {item={{gdp={0,101,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"}}},
			[27] = {item={{gdp={0,101,3185,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,101,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"}}},
			[8] = {item={{gdp={0,101,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"}}},
			[9] = {item={{gdp={0,101,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"}}},
			[11] = {item={{gdp={0,101,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"}}},
			[12] = {item={{gdp={0,101,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Trang"}}},
			[14] = {item={{gdp={0,101,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"}}},
			[15] = {item={{gdp={0,101,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"}}},
			[17] = {item={{gdp={0,101,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"}}},
			[18] = {item={{gdp={0,101,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"}}},
			[20] = {item={{gdp={0,101,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"}}},
			[21] = {item={{gdp={0,101,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"}}},
			[25] = {item={{gdp={0,101,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"}}},
			[26] = {item={{gdp={0,101,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"}}},
			[27] = {item={{gdp={0,101,3186,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"}}},
			[29] = {item={{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"}}},
			[30] = {item={{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Phi H¹ Tiªn Tö"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,101,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"}}},
			[8] = {item={{gdp={0,101,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"}}},
			[9] = {item={{gdp={0,101,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"}}},
			[11] = {item={{gdp={0,101,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"}}},
			[12] = {item={{gdp={0,101,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt Trang"}}},
			[14] = {item={{gdp={0,101,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"}}},
			[15] = {item={{gdp={0,101,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"}}},
			[17] = {item={{gdp={0,101,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"}}},
			[18] = {item={{gdp={0,101,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"}}},
			[20] = {item={{gdp={0,101,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"}}},
			[21] = {item={{gdp={0,101,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"}}},
			[25] = {item={{gdp={0,101,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"}}},
			[26] = {item={{gdp={0,101,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"}}},
			[27] = {item={{gdp={0,101,3187,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"}}},
			[29] = {item={{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"}}},
			[30] = {item={{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Phi H¹ Tiªn Tö"}}},
		},
	}
	local nBody = GetBody()
	LIB_Award:AwardByRoute(tbItem[nBody])
end


function ChiTonNew_VuKhiDieuDuong()
	local tbItem = {
		[2] = {item={{gdp={0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é N¹n T«n Gi¶ PhËt §ao"}}},
		[4] = {item={{gdp={0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é KiÕp T«n Gi¶ PhËt Thñ"}}},
		[3] = {item={{gdp={0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§é ¸ch T«n Gi¶ PhËt Tr­îng"}}},
		[6] = {item={{gdp={0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Tr©m"}}},
		[8] = {item={{gdp={0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt V©n Th¸nh C« Liªn KiÕm"}}},
		[9] = {item={{gdp={0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-PhËt TrÇn Th¸nh C« CÇm"}}},
		[11] = {item={{gdp={0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Trôc Phông Thiªn C¸i Thñ"}}},
		[12] = {item={{gdp={0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Du Long §Þa KhÊt C«n"}}},
		[14] = {item={{gdp={0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-V« Cùc Thiªn T«n Tóc KiÕm"}}},
		[15] = {item={{gdp={0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bót"}}},
		[17] = {item={{gdp={0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-C¶m Thiªn §Êu Hån Th­¬ng"}}},
		[18] = {item={{gdp={0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Cung"}}},
		[20] = {item={{gdp={0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Quû Xóc Tµ ThÇn §ao"}}},
		[21] = {item={{gdp={0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Vu Cèt §éc V­¬ng Tr¶o"}}},
		[23] = {item={{gdp={0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-BÊt §éng Ch©n Tiªn KiÕm"}}},
		[25] = {item={{gdp={0,3,9007,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn §ao"}}},
		[26] = {item={{gdp={0,9,9008,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Cöu Thiªn Quû Phï Bót"}}},
		[27] = {item={{gdp={0,11,9009,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Tr¶o"}}},
		[29] = {item={{gdp={0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Tª V©n Tiªn Tö PhiÕn"}}},
		[30] = {item={{gdp={0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-Phi H¹ Tiªn Tö ¦u Lan Tiªu"}}},
	}
	LIB_Award:AwardByRoute(tbItem)
end


function ChiTonNew_HoanThanhPS1Part1()
	SetTask(TSK_CS6_COUNTA, 1501503030)
	SetTask(TSK_CS6_COUNTB, 1601503030)
	SetTask(TSK_CS6_TULINH,2)
	TaskTip("Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i !!!!")
end


function GetOnlineTime()
	if GetTask(IP_ONLINE_TIME) > IP_TIME_LIMIT then
		SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)
	end
	return GetTask(IP_ONLINE_TIME);
end


function SetOnlineTime(nSec,nType)
	if nType == 1 then
		if GetOnlineTime() + nSec < IP_TIME_LIMIT then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() + nSec)
		else
			SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)
		end	
	elseif nType == 2 then
		if GetTask(IP_ONLINE_TIME) - nSec >= 0 then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() - nSec)
		end
	end
	return GetTask(IP_ONLINE_TIME);
end


function ChiTonNew_HoTroServerMoi()
	local nIndex = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT)*100 + GetLevel()
	if nIndex < 191 then
		Talk(1,"","Ta chØ hç trî nÕu c¸c h¹ ®· chuyÓn sinh 1 cÊp ®é 91 trë lªn. H·y cè g¾ng thªm nhÐ.")
		return 0
	end
	if ChiTonNew_CheckNewServer() ~= 1 then
		Talk(1,"","§iÒu kiÖn nhËn th­ëng kh«ng phï hîp. H·y xem l¹i quèc tÞch hoÆc ®iÒu kiÖn kÝch ho¹t ChÝ T«n V­¬ng LÖnh.")
		return 0
	end
	if gf_GetTaskBit(TSK_CHITONNEW3, 8) ~= 0 then
		Talk(1,"","PhÇn th­ëng h«m nay ®· ®­îc nhËn, ng­¬i h·y quay l¹i sau nhÐ.")
		return 0
	end
	if GetOnlineTime() < 2*3600 then
		Talk(1,"","TÝch lòy online ch­a ®ñ 2 giê..")
		return 0
	end
	local tbAward = {nGold = 120000}
	local nBachCau1, nTamThanh1, nLucThan1, nTuLinh1 = 120, 120, 120, 120
	SetTask(2501, GetTask(2501) + nBachCau1)
	EatSanqin(1,120)
	EatLiushen(1,nLucThan1)
	SetTask(3105, GetTask(3105) + nTuLinh1, 8)
	LIB_Award:Award(tbAward)
	SetOnlineTime(2*3600,2)
	gf_SetTaskBit(TSK_CHITONNEW3,8,1,0)
end