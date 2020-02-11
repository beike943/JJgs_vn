Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");

nMAXPOINT = 111
TOPBANGHOI_FILENAME = "newserver_topbanghoi.txt"
LIB_txtData.szPattern = "[A-Za-z0-9¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËEĞÌÎÏÑ£ÕÒÓÔÖãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùİ×ØÜŞıúûüş§¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËĞÌÎÏÑªÕÒÓÔÖãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùİ×ØÜŞıúûüş®_]"
szNpcName =  "<color=green>Ngäa Long<color>: "
LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
LIB_Award.szLogAction = "nhËn"

tbCongHienBang_NguyenLieu = {
	[1] = {1, {item={{gdp={2,1,30230,1}}},nExp = 1000000}, "1 ®iÓm cèng hiÕn: tiªu hao 1.000.000 kinh nghiÖm, 1 xu"},
	[2] = {10, {item={{gdp={2,1,30230,10}}},nExp = 10000000}, "10 ®iÓm cèng hiÕn: tiªu hao 10.000.000 kinh nghiÖm, 10 xu"},
	[3] = {100, {item={{gdp={2,1,30230,100}}},nExp = 100000000}, "100 ®iÓm cèng hiÕn: tiªu hao 100.000.000 kinh nghiÖm, 100 xu"},
--	[4] = {1000, {nExp = 1000000000, nGold = 10000000}, "1000 ®iÓm cèng hiÕn: tiªu hao 1.000.000.000 kinh nghiÖm, 1000 vµng"},
}

function TopBangHoi_Menu()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}
	if nDate <= 20140912 then
		tinsert(tbSay, "Ta muèn ®¨ng kı ®ua top cèng hiÕn bang héi/TopBangHoi_DangKy")
		tinsert(tbSay, "Ta muèn cèng hiÕn cho bang héi hïng m¹nh/TopBangHoi_CongHien_Menu")
	end
	tinsert(tbSay, "Xem ®iÓm cèng hiÕn cña bang héi/TopBangHoi_XemDiem")
--	tinsert(tbSay, "Xem danh s¸ch bang héi ®¨ng kı ®ua top")
	if nDate > 20140913 and nDate < 20140915 then
		tinsert(tbSay, "Thµnh viªn nhËn th­ëng bang héi h¹ng 1,2,3/#TopBangHoi_NhanThuong(1)")
		local nTongLevel = IsTongMember()
		if nTongLevel == 1 then
			tinsert(tbSay, "Bang chñ nhËn th­ëng bang héi h¹ng 1,2,3/#TopBangHoi_NhanThuong(2)")
		end
	end
	tinsert(tbSay, "Ta chØ ghĞ xem/gf_DoNothing")
	Say("", getn(tbSay), tbSay)
end


function TopBangHoi_DangKy()
	--local tbMaterial = {item={{gdp={2,1,30490,10}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}}
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local nTongLevel = IsTongMember()
	local szRole = GetName()
	-- kiem tra Maxx Skill 55 va dang cap 81
	local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  81 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 81, kh«ng thÓ ®¨ng kı tham gia!")
		return 0
	end
	if nMaxSkill ~= 1 then
		Talk(1, "",szNpcName.."Kû n¨ng skill 55 cña c¸c h¹ ch­a ®ñ. NÕu muèn ®¨ng kı tham gia, h·y n©ng cÊp kû n¨ng cÊp 55 råi ®Õn gÆp ta.");
		return 0
	end
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng kı tham gia, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	if LIB_txtData:CheckString(szTong) > 0 then
		Talk(1, "",szNpcName.."Tªn bang héi c¸c h¹ cã nhiÒu ch÷ l¹ qu¸, ta kh«ng biÕt ghi l¹i nh­ thÕ nµo n÷a. Hay lµ ®æi bang kh¸c ®i nhĞ.")
		return 0
	end
	--local nCheck = 0
	--nCheck = LIB_Award:CheckMaterial(tbMaterial)
	--if nCheck ~= 1 then
	--	return 0
	--end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName > 0 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®· ®¨ng kı thµnh c«ng, kh«ng cÇn ®¨ng kı thªm lÇn n÷a.")
		return 0
	end
	--LIB_Award:PayMaterial(tbMaterial)
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0"
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Bang héi c¸c h¹ b¸o danh thµnh c«ng vµo cuéc ®ua vinh danh bang héi danh gi¸ , h·y b¸o tin cho c¸c thµnh viªn tİch cùc x©y dùng danh tiÕng bang héi.")
	gf_WriteLogEx(szLogTitle, "nhËn", 1, "§¨ng kı thµnh c«ng")
end


function TopBangHoi_CongHien_Menu()
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã trong danh s¸ch bÊt kú bang nµo. H·y t×m chç gia nhËp tr­íc ®· nhĞ.")
		return 0
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName == 0 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch ®¨ng kı vinh danh.")
		return 0
	end
	local tbSay = {}
	for i=1,getn(tbCongHienBang_NguyenLieu) do
		tinsert(tbSay, tbCongHienBang_NguyenLieu[i][3].."/#TopBangHoi_CongHien_Done("..i..")")
	end
	tinsert(tbSay, "Ta chØ ghĞ xem/gf_DoNothing")
	Say(szNpcName.."§«ng ng­êi thªm søc m¹nh. Ng­¬i h·y cèng hiÕn cho bang héi b»ng hÕt kh¶ n¨ng m×nh cã.", getn(tbSay), tbSay)
end


function TopBangHoi_CongHien_Done(nOption)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Tr¹ng th¸i hiÖn t¹i kh«ng thÓ cèng hiÕn.")
		return
	end	
	-- kiem tra Maxx Skill 55 va dang cap 81
	local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  81 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 81, kh«ng thÓ tham gia cèng hiÕn!")
		return 0
	end
	if nMaxSkill ~= 1 then
		Talk(1, "",szNpcName.."Kû n¨ng skill 55 cña c¸c h¹ ch­a ®ñ. NÕu muèn ®¨ng kı tham gia, h·y n©ng cÊp kû n¨ng cÊp 55 råi ®Õn gÆp ta.");
		return 0
	end
	local szName = GetName()
	local szTong = GetTongName() or ""
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	if nCheck == 0 then
		return 0
	end
	local nPoint = VNG_GetTaskPos(TSK_CONGHIENBANG, 4,1)
	if (nPoint + tbCongHienBang_NguyenLieu[nOption][1]) > nMAXPOINT then
		Talk(1,"",szNpcName.."Møc cèng hiÕn ng­¬i chän v­ît qu¸ sè ®iÓm tèi ®a mçi ngµy. H·y chän møc kh¸c hoÆc mai quay l¹i nhĞ.")
		return 0
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nBang = i
			break
		end
	end
	if nBang == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	VNG_SetTaskPos(TSK_CONGHIENBANG, (nPoint + tbCongHienBang_NguyenLieu[nOption][1]), 4, 1)
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + tbCongHienBang_NguyenLieu[nOption][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[4]) > tonumber(y[4]) end)
	LIB_txtData:SaveMultiColumn()
	if tbCongHienBang_NguyenLieu[nOption][1] == 100 then
	AddGlobalNews(szName.." ®· cèng hiÕn 100 ®iÓm cho bang ".. szTong ..". M¹nh Th­êng Qu©n ®· xuÊt hiÖn t¹i bang "..szTong..".")
		--AddGlobalNews(szName.." ®· cèng hiÕn 10 ®iÓm cho bang ".. szTong .." thËt ®¸ng ng­ìng mé.")
	--elseif tbCongHienBang_NguyenLieu[nOption][1] == 100 then
	--	AddGlobalNews(szName.." ®· cèng hiÕn 100 ®iÓm cho bang ".. szTong ..". M¹nh Th­êng Qu©n ®· xuÊt hiÖn t¹i bang "..szTong..".")
	end
	local nNewRank = 10000
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nNewRank = i
			break
		end
	end
	if nBang >= nNewRank then
		if LIB_txtData.tbTextData[(nNewRank+1)] ~= nil then
			AddGlobalNews(szName.." ®· gióp bang héi "..LIB_txtData.tbTextData[nNewRank][1].." v­ît qua bang héi "..LIB_txtData.tbTextData[(nNewRank+1)][1]..". D­êng nh­ bang "..LIB_txtData.tbTextData[(nNewRank+1)][1].." cã biÓu hiÖn ®uèi søc.")
		end
	end
	Msg2Player("B¹n ®· cèng hiÕn "..tbCongHienBang_NguyenLieu[nOption][1].." cho bang héi.")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "Cèng hiÕn "..tbCongHienBang_NguyenLieu[nOption][1].." ®iÓm")
	TopBangHoi_CongHien_Menu()
end


function TopBangHoi_XemDiem()
	local tbData = {}
	tinsert(tbData,szNpcName.."KÕt qu¶ hiÖn t¹i:\n")
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	for i=1,getn(LIB_txtData.tbTextData) do
		local nIndex = floor(i/10)+1
		if tbData[nIndex] == nil then
			tinsert(tbData, szNpcName.."KÕt qu¶ hiÖn t¹i:\n")
		end
		tbData[nIndex] = tbData[nIndex] .. i.." - ".."<color=yellow>"..LIB_txtData.tbTextData[i][1].."<color>: <color=red>"..LIB_txtData.tbTextData[i][4].." ®iÓm<color>\n"
	end
	for i=1, getn(tbData) do
		Talk(1,"",tbData[i])
	end
end


function TopBangHoi_NhanThuong(nOption)
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a gia nhËp bang héi, kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if nOption == 1 then
		if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
			Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng, kh«ng thÓ nhËn thªm lÇn n÷a.")
			return 0
		end
	else
		if VNG_GetTaskPos(TSK_CONGHIENBANG,6,6) == 1 then
			Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng, kh«ng thÓ nhËn thªm lÇn n÷a.")
			return 0
		end
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 10000
	local nDiemCongHien = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			nDiemCongHien =  LIB_txtData.tbTextData[i][4]
			break
		end
	
	end
	
--local nConditionRank = 10000

--if max(tonumber(nDiemCongHien) >= 250000 then
--	nConditionRank = 1
--elseif tonumber(nDiemCongHien) >= 180000 then
--	nConditionRank = 2
--	elseif tonumber(nDiemCongHien) >= 79000 then
--	nConditionRank = 3
--end
		if tonumber(nDiemCongHien) < 150000 then
			Talk(1,"",szNpcName.."§iÓm cèng hiÕn kh«ng ®ñ 150000 kh«ng thÓ nhËn th­ëng ®ua top.")
			return 0
		end
		
--	nCheckTongName = min(nCheckTongName,nConditionRank)
	if nOption == 1 then
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_ThanhVien(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
		end
	else
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_BangChu(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
		end
	end
end


function TopBangHoi_NhanThuong_ThanhVien(nRank)
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhĞ.")
		return 0
	end
	local nJoinTime = GetJoinTongTime();	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 90, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Thêi gian gia nhËp cña c¸c h¹ İt h¬n 1ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	local tbAward1 = {
		item = {
			{gdp={2,1,30499,10}}, -- Hu©n ch­¬ng anh hïng
			{gdp={2,1,30535,20,4}}, -- ThiÕt tinh cÊp 3
			{gdp={2,1,1008,4,4}, nExpired=7*24*3600}, -- B¹ch C©u Tiªn §¬n
			{gdp={0,105,30027,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- H¾c Hæ
		},
		nExp = 200000000,
	}
	local tbAward2 = {
		item = {
			{gdp={2,1,30499,5}}, -- Hu©n ch­¬ng anh hïng
			{gdp={2,1,30535,10,4}}, -- ThiÕt tinh cÊp 3
			{gdp={2,1,1007,4,4}, nExpired=7*24*3600}, -- B¹ch C©u Tiªn §¬n
			{gdp={0,105,30029,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- B¸o §en
		},
		nExp = 100000000,
	}
	local tbAward3 = {
		item = {
			{gdp={2,1,30499,3}}, -- Hu©n ch­¬ng anh hïng
			{gdp={2,1,30535,6,4}}, -- ThiÕt tinh cÊp 3
			{gdp={2,1,270,4,4}, nExpired=7*24*3600}, -- B¹ch C©u Tiªn §¬n
		},
		nExp = 80000000,
	}
	tbAward = {
		[1] = tbAward1,
		[2] = tbAward2,
		[3] = tbAward3,
	}
	LIB_Award:Award(tbAward[nRank])
	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 5, 5)
	Talk(1,"",szNpcName.."NhËn thµnh c«ng phÇn t­ëng dµnh cho thµnh viªn bang h¹ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "PhÇn th­ëng thµnh viªn bang héi h¹ng "..nRank)
end


function TopBangHoi_NhanThuong_BangChu(nRank)
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhĞ.")
		return 0
	end
	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn nhËn th­ëng, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < (15*24*3600)   then
		Talk(1,"",szNpcName.."Thêi gian t¹i vŞ cña c¸c h¹ İt h¬n 15 ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	if nRank == 1 then
		TraoLoiHoNguyenSoai(0)
		TraoMatTichCaoCap20(6)
		local tbAward = {item={{gdp={0,105,30026,1,4,-1,-1,-1,-1,-1,-1,-1}}}}
		LIB_Award:Award(tbAward)
	elseif nRank == 2 then
		TraoLoiHoTuongQuan(0)
		TraoMatTichCaoCap20(3)
		local tbAward = {item={{gdp={0,105,30030,1,4,-1,-1,-1,-1,-1,-1,-1}}}}
		LIB_Award:Award(tbAward)
	elseif nRank == 3 then
		TraoMatTichCaoCap20(6)
		local tbAward = {item={{gdp={0,112,78,2}}}}
		LIB_Award:Award(tbAward)
	end
	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 6, 6)
	Talk(1,"",szNpcName.."NhËn thµnh c«ng phÇn t­ëng dµnh cho bang h¹ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "PhÇn th­ëng bang chñ bang héi h¹ng "..nRank)
end
