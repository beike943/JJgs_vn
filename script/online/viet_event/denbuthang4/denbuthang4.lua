Include("\\script\\lib\\globalfunctions.lua");

function DenBuThang4()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	
	local TSK_DENBU = 2700
	local nFreeSlotRequire = 3
	local nWeightRequire = 200
	
	--local nCountry = GetByte(GetTask(2280),1)
	local nServerID =  GetGlbValue(GLB_TSK_SERVER_ID)
	local szAccount = GetAccount()
	local szRole = GetName()
	local nCheckListMatTich = 0
	local nCheckListBKL = 0
	local nCheckListViemDe = 0
	local nCheckListTrangSuc = 0
	
	-- Danh sach nhan den bu mat tich
	local tbNhanMatTich = {
			{66, 'depzai2906', 's2ChamHet'},
			{35, 'luctieuphung202', 'J2xKuLak'},
			{8, 'anhkhoa0988350778', 'zIoChemMuonoooo'},
			{9, 'volam2247684', 'oozLouisXaVizoo'},
			{62, 'conag1102', 'xYzSirAlanzYx'},
			{50, 'trieulongphi037374', 'TrungSieuCuiChuoi'},
			{62, 'coolnt0317', 'oLangTuMienTay'},
			{16, 'hoangkim721', 'jZoThanhLongNhi'},
			{32, 'slowlove0407', 's2TÝmB»ngL¨ng'},
			{24, 'hoithegiantienlagi12', 'ChienthanNo1'},
			{10, 'volam2192620', 'oMightyMouse'},
			{17, 'danhvahuy95', 'RuuQuenSau'},
			{5, 'trungkhoa8888', 'XxCarloTevezxX'},
			{47, 'a2hoanghuy', 'o0oLongextended'}
		}
		
	-- Danh sach nhan den bu BKL
	local tbNhanBKL = {
			{50, 'bklb160hcm', 'VoBeHoaAnhHung'},
			{24, 'ferrari4500', 'LamborGhini49PL'},
			{33, 'nh0ck0n129', 'zPinez'},
			{24, 'becayacc2013', 'RNeverGrief'},
			{60, 'meoyeu140593', 'oMeoSieuNhan'},
			{24, 'truongthison0199', 'zINiKiTa'},
			{33, 'tuanmobi1259', 'oITuongTu'},
			{43, 'luckyluckylove', 'RhythmOfTheKiss'},
			{19, 'caytkiem010', 'iiKiemKhach'},
			{43, 'votinhcuocmc9x', 'IzoBeKhang'},
			{63, 'volam2366206', 'zIzCrazylnLove'},
			{53, 'brazil', 'IzPeOiYeuAnhNaz'},
			{62, 'volam2361483', 'BachLienThanhNu'},
			{58, 'hongthitandat1988', 'iZBeLun902'},
			{43, 'thichduthu007', 'oBaByNgaMiLoVe'},
			{32, 'papadepdzaiz', 'iDeTuHoaAnhHung'},
			{24, 'dilamtien1', 'NguyenVuTueNhi'},
			{43, 'vietnamno1', 'IzoBeDep'},
			{16, 'vl2thanhtv01', 'xxAljsa'},
			{16, 'vanminh8318', 'jzoshina'},
			{16, 'hòangkiml?nh721', 'jzoThanhLong Nhi'},
			{16, 'volam2126707', 'izPechandai1m20'},
			{16, 'denis7', 'oVuaBoCap'},
			{50, 'thientv108406', 'AzPhatxjtzAz'},
			{16, 'hoangkimlenh', 'YogoWolves'},
			{16, 'letuyetnhi10', 'mrsonglong'},
			{28, 'phanthanhhuong22485', 'PhanThanhH­¬ng'},
			{28, 'koluadoiphunu', 'BïiThÞThanhNhµn'},
			{28, 'drhoangky', 'hoangky'},
			{14, 'volam2361483', 'xXxBachYenxXx'},
			{50, 'anhtunhtq1', 'iLacThan'},
			{50, 'heavenm', 'iHoaDaQuy'},
			{50, 'thientv108406', 'AzPhatxjtzAz'},
			{50, 'nltl004830', 'onggiahamzui'},
			{43, 'ngocnhu', 'zIzEiveMsTrang'},
			{22, 'nambep85', 'z7zHungThanz7z'},
			{43, 'haclonghoangkim', '§øcKhènN¹n'},
			{26, 'subakhatmau1405', 'iiPessSj'},
			{12, 'thienbao2192', 'oS2oPeMioX3oo'},
			{32, 'colam2061632206', 'oooNgheTiengGio'},
			{6, 'nhtl044567', 'xxxPhungTienxxx'},
			{2, 'daituongquan198300', 'buonlaumatuy'},
			{6, 'tieuthuutle', 'o8oKwonYuri'},
			{6, 'congtan', '011087'},
			{6, 'tieuthienlum', '080HyoYeon'},
			{6, 'longuy191179', 'longuy'},
			{6, 'dulichle', 'thiêndi'},
			{22, 'tieumai768 ', 'x0xMrHAOCUTEx0x'},
			{22, 'canhcut88', 'canhcut88'},
			{22, 'nhutnam4', 'TiªuCh¸nhNam'},
			{13, 'elnino779', 'mrskasekell'},
			{13, 'xyzphongthancueczyx', 'joophoykk'},
			{13, 'handoivodolithu91', 'oLongHoTanSat'},
			{62, 'trungticts', 'BachSau'},
			{62, 'kiki12345678910vn', 'zzTienPhong'},
			{62, 'biwantuando', 'jDiepMocSon'},
			{47, 'tkh999', 'izBachQuanLang'},
			{47, 'khongconaidedanh', 'IzTonNgoKhongIz'},
			{19, 'minchan1211', 'ooTieuBaoBoi'},
			{7, 'chungtancan01', 'sososos1'},
			{1, 'ammacong25', 'zzCryForYouzz'},
			{63, 'colamdenhi871', 'ZAthena'},
			{63, 'emansuongdem2009', 'LazyOldmanCbb'},
			{8, 'zzzrognxinhzzz', '01dancerock10'},
			{33, 'tyxixon', 'KyNuThaoCam'},
			{33, 'benu1009', 'iDaiKaRan'},
--			{29, 'comalop2210', 'ZoZlãngt?ZoZ'},
			{4, 'hoohodiep218', 'Boomerang'},
			{4, 'tinhyeucuatoithatdep', 'kyvophong'},
--			{35, 'ttnh1977', 'Phongbathiêns?999'},
			{35, 'ttuhihcm', 'phongbahasu999'},
			{35, 'dungcodongtuesss', 'ThieuThan999'},
			{39, 'maingoccanh', 'IIzVoTinh'},
			{39, 'volam2280604', 'szWhyAlwayMe'},
			{47, 'giangsinhdautienhappy', 'GenjuroKibagami'},
			{21, 'nhh199999', 'Lukass2'},
			{12, 'hositientrangbang', 'TiquiTaka'},
			{21, 'tienlong5039610450', 'xzxBangBCSzx'}
		}

	-- Danh sach nhan den bu trang bi Viem De
	local tbNhanViemDe = {
				{serverid = 32, account = 'anchau9454', role = 'zKiÕpCÇmCaz', item = {{0, 100, 8057}, {0 ,101, 8057}, {0, 103, 8057}}, nLevel = 10, nDinhhon = 0},
				{serverid = 70, account = 'motcuocdoituoidep', role = 'VangBãngMétThêi', item = {{0, 100, 8055}, {0, 101, 8055}, {0, 103, 8055}}, nLevel =12, nDinhhon = 1},
				{serverid = 70, account = 'soemden007', role = 'xIPhuDuIx',  item = {{0, 100, 8055}, {0, 101, 8055}, {0, 103, 8055}}, nLevel =7, nDinhhon = 1},
				{serverid = 70, account = 'legiahienyeudau', role = '1stOneOne', item = {{0, 100, 8001}, {0, 101, 8001}, {0, 103, 8001}}, nLevel = 14, nDinhhon = 1},
				{serverid = 70, account = 'hisumit', role = 'zGiangHåBÊtB¹iz', item = {{0, 100, 8001}, {0, 101, 8001}, {0, 103, 8001}}, nLevel = 12, nDinhhon = 1},
				{serverid = 70, account = 'duytan93cz', role = 'ThiÕuTiÒn', item = {{0, 100, 8055}, {0, 101, 8055}, {0, 103, 8055}}, nLevel = 7, nDinhhon = 1},
				{serverid = 70, account = 'tuoitrecuoi3008', role = 'KetGiao', item = {{0, 100, 8001}, {0, 101, 8001}, {0, 103, 8001}}, nLevel = 0, nDinhhon = 0}
		}

	-- Danh sach nhan den bu trang suc mon phai
	local tbNhanTrangSuc = {
			{serverid = 55, account = '123chivianhyeuem', role = 'ooS2oDionysus'},
			{serverid = 29, account = 'htvqa1718', role = 'OoQuúnhAnhoO'},
			{serverid = 38, account = 'vanthichnmdnhe', role = 'iIIMusicStyle'},
			{serverid = 14, account = 'procailaytgvt', role = 'iiiR­îuQuªnSÇu'},
			{serverid = 63, account = 'lekhaihung2012', role = 'o§iªuThuyÒno'},
			{serverid = 7, account = 'dinhthiluyen102', role = '§ÑpTõngDecimet'},
			{serverid = 5, account = 'mrnguyenkgvn', role = 'oLanAnh'},
			{serverid = 3, account = 'aslong113vn', role = 'TonyTran'}
		}
	-- Check da nhan den bu
	if GetTask(TSK_DENBU)~=0 then
		Talk(1,"","C¸c h¹ ®· nhËn ®ñ phÇn th­ëng råi, ta kh«ng thÓ giao thªm.");
		return
	end
	
	-- Check hanh trang & suc luc
	if gf_Judge_Room_Weight(nFreeSlotRequire, nWeightRequire)==0 then
		Talk(1,"","Hµnh trang c¸c h¹ kh«ng ®ñ "..nFreeSlotRequire.." chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	-- Truong hop dac biet k0 trong danh sach
	if nServerID==70 and szAccount=="olay2012" and szRole=="GioLanhMuaDong" then
		SetTask(TSK_DENBU,1)
		AddItem(2,1,1068,3);
		gf_WriteLogEx("DENBUTHANG4", "nhËn thµnh c«ng", 3, "Thiªn th¹ch linh th¹ch")
		nDenbu = 1
		Talk(1,"","VËt phÈm ®Òn bï ®· ®­îc chuyÓn vµo hµnh trang c¸c h¹");
		return
	end
		
	-- Check danh sach
	for i=1, getn(tbNhanMatTich) do
		if tbNhanMatTich[i][1]==nServerID and tbNhanMatTich[i][2]==szAccount and tbNhanMatTich[i][3]==szRole then
			nCheckListMatTich = 1
			break
		end
	end
	for i=1, getn(tbNhanBKL) do
		if tbNhanBKL[i][1]==nServerID and tbNhanBKL[i][2]==szAccount and tbNhanBKL[i][3]==szRole then
			nCheckListBKL = 1
			break
		end
	end
	for i=1,getn(tbNhanViemDe) do
		if tbNhanViemDe[i]["serverid"]==nServerID and tbNhanViemDe[i]["account"]==szAccount and tbNhanViemDe[i]["role"]==szRole then
			nCheckListViemDe = i
			break
		end
	end
	for i=1,getn(tbNhanTrangSuc) do
		if tbNhanTrangSuc[i]["serverid"]==nServerID and tbNhanTrangSuc[i]["account"]==szAccount and tbNhanTrangSuc[i]["role"]==szRole then
			nCheckListTrangSuc = 1
			break
		end
	end
	
	if nCheckListMatTich==0 and nCheckListBKL==0 and nCheckListViemDe==0 and nCheckListTrangSuc==0 then
		Talk(1,"","C¸c h¹ kh«ng cã tªn trong danh s¸ch nhËn ®Òn bï.")
		return
	end
	
-- Thuc hien den bu
	local nDenbu = 0
	-- Set task den bu
	SetTask(TSK_DENBU,1)
	
	-- Den bu mat tich
	if nCheckListMatTich==1 then
		nDenbu = DenBu_NhanMatTich()
	end
	
	-- Den bu BKL
	if nCheckListBKL==1 then
		nDenbu = DenBu_BKL()
	end
	
	--Den Bu Viem De
	if nCheckListViemDe>0 then
		nDenbu = DenBu_ViemDe(tbNhanViemDe[nCheckListViemDe])
	end
	
	if nCheckListTrangSuc==1 then
		nDenbu = DenBu_TrangSuc()
	end
	
	-- Truong hop rieng
	if nServerID==14 and szAccount=="procailaytgvt" and szRole=="iiiR­îuQuªnSÇu" then
		local tbTangKiemKyThach = {[1] = 30002, [2] = 30005, [3] = 30008, [4] = 30011}
		AddItem(0, 102, tbTangKiemKyThach[GetBody()], 1,1,-1,-1,-1,-1,-1,-1,-1,0);
		gf_WriteLogEx("DENBUTHANG4", "nhËn thµnh c«ng", 1, "Tµng kiÕm kú th¹ch")
		nDenbu = 1
	end
	
	if nServerID==29 and szAccount=="htvqa1718" and szRole=="OoQuúnhAnhoO" then
		nDenbu = DenBu_TrangSuc()
	end
	
	if nDenbu == 1 then
		Talk(1,"","VËt phÈm ®Òn bï ®· ®­îc chuyÓn vµo hµnh trang c¸c h¹");
	end
end
	
	
function DenBu_NhanMatTich()
	local nFaction = GetPlayerRoute()
	local tblMatTichCaoCap = {
			[2] = {item = {0, 107, 204, 1}, name ="Kim Cang B¸t Nh· Ch©n QuyÓn"},
			[3] = {item = {0, 107, 206, 1}, name ="V« TrÇn Bå §Ò Ch©n QuyÓn"},
			[4] = {item = {0, 107, 205, 1}, name ="TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
			[6] = {item = {0, 107, 207, 1}, name ="Thiªn La Liªn Ch©u Ch©n QuyÓn"},
			[8] = {item = {0, 107, 208, 1}, name ="Nh­ ý Kim §Ønh Ch©n QuyÓn"},
			[9] = {item = {0, 107, 209, 1}, name ="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
			[11] = {item = {0, 107, 210, 1}, name ="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
			[12] = {item = {0, 107, 211, 1}, name ="Quú Thiªn Du Long Ch©n QuyÓn"},
			[14] = {item = {0, 107, 212, 1}, name ="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
			[15] = {item = {0, 107, 213, 1}, name ="Qu©n Tö §íi Phong Ch©n QuyÓn"},
			[17] = {item = {0, 107, 214, 1}, name ="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
			[18] = {item = {0, 107, 215, 1}, name ="Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
			[20] = {item = {0, 107, 216, 1}, name ="HuyÒn Minh Phong Ma Ch©n QuyÓn"},
			[21] = {item = {0, 107, 217, 1}, name ="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
			[23] = {item = {0, 107, 218, 1}, name ="Cöu Thiªn Phong L«i Ch©n QuyÓn"},
			[29] = {item = {0, 107, 222, 1}, name ="Hång TrÇn Tóy Méng Ch©n QuyÓn"},
			[30] = {item = {0, 107, 223, 1}, name ="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
		}
	AddItem(tblMatTichCaoCap[nFaction]["item"][1], tblMatTichCaoCap[nFaction]["item"][2], tblMatTichCaoCap[nFaction]["item"][3], 1);
	gf_WriteLogEx("DENBUTHANG4", "nhËn thµnh c«ng", 1, "MËt tÞch cao cÊp")
	return 1
end


function DenBu_BKL()
	local nBKL_End = GetTime()
	if nBKL_End - GetTask(TSK_BKLB_START) < 5270400 then
		Msg2Player("B¹ch Kim LÖnh vÉn cßn ®ang hiÖu lùc. §¹i hiÖp kh«ng thÓ kÝch ho¹t thªm ®­îc n÷a.")
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: B¹ch Kim LÖnh vÉn cßn ®ang hiÖu lùc. §¹i hiÖp kh«ng thÓ kÝch ho¹t thªm ®­îc n÷a.")
		return
	end
		
	local nCreateTime = GetCreateTime()		
	if nCreateTime >= 1332370895 and GetTask(TSK_BKLB_COUNT) == 0 then
		SetTask(TSK_BKLB_START, GetTime())
		SetTask(TSK_BKLB_ACTIVE,1)
		WriteLogEx("DENBUTHANG4", "kich hoat TNAH",1);
		Msg2Player("KÝch ho¹t B¹ch Kim LÖnh thµnh c«ng trë thµnh ThiÕu Niªn Anh Hïng. Vui lßng kÝch ho¹t nhËn th­ëng ThiÕu Niªn Anh Hïng.")
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: KÝch ho¹t B¹ch Kim LÖnh thµnh c«ng trë thµnh ThiÕu Niªn Anh Hïng. Vui lßng kÝch ho¹t nhËn th­ëng ThiÕu Niªn Anh Hïng.")
	else
		SetTask(TSK_BKLB_START, GetTime())
		SetTask(TSK_BKLB_ACTIVE,2)
		WriteLogEx("DENBUTHANG4", "kich hoat VLTB",1);
		Msg2Player("KÝch ho¹t B¹ch Kim LÖnh thµnh c«ng trë thµnh Vâ L©m TiÒn Bèi. Vui lßng kÝch ho¹t nhËn th­ëng Vâ L©m TiÒn Bèi.")
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: KÝch ho¹t B¹ch Kim LÖnh thµnh c«ng trë thµnh Vâ L©m TiÒn Bèi. Vui lßng kÝch ho¹t nhËn th­ëng Vâ L©m TiÒn Bèi.")
	end
	
	SetTask(TSK_BKLB_COUNT, GetTask(TSK_BKLB_COUNT) + 1)
	gf_WriteLogEx("Bach Kim Lenh Bai", "Tæng sè kÝch ho¹t")
	gf_WriteLogEx("DENBUTHANG4", "add thµnh c«ng", 1, "B¹ch Kim LÖnh")
	return 1
end


function DenBu_ViemDe(tbdenbu)
	for i=1,getn(tbdenbu["item"]) do
		local _, nItemIdx = AddItem(tbdenbu["item"][i][1], tbdenbu["item"][i][2], tbdenbu["item"][i][3],1,1,-1,-1,-1,-1,-1,-1,0,tbdenbu["nLevel"],0);
		if tbdenbu["nDinhhon"]==1 then
			SetItemSpecialAttr(nItemIdx, "DING7", 1)
		end
	end
	gf_WriteLogEx("DENBUTHANG4", "nhËn thµnh c«ng", 1, "bé Viªm §Õ")
	return 1
end



function DenBu_TrangSuc()
	local tbTrangSucSuMon = {
		[2] = {[1]={{0,102,231},{0,102,235}}, [2]={{0,102,232},{0,102,236}}},
		[3] = {[1]={{0,102,331},{0,102,335}}, [2]={{0,102,332},{0,102,336}}},
		[4] = {[1]={{0,102,431},{0,102,435}}, [2]={{0,102,432},{0,102,436}}},
		[6] = {[1]={{0,102,631},{0,102,635}}, [2]={{0,102,632},{0,102,636}}, [3]={{0,102,633},{0,102,637}}, [4]={{0,102,634},{0,102,638}}},
		[8] = {[3]={{0,102,831},{0,102,835}}, [4]={{0,102,832},{0,102,836}}},
		[9] = {[3]={{0,102,931},{0,102,935}}, [4]={{0,102,932},{0,102,936}}},
		[11] = {[1]={{0,102,1131},{0,102,1135}}, [2]={{0,102,1132},{0,102,1136}}, [3]={{0,102,1133},{0,102,1137}}, [4]={{0,102,1134},{0,102,1138}}},
		[12] = {[1]={{0,102,1231},{0,102,1235}}, [2]={{0,102,1232},{0,102,1236}}, [3]={{0,102,1233},{0,102,1237}}, [4]={{0,102,1234},{0,102,1238}}},
		[14] = {[1]={{0,102,1431},{0,102,1435}}, [2]={{0,102,1432},{0,102,1436}}, [3]={{0,102,1433},{0,102,1437}}, [4]={{0,102,1434},{0,102,1438}}},
		[15] = {[1]={{0,102,1531},{0,102,1535}}, [2]={{0,102,1532},{0,102,1536}}, [3]={{0,102,1533},{0,102,1537}}, [4]={{0,102,1534},{0,102,1538}}},
		[17] = {[1]={{0,102,1731},{0,102,1735}}, [2]={{0,102,1732},{0,102,1736}}, [3]={{0,102,1733},{0,102,1737}}, [4]={{0,102,1734},{0,102,1738}}},
		[18] = {[1]={{0,102,1831},{0,102,1835}}, [2]={{0,102,1832},{0,102,1836}}, [3]={{0,102,1833},{0,102,1837}}, [4]={{0,102,1834},{0,102,1838}}},
		[20] = {[1]={{0,102,2031},{0,102,2035}}, [2]={{0,102,2032},{0,102,2036}}, [3]={{0,102,2033},{0,102,2037}}, [4]={{0,102,2034},{0,102,2038}}},
		[21] = {[1]={{0,102,2131},{0,102,2135}}, [2]={{0,102,2132},{0,102,2136}}, [3]={{0,102,2133},{0,102,2137}}, [4]={{0,102,2134},{0,102,2138}}}
	}
	local nRand = mod(random(1,100),2)+1
	local nFaction = GetPlayerRoute()
	local nBody = GetBody()
	AddItem(tbTrangSucSuMon[nFaction][nBody][nRand][1], tbTrangSucSuMon[nFaction][nBody][nRand][2], tbTrangSucSuMon[nFaction][nBody][nRand][3],1,1,-1,-1,-1,-1,-1,-1,-1,0);
	--AddItem(0, 102, 2131,1,1,-1,-1,-1,-1,-1,-1,-1,0)
	gf_WriteLogEx("DENBUTHANG4", "nhËn thµnh c«ng", 1, "trang søc s­ m«n")
	return 1
end