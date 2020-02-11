Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");
DIEUDUONG2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\dieuduong2chiencuong.lua"
BKVD2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\bachkimviemde2chiencuong.lua"
DIEUDUONG2CHIENCUONG_FILE2 = "\\script\\vng\\weapon_upgrade\\dieuduong2chiencuong_3.lua"
NGULONG2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\ngulong2chiencuong.lua"
THUONGUNG2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\thuongung2chiencuong.lua"



LIB_Award.szLogTitle = "TRANG BI CHIEN CUONG"
LIB_Award.szLogAction = "nhËn"

tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}

tbChienCuongNguyenLieu = {
	[1] = {item={{gdp={2,95,204,2}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,2}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,1005,6}, name="ChiÕn ThÇn Hoµn"}, {gdp={2,1,30499,50}, name="Hu©n Ch­¬ng Anh Hïng"}}},
	[2] = {item={{gdp={2,95,204,2}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,2}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,1005,6}, name="ChiÕn ThÇn Hoµn"}, {gdp={2,1,30499,50}, name="Hu©n Ch­¬ng Anh Hïng"}}},
	[3] = {item={{gdp={2,95,204,2}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,2}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,1005,6}, name="ChiÕn ThÇn Hoµn"}, {gdp={2,1,30499,50}, name="Hu©n Ch­¬ng Anh Hïng"}}},
	[4] = {item={{gdp={2,95,204,2}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,2}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,1005,9}, name="ChiÕn ThÇn Hoµn"}, {gdp={2,1,30499,50}, name="Hu©n Ch­¬ng Anh Hïng"}}},
}

function TrangBiChienCuong_Form()
	local nDate = tonumber(date("%Y%m%d"))
	local szTitle = "C¸c h¹ cã thÓ ®æi trang bÞ ChiÕn Cuång b»ng nhiÒu c¸ch:\n"
	local tbSay = {}
	tinsert(tbSay, "§æi b»ng Thiªn M«n Kim LÖnh vµ Thiªn Cang LÖnh/TrangBiChienCuong_CongThuc1")
	tinsert(tbSay, "N©ng cÊp tõ trang bÞ DiÖu D­¬ng nhËn ChiÕn Cuång/TrangBiChienCuong_CongThuc2_Form")
	if nDate <= 20140412 then
		tinsert(tbSay, "N©ng cÊp tõ trang bÞ DiÖu D­¬ng nhËn ChiÕn Cuång +10/TrangBiChienCuong_CongThuc3_Form")
	end
	tinsert(tbSay, "§æi b»ng trang bÞ B¹ch Kim Viªm §Õ/BKVD2ChienCuong_Form")
	tinsert(tbSay, "N©ng cÊp tõ trang bÞ Ngù Long T­íng Qu©n/NguLong2ChienCuong_Form")
	tinsert(tbSay, "N©ng cÊp tõ trang bÞ Th­¬ng ¦ng T­íng Qu©n/ThuongUng2ChienCuong_Form")

	tinsert(tbSay, "Ta ch­a muèn n©ng cÊp/gf_DoNothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function NguLong2ChienCuong_Form()
	local szSay = "§æi trang bÞ ChiÕn Cuång +0 tõ trang bÞ Ngù Long T­íng Qu©n cÇn:\n"
	szSay = szSay .. "+ Trang bÞ: Nãn, ¸o, quÇn Ngù Long T­íng Qu©n +11, 4 ChiÕn ThÇn Hoµn, 100 Huy Ch­¬ng Dòng SÜ.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ®ång ý ®æi/NguLong2ChienCuong")
	tinsert(tbSay, "Ta muèn suy nghÜ thªm/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end

function NguLong2ChienCuong()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi trang bÞ ChiÕn Cuång.")
		return 0
	end
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NGULONG2CHIENCUONG_FILE, 1)
end

function ThuongUng2ChienCuong_Form()
	local szSay = "§æi trang bÞ ChiÕn Cuång +10 tõ trang bÞ Th­¬ng ¦ng T­íng Qu©n cÇn:\n"
	szSay = szSay .. "+ Trang bÞ: Nãn, ¸o, quÇn Th­¬ng ¦ng T­íng Qu©n +11, 3 ChiÕn ThÇn Hoµn, 100 Huy Ch­¬ng Dòng SÜ.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ®ång ý ®æi/ThuongUng2ChienCuong")
	tinsert(tbSay, "Ta muèn suy nghÜ thªm/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end

function ThuongUng2ChienCuong()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi trang bÞ ChiÕn Cuång.")
		return 0
	end
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", THUONGUNG2CHIENCUONG_FILE, 1)
end

function TrangBiChienCuong_CongThuc1()
	local szTitle = "§æi trang bÞ ChiÕn Cuång cÇn:\n- §Çu Qu¸n, Th­îng Y, H¹ Y: 2 Thiªn Cang LÖnh + 2 Thiªn M«n Kim LÖnh + 6 ChiÕn ThÇn Hoµn + 50 Hu©n Ch­¬ng Anh Hïng\n - Vò khÝ: 2 Thiªn Cang LÖnh + 2 Thiªn M«n Kim LÖnh + 9 ChiÕn ThÇn Hoµn + 50 Hu©n Ch­¬ng Anh Hïng"
	local tbSay = {
		"Ta muèn lÊy §Çu Qu¸n/#ChienCuong_DoiTrangBi(1)",
		"Ta muèn lÊy Th­îng Y/#ChienCuong_DoiTrangBi(2)",
		"Ta muèn lÊy H¹ Trang/#ChienCuong_DoiTrangBi(3)",
		"Ta muèn lÊy Vò KhÝ/#ChienCuong_DoiTrangBi(4)",
		"Ta ®Õn xem th«i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end

function TrangBiChienCuong_CongThuc2()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi trang bÞ ChiÕn Cuång.")
		return 0
	end
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", DIEUDUONG2CHIENCUONG_FILE, 1)
end



function ChienCuong_DoiTrangBi(nOption)
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi trang bÞ ChiÕn Cuång.")
		return 0
	end
	if tbChienCuongNguyenLieu[nOption] == nil then
		print("NGUYEN LIEU KHONG DUNG")
		return 0
	end
	if gf_Judge_Room_Weight(1, 250) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbChienCuongNguyenLieu[nOption])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbChienCuongNguyenLieu[nOption])
	local nBody = GetBody()
	if nOption == 1 then
		LIB_Award:AwardByRoute(tbTrangBiChienCuong[103][nBody])
	elseif nOption == 2 then
		LIB_Award:AwardByRoute(tbTrangBiChienCuong[100][nBody])
	elseif nOption == 3 then
		LIB_Award:AwardByRoute(tbTrangBiChienCuong[101][nBody])
	elseif nOption == 4 then
		LIB_Award:AwardByRoute(tbVuKhiChienCuong[nBody])
	end
end


function TrangBiChienCuong_CongThuc2_Form()
	local szSay = "§æi trang bÞ ChiÕn Cuång tõ trang bÞ DiÖu D­¬ng cÇn:\n"
	szSay = szSay .. "+ Trang bÞ: Nãn, ¸o, quÇn DiÖu D­¬ng +13 trë lªn, 1 Thiªn Cang LÖnh, 1 Thiªn M«n Kim LÖnh, 5 ChiÕn ThÇn Hoµn, 50 Hu©n Ch­¬ng Anh Hïng.\n"
	szSay = szSay .. "+ Vò khÝ: Vò khÝ DiÖu D­¬ng +13 trë lªn, 1 Thiªn Cang LÖnh, 1 Thiªn M«n Kim LÖnh, 7 ChiÕn ThÇn Hoµn, 50 Hu©n Ch­¬ng Anh Hïng.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ®ång ý ®æi/TrangBiChienCuong_CongThuc2")
	tinsert(tbSay, "Ta muèn suy nghÜ thªm/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end


function TrangBiChienCuong_CongThuc2()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi trang bÞ ChiÕn Cuång.")
		return 0
	end
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", DIEUDUONG2CHIENCUONG_FILE, 1)
end


function TrangBiChienCuong_CongThuc3_Form()
	local szSay = "§æi trang bÞ ChiÕn Cuång +10 tõ trang bÞ DiÖu D­¬ng cÇn:\n"
	szSay = szSay .. "+ Trang bÞ: Nãn, ¸o, quÇn DiÖu D­¬ng +13, 19 Thiªn Th¹ch Tinh Th¹ch, 19 Hu©n Ch­¬ng Anh Hïng, 6 ChiÕn ThÇn Hoµn.\n"
	szSay = szSay .. "+ Vò khÝ: Vò khÝ DiÖu D­¬ng +13, 44 Thiªn Th¹ch Tinh Th¹ch, 44 Hu©n Ch­¬ng Anh Hïng, 11 ChiÕn ThÇn Hoµn.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ®ång ý ®æi/TrangBiChienCuong_CongThuc3")
	tinsert(tbSay, "Ta muèn suy nghÜ thªm/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end


function TrangBiChienCuong_CongThuc3()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20140412 then
		return 0
	end
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi trang bÞ ChiÕn Cuång.")
		return 0
	end
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", DIEUDUONG2CHIENCUONG_FILE2, 1)
end


function BKVD2ChienCuong_Form()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi trang bÞ ChiÕn Cuång.")
		return 0
	end
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", BKVD2CHIENCUONG_FILE, 1)
end