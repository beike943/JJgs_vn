Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
szLogTitle = "SINH TU VO NGA"
szLogAction = "nhËn"

function Award_Daily_Menu()
	local tbSay = {}
	tinsert(tbSay,"NhËn nhiÖm vô h»ng ngµy/STVNdailymission")
	tinsert(tbSay,"Xem t×nh h×nh nhiÖm vô h»ng ngµy/STVN_DailyMissionView")
	tinsert(tbSay,"NhËn th­ëng nhiÖm vô h»ng ngµy/Award_Daily")
	tinsert(tbSay,"Tho¸t/gf_DoNothing")
	Say(szNpcName.."NÕu hoµn thµnh tÊt c¶ c¸c thö th¸ch mçi ngµy cña ta, ta sÏ cã phÇn th­ëng cho c¸c h¹.",getn(tbSay),tbSay)
end

function STVN2_NhanNhiemVu()
	local nRoute = GetPlayerRoute()
	local tRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if tRoute[nRoute] ~= 1 then	
		Talk(1, "", "Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ tham gia ho¹t ®éng nµy.");
		return 0
	end	
	if nChuyenSinh >= 700 then -- b¾t chuyÓn sinh 7
		Talk(1,"","Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp qu¸ cao, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
		return 0	
	end
	if STVN_GetStatus() ~= 0 then
		Talk(1, "", "§¹i hiÖp ®· tham gia ho¹t ®éng nµy, kh«ng thÓ tham gia thªm ®­îc n÷a.");
		return 0
	end
	STVN_MissionAccept()
end


function menu_award()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "HÖ thèng nhËn th­ëng:"
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 91/#Level_Award(591)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 92/#Level_Award(592)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 93/#Level_Award(593)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 94/#Level_Award(594)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 95/#Level_Award(595)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 96/#Level_Award(596)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 97/#Level_Award(597)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 98/#Level_Award(598)")
	tinsert(tbSayDialog,"NhËn th­ëng chuyÓn sinh 5, ®¼ng cÊp 99/#Level_Award(599)")
	tinsert(tbSayDialog,"Trang sau/menu_award2")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function menu_award2()
	local tbSayDialog = {};
	local szSayHead = "HÖ thèng nhËn th­ëng:"
	tinsert(tbSayDialog,"NhËn th­ëng Phôc sinh, ®¼ng cÊp 90/#Level_Award(690)")
	tinsert(tbSayDialog,"NhËn th­ëng Phôc sinh, ®¼ng cÊp 91/#Level_Award(691)")
	tinsert(tbSayDialog,"NhËn th­ëng Phôc sinh, ®¼ng cÊp 92/#Level_Award(692)")
	tinsert(tbSayDialog,"NhËn th­ëng Phôc sinh, ®¼ng cÊp 93/#Level_Award(693)")
	tinsert(tbSayDialog,"NhËn th­ëng Phôc sinh, ®¼ng cÊp 94/#Level_Award(694)")
	tinsert(tbSayDialog,"NhËn th­ëng Phôc sinh, ®¼ng cÊp 95/#Level_Award(695)")
	tinsert(tbSayDialog,"NhËn th­ëng Phôc sinh, ®¼ng cÊp 96/#Level_Award(696)")
	tinsert(tbSayDialog,"Quay l¹i/menu_award")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function menu_point()
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","Sinh Tö V« Ng· ch­a kÝch ho¹t.")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "HÖ thèng ®iÓm tÝch cùc:"
	tinsert(tbSayDialog,"NhËn 1 ®iÓm tÝch cùc (tiªu hao 5.000.000 ®iÓm kinh nghiÖm + 3 xu + 9 vµng)/#get_point(1)")
	tinsert(tbSayDialog,"NhËn 5 ®iÓm tÝch cùc (tiªu hao 25.000.000 ®iÓm kinh nghiÖm + 15 xu + 49 vµng)/#get_point(5)")
	tinsert(tbSayDialog,"NhËn 10 ®iÓm tÝch cùc (tiªu hao 50.000.000 ®iÓm kinh nghiÖm + 30 xu + 99 vµng)/#get_point(10)")
	
	tinsert(tbSayDialog,"Xem ®iÓm tÝch lòy/show_point")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end


function show_point()
	local nPoint = mod(GetTask(TSK_SINHTUVONGA1),1000)
	local nTodayPoint = mod(floor(GetTask(TSK_SINHTUVONGA1)/1000),100)
	local szText = "§iÓm tÝch cùc hiÖn t¹i: <color=yellow>"..nPoint.."<color>\n"
	szText = szText .. "§iÓm tÝch cùc ®· nép h«m nay: <color=yellow>"..nTodayPoint.."<color>\n"
	Talk(1,"",szText)
end


function get_point(nPoint)
--	AABCCDDD
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	local nMaxToday = 16
	local nMax =600
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30230,3}}},nExp = 5000000, nGold = 90000},
		[5] = {item={{gdp={2,1,30230,15}}},nExp = 25000000, nGold = 490000},
		[10] = {item={{gdp={2,1,30230,30}}},nExp = 50000000, nGold = 990000},
	}
	local nCurrentPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,3,1)
	local nTodayPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,5,4)
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","Sinh Tö V« Ng· ch­a kÝch ho¹t.")
		return 0
	end
	if STVN_time_remain() == 0 then
		Talk(1,"","C¸c ®· ®Õn qu¸ muén, ®· hÕt h¹n nhËn th­ëng...")
		return 0
	end
	if (nCurrentPoint + nPoint) > nMax then
		Talk(1,"","Møc ®iÓm ®æi v­ît qu¸ giíi h¹n "..nMax..", c¸c h¹ h·y chän møc ®æi kh¸c.")
		return 0
	end
	local nCheck_reset = VNG_GetTaskPos(TSK_SINHTUVONGA1,9,9)
	if nCheck_reset == 1 then
		VNG_SetTaskPos(TSK_SINHTUVONGA1, 0, 5, 4) -- Reset doi diem moi ngay
		VNG_SetTaskPos(TSK_SINHTUVONGA1, 0, 9, 9)
	end
	if (nTodayPoint + nPoint) > nMaxToday then
		Talk(1,"","Møc ®iÓm ®æi trong ngµy v­ît qu¸ giíi h¹n "..nMaxToday..", c¸c h¹ h·y chän møc ®æi kh¸c.")
		return 0
	end
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nPoint])
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial[nPoint])
	nCurrentPoint = nCurrentPoint + nPoint
	nTodayPoint = nTodayPoint + nPoint
	VNG_SetTaskPos(TSK_SINHTUVONGA1,nCurrentPoint,3,1)
	VNG_SetTaskPos(TSK_SINHTUVONGA1,nTodayPoint,5,4)
	Msg2Player("§iÓm tÝch cùc t¨ng "..nPoint)
	gf_WriteLogEx(szLogTitle, szLogAction, 1, nPoint.." ®iÓm tÝch cùc")
end


function STVNdailymission()
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","Sinh Tö V« Ng· ch­a kÝch ho¹t.")
		return 0
	end
	local nIndex = STVN_GetDailyAwardStatus()
	if nIndex >= 3 then
		Talk(1,"","Sè lÇn nhËn nhiÖm vô h«m nay ®· hÕt, mai h·y quay l¹i nhÐ.")
		return 0
	end
	if nIndex == 2 then
		Talk(1,"","C¸c h¹ ®· hoµn thµnh nhiÖm vô, h·y ®i nhËn th­ëng.")
		return 0
	end
	if nIndex == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn nhiÖm vô hµng ngµy, h·y mau chãng hoµn thµnh nhiÖm vô.")
		return 0
	end
	STVN_SetDailyAwardStatus(1)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,1111,5,2) -- Set bé ®Õm nhiÖm vô h»ng ngµy
	Talk(1,"","Sinh tö V« Ng·: NhËn thµnh c«ng nhiÖm vô h»ng ngµy.")
end


function Award_Daily()
	local nDate = tonumber(date("%y%m%d"))
	if STVN_time_remain() == 0 then
		Talk(1,"","C¸c ®· ®Õn qu¸ muén, ®· hÕt h¹n nhËn th­ëng...")
		return 0
	end
	Msg2Player(STVN_GetDailyAwardStatus())
	if STVN_GetDailyAwardStatus() == 3 then
		Talk(1,"","Hç trî h«m nay c¸c h¹ ®· nhËn, sao l¹i muèn ®ßi thªm?")
		return 0
	end
	if STVN_GetDailyAwardStatus() == 1 then
		Talk(1,"","NhiÖm vô mçi ngµy ch­a hoµn thµnh, c¸c h¹ kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if STVN_GetDailyAwardStatus() ~= 2 then
		Talk(1,"","C¸c h¹ ch­a nhËn nhiÖm vô h»ng ngµy.")
		return 0
	end
	if gf_Judge_Room_Weight(6,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0
	end
	STVN_SetDailyAwardStatus(3)
	MatTichCaoCap70(2)
	local nAwardRand = mod(random(1,1000),20)
	gf_AddItemEx2({2,1,(30164+nAwardRand),19}, "Tr¸i c©y", szLogTitle, szLogAction)

	--3 diem tich luy
	local nCurrentPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,3,1)
	local nTodayPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,5,4)
	local nPoint = 3
	nCurrentPoint = nCurrentPoint + nPoint
	nTodayPoint = nTodayPoint + nPoint
	VNG_SetTaskPos(TSK_SINHTUVONGA1, nCurrentPoint, 3,1)
	VNG_SetTaskPos(TSK_SINHTUVONGA1, nTodayPoint, 5,4)
	Msg2Player("§iÓm tÝch cùc t¨ng "..nPoint)
	gf_WriteLogEx(szLogTitle, szLogAction, 1, nPoint.." ®iÓm tÝch cùc")
	
	local tbAward = {item = {{gdp={2,95,208,1,4}, name = "Tô NghÜa LÖnh"},{gdp={2,1,30409,1,4}, name = "Th«ng Thiªn LÖnh"}}} 
	LIB_Award:Award(tbAward)
	Talk(1,"","NhËn hç trî mçi ngµy thµnh c«ng.")
end


function Level_Award(nIndex)
	if STVN_time_remain() == 0 then
		Talk(1,"","C¸c h¹ ®· ®Õn qu¸ muén, ®· hÕt h¹n nhËn th­ëng...")
		return 0
	end
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","C¸c h¹ ch­a hoµn thµnh nhiÖm vô...")
		return 0
	end
	
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ph­¬ng ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ngäc ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
	end
	local tbAward91 = {item = {
			{gdp={0,112,78,1,1}}, --lang ba vi bo
			{gdp={2,1,30408,3}}, --Thien huyen khac ban 3
			{gdp={2,1,30491,3}}}, --Tieu y vang
			fn = "MatTichCaoCap70(9)",
	}
	local tbAward92 = {
			item = {{gdp={2,1,9999,3}, nExpired=30*24*3600}},--quan cong chuong
			nChankhi = 30000,
			nPetExp = 300,
			nPetLinhluc = 100,
	}
	local tbAward93 = {
			item = {{gdp={2,1,9998,3}, nExpired=30*24*3600}}, --quan cong dai
			nPetExp = 300,
		 	nPetLinhluc = 100, 
		 	nChankhi = 30000,
	}
	local tbAward94 = {item = {{gdp={0,112,78,1,1}, name = "L¨ng Ba Vi Bé"}}, 
			nChankhi = 30000,
			nPetExp = 300,
			nPetLinhluc = 200, 
			fn = "Trao1NguLongTuongQuan_TrangBi(10,103)",
	}
	local tbAward95 = {item = {
			{gdp={0,112,78,1,1}, name = "L¨ng Ba Vi Bé"}},
			nPetExp = 300,
			nPetLinhluc = 200,
			nChankhi = 30000,
			fn = "Trao1NguLongTuongQuan_TrangBi(10,100)",
	}
	local tbAward96 = {
			nPetExp = 300,
			nPetLinhluc = 200,
			nChankhi = 30000,
			fn = "Trao1NguLongTuongQuan_TrangBi(10,101)",
	}
	local tbAward97 = {item = {
			{gdp={2,1,504,3,4}, nExpired = 30 * 24 * 3600},--Nu oa tinh thach
			{gdp={2, 1, 30535,44}}},--thiet tinh cap 3
			nChankhi = 30000,
			nPetLinhluc = 200,
			fn = "TraoNguLongTuongQuan_TrangSuc()",
	}
	local tbAward98 = {item = {
			{gdp={2,1,9977,3}, nExpired = 30 * 24 * 3600}, -- chien cong huy hoang
			{gdp={2,1,504,3,4}, nExpired = 30 * 24 * 3600}},--Nu oa tinh thach
			nChankhi = 30000,
			fn = "HoTroPhucSinh()",
	}
	local tbAward99 = {
			nQuancong = 99000, 
			nChankhi = 30000, 
			fn = "VukhiDieuDuong();HoTroPhucSinh2()"}
	local tbAwardPS90 =  {item = {
			{gdp={2, 1, 30535,77}}},--thiet tinh cap 3
			nPetLinhluc = 200,
			nPetExp = 300,
			nChankhi = 69000,
			fn = "TrangBiDieuDuong1(103)",
	}
	local tbAwardPS91 = {
			nExp = 1234567890,
			fn = "TrangBiDieuDuong1(100)",
			
	}
	local tbAwardPS92 = {
			nExp = 1234567890,
			nChankhi = 99000,
	}
	local tbAwardPS93 = {
			nExp = 1234567890,
			fn = "TrangBiDieuDuong1(101)",
	}
	local tbAwardPS94 = {
			item= {
				{gdp={0,102,3176,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3178,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3180,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3182,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3184,1,1,-1,-1,-1,-1,-1,-1,-1}},
			},
			fn = "AddBigExp(3999000000)",
	}
	local tbAwardPS95 = {
			nChankhi = 99000,
			fn = "AddBigExp(4999000000)",
	}
	local tbAwardPS96 = {
			fn = "HoTroPhucSinhPet();AddBigExp(5999000000)",
	}
	--TRUNGLX
	local tbLevelAward = {
		[591] = tbAward91,
		[592] = tbAward92,
		[593] = tbAward93,
		[594] = tbAward94,
		[595] = tbAward95,
		[596] = tbAward96,
		[597] = tbAward97,
		[598] = tbAward98,
		[599] = tbAward99,
		[690] = tbAwardPS90,
		[691] =	tbAwardPS91,
		[692] = tbAwardPS92,
		[693] = tbAwardPS93,
		[694] = tbAwardPS94,
		[695] = tbAwardPS95,
		[696] = tbAwardPS96,
	}
	local tbIndexAward = {
		[591] = 1,
		[592] = 2,
		[593] = 3,
		[594] = 4,
		[595] = 5,
		[596] = 6,
		[597] = 7,
		[598] = 8,
		[599] = 9,
		[690] = 10,
		[691] = 11,
		[692] = 12,
		[693] = 13,
		[694] = 14,
		[695] = 15,
		[696] = 16,
	}
	local tbCondition1 = {nQuancong = 100000, nSumon = 10000, nDanhvong = 10000}
	local tbCondition2 = {nQuancong = 300000, nSumon = 20000, nDanhvong = 20000}
	local tbDieuKienChung = { -- Diem tich cuc, hanh trang, can nang}
		[591] = {30, 17, 100},
		[592] = {50, 4, 100},
		[593] = {60, 4, 100},
		[594] = {80, 2, 100},
		[595] = {90, 2, 100},
		[596] = {120, 2, 100},
		[597] = {150, 12, 100},
		[598] = {180, 7, 100},
		[599] = {210, 2, 100},
		[690] = {280, 12, 100},
		[691] = {320, 2, 100},
		[692] = {350, 2, 100},
		[693] = {400, 2, 100},
		[694] = {450, 6, 100},
		[695] = {500, 2, 100},
		[696] = {600, 2, 100},
	}
	local tbMaterial1 = {nExp = 390000000, item={{gdp ={2,1,30230,39}}}}
	local tbMaterial690 = {item={{gdp ={2,1,30230,74}}},nGold = 740000}
	local tbMaterial695 = {item={{gdp ={2,1,30230,99}},{gdp = {2,1,30603,99}}},nGold = 990000,}
	local tbMaterial696 = {item={{gdp ={2,1,30230,444}},{gdp = {2,1,30603,444}}},nGold = 44440000,}
	
	local nAwardStep = VNG_GetTaskPos(TSK_SINHTUVONGA1,8,7)
	local nDiem = VNG_GetTaskPos(TSK_SINHTUVONGA1,3,1)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()
	if tbLevelAward[nIndex] == nil then
		return 0
	end
-- Kiem tra dieu kien
	if nAwardStep >= tbIndexAward[nIndex] then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	if (nAwardStep + 1) < tbIndexAward[nIndex] then
		Talk(1,"","C¸c h¹ ch­a nhËn phÇn th­ëng tr­íc.")
		return 0
	end
	if nLevel < nIndex then
		Talk(1,"","§iÒu kiÖn chuyÓn sinh hoÆc ®¼ng cÊp kh«ng ®ñ.")
		return 0
	end
	if gf_Judge_Room_Weight(tbDieuKienChung[nIndex][2],tbDieuKienChung[nIndex][3]) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0
	end
	if nDiem < tbDieuKienChung[nIndex][1] then
		Talk(1, "", "C¸c h¹ ch­a ®ñ "..tbDieuKienChung[nIndex][1].." ®iÓm tÝch cùc")
		return 0
	end
	if nIndex <= 599 then
		if TopCheckSkill(10) == 0 then
			Talk(1, "", "C¸c h¹ ch­a luyÖn thµnh 10 cÊp vâ c«ng trÊn ph¸i.");
			return 0
		end
	else
		if TopCheckSkill(20) == 0 then
			Talk(1, "", "C¸c h¹ ch­a luyÖn thµnh 20 cÊp vâ c«ng trÊn ph¸i.");
			return 0
		end
	end
	
	local nCheck = 0
	if nIndex <= 599 then
		nCheck = LIB_Award:CheckMaterial(tbCondition1)
	else
		nCheck = LIB_Award:CheckMaterial(tbCondition2)
	end
	if nCheck == 0 then
		return 0
	end
--	if nIndex == 599 then
--		if GetTask(TSK_CS6_TULINH) ~= 4 then
--			Talk(1,"","C¸c h¹ ch­a hoµn thµnh nhiÖm vô Cèng HiÕn Quèc Gia.")
--			return 0
--		end
--	end
	nCheck = 0
	if nIndex < 598 then
		nCheck = LIB_Award:CheckMaterial(tbMaterial1)
	elseif nIndex == 598 then
		if GetTask(TSK_CS6_TULINH) < 1 then
			Talk(1,"","§¹i hiÖp ch­a nhËn nhiÖm vô Tø Linh Phôc Sinh !!!!")
			return 0
		else
			nCheck = 1
		end
	elseif nIndex == 599 then 
		if GetTask(TSK_CS6_TULINH) ~= 4 then
			Talk(1,"","§¹i hiÖp ch­a hoµn thµnh nhiÖm vô Cèng HiÕn Quèc Gia !!!!")
			return 0
		else
			nCheck = 1
		end
	elseif nIndex == 690 then 
		nCheck = LIB_Award:CheckMaterial(tbMaterial690)
	elseif nIndex > 690 and nIndex <= 695 then
		nCheck = LIB_Award:CheckMaterial(tbMaterial695)
	elseif nIndex == 696 then
		local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		if nGetQuest < 1 then
			Talk(1, "", "C¸c h¹ ch­a nhËn nhiÖm vô phôc sinh b¹n ®ång hµnh.")
			return
		end
		nCheck = LIB_Award:CheckMaterial(tbMaterial696)
	end
	if nCheck == 0 then
		return 0
	end
	SetTask(TSK_SINHTUVONGA1, GetTask(TSK_SINHTUVONGA1) + 1000000)
	
	
	if nIndex < 598 then
		LIB_Award:PayMaterial(tbMaterial1)
	elseif nIndex == 690 then 
		LIB_Award:PayMaterial(tbMaterial690)
	elseif nIndex > 690 and nIndex <= 695 then
		LIB_Award:PayMaterial(tbMaterial695)
	elseif nIndex == 696 then
		LIB_Award:PayMaterial(tbMaterial696)
	end
	
	LIB_Award:Award(tbLevelAward[nIndex])
	gf_WriteLogEx(szLogTitle, szLogAction, 1, "PhÇn th­ëng CS"..floor(nIndex/100).." level "..mod(nIndex,100))
end

function MatTichCaoCap70(nSoluong)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nSoluong}, name ="Kim Cang B¸t Nh· Ch©n QuyÓn"}}},
		[4] = {item={{gdp={0,107,205, nSoluong}, name ="TiÒm Long Tóc DiÖt Ch©n QuyÓn"}}},
		[3] = {item={{gdp={0,107,206, nSoluong}, name ="V« TrÇn Bå §Ò Ch©n QuyÓn"}}},
		[6] = {item={{gdp={0,107,207, nSoluong}, name ="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}},
		[8] = {item={{gdp={0,107,208, nSoluong}, name ="Nh­ ý Kim §Ønh Ch©n QuyÓn"}}},
		[9] = {item={{gdp={0,107,209, nSoluong}, name ="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"}}},
		[11] = {item={{gdp={0,107,210, nSoluong}, name ="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"}}},
		[12] = {item={{gdp={0,107,211, nSoluong}, name ="Quú Thiªn Du Long Ch©n QuyÓn"}}},
		[14] = {item={{gdp={0,107,212, nSoluong}, name ="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"}}},
		[15] = {item={{gdp={0,107,213, nSoluong}, name ="Qu©n Tö §íi Phong Ch©n QuyÓn"}}},
		[17] = {item={{gdp={0,107,214, nSoluong}, name ="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"}}},
		[18] = {item={{gdp={0,107,215, nSoluong}, name ="Xuyªn V©n L¹c Hång Ch©n QuyÓn"}}},
		[20] = {item={{gdp={0,107,216, nSoluong}, name ="HuyÒn Minh Phong Ma Ch©n QuyÓn"}}},
		[21] = {item={{gdp={0,107,217, nSoluong}, name ="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"}}},
		[23] = {item={{gdp={0,107,218,nSoluong}, name ="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}},
		[29] = {item={{gdp={0,107,222,nSoluong}, name ="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}},
		[30] = {item={{gdp={0,107,223,nSoluong}, name ="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end

function TrangBiHaoNguyet()
	-- Thieu Lam
	local HaoNguyet_TLD = {
		[1] = {item={
			{gdp={0,100,3064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é N¹n T«n Gi¶ Bµo"},
			{gdp={0,101,3064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é N¹n T«n Gi¶ Trang"},
			{gdp={0,103,3064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é N¹n T«n Gi¶ M·o"},}},
		[2] = {item={
			{gdp={0,100,3065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é N¹n T«n Gi¶ Bµo"},
			{gdp={0,101,3065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é N¹n T«n Gi¶ Trang"},
			{gdp={0,103,3065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é N¹n T«n Gi¶ M·o"},}},
	}
	local HaoNguyet_TLQ = {
		[1] = {item={
			{gdp={0,100,3066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ Bµo"},
			{gdp={0,101,3066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ Trang"},
			{gdp={0,103,3066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ M·o"},}},
		[2] = {item={
			{gdp={0,100,3067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ Bµo"},
			{gdp={0,101,3067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ Trang"},
			{gdp={0,103,3067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ M·o"},}},
	}
	local HaoNguyet_TLT = {
		[1] = {item={
			{gdp={0,100,3068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ Bµo"},
			{gdp={0,101,3068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ Trang"},
			{gdp={0,103,3068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ M·o"},}},
		[2] = {item={
			{gdp={0,100,3069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ Bµo"},
			{gdp={0,101,3069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ Trang"},
			{gdp={0,103,3069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ M·o"},}},
	}
	
	-- Duong Mon
	local HaoNguyet_DM = {
		[1] = {item={
			{gdp={0,100,3070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
		[3] = {item={
			{gdp={0,100,3072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
		[4] = {item={
			{gdp={0,100,3073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
	}
	
	-- Nga My
	local HaoNguyet_NMK = {
		[3] = {item={
			{gdp={0,100,3074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt V©n Th¸nh C« Y"},
			{gdp={0,101,3074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt V©n Th¸nh C« QuÇn"},
			{gdp={0,103,3074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt V©n Th¸nh C« Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt V©n Th¸nh C« Y"},
			{gdp={0,101,3075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt V©n Th¸nh C« QuÇn"},
			{gdp={0,103,3075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt V©n Th¸nh C« Tr©m"},}},
	}
	local HaoNguyet_NMD = {
		[3] = {item={
			{gdp={0,100,3076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« Y"},
			{gdp={0,101,3076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« QuÇn"},
			{gdp={0,103,3076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« Y"},
			{gdp={0,101,3077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« QuÇn"},
			{gdp={0,103,3077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« Tr©m"},}},
	}
	
	-- Cai Bang
	local HaoNguyet_CBQ = {
		[1] = {item={
			{gdp={0,100,3078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang"},
			{gdp={0,103,3078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n"},}},
		[2] = {item={
			{gdp={0,100,3079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang"},
			{gdp={0,103,3079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n"},}},
		[3] = {item={
			{gdp={0,100,3080,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3080,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang"},
			{gdp={0,103,3080,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n"},}},
		[4] = {item={
			{gdp={0,100,3081,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3081,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,103,3081,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n"},}},
	}
	local HaoNguyet_CBB = {
		[1] = {item={
			{gdp={0,100,3082,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3082,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Trang"},
			{gdp={0,103,3082,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt C©n"},}},
		[2] = {item={
			{gdp={0,100,3083,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3083,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Trang"},
			{gdp={0,103,3083,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt C©n"},}},
		[3] = {item={
			{gdp={0,100,3084,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3084,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Trang"},
			{gdp={0,103,3084,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt C©n"},}},
		[4] = {item={
			{gdp={0,100,3085,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3085,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,103,3085,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông §Þa KhÊt C©n"},}},
	}
	
	-- Vo Dang
	local HaoNguyet_VDK = {
		[1] = {item={
			{gdp={0,100,3086,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3086,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3086,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3087,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3087,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3087,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n"},}},
		[3] = {item={
			{gdp={0,100,3088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n"},}},
		[4] = {item={
			{gdp={0,100,3089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n"},}},
	}
	local HaoNguyet_VDB = {
		[1] = {item={
			{gdp={0,100,3090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n"},}},
		[3] = {item={
			{gdp={0,100,3092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n"},}},
		[4] = {item={
			{gdp={0,100,3093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n"},}},
	}
	
	-- Duong Gia
	local HaoNguyet_DGT = {
		[1] = {item={
			{gdp={0,100,3094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i"},}},
		[2] = {item={
			{gdp={0,100,3095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i"},}},
		[3] = {item={
			{gdp={0,100,3096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i"},}},
		[4] = {item={
			{gdp={0,100,3097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i"},}},
	}
	local HaoNguyet_DGC = {
		[1] = {item={
			{gdp={0,100,3098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
		[2] = {item={
			{gdp={0,100,3099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
		[3] = {item={
			{gdp={0,100,3100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
		[4] = {item={
			{gdp={0,100,3101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
	}
	
	-- Ngu Doc
	local HaoNguyet_5DD = {
		[1] = {item={
			{gdp={0,100,3102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n"},}},
		[2] = {item={
			{gdp={0,100,3103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n"},}},
		[3] = {item={
			{gdp={0,100,3104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n"},}},
		[4] = {item={
			{gdp={0,100,3105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n"},}},
	}
	local HaoNguyet_5DT = {
		[1] = {item={
			{gdp={0,100,3106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y C©n"},}},
		[2] = {item={
			{gdp={0,100,3107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y C©n"},}},
		[3] = {item={
			{gdp={0,100,3108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y C©n"},}},
		[4] = {item={
			{gdp={0,100,3109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Y C©n"},}},
	}
	
	-- Con Lon
	local HaoNguyet_CLTS = {
		[1] = {item={
			{gdp={0,100,3110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn Bào"},
			{gdp={0,101,3110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn Trang"},
			{gdp={0,103,3110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn Bào"},
			{gdp={0,101,3111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn Trang"},
			{gdp={0,103,3111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn Qu¸n"},}},
	}
	
	-- Thuy Yen
	local HaoNguyet_TYVT = {
		[3] = {item={
			{gdp={0,100,3124,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö Y"},
			{gdp={0,101,3124,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö QuÇn"},
			{gdp={0,103,3124,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö Y"},
			{gdp={0,101,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö QuÇn"},
			{gdp={0,103,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö Tr©m"},}},
	}
	local HaoNguyet_TYLN = {
		[3] = {item={
			{gdp={0,100,3126,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö Y"},
			{gdp={0,101,3126,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö QuÇn"},
			{gdp={0,103,3126,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3127,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö Y"},
			{gdp={0,101,3127,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö QuÇn"},
			{gdp={0,103,3127,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö Tr©m"},}},
	}
	local tbVuKhiHaoNguyet = {
		[2] = {item={{gdp={0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H¹o NguyÖt-§é N¹n T«n Gi¶ PhËt §ao"}}},
		[4] = {item={{gdp={0,0,8973,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ PhËt Thñ"}}},
		[3] = {item={{gdp={0,8,8974,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ PhËt Tr­îng"}}},
		[6] = {item={{gdp={0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Ch©m"}}},
		[8] = {item={{gdp={0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name ="H¹o NguyÖt-PhËt V©n Th¸nh C« Liªn KiÕm"}}},
		[9] = {item={{gdp={0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« CÇm"}}},
		[11] = {item={{gdp={0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Thñ"}}},
		[12] = {item={{gdp={0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Du Long §Þa KhÊt C«n"}}},
		[14] = {item={{gdp={0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Tóc KiÕm"}}},
		[15] = {item={{gdp={0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Bót"}}},
		[17] = {item={{gdp={0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Th­¬ng"}}},
		[18] = {item={{gdp={0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Cung"}}},
		[20] = {item={{gdp={0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn §ao"}}},
		[21] = {item={{gdp={0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Tr¶o"}}},
		[23] = {item={{gdp={0,2,8986,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn KiÕm"}}},
		[29] = {item={{gdp={0,13,8990,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö PhiÕn"}}},
		[30] = {item={{gdp={0,12,8991,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö ¦u Lan Tiªu"}}},
	}
	local tbTrangBiHaoNguyet = {
		[2] = HaoNguyet_TLD,
		[3] = HaoNguyet_TLT,
		[4] = HaoNguyet_TLQ,
		[6] = HaoNguyet_DM,
		[8] = HaoNguyet_NMK,
		[9] = HaoNguyet_NMD,
		[11] = HaoNguyet_CBQ,
		[12] = HaoNguyet_CBB,
		[14] = HaoNguyet_VDK,
		[15] = HaoNguyet_VDB,
		[17] = HaoNguyet_DGT,
		[18] = HaoNguyet_DGC,
		[20] = HaoNguyet_5DD,
		[21] = HaoNguyet_5DT,
		[23] = HaoNguyet_CLTS,
		[29] = HaoNguyet_TYVT,
		[30] =HaoNguyet_TYLN,
	}
	local nRoute = GetPlayerRoute()
	local tbAward = tbTrangBiHaoNguyet[nRoute]
	LIB_Award:AwardByBody(tbAward)
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet)
end


function UpChanKhi(nLevel)
	if MeridianGetLevel() < nLevel then
		MeridianUpdateLevel()
	end
	AwardGenuineQi(20000)
	return 1
end

function Trao1NguLongTuongQuan_TrangBi(nItemLevel,nD)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,nD,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,nD,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,nD,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,nD,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,nD,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,nD,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,nD,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,nD,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end

function TraoNguLongTuongQuan_TrangBi(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan_TrangSuc()
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end

function TrangBiDieuDuong1(nD)
	-- Thieu Lam
	local DieuDuong_TLD = {3128,3129}
	local DieuDuong_TLQ = {3130,3131}
	local DieuDuong_TLT = {3132,3133}
	local DieuDuong_DM = {3134,3135,3136,3137}
	--nga my
	local DieuDuong_NMK = {nil,nil,3138,3139}
	local DieuDuong_NMD = {nil,nil,3140,3141}
	
	-- Cai Bang
	local DieuDuong_CBQ = {3142,3143,3144,3145}
		
	local DieuDuong_CBB = {3146,3147,3148,3149}
		
	
	-- Vo Dang
	local DieuDuong_VDK = {3150,3151,3152,3153}
		
	local DieuDuong_VDB = {3154,3155,3156,3157}
		
	
	-- Duong Gia
	local DieuDuong_DGT = {3158,3159,3160,3161}
		
	local DieuDuong_DGC = {3162,3163,3164,3165}
		
	
	-- Ngu Doc
	local DieuDuong_5DD = {3166,3167,3168,3169}
		
	local DieuDuong_5DT = {3170,3171,3172,3173}
		
	
	-- Con Lon
	local DieuDuong_CLTS = {3174,3175}
		
	-- Thuy Yen
	local DieuDuong_TYVT = {nil,nil,3188,3189}

	local DieuDuong_TYLN = {nil,nil,3190,3191}

	local tbTrangBiDieuDuong = {
		[2] = DieuDuong_TLD,
		[3] = DieuDuong_TLT,
		[4] = DieuDuong_TLQ,
		[6] = DieuDuong_DM,
		[8] = DieuDuong_NMK,
		[9] = DieuDuong_NMD,
		[11] = DieuDuong_CBQ,
		[12] = DieuDuong_CBB,
		[14] = DieuDuong_VDK,
		[15] = DieuDuong_VDB,
		[17] = DieuDuong_DGT,
		[18] = DieuDuong_DGC,
		[20] = DieuDuong_5DD,
		[21] = DieuDuong_5DT,
		[23] = DieuDuong_CLTS,
		[29] = DieuDuong_TYVT,
		[30] = DieuDuong_TYLN,
	}
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local tbAward = {item={{gdp={0,nD,tbTrangBiDieuDuong[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,10}}}}
	LIB_Award:Award(tbAward)
end

function TrangBiDieuDuong()
	-- Thieu Lam
	local DieuDuong_TLD = {
		[1] = {item={
			{gdp={0,100,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo"},
			{gdp={0,101,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
			{gdp={0,103,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o"},}},
		[2] = {item={
			{gdp={0,100,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo"},
			{gdp={0,101,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
			{gdp={0,103,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o"},}},
	}
	local DieuDuong_TLQ = {
		[1] = {item={
			{gdp={0,100,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo"},
			{gdp={0,101,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
			{gdp={0,103,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o"},}},
		[2] = {item={
			{gdp={0,100,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo"},
			{gdp={0,101,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
			{gdp={0,103,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o"},}},
	}
	local DieuDuong_TLT = {
		[1] = {item={
			{gdp={0,100,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo"},
			{gdp={0,101,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
			{gdp={0,103,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o"},}},
		[2] = {item={
			{gdp={0,100,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo"},
			{gdp={0,101,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
			{gdp={0,103,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o"},}},
	}
	
	-- Duong Mon
	local DieuDuong_DM = {
		[1] = {item={
			{gdp={0,100,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
		[3] = {item={
			{gdp={0,100,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
		[4] = {item={
			{gdp={0,100,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y"},
			{gdp={0,101,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
			{gdp={0,103,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n"},}},
	}
	
	-- Nga My
	local DieuDuong_NMK = {
		[3] = {item={
			{gdp={0,100,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt V©n Th¸nh C« Y"},
			{gdp={0,101,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
			{gdp={0,103,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt V©n Th¸nh C« Y"},
			{gdp={0,101,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
			{gdp={0,103,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m"},}},
	}
	local DieuDuong_NMD = {
		[3] = {item={
			{gdp={0,100,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y"},
			{gdp={0,101,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
			{gdp={0,103,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y"},
			{gdp={0,101,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
			{gdp={0,103,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m"},}},
	}
	
	-- Cai Bang
	local DieuDuong_CBQ = {
		[1] = {item={
			{gdp={0,100,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
			{gdp={0,103,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},}},
		[2] = {item={
			{gdp={0,100,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
			{gdp={0,103,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},}},
		[3] = {item={
			{gdp={0,100,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
			{gdp={0,103,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},}},
		[4] = {item={
			{gdp={0,100,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,101,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y"},
			{gdp={0,103,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n"},}},
	}
	local DieuDuong_CBB = {
		[1] = {item={
			{gdp={0,100,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Trang"},
			{gdp={0,103,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt C©n"},}},
		[2] = {item={
			{gdp={0,100,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Trang"},
			{gdp={0,103,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt C©n"},}},
		[3] = {item={
			{gdp={0,100,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Trang"},
			{gdp={0,103,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt C©n"},}},
		[4] = {item={
			{gdp={0,100,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,101,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt Y"},
			{gdp={0,103,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Trôc Phông §Þa KhÊt C©n"},}},
	}
	
	-- Vo Dang
	local DieuDuong_VDK = {
		[1] = {item={
			{gdp={0,100,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},}},
		[3] = {item={
			{gdp={0,100,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},}},
		[4] = {item={
			{gdp={0,100,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo"},
			{gdp={0,101,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
			{gdp={0,103,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n"},}},
	}
	local DieuDuong_VDB = {
		[1] = {item={
			{gdp={0,100,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},}},
		[3] = {item={
			{gdp={0,100,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},}},
		[4] = {item={
			{gdp={0,100,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo"},
			{gdp={0,101,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
			{gdp={0,103,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n"},}},
	}
	
	-- Duong Gia
	local DieuDuong_DGT = {
		[1] = {item={
			{gdp={0,100,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},}},
		[2] = {item={
			{gdp={0,100,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},}},
		[3] = {item={
			{gdp={0,100,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},}},
		[4] = {item={
			{gdp={0,100,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p"},
			{gdp={0,101,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
			{gdp={0,103,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i"},}},
	}
	local DieuDuong_DGC = {
		[1] = {item={
			{gdp={0,100,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
		[2] = {item={
			{gdp={0,100,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
		[3] = {item={
			{gdp={0,100,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
		[4] = {item={
			{gdp={0,100,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p"},
			{gdp={0,101,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
			{gdp={0,103,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i"},}},
	}
	
	-- Ngu Doc
	local DieuDuong_5DD = {
		[1] = {item={
			{gdp={0,100,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},}},
		[2] = {item={
			{gdp={0,100,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},}},
		[3] = {item={
			{gdp={0,100,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},}},
		[4] = {item={
			{gdp={0,100,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y"},
			{gdp={0,101,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
			{gdp={0,103,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n"},}},
	}
	local DieuDuong_5DT = {
		[1] = {item={
			{gdp={0,100,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y C©n"},}},
		[2] = {item={
			{gdp={0,100,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y C©n"},}},
		[3] = {item={
			{gdp={0,100,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y C©n"},}},
		[4] = {item={
			{gdp={0,100,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Y"},
			{gdp={0,101,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y Trang"},
			{gdp={0,103,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y C©n"},}},
	}
	
	-- Con Lon
	local DieuDuong_CLTS = {
		[1] = {item={
			{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo"},
			{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
			{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n"},}},
		[2] = {item={
			{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bào"},
			{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
			{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n"},}},
	}
	
	-- Thuy Yen
	local DieuDuong_TYVT = {
		[3] = {item={
			{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Tª V©n Tiªn Tö Y"},
			{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
			{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Tª V©n Tiªn Tö Y"},
			{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
			{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m"},}},
	}
	local DieuDuong_TYLN = {
		[3] = {item={
			{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Phi H¹ Tiªn Tö Y"},
			{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Phi H¹ Tiªn Tö QuÇn"},
			{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m"},}},
		[4] = {item={
			{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Phi H¹ Tiªn Tö Y"},
			{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Phi H¹ Tiªn Tö QuÇn"},
			{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m"},}},
	}
	local tbTrangBiDieuDuong = {
		[2] = DieuDuong_TLD,
		[3] = DieuDuong_TLT,
		[4] = DieuDuong_TLQ,
		[6] = DieuDuong_DM,
		[8] = DieuDuong_NMK,
		[9] = DieuDuong_NMD,
		[11] = DieuDuong_CBQ,
		[12] = DieuDuong_CBB,
		[14] = DieuDuong_VDK,
		[15] = DieuDuong_VDB,
		[17] = DieuDuong_DGT,
		[18] = DieuDuong_DGC,
		[20] = DieuDuong_5DD,
		[21] = DieuDuong_5DT,
		[23] = DieuDuong_CLTS,
		[29] = DieuDuong_TYVT,
		[30] = DieuDuong_TYLN,
	}
	local nRoute = GetPlayerRoute()
	local tbAward = tbTrangBiDieuDuong[nRoute]
	LIB_Award:AwardByBody(tbAward)
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

function HoTroPhucSinh2()
	SetTask(TSK_CS6_DaoQuy_XoaQuy, 99999999)
	SetTask(TSK_CS6_SaMac_TamBao, 99999999)
	SetTask(TSK_CS6_KiemTien_DichTien, 99999999)
	SetTask(TSK_CS6_LiLong_HoaHo, 99999999)
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


function show_time()
	local nSinhTu_End = GetTime()
	local nDay = floor((5184000 - (nSinhTu_End - GetTask(TSK_SINHTUVONGA2))) / 86400)
	if nDay < 0 then
		nDay = 0
	end
	Msg2Player("Thêi gian nhËn th­ëng cña ho¹t ®éng Sinh Tö V« Ng· cßn : "..nDay.." ngµy")
	Talk(1, "", szNpcName.."Thêi gian nhËn th­ëng cña ho¹t ®éng Sinh Tö V« Ng· cßn : <color=green>"..nDay.." ngµy<color>")
end


function STVN_Active()
	if STVN_GetStatus() == 3 then
		Talk(1,"",szNpcName.."NhiÖm vô Sinh Tö V« Ng· ®· hÕt h¹n.")
		return 0
	end
	if STVN_GetStatus() == 2 then
		Talk(1,"",szNpcName.."Sinh Tö V« Ng· ®· kÝch ho¹t, kh«ng cÇn kÝch ho¹t l¹i.")
		return 0
	end
	if STVN_GetStatus() == 1 then
		if STVN_AllMissionComplete() ~= 1 then
			Talk(1,"",szNpcName.."C¸c h¹ ch­a hoµn thµnh c¸c nhiÖm vô Sinh Tö V« Ng·.")
			return 0
		end
		STVN_ActiveAward()
		return 1
	end
	Talk(1,"",szNpcName.."C¸c h¹ ch­a nhËn nhiÖm vô Sinh Tö V« Ng·.")
	return 0
end


function STVN_ActiveAward()
	local nLevel = GetLevel()
	local nChuyenSinh = GetTranslifeCount() + GetPlayerRebornParam(0)
	local nAwardIndex = nChuyenSinh * 100 + GetLevel()
	if nAwardIndex >= 600 and nAwardIndex <= 679 then
		Talk(1,"",szNpcName.."CÊp ®é nµy kh«ng thÓ kÝch ho¹t Sinh Tö V« Ng·. C¸c h¹ h·y phÊn ®Êu ®Õn ®¼ng cÊp 80.")
		return 0
	end
	local nIndex = 1
	if nChuyenSinh == 5 and nLevel == 99 then
		nIndex = 2
	end
	local nCheck = LIB_Award:CheckMaterial(tbActiveFee[nChuyenSinh][nIndex])
	if nCheck ~= 1 then
		return 0
	end
	
	local szSayHead = "Khi luyÖn Sinh Tö V« Ng·, c¸c h¹ sÏ ®o¹n tuyÖt qu¸ khø, trë thµnh ng­êi hoµn toµn míi. H·y chän l¹i phe ph¸i cña m×nh."
	local tbSay = {}
	tinsert(tbSay, "Ta sÏ gia nhËp phe Tèng/#STVN_Active_Phe(1)")
	tinsert(tbSay, "Ta sÏ gia nhËp phe Liªu/#STVN_Active_Phe(2)")
	tinsert(tbSay, "Ta muèn nghÜ kü h¬n/gf_DoNothing")
	Say(szSayHead, getn(tbSay), tbSay)
end


function STVN_Active_Phe(nPhe)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if STVN_GetStatus() ~= 1 then
		Talk(1,"",szNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ kÝch ho¹t, vui lßng kiÓm tra l¹i.")
		return 0
	end
	if STVN_AllMissionComplete() ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a hoµn thµnh c¸c nhiÖm vô Sinh Tö V« Ng·.")
		return 0
	end
	if gf_Judge_Room_Weight(16, 50," ") ~= 1 then
		Talk(1, "", "Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
        	return 0
    end
	local nRoute = GetPlayerRoute()
	local tRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	if tRoute[nRoute] ~= 1 then
		Talk(1, "", "Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ tham gia ho¹t ®éng nµy.");
		return 0
	end	
	local nCheck = STVN_time_remain()
	if nCheck == 0 then
		Msg2Player("§· hÕt h¹n kÝch ho¹t Sinh Tö V« Ng·.")
		Talk(1, "", szNpcName.."§· hÕt h¹n kÝch ho¹t Sinh Tö V« Ng·.")
		return 0
	end
	
	local nLevel = GetLevel()
	local nChuyenSinh = GetTranslifeCount() + GetPlayerRebornParam(0)
	local nIndex = 1
	if nChuyenSinh == 5 and nLevel == 99 then
		nIndex = 2
	end
	local nCheck = LIB_Award:CheckMaterial(tbActiveFee[nChuyenSinh][nIndex])
	if nCheck ~= 1 then
		return 0
	end
	local tSay = 	{
		"Ta muèn tu luyÖn theo h­íng Long Tö!/#SinhTu_select_translife(1,"..nPhe..")",
		"Ta muèn tu luyÖn theo h­íng Hæ Tö!/#SinhTu_select_translife(2,"..nPhe..")",
		"Ta muèn tu luyÖn theo h­íng ¦ng Tö!/#SinhTu_select_translife(3,"..nPhe..")",
		"Ta muèn tu luyÖn theo h­íng Phông Tö!/#SinhTu_select_translife(4,"..nPhe..")",
		"Ta suy nghÜ l¹i ®·./gf_DoNothing",
	}
	Say("<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end

function AddBigExp(nExp)
	if nExp > 2000000000 then
		Msg2Player("B¹n ®· nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm !")
		gf_WriteLogEx("SINH TU VO NGA BK", "nhËn ®iÓm kinh nghiÖm", nExp, "§iÓm kinh nghiÖm")
		for i=0,(floor(nExp/1000000000)) do
			ModifyExp(min(1000000000,nExp))
			nExp = nExp - min(1000000000,nExp)
		end
		
	end
end

--TSK_PET_PS_GIAIDOAN_A = 2538	--xxxFFFcddg: x = 160 c©y tø linh, F = 160 c©y b¸t nh· nhá, c = h­íng Phôc Sinh, dd = sè lÇn phôc sinh, g = .....
--TSK_PET_PS_GIAIDOAN_B = 2539	--aabbccddeg: g = (1,2,3) chuçi nhiÖm vô), e = x¸c ®Þnh cã PET Phôc Sinh, dd = 30 lÇn Cóng TÕ, cc = 30 lÇn TrÞ An, bb = 30 lÇn Thñy Lîi, aa = 3 lÇn luyÖn ®¬n
function HoTroPhucSinhPet()
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_A,160160,10,5)
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_B,3303030,10,3)
	Msg2Player("B¹n ®· hoµn thµnh giai ®o¹n 1 nhiÖm vô phôc sinh b¹n ®ång hµnh")
end



function SinhTu_select_translife(nType, nPhe)
	local nCountCS = GetTranslifeCount()	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(11,500) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0
	end
	local nLevel = GetLevel()
	local nChuyenSinh = GetTranslifeCount() + GetPlayerRebornParam(0)
	local nAwardIndex = nChuyenSinh * 100 + GetLevel()
	if nAwardIndex >= 600 and nAwardIndex <= 679 then
		Talk(1,"",szNpcName.."CÊp ®é nµy kh«ng thÓ kÝch ho¹t Sinh Tö V« Ng·. C¸c h¹ h·y phÊn ®Êu ®Õn ®¼ng cÊp 80.")
		return 0
	end
	local nIndex = 1
	if nChuyenSinh == 5 and nLevel == 99 then
		nIndex = 2
	end
	local nCheck = LIB_Award:CheckMaterial(tbActiveFee[nChuyenSinh][nIndex])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbActiveFee[nChuyenSinh][nIndex])
	STVN_SetStatus(2) -- Set status Sinh Tu Vo Nga (2=kich hoat)
	ModifyReputation(-GetReputation(),0) --set ®iÓm danh väng vÒ 1
	ModifyReputation(1,0)
	SetTask(336, 1) --set ®iÓm s­ m«n vÒ 1
	if nPhe == 1 then
		SetTask(701, 1)
	else
		SetTask(701, -1)
	end
	--=== Clear qu©n c«ng b¶o l­u ====
	SetTask(2150, 0)
	SetTask(2151, 0)
	--==== Reset task nhiem vu de dung lai =======
	SetTask(TSK_SINHTUVONGA1,0)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)	
	--===================================
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	if nAwardIndex > 598 then
		VNG_SetTaskPos(TSK_SINHTUVONGA1,9,8,7)
		local tbAward = {
			item={
				{gdp={2,1,9977,3}, nExpired = 30 * 24 * 3600}, -- chien cong huy hoang
				{gdp={2,1,30408,3}}, --thien huyen khac ban
			},
			nChankhi = 49000,
			fn ="VukhiDieuDuong()",
		}
		LIB_Award:Award(tbAward)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,2,9,9) -- Set status Sinh Tu Vo Nga (2=kich hoat)
		-- Reset task nhiem vu de dung lai
		PlayerReborn(1,nType)
		
		if nAwardIndex >= 680 then
			local nType_cs6 = GetPlayerRebornParam(1)
			for i=1, getn(tb_translife_cloth_PS[nType_cs6]) do
				local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS[nType_cs6][i][2])
				P = P + GetBody() - 1
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			end
			local tbVanSu = {"V¨n Sö ngo¹i trang",0,108,570,188}
			local nPVanSu = tbVanSu[4]  + GetBody() - 1
			for i = 0, 2 do
				BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
			end
			SetLevel(80,0)
		else
			local nType_cs5 = GetTranslifeFaction()	
			local nTransCount = GetTranslifeCount()	
			local nRoute = GetPlayerRoute()
			for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
				local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
				P = P + GetBody() - 1
				Pnew = 30000 + GetBody()
				Pnew1 = 561 + GetBody()			
				Pnew2 = 565 + GetBody()		
				lvatt3 = lvatt3 or 0
				att3 = att3 or 0
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))
				BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
				BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
				BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
			end
			RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	
			AddTitle(61,05)
			local tbVanSu = {"V¨n Sö ngo¹i trang",0,108,570,188}
			local nPVanSu = tbVanSu[4]  + GetBody() - 1
			for i = 0, 2 do
				BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
			end
			gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
			SetLevel(10,0)
			ModifyExp(-GetExp())
		end
		DoWait(15,15,10)
	else
		local nRoute = GetPlayerRoute()
		-- Set sè lÇn chuyÓn sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5)
		-- Set h­íng chuyÓn sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
		local nTransCount = GetTranslifeCount()
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
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 37)
		ResetProperty()
		Msg2Player("§ang truyÒn Hçn Nguyªn C«ng chiªu thøc thø t­...")
		AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> v­ît qua thö th¸ch Long Quang Ch©n Nh©n, ®­îc truyÒn thô 8 thµnh <color=green>Hçn Nguyªn C«ng<color> theo  h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color>!")
	--		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
	-- ¸p dông c¸c ®iÒu kiÖn cña Sinh Tö V« Ng·
		SetLevel(90,0)
		ModifyExp(-GetExp()) --set ®iÓm kinh nghiÖm vÒ 0
		local tbAward = {
			item={{gdp={0,200,40,1}, nExpired=30*24*3600}},
			fn="MatTichCaoCap70(6);MatTichTranPhai();"
		}
		LIB_Award:Award(tbAward)
		DoWait(15,15,10)
	end
end


function STVN2_TienDoNhiemVu()
	local szMsg = szNpcName.."TiÕn ®é hoµn thµnh Sinh Tö V« Ng·:\n"
	for i=1, getn(tbSTVNconfig) do
		szMsg = szMsg .. tbSTVNconfig[i][2]..": cßn <color=red>".. VNG_GetTaskPos(tbSTVNconfig[i][1],tbSTVNconfig[i][4],tbSTVNconfig[i][5]) .."<color> lÇn.\n"
	end
	Talk(1,"",szMsg)
end


function MatTichTranPhai()
	local tbMatTich = {
		[2] = {item={{gdp={0, 112, 101, 1}}}},
		[4] = {item={{gdp={0, 112, 102, 1}}}},		
		[3] = {item={{gdp={0, 112, 103, 1}}}},		
		[6] = {item={{gdp={0, 112, 104, 1}}}},		
		[8] = {item={{gdp={0, 112, 105, 1}}}},		
		[9] = {item={{gdp={0, 112, 106, 1}}}},		
		[11] = {item={{gdp={0, 112, 107, 1}}}},		
		[12] = {item={{gdp={0, 112, 108, 1}}}},		
		[14] = {item={{gdp={0, 112, 109, 1}}}},		
		[15] = {item={{gdp={0, 112, 110, 1}}}},		
		[17] = {item={{gdp={0, 112, 111, 1}}}},		
		[18] = {item={{gdp={0, 112, 112, 1}}}},		
		[20] = {item={{gdp={0, 112, 113, 1}}}},		
		[21] = {item={{gdp={0, 112, 114, 1}}}},
		[23] = {item={{gdp={0,112,192,1}}}},
		[29] = {item={{gdp={0,112,196,1}}}},
		[30] = {item={{gdp={0,112,197,1}}}},
	}
	local nRoute = GetPlayerRoute()
	LIB_Award:Award(tbMatTich[nRoute])
end