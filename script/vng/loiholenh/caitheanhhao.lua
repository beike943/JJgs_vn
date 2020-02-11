Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");

szLogTitle = "LOI HO LENH - CAI THE ANH HAO"
szLogAction = "nhËn"
LIB_Award.szLogTitle = szLogTitle
LIB_Award.LogAction = szLogAction

tbDieuKien = {
	[74] = {nQuancong = 50000, nDanhvong = 3000, nSumon = 4000},
	[75] = {nQuancong = 50000, nDanhvong = 3000, nSumon = 4000},
	[76] = {nQuancong = 50000, nDanhvong = 3000, nSumon = 4000},
	[77] = {nQuancong = 50000, nDanhvong = 5000, nSumon = 5000},
	[78] = {nQuancong = 55000, nDanhvong = 5000, nSumon = 5000},
	[79] = {nQuancong = 55000, nDanhvong = 5000, nSumon = 5000},
	[80] = {nQuancong = 60000, nDanhvong = 6000, nSumon = 6000},
	[81] = {nQuancong = 65000, nDanhvong = 7000, nSumon = 7000},
	[82] = {nQuancong = 70000, nDanhvong = 8000, nSumon = 8000},
	[83] = {nQuancong = 75000, nDanhvong = 9000, nSumon = 9000},
	[84] = {nQuancong = 80000, nDanhvong = 10000, nSumon = 10000},
	[85] = {nQuancong = 80000, nDanhvong = 10000, nSumon = 10000},
	[86] = {nQuancong = 81000, nDanhvong = 10500, nSumon = 10500},
	[87] = {nQuancong = 82000, nDanhvong = 11000, nSumon = 11000},
	[88] = {nQuancong = 100000, nDanhvong = 12000, nSumon = 12000},
	[89] = {nQuancong = 100000, nDanhvong = 13500, nSumon = 13500},
	[90] = {nQuancong = 100000, nDanhvong = 15000, nSumon = 15000},
	[91] = {nQuancong = 150000, nDanhvong = 15500, nSumon = 15500},
	[92] = {nQuancong = 150000, nDanhvong = 15500, nSumon = 15500},
	[93] = {nQuancong = 175000, nDanhvong = 15500, nSumon = 15500},
	[94] = {nQuancong = 200000, nDanhvong = 15500, nSumon = 15500},
	[95] = {nQuancong = 250000, nDanhvong = 18000, nSumon = 18000},
	[96] = {nQuancong = 275000, nDanhvong = 20000, nSumon = 20000},
	[97] = {nQuancong = 300000, nDanhvong = 21000, nSumon = 21000},
	[98] = {nQuancong = 320000, nDanhvong = 21000, nSumon = 21000},
	[99] = {nQuancong = 390000, nDanhvong = 26000, nSumon = 26000},
	[696] = {nQuancong = 700000, nDanhvong = 30000, nSumon = 30000},
}

tbMaterial = {
	[81] = {nExp = 15000000, nDanhvong = 300, nSumon = 300},
	[86] = {nExp = 20000000, nDanhvong = 300, nSumon = 300},
	[88] = {nExp = 30000000, nDanhvong = 300, nSumon = 300},
	[90] = {nExp = 50000000, nDanhvong = 300, nSumon = 300},
	[93] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu VËt PhÈm"}}},
	[94] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu VËt PhÈm"}}},
	[95] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu VËt PhÈm"}}},
	[96] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu VËt PhÈm"}}},
	[97] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu VËt PhÈm"}}},
	[98] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu VËt PhÈm"}}},
	[99] = {nExp = 2000000000, item={{gdp={2,1,1001,2}, name="Hßa ThÞ BÝch"}, {gdp={2,1,30490,2}, name="Hoµng Kim §¹i Ng©n PhiÕu"}, {gdp={2,1,30344,2}, name="ThÇn Tµi B¶o R­¬ng"}, {gdp={2,1,504,2}, name="N÷ Oa Tinh Th¹ch"}}},
	[696] = {nExp = 3000000000, item={{gdp={2,1,1001,3}, name="Hßa ThÞ BÝch"}, {gdp={2,1,30490,3}, name="Hoµng Kim §¹i Ng©n PhiÕu"}, {gdp={2,1,30344,3}, name="ThÇn Tµi B¶o R­¬ng"}, {gdp={2,1,504,3}, name="N÷ Oa Tinh Th¹ch"}}},
}

tbAwardByLevel = {
	[74] = {item={
				{gdp={2,0,553,3}, name="§¹i Nh©n s©m", nExpired = 7*24*3600},
				{gdp={2,0,554,15}, name="Tu Ch©n YÕu QuyÕt", nExpired = 7*24*3600},
				{gdp={0,107,64,1}, name="Thiªn Hµ MËt tÞch"},
				{gdp={0,107,65,1}, name="Tö Hµ MËt tÞch"},
				{gdp={0,107,66,1}, name="Chiªm Y Phæ"},
				{gdp={0,107,60,1}, name="Tu La MËt TÞch"},
				{gdp={0,107,59,1}, name="Kim ThiÒn Phæ"},
				{gdp={0,107,61,1}, name="Bæ Th¹ch MËt TÞch"},
				{gdp={0,107,62,1}, name="Bæ Kim MËt TÞch"},
	}},
	[75] = {item={{gdp={2,1,9977,7}, name="Qu©n C«ng Huy Hoµng", nExpired = 7*24*3600},},
			fn="NgoaiTrangDoThong()",
	},
	[76] = {item={
				{gdp={2,2,7,100}, name="M¶nh Thiªn Th¹ch"},
				{gdp={2,2,8,100}, name="Thiªn Th¹ch"},
	}},
	[77] = {fn="TraoThuongUngDoThong(100);TraoThuongUngDoThong(101);TraoThuongUngDoThong(103);PhongThuongLenh()"},
	[78] = {fn="NhanRuongYeuQuyet(3);MatTichSuMon45(3)"},
	[79] = {item={{gdp={2,1,30340,800}, name="Méc R­¬ng"}}, fn="MatTichSuMon70(3)"},
	[80] = {item={{gdp={2,0,554,15,4}, name="Tu Ch©n YÕu QuyÕt", nExpired = 7*24*3600}},
			fn="MatTichSuMon70CaoCap(3);KichHoatKinhMach(1);",
	},
	[81] = {item={{gdp={2,1,1068,1}, name="Thiªn Th¹ch Linh Th¹ch", nExpired = 15*24*3600}}},
	[82] = {fn="ThuongUngTienPhong(1)"},
	[83] = {fn="ThuongUngTienPhong(2)"},
	[84] = {fn="MatTichTranPhai()"},
	[85] = {item={{gdp={2,1,30369,88}, name="Cæ Linh Ngäc"}, {gdp={2,1,30368,88}, name="Cæ Linh Th¹ch"}}},
	[86] = {item={{gdp={2,1,1068,1}, name="Thiªn Th¹ch Linh Th¹ch", nExpired = 15*24*3600}}, fn="MatTichSuMon70CaoCap(3);"},
	[87] = {item={{gdp={2,1,30408,3}, name="Thiªn HuyÔn Kh¾c B¶n cÊp 3"}, {gdp={2,1,30491,7}, name="VÐ TiÕu Y Vµng", nExpired = 15*24*3600}}},
	[88] = {item={{gdp={2,1,1067,1}, name="§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", nExpired = 15*24*3600}}},
	[89] = {item={{gdp={2,1,30497,500}, name="Ma Tinh"}}},
	[90] = {item={{gdp={2,1,1113,1}, name="§¹i §Þnh Hån", nExpired = 15*24*3600}}, fn="KichHoatKinhMach(2);"},
	[91] = {item={{gdp={2,1,1009,44}, name="Thiªn Th¹ch Tinh Th¹ch"}}},
	[92] = {item={{gdp={0,112,78,3}, name="L¨ng Ba Vi Bé"}}, nChankhi = 77000},
	[93] = {item={{gdp={2,1,1067,1}, name="§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", nExpired = 15*24*3600}}},
	[94] = {item={{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n", nExpired = 60*24*3600}}, fn="NonDieuDuong();"},
	[95] = {item={{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n", nExpired = 60*24*3600}}, fn="AoDieuDuong();"},
	[96] = {item={{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n", nExpired = 60*24*3600}, {gdp={2,1,504,11}, name="N÷ Oa Tinh Th¹ch", nExpired = 15*24*3600}}},
	[97] = {item={{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n", nExpired = 60*24*3600}}, fn="QuanDieuDuong();"},
	[98] = {item={{gdp={2,1,1113,1}, name="§¹i §Þnh Hån", nExpired = 15*24*3600}}},
	[99] = {item={
				{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n", nExpired = 60*24*3600},
				{gdp={2,1,30523,77}, name="CÊp 3 TÈy T©m Th¹ch"},
				{gdp={2,1,30529,77}, name="CÊp 3 LuyÖn L« ThiÕt"},
				{gdp={2,1,30535,111}, name="ThiÕt Tinh cÊp 3"},
				{gdp={0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng ¢m ChÕ ngò hµnh"},
				{gdp={0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng ¢m ChÕ ngò hµnh"},
				{gdp={0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi ¢m ChÕ ngò hµnh"},
				{gdp={2,1,30497,200}, name="Ma Tinh"},
				{gdp={2,1,1068,1}, name="Thiªn Th¹ch Linh Th¹ch", nExpired = 15*24*3600},
				{gdp={2,1,1067,2}, name="§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", nExpired = 15*24*3600},
			},
			fn="DanhHieuCaiTheAnhHao()",
	},
	[696] ={item={
				{gdp={0,105,30024,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Lam Mao Ng­u B¶o B¶o"},
				{gdp={0,102,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng- ¤ L©n B¶o Giíi"},
				{gdp={0,102,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng- Tö Giao Ngäc Béi"},
				{gdp={0,102,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng-  V©n Hæ LÖnh"},
				{gdp={0,102,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng- XÝch T­íc Hoµn"},
				{gdp={0,102,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng- BÝch Quy Liªn"},
			},
			nChankhi = 100000,
			fn="VuKhiDieuDuong(); KichHoatKinhMach(3); DanhHieuChienCuong();",
	},
}

tbAwardIndex = {
	-- Level, Slot, Weight
	[1] = {74, 26, 100},
	[2] = {75, 9, 100},
	[3] = {76, 3, 300},
	[4] = {77, 5, 300},
	[5] = {78, 20, 100},
	[6] = {79, 5, 100},
	[7] = {80, 20, 100},
	[8] = {81, 2, 100},
	[9] = {82, 2, 100},
	[10] = {83, 2, 100},
	[11] = {84, 2, 100},
	[12] = {85, 3, 100},
	[13] = {86, 5, 100},
	[14] = {87, 9, 100},
	[15] = {88, 2, 100},
	[16] = {89, 2, 100},
	[17] = {90, 2, 100},
	[18] = {91, 2, 100},
	[19] = {92, 4, 100},
	[20] = {93, 2, 100},
	[21] = {94, 3, 100},
	[22] = {95, 3, 100},
	[23] = {96, 13, 100},
	[24] = {97, 3, 100},
	[25] = {98, 2, 100},
	[26] = {99, 23, 100},
	[27] = {696, 8, 100},
}

function LHL_menu_award()
	local tbSay = {};
	tbSay[0] = "NhËn th­ëng C¸i ThÕ Anh Hµo theo ®¼ng cÊp:"
	local nCurrentIndex = VNG_GetTaskPos(TSK_BKLB_FLAG, 2,1)
	for i = (nCurrentIndex+1), getn(tbAwardIndex) do
		if tbAwardIndex[i] ~= nil then
			local nLevel = mod(tbAwardIndex[i][1],100)
			local szPhucsinh = ""
			if tbAwardIndex[i][1] > 100 then
				szPhucsinh = "Phôc Sinh "
			end
			tinsert(tbSay, "NhËn phÇn th­ëng "..szPhucsinh.."cÊp ®é "..nLevel.."/#CaiTheAnhHao_LevelAward("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function CaiTheAnhHao_LevelAward(nAwardIndex)
	if tbAwardIndex[nAwardIndex] == nil then
		return 0
	end
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	local nLevel = nChuyenSinh*100 + GetLevel()
	local nIndex = tbAwardIndex[nAwardIndex][1]
	local nCurrentIndex = VNG_GetTaskPos(TSK_BKLB_FLAG, 2,1)

	if CheckActivatedExt_BKL() ~= 1 then
		Talk(1,"","C¸c h¹ kh«ng ph¶i C¸i ThÕ Anh Hµo, kh«ng thÓ nhËn phÇn th­ëng nµy.")
		return 0
	end
	
	if nLevel < nIndex then
		Talk(1,"","§¼ng cÊp c¸c h¹ ch­a ®ñ nhËn th­ëng.")
		return 0
	end
	
	if gf_Check55MaxSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if (nCurrentIndex + 1) < nAwardIndex then
		Talk(1,"","C¸c h¹ ch­a nhËn phÇn th­ëng tr­íc nªn kh«ng thÓ nhËn phÇn th­ëng nµy..")
		return 0
	end
	
	if VNG_GetTaskPos(TSK_BKLB_FLAG,2,1) >= nAwardIndex then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbDieuKien[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	if tbMaterial[nIndex] ~= nil then
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
		if nCheck == 0 then
			return 0
		end
	end
	
	if gf_JudgeRoomWeight(tbAwardIndex[nAwardIndex][2],tbAwardIndex[nAwardIndex][3],"") == 0 then
		Talk(1,"","Hµnh trang cÇn <color=yellow>".. tbAwardIndex[nAwardIndex][2] .."<color> « trèng, <color=yellow>".. tbAwardIndex[nAwardIndex][3] .."<color> ®é nÆng, vui lßng s¾p xÕp l¹i")
		return 0
	end
	--================= Trao thuong ================
	if tbMaterial[nIndex] ~= nil then
		LIB_Award:PayMaterial(tbMaterial[nIndex])
	end
	VNG_SetTaskPos(TSK_BKLB_FLAG, nAwardIndex, 2,1)
	LIB_Award:Award(tbAwardByLevel[nIndex])
	Talk(1,"","C¸c h¹n ®· nhËn thµnh c«ng phÇn th­ëng C¸i ThÕ Anh Hµo ®¼ng cÊp "..nIndex..".")
end


function VukhiDieuDuong()
	local tbVukhiDieuDuong = {
		[2]={item={{gdp={0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é N¹n T«n Gi¶ PhËt §ao"}}},
		[4]={item={{gdp={0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é KiÕp T«n Gi¶ PhËt Thñ"}}},
		[3]={item={{gdp={0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é ¸ch T«n Gi¶ PhËt Tr­îng"}}},
		[6]={item={{gdp={0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Tr©m"}}},
		[8]={item={{gdp={0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt V©n Th¸nh C« Liªn KiÕm"}}},
		[9]={item={{gdp={0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« CÇm"}}},
		[11]={item={{gdp={0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Thñ"}}},
		[12]={item={{gdp={0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Du Long §Þa KhÊt C«n"}}},
		[14]={item={{gdp={0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Tóc KiÕm"}}},
		[15]={item={{gdp={0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bót"}}},
		[17]={item={{gdp={0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Th­¬ng"}}},
		[18]={item={{gdp={0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Cung"}}},
		[20]={item={{gdp={0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn §ao"}}},
		[21]={item={{gdp={0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Tr¶o"}}},
		[23]={item={{gdp={0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn KiÕm"}}},
		[29]={item={{gdp={0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Tª V©n Tiªn Tö PhiÕn"}}},
		[30]={item={{gdp={0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Phi H¹ Tiªn Tö ¦u Lan Tiªu"}}},
	}
	LIB_Award:AwardByRoute(tbVukhiDieuDuong)
end


function HoTroPhucSinh()
	if GetTask(TSK_CS6_TULINH) == 1 then
		SetTask(TSK_CS6_TULINH,2)
		TaskTip("Ta ®· truyÒn thô phÇn ®Çu cña bÝ kÝp Tø Linh Phôc Sinh cho ®¹i hiÖp råi, b©y giê ®¹i hiÖp h·y ®i t×m Viªn Quan Tho¸i NhiÖm ®Ó l·nh gi¸o phÇn cßn l¹i !!!!")
	end
end

-- Check level skill trÊn ph¸i
function TopCheckSkill(nSkillLevel)
	tb_Skill_ID = {
		[0] = 0,
		[1] = 0,
		[2] = 32,
		[3] = 57,
		[4] = 44,
		[5] = 0,
		[6] = 74,
		[7] = 0,
		[8] = 89,
		[9] = 102,
		[10] = 0,
		[11] = 113,
		[12] = 124,
		[13] = 0,
		[14] = 146,
		[15] = 159,
		[16] = 0,
		[17] = 732,
		[18] = 745,
		[19] = 0,
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
	}
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end;


function MatTichSuMon70(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,166, nQty}, name="Kim Cang B¸t Nh· Kinh"}}},
		[4] = {item={{gdp={0,107,167, nQty}, name="TiÒm Long TÞch DiÖt Kinh"}}},
		[3] = {item={{gdp={0,107,168, nQty}, name="V« TrÇn Bå §Ò Kinh"}}},
		[6] = {item={{gdp={0,107,169, nQty}, name="Thiªn La Liªn Ch©u Lôc"}}},
		[8] = {item={{gdp={0,107,170, nQty}, name="Nh­ ý Kim §Ønh MËt TÞch"}}},
		[9] = {item={{gdp={0,107,171, nQty}, name="BÝch H¶i TuyÖt ¢m Phæ"}}},
		[11] = {item={{gdp={0,107,172, nQty}, name="Hçn §én TrÊn Nh¹c MËt TÞch"}}},
		[12] = {item={{gdp={0,107,173, nQty}, name="Quü Thiªn Du Long MËt TÞch"}}},
		[14] = {item={{gdp={0,107,174, nQty}, name="HuyÔn ¶nh Mª Tung MËt TÞch"}}},
		[15] = {item={{gdp={0,107,175, nQty}, name="Qu©n Tö TiÖt Phong MËt TÞch"}}},
		[17] = {item={{gdp={0,107,176, nQty}, name="TrÊn Qu©n Phi Long Th­¬ng Phæ"}}},
		[18] = {item={{gdp={0,107,177, nQty}, name="Xuyªn V©n L¹c Hång MËt TÞch"}}},
		[20] = {item={{gdp={0,107,178, nQty}, name="U Minh Phong Ma Lôc"}}},
		[21] = {item={{gdp={0,107,179, nQty}, name="Linh Cæ HuyÔn Tµ Lôc"}}},
		[23] = {item={{gdp={0,107,198, nQty}, name="Cöu Thiªn Phong L«i QuyÕt"}}},
		[29] = {item={{gdp={0,107,202, nQty}, name="Hång TrÇn Tóy Méng Phæ"}}},
		[30] = {item={{gdp={0,107,203, nQty}, name="Phong Hoa Thiªn DiÖp Phæ"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end


function MatTichSuMon70CaoCap(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nQty}, name ="Kim Cang B¸t Nh· Ch©n QuyÓn"}}},
		[4] = {item={{gdp={0,107,205, nQty}, name ="TiÒm Long Tóc DiÖt Ch©n QuyÓn"}}},
		[3] = {item={{gdp={0,107,206, nQty}, name ="V« TrÇn Bå §Ò Ch©n QuyÓn"}}},
		[6] = {item={{gdp={0,107,207, nQty}, name ="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}},
		[8] = {item={{gdp={0,107,208, nQty}, name ="Nh­ ý Kim §Ønh Ch©n QuyÓn"}}},
		[9] = {item={{gdp={0,107,209, nQty}, name ="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"}}},
		[11] = {item={{gdp={0,107,210, nQty}, name ="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"}}},
		[12] = {item={{gdp={0,107,211, nQty}, name ="Quú Thiªn Du Long Ch©n QuyÓn"}}},
		[14] = {item={{gdp={0,107,212, nQty}, name ="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"}}},
		[15] = {item={{gdp={0,107,213, nQty}, name ="Qu©n Tö §íi Phong Ch©n QuyÓn"}}},
		[17] = {item={{gdp={0,107,214, nQty}, name ="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"}}},
		[18] = {item={{gdp={0,107,215, nQty}, name ="Xuyªn V©n L¹c Hång Ch©n QuyÓn"}}},
		[20] = {item={{gdp={0,107,216, nQty}, name ="HuyÒn Minh Phong Ma Ch©n QuyÓn"}}},
		[21] = {item={{gdp={0,107,217, nQty}, name ="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"}}},
		[23] = {item={{gdp={0,107,218,nQty}, name ="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}},
		[29] = {item={{gdp={0,107,222,nQty}, name ="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}},
		[30] = {item={{gdp={0,107,223,nQty}, name ="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end


function KichHoatKinhMach(nMeridianLevel)
	local nCurrentLevel = MeridianGetLevel() + 1
	for i=nCurrentLevel, nMeridianLevel do
		MeridianUpdateLevel()
	end
end


function ThuongUngTienPhong(nOption)
	local tbThuongUngTienPhong = {
		Tong = {
			[1] = {
				[1] = {item={{gdp={0,102,30044,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30048,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Phï"}}},
			},
			[2] = {
				[1] = {item={{gdp={0,102,30045,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30049,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Phï"}}},
			},
			[3] = {
				[1] = {item={{gdp={0,102,30046,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30050,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Phï"}}},
			},
			[4] = {
				[1] = {item={{gdp={0,102,30047,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30051,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Tèng Tiªn Phong HiÖu Phï"}}},
			},
		},
		Lieu = {
			[1] = {
				[1] = {item={{gdp={0,102,30080,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30084,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Phï"}}},
			},
			[2] = {
				[1] = {item={{gdp={0,102,30081,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30085,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Phï"}}},
			},
			[3] = {
				[1] = {item={{gdp={0,102,30082,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30086,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Phï"}}},
			},
			[4] = {
				[1] = {item={{gdp={0,102,30083,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Kú"}}},
				[2] = {item={{gdp={0,102,30087,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th­¬ng ¦ng Liªu Tiªn Phong HiÖu Phï"}}},
			},
		},
	}
	local szPhe = "Tong"
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	local nBody = GetBody()
	LIB_Award:Award(tbThuongUngTienPhong[szPhe][nBody][nOption])
end


function MatTichTranPhai()
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


function NonDieuDuong()
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


function AoDieuDuong()
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


function QuanDieuDuong()
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


function VuKhiDieuDuong()
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


function DanhHieuCaiTheAnhHao()
	AddTitle(22, 12)
	SetTitleTime(22, 12, GetTime() + 30*24*3600)
	SetCurTitle(22, 12)
end


function DanhHieuChienCuong()
	AddTitle(65, 3)
	SetTitleTime(65, 3, GetTime() + 30*24*3600)
	SetCurTitle(65, 3)
end


function TraoThuongUngDoThong(nGenre)
	local szItemName = "Th­¬ng ¦ng §« Thèng "
	local nID = 30028
	local szPhe = "Tèng "
	if GetTask(701) < 0 then
		nID = 30040
		szPhe = "Liªu "
	end
	if nGenre == 100 then
		szItemName = szPhe .. szItemName .. "Gi¸p"
	elseif nGenre == 101 then
		szItemName = szPhe .. szItemName .. "Trang"
	elseif nGenre == 103 then
		szItemName = szPhe .. szItemName .. "Kh«i"
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,10}, name = szItemName}}}
	LIB_Award:Award(tbAward)
end


function PhongThuongLenh()
	local tbAward = {
		[1] = {item={{gdp={2,1,9988,1}, name="Phong th­ëng lÖnh_Tèng (§« Thèng)", nExpired = 30*24*3600}}},
		[2] = {item={{gdp={2,1,9987,1}, name="Phong th­ëng lÖnh_Liªu (§« Thèng)", nExpired = 30*24*3600}}},
	}
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award:Award(tbAward[nPhe])
end


function NgoaiTrangDoThong()
	local tbAward = {
		Tong = {
			[1] = {item={{gdp={0,109,992,1}, name="Tèng qu©n trang(Nam tiªu chuÈn)", nExpired = 60*24*3600}}},
			[2] = {item={{gdp={0,109,993,1}, name="Tèng qu©n trang (Nam Kh«i ng«)", nExpired = 60*24*3600}}},
			[3] = {item={{gdp={0,109,994,1}, name="Tèng qu©n trang (N÷ gîi c¶m )", nExpired = 60*24*3600}}},
			[4] = {item={{gdp={0,109,995,1}, name="Tèng qu©n trang (KiÒu n÷ )", nExpired = 60*24*3600}}},
		},
		Lieu = {
			[1] = {item={{gdp={0,109,996,1}, name="Liªu qu©n trang(Nam tiªu chuÈn)", nExpired = 60*24*3600}}},
			[2] = {item={{gdp={0,109,997,1}, name="Liªu qu©n trang (Nam Kh«i ng«)", nExpired = 60*24*3600}}},
			[3] = {item={{gdp={0,109,998,1}, name="Liªu qu©n trang (N÷ gîi c¶m )", nExpired = 60*24*3600}}},
			[4] = {item={{gdp={0,109,999,1}, name="Liªu qu©n trang (KiÒu n÷ )", nExpired = 60*24*3600}}},
		},
	}
	local szPhe = "Tong"
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	LIB_Award:AwardByBody(tbAward[szPhe])
end


function NhanRuongYeuQuyet(nQty)
	local tbRuongYeuQuyet = {
		[2] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m"}}},
		[4] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m"}}},
		[3] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m"}}},
		[6] = {item={{gdp={2,0,608,1}, name="Tói bÝ kiÕp §­êng M«n"}}},
		[8] = {item={{gdp={2,0,609,1}, name="Tói bÝ kiÕp Nga My"}}},
		[9] = {item={{gdp={2,0,609,1}, name="Tói bÝ kiÕp Nga My"}}},
		[11] = {item={{gdp={2,0,610,1}, name="Tói bÝ kiÕp C¸i Bang"}}},
		[12] = {item={{gdp={2,0,610,1}, name="Tói bÝ kiÕp C¸i Bang"}}},
		[14] = {item={{gdp={2,0,611,1}, name="Tói bÝ kiÕp Vâ §ang"}}},
		[15] = {item={{gdp={2,0,611,1}, name="Tói bÝ kiÕp Vâ §ang"}}},
		[17] = {item={{gdp={2,0,612,1}, name="Tói bÝ kiÕp D­¬ng M«n"}}},
		[18] = {item={{gdp={2,0,612,1}, name="Tói bÝ kiÕp D­¬ng M«n"}}},
		[20] = {item={{gdp={2,0,613,1}, name="Tói bÝ kiÕp Ngò §éc"}}},
		[21] = {item={{gdp={2,0,613,1}, name="Tói bÝ kiÕp Ngò §éc"}}},
		[23] = {fn="NhanBiKipConLon()"},
		[29] = {fn="NhanBiKipThuyYen()"},
		[30] = {fn="NhanBiKipThuyYen()"},
	}
	for i=1,nQty do
		LIB_Award:AwardByRoute(tbRuongYeuQuyet)
	end
end


function NhanBiKipConLon()
	local tbBiKipConLon = {
		[1] = {[1] = {item={{gdp={2,6,169,1}, name = "BÝ kiÕp L«i TÕ"}}}, nRate = 7.15},
		[2] = {[1] = {item={{gdp={2,6,170,1}, name = "BÝ kiÕp Phong TÕ"}}}, nRate = 7.15},
		[3] = {[1] = {item={{gdp={2,6,171,1}, name = "BÝ kiÕp Thiªn l«i phï"}}}, nRate = 7.15},
		[4] = {[1] = {item={{gdp={2,6,172,1}, name = "BÝ kiÕp B¨ng Phong QuyÕt"}}}, nRate = 7.15},
		[5] = {[1] = {item={{gdp={2,6,173,1}, name = "BÝ kiÕp Ngù Phong QuyÕt"}}}, nRate = 7.14},
		[6] = {[1] = {item={{gdp={2,6,174,1}, name = "BÝ KiÕp Cuång L«i Phï"}}}, nRate = 7.14},
		[7] = {[1] = {item={{gdp={2,6,175,1}, name = "BÝ KiÕp D­¬ng Sa QuyÕt"}}}, nRate = 7.14},
		[8] = {[1] = {item={{gdp={2,6,176,1}, name = "BÝ KiÕp Oanh L«i Phï"}}}, nRate = 7.14},
		[9] = {[1] = {item={{gdp={2,6,177,1}, name = "BÝ KiÕp Cang phong quyÕt"}}}, nRate = 7.14},
		[10] = {[1] = {item={{gdp={2,6,178,1}, name = "BÝ KiÕp B¹o L«i Phï"}}}, nRate = 7.14},
		[11] = {[1] = {item={{gdp={2,6,179,1}, name = "BÝ KiÕp Tiªu phong t¸n quyÕt"}}}, nRate = 7.14},
		[12] = {[1] = {item={{gdp={2,6,180,1}, name = "BÝ KiÕp Ngò L«i chÝnh ph¸p phï"}}}, nRate = 7.14},
		[13] = {[1] = {item={{gdp={2,6,181,1}, name = "BÝ KiÕp V¹n L«i To¸i Tinh phï"}}}, nRate = 7.14},
		[14] = {[1] = {item={{gdp={2,6,182,1}, name = "BÝ KiÕp HuyÒn Phong triÒn quyÕt"}}}, nRate = 7.14},
	}
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipConLon)
	end
end


function NhanBiKipThuyYen()
	local tbBiKipThuyYen = {
		[1] = {[1] = {item={{gdp={2,6,219,1}, name = "YÕu quyÕt Khëi Vò"}}}, nRate = 4.55},
		[2] = {[1] = {item={{gdp={2,6,220,1}, name = "YÕu quyÕt Linh Miªu VËn"}}}, nRate = 4.55},
		[3] = {[1] = {item={{gdp={2,6,221,1}, name = "YÕu quyÕt Vò V©n T©m Ph¸p"}}}, nRate = 4.55},
		[4] = {[1] = {item={{gdp={2,6,222,1}, name = "YÕu quyÕt MÞ Hoa"}}}, nRate = 4.55},
		[5] = {[1] = {item={{gdp={2,6,223,1}, name = "YÕu quyÕt §o¹n V©n"}}}, nRate = 4.55},
		[6] = {[1] = {item={{gdp={2,6,224,1}, name = "YÕu quyÕt Thu NguyÖt Vò"}}}, nRate = 4.55},
		[7] = {[1] = {item={{gdp={2,6,225,1}, name = "YÕu quyÕt Thiªn L¹i T©m Kinh"}}}, nRate = 4.54},
		[8] = {[1] = {item={{gdp={2,6,226,1}, name = "YÕu quyÕt §iÖp Uyªn"}}}, nRate = 4.54},
		[9] = {[1] = {item={{gdp={2,6,227,1}, name = "YÕu quyÕt Thiªn Háa DiÖm D­¬ng"}}}, nRate = 4.54},
		[10] = {[1] = {item={{gdp={2,6,228,1}, name = "§¹p V©n X¶o Bé QuyÕt YÕu"}}}, nRate = 4.54},
		[11] = {[1] = {item={{gdp={2,6,229,1}, name = "YÕu quyÕt Méng Xµ"}}}, nRate = 4.54},
		[12] = {[1] = {item={{gdp={2,6,230,1}, name = "YÕu quyÕt L¹c Hoa QuyÕt"}}}, nRate = 4.55},
		[13] = {[1] = {item={{gdp={2,6,231,1}, name = "YÕu quyÕt §µo Hoa Ch­¬ng"}}}, nRate = 4.55},
		[14] = {[1] = {item={{gdp={2,6,232,1}, name = "YÕu quyÕt B¸ch Hoa T©m Kinh"}}}, nRate = 4.55},
		[15] = {[1] = {item={{gdp={2,6,233,1}, name = "YÕu quyÕt Táa T©m QuyÕt"}}}, nRate = 4.55},
		[16] = {[1] = {item={{gdp={2,6,234,1}, name = "YÕu quyÕt Hoµn ThÇn ThuËt"}}}, nRate = 4.55},
		[17] = {[1] = {item={{gdp={2,6,235,1}, name = "YÕu quyÕt Linh §éng QuyÕt"}}}, nRate = 4.55},
		[18] = {[1] = {item={{gdp={2,6,236,1}, name = "YÕu quyÕt Mª X¶o QuyÕt"}}}, nRate = 4.54},
		[19] = {[1] = {item={{gdp={2,6,237,1}, name = "YÕu quyÕt Tiªn L­ H­¬ng"}}}, nRate = 4.54},
		[20] = {[1] = {item={{gdp={2,6,238,1}, name = "YÕu quyÕt B¸ch §iÖp Nghªnh H­¬ng QuyÕt"}}}, nRate = 4.54},
		[21] = {[1] = {item={{gdp={2,6,239,1}, name = "YÕu quyÕt §iÖp LuyÕn Hoa"}}}, nRate = 4.54},
		[22] = {[1] = {item={{gdp={2,6,240,1}, name = "YÕu quyÕt Ngäc Long Xuyªn NguyÖt"}}}, nRate = 4.54},
	}
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipThuyYen)
	end
end


function MatTichSuMon45(nQty)
	local tbMatTich45 = {
		[0] = {
			[2] = {item={{gdp={0,107,1,1}, name="Kim Cang Phôc Ma kinh"}}},
			[4] = {item={{gdp={0,107,3,1}, name="TiÒm Long MËt tÞch"}}},
			[3] = {item={{gdp={0,107,5,1}, name="V« TrÇn MËt tÞch"}}},
			[6] = {item={{gdp={0,107,7,1}, name="Thiªn La MËt TÞch"}}},
			[8] = {item={{gdp={0,107,9,1}, name="Nh­ ý MËt TÞch"}}},
			[9] = {item={{gdp={0,107,11,1}, name="BÝch H¶i Phæ"}}},
			[11] = {item={{gdp={0,107,13,1}, name="Hçn §én MËt tÞch"}}},
			[12] = {item={{gdp={0,107,15,1}, name="Quý Thiªn MËt tÞch"}}},
			[14] = {item={{gdp={0,107,17,1}, name="HuyÒn ¶nh MËt tÞch"}}},
			[15] = {item={{gdp={0,107,19,1}, name="Qu©n Tö MËt tÞch"}}},
			[17] = {item={{gdp={0,107,21,1}, name="TrÊn Qu©n MËt tÞch"}}},
			[18] = {item={{gdp={0,107,23,1}, name="Xuyªn V©n MËt tÞch"}}},
			[20] = {item={{gdp={0,107,25,1}, name="U Minh Quû Lôc"}}},
			[21] = {item={{gdp={0,107,27,1}, name="Linh Cæ MËt tÞch"}}},
			[23] = {item={{gdp={0,107,180,1}, name="Kinh Phong MËt TÞch"}}},
			[29] = {item={{gdp={0,107,188,1}, name="Tóy Méng MËt TÞch"}}},
			[30] = {item={{gdp={0,107,190,1}, name="Phån Hoa MËt TÞch"}}},
		},
		[1] = {
			[2] = {item={{gdp={0,107,2,1}, name="Kim Cang Phôc Ma T©m Ph¸p"}}},
			[4] = {item={{gdp={0,107,4,1}, name="TiÒm Long T©m Ph¸p"}}},
			[3] = {item={{gdp={0,107,6,1}, name="V« TrÇn T©m Ph¸p"}}},
			[6] = {item={{gdp={0,107,8,1}, name="Thiªn La T©m Ph¸p"}}},
			[8] = {item={{gdp={0,107,10,1}, name="Nh­ ý T©m Ph¸p"}}},
			[9] = {item={{gdp={0,107,12,1}, name="BÝch H¶i T©m Ph¸p"}}},
			[11] = {item={{gdp={0,107,14,1}, name="Hçn §én T©m Ph¸p"}}},
			[12] = {item={{gdp={0,107,16,1}, name="Quý Thiªn T©m Ph¸p"}}},
			[14] = {item={{gdp={0,107,18,1}, name="HuyÒn ¶nh T©m Ph¸p"}}},
			[15] = {item={{gdp={0,107,20,1}, name="Qu©n Tö T©m Ph¸p"}}},
			[17] = {item={{gdp={0,107,22,1}, name="TrÊn Qu©n T©m Ph¸p"}}},
			[18] = {item={{gdp={0,107,24,1}, name="Xuyªn V©n T©m Ph¸p"}}},
			[20] = {item={{gdp={0,107,26,1}, name="U Minh T©m Ph¸p"}}},
			[21] = {item={{gdp={0,107,28,1}, name="Linh Cæ T©m Ph¸p"}}},
			[23] = {item={{gdp={0,107,181,1}, name="Kinh Phong T©m Ph¸p"}}},
			[29] = {item={{gdp={0,107,189,1}, name="Tóy M«ng T©m Ph¸p"}}},
			[30] = {item={{gdp={0,107,191,1}, name="Phån Hoa T©m Ph¸p"}}},
		},
	}
	for i = 1,nQty do
		local nIndex = mod(random(0,1000),2)
		LIB_Award:AwardByRoute(tbMatTich45[nIndex])
	end
end
