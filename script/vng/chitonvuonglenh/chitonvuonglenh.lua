Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_newserver.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");

szNPCName = "<color=green>Anh/ChÞ Chñ Phßng M¸y: <color>"
szLogTitle = "CHI TON VUONG LENH"
szLogTitle1 = "CHI TON VUONG LENH BK"
DEFINE_30_DAYS = 2592000
--EXT_POINT_CLTV = 5	--khai b¸o ExtPoint
--TSK_CTVL_START = 2664  --khai b¸o Task thêi h¹n CTVL
--TSK_CTVL_ALL = 2665		--khai b¸o task: 0987654321: 1:kÝch ho¹t CTVL;	2: ®· x©y dùng bang trong tuÇn	3: ®· nhËn th­ëng BHCT trong tuÇn		4: nhËn th­ëng tæ ®éi trong ngµy		65: check lev nhËn th­ëng PS0 	7: nhËn trang bÞ HN	8: kich ho¹t Bang héi ChÝ T«n		9: nhËn th­ëng PS1 88	0: nhËn th­ëng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: bé ®Õm b­íc nhiÖm vô	4: tr¹ng th¸i hoµn thµnh nhiÖm vô		65: l­u ID nhiÖm vô mçi ngµy ®ang thùc hiÖn	7: sè lÇn hoµn thµnh nhiÖm vô trong ngµy		8: tr¹ng th¸i nhËn thö th¸ch		9: nhËn th­ëng mçi ngµy cña old server

function CTVL_first()
	do return end
	local nCTVL_End = GetTime()
	if GetTask(TSK_CTVL_START) > 0 then
		if nCTVL_End - GetTask(TSK_CTVL_START) > DEFINE_30_DAYS then
			Msg2Player("ChÝ T«n V­¬ng LÖnh ®· hÕt hiÖu lùc.")
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChÝ T«n V­¬ng LÖnh ®· hÕt hiÖu lùc.")
			SetTask(TSK_CTVL_ALL, GetTask(TSK_CTVL_ALL)+1)
			return 0
		end		
	end
	
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local tSay = {}
	
	tinsert(tSay, "Ta muèn kÝch ho¹t ChÝ T«n V­¬ng LÖnh/CTVL_active")
	tinsert(tSay, "Bang héi ChÝ T«n/CTVL_Tong")
	tinsert(tSay, "Tæ §éi ChÝ T«n/CTVL_Party")
	if ChiTonNew_CheckNewServer() ~= 1 then
		tinsert(tSay, "Chµo mõng b¹n trë l¹i Vâ L©m TruyÒn Kú 2 (nhËn 1 bé trang bÞ H¹o NguyÖt)/#CTVL_getHN(0)")
		if VNG_GetTaskPos(TSK_CTVL_ALL, 7, 7) ~= 0 then
			tinsert(tSay, "NhËn l¹i 1 bé trang bÞ H¹o NguyÖt (cÇn 29 vµng))/#CTVL_getHN(1)")
		end
		tinsert(tSay, "Ta muèn nhËn hç trî kÝch ho¹t c¶nh giíi kinh m¹ch/CTVL_KinhMach_main")
		tinsert(tSay, "Ta muèn nhËn th­ëng mçi ngµy (tiªu hao 1 b¸t nh· nhá, 1 b¸t nh· lín, 3 h¹t gièng/CTVL_getDaily_Award")
		tinsert(tSay, "Ch­a Phôc Sinh, ta muèn nhËn th­ëng theo ®¼ng cÊp cña ChÝ T«n V­¬ng LÖnh/CTVL_getLevel_Award")
		tinsert(tSay, "Phôc Sinh 1 - ChÝ T«n V­¬ng LÖnh/CTVL_getLevel_PS1")
		tinsert(tSay, "Phôc Sinh 2 - ChÝ T«n V­¬ng LÖnh/CTVL_getLevel_PS2")
	else
		tinsert(tSay, "Server míi ChÝ T«n V­¬ng LÖnh/ChiTonNewServer_Menu")
	end
	tinsert(tSay, "Ta kh«ng muèn lµm g× hÕt/nothing")
	
	Say(szNpcName.."Ta chuyªn phô tr¸ch vÒ ChÝ T«n V­¬ng LÖnh. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end
function nothing()

end
function CTVL_active()
	do return end
	local nExtPoint = GetExtPoint(5)
	local nCheck = CheckAccount_Active()
	if nCheck == 0 then
		return
	end
	if nExtPoint == 1 then
		SetTask(TSK_CTVL_START, GetTime())
		SetTask(TSK_CTVL_ALL, 1) --Task kÝch ho¹t CTVL
		--PayExtPoint(EXT_POINT_CLTV,GetExtPoint(EXT_POINT_CLTV))	
		--AddExtPoint(EXT_POINT_CLTV,2)
		 gf_WriteLogEx(szLogTitle, "kick ho¹t thµnh c«ng", 1, "CTVL kÝch ho¹t")
		Msg2Player("KÝch ho¹t ChÝ T«n V­¬ng LÖnh thµnh c«ng.")
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: KÝch ho¹t ChÝ T«n V­¬ng LÖnh thµnh c«ng.")
	end
end

function CTVL_KinhMach_main()
	local tSay = {}
	tinsert(tSay, "KÝch ho¹t Vâ Gi¶ (®¹t cÊp 90 chuyÓn sinh 1 trë lªn)/#CTVL_KinhMach_active(1)")
	tinsert(tSay, "KÝch ho¹t Vâ T­íng (®¹t cÊp 90 chuyÓn sinh 1 trë lªn)/#CTVL_KinhMach_active(2)")
	tinsert(tSay, "Ta kh«ng muèn lµm g× hÕt/nothing")	
	
	Say(szNpcName.."Ta chuyªn phô tr¸ch vÒ ChÝ T«n V­¬ng LÖnh. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)	
end
function CTVL_KinhMach_active(nType)
	local nCheck = CheckAccount_Active1()
	local nCount_CS = GetTranslifeCount()
	local nLevel = GetLevel()
	local tKM = {1, 2}
	
	if nCheck ~= 1 then
		return
	end
	if nCount_CS < 1 then
		Talk(1, "","§¹i hiÖp ch­a ®¹t ChuyÓn Sinh 1 nªn kh«ng thÓ nhËn hç trî")
		return
	end
	if nLevel < 90 then
		Talk(1, "","§¹i hiÖp ch­a ®¹t cÊp 90 nªn kh«ng thÓ nhËn hç trî")
		return
	end
	if MeridianGetLevel() >= tKM[nType] then
		Talk(1, "", "§¹i hiÖp ®· kÝch ho¹t c¶nh giíi nµy råi.")
		return
	end
	if nType == 2 then
		if MeridianGetLevel() < 1 then
			Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t c¶nh giíi Vâ Gi¶.")
			return
		end
	end
	MeridianUpdateLevel()
	 gf_WriteLogEx(szLogTitle, "hç trî thµnh c«ng", 1, "Hç trî thµnh c«ng lo¹i "..nType)
end
function CTVL_getDaily_Award()
	local nCount_CS = GetTranslifeCount()
	local nCheck = CheckAccount_Active1()
	local nCountItem = 1
	local nDelItem = 1
	local tItem_check = {
									{"B¸t nh· nhá",  2,0,504,1},
									{"B¸t nh· lín", 2,0,398,1},
									{"H¹t gièng", 2,1,30086,3},
								}
	local tItem_add = {
									{"M¶nh Thiªn M«n", 2,1,30410,10},
									{"M¶nh Thiªn Cang", 2,1,30390,50},
									{"Cæ Linh Ngäc", 2,1,30369,6},
								}
	if nCheck ~= 1 then
		return
	end	
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
--	if nCount_CS ==0 then
--		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a chuyÓn sinh nªn kh«ng thÓ nhËn quµ hç trî.")
--		return 
--	end	
	if nLevel < 83 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña ®¹i hiÖp qu¸ thÊp, h·y ®¹t cÊp 83 råi quay l¹i gÆp ta ®Ó nhËn quµ hç trî.")
		return 
	end
	if nRoute == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a gia nhËp ph¸i nªn kh«ng thÓ nhËn quµ hç trî.")
		return	
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 9, 9) >= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ®· nhËn quµ hç trî h«m nay råi.")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Chñ Phßng M¸y") == 0 then
		return
	end
	for i = 1, 3 do
		if GetItemCount(tItem_check[i][2], tItem_check[i][3], tItem_check[i][4]) < tItem_check[i][5] then
			nCountItem = 0
		end
	end
	if nCountItem == 0 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ vËt phÈm ®Ó nhËn th­ëng hµng ngµy.")
		return
	end
	for i = 1, 3 do
		if DelItem(tItem_check[i][2], tItem_check[i][3], tItem_check[i][4], tItem_check[i][5]) ~= 1 then
			nDelItem = 2
		end
	end
	if nDelItem == 2 then
		gf_WriteLogEx(szLogTitle, "hç trî kh«ng thµnh c«ng", 1, "Hç trî kh«ng thµnh c«ng lo¹i "..nType)
	else
		VNG_SetTaskPos(TSK_CTVL_COUNT, 1, 9, 9)
		for i =1, 3 do
			gf_AddItemEx2({tItem_add[i][2], tItem_add[i][3], tItem_add[i][4], tItem_add[i][5]},tItem_add[i][1], szLogTitle, "add thµnh c«ng")
		end
		Msg2Player("NhËn th­ëng mçi ngµy: 10 M¶nh Thiªn M«n, 50 M¶nh Thiªn Cang, 6 Cæ Linh Ngäc")
		gf_WriteLogEx(szLogTitle, "hç trî thµnh c«ng", 1, "NhËn th­ëng mçi ngµy ")
	end
end

function CTVL_getLevel_Award()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end	
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nChuyenSinh_count = GetTranslifeCount()
	local nLevel = GetLevel()
	if nPhucSinh > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ®· thùc hiÖn Phôc Sinh råi nªn kh«ng thÓ nhËn th­ëng ë ®©y ®­îc..")
		return	
	end
	if nChuyenSinh_count < 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a chuyÓn sinh nªn kh«ng thÓ nhËn th­ëng ®­îc.")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Chñ Phßng M¸y") == 0 then
		return
	end
	if nLevel < 79 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a ®ñ ®¼ng cÊp ®Ó nhËn nhiÖm vô.")
		return		
	end
	local nGet = VNG_GetTaskPos(TSK_CTVL_ALL, 6,5)		--mod(floor(GetTask(TSK_CTVL_ALL)/10000), 100)
	
	if nGet >= tb_award_ctvl_PS0[nLevel][1] then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn tiÕp n÷a!");
		return
	end	
	if GetItemCount(tb_award_ctvl_PS0[nLevel][3], tb_award_ctvl_PS0[nLevel][4], tb_award_ctvl_PS0[nLevel][5]) < tb_award_ctvl_PS0[nLevel][6] then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp kh«ng cã ®ñ "..tb_award_ctvl_PS0[nLevel][6].." "..tb_award_ctvl_PS0[nLevel][2].." ®Ó nhËn nhiÖm vô");
		return
	end
	if DelItem(tb_award_ctvl_PS0[nLevel][3], tb_award_ctvl_PS0[nLevel][4], tb_award_ctvl_PS0[nLevel][5], tb_award_ctvl_PS0[nLevel][6]) == 1 then
		VNG_SetTaskPos(TSK_CTVL_ALL, tb_award_ctvl_PS0[nLevel][1], 6,5)
		ModifyExp(tb_award_ctvl_PS0[nLevel][7])
		Msg2Player("NhËn ®­îc "..tb_award_ctvl_PS0[nLevel][7].." ®iÓm kinh nghiÖm")
		if nLevel < 90 then
			Earn(tb_award_ctvl_PS0[nLevel][8])
		else
			AwardGenuineQi(tb_award_ctvl_PS0[nLevel][9])
		end
		gf_WriteLogEx(szLogTitle, "nhËn th­ëng thµnh c«ng", 1, "NhËn th­ëng PS0 thµnh c«ng "..nLevel)
	else
		gf_WriteLogEx(szLogTitle, "nhËn th­ëng kh«ng thµnh c«ng", 1, "NhËn th­ëng PS0 kh«ng thµnh c«ng "..nLevel)
	end
	
end
function CTVL_getLevel_PS1()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end	
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nLevel = GetLevel()
	if nPhucSinh ~= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp kh«ng ph¶i Phôc Sinh 1 nªn kh«ng thÓ nhËn th­ëng ë ®©y ®­îc..")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Chñ Phßng M¸y") == 0 then
		return
	end
	if nLevel < 90 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a ®ñ ®¼ng cÊp ®Ó nhËn th­ëng.")
		return		
	end	
	local tSay = {}
	
	tinsert(tSay, "NhËn th­ëng ®¼ng cÊp 90 /CTVL_PS1_getAward88")
	tinsert(tSay, "NhËn nhiÖm vô mçi ngµy/#CTVL_PS12_getMission(1)")
	tinsert(tSay, "TiÕn ®é nhiÖm vô mçi ngµy/CTVL_PS12_ShowCountMission")	
	tinsert(tSay, "TiÕn ®é nhiÖm vô ®ang lµm/CTVL_PS12_ShowCountQuest")
	tinsert(tSay, "Nhê chñ phßng m¸y hç trî hoµn thµnh 3 nhiÖm vô (tiªu hao 2 ®¹i ng©n phiÕu)/CTVL_PS12_Help")
	tinsert(tSay, "NhËn th­ëng hoµn thµnh nhiÖm vô mçi ngµy/CTVL_PS12_finishMission")

	tinsert(tSay, "Ta kh«ng muèn lµm g× hÕt/nothing")
	
	Say(szNpcName.."Ta chuyªn phô tr¸ch vÒ ChÝ T«n V­¬ng LÖnh. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end
function CTVL_PS1_getAward88()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nPhucSinh = GetPlayerRebornParam(0)		
	local nKinhMach = MeridianGetLevel()
	local nLev = GetLevel()
	if nLev < 90 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña ®¹i hiÖp qu¸ thÊp nªn kh«ng thÓ nhËn th­ëng. §ñ ®iÒu kiÖn råi h·y quay l¹i gÆp ta..")
		return
	end
	if nLev > 90 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña ®¹i hiÖp qu¸ cao nªn kh«ng thÓ nhËn th­ëng ®­îc.")
		return
	end	
	if nPhucSinh < 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a Phôc Sinh lÇn 1 nªn kh«ng thÓ nhËn th­ëng ®­îc. §ñ ®iÒu kiÖn råi h·y quay l¹i gÆp ta..")
		return		
	end
	if nKinhMach < 2 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¶nh giíi kinh m¹ch cña ®¹i hiÖp ph¶i ®¹t Vâ T­íng th× ta míi gióp ®¹i hiÖp kÝch ho¹t c¶nh giíi Vâ V­¬ng ®­îc. §ñ ®iÒu kiÖn råi h·y quay l¹i gÆp ta..")
		return		
	end
	if gf_Judge_Room_Weight(2, 10, "Chñ Phßng M¸y") == 0 then
		return
	end	
	local nCheck_getPS188 = VNG_GetTaskPos(TSK_CTVL_ALL, 9, 9)
	if nCheck_getPS188 >= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.")
		return		
	end
	VNG_SetTaskPos(TSK_CTVL_ALL, 1, 9, 9)
	local nExp1 = 2000000000
	local nExp2 = 1000000000
	ModifyExp(nExp1)
	Msg2Player("§¹i hiÖp nhËn ®­îc "..nExp1.." ®iÓm kinh nghiÖm")
	ModifyExp(nExp2)
	Msg2Player("§¹i hiÖp nhËn ®­îc "..nExp2.." ®iÓm kinh nghiÖm")
	MeridianUpdateLevel()	
	gf_AddItemEx2({2,1,30497,290},"Ma tinh", szLogTitle, "add thµnh c«ng")
	gf_WriteLogEx(szLogTitle, "nhËn th­ëng thµnh c«ng", 1, "NhËn th­ëng PS1 lev90 thµnh c«ng ")	
end
function CTVL_getLevel_PS2()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end	
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nLevel = GetLevel()
	if nPhucSinh ~= 2 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp kh«ng ph¶i Phôc Sinh 2 nªn kh«ng thÓ nhËn th­ëng ë ®©y ®­îc..")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Chñ Phßng M¸y") == 0 then
		return
	end
	if nLevel < 75 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a ®ñ ®¼ng cÊp ®Ó nhËn nhiÖm vô.")
		return		
	end	
	local tSay = {}
	
	tinsert(tSay, "NhËn th­ëng ®¼ng cÊp 75 /CTVL_PS2_getAward75")
	tinsert(tSay, "NhËn nhiÖm vô mçi ngµy/#CTVL_PS12_getMission(2)")
	tinsert(tSay, "TiÕn ®é nhiÖm vô mçi ngµy/CTVL_PS12_ShowCountMission")
	tinsert(tSay, "TiÕn ®é nhiÖm vô ®ang lµm/CTVL_PS12_ShowCountQuest")
	tinsert(tSay, "Nhê chñ phßng m¸y hç trî hoµn thµnh 3 nhiÖm vô (tiªu hao 2 ®¹i ng©n phiÕu)/CTVL_PS12_Help")
	tinsert(tSay, "NhËn th­ëng hoµn thµnh nhiÖm vô mçi ngµy/CTVL_PS12_finishMission")

	tinsert(tSay, "Ta kh«ng muèn lµm g× hÕt/nothing")
	
	Say(szNpcName.."Ta chuyªn phô tr¸ch vÒ ChÝ T«n V­¬ng LÖnh. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end
function CTVL_PS2_getAward75()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nPhucSinh = GetPlayerRebornParam(0)		
	local nLev = GetLevel()
	if nLev < 75 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña ®¹i hiÖp qu¸ thÊp nªn kh«ng thÓ nhËn th­ëng. §ñ ®iÒu kiÖn råi h·y quay l¹i gÆp ta..")
		return
	end
	if nLev > 75 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña ®¹i hiÖp qu¸ cao nªn kh«ng thÓ nhËn th­ëng ®­îc")
		return
	end	
	if nPhucSinh < 2 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a Phôc Sinh lÇn 2 nªn kh«ng thÓ nhËn th­ëng ®­îc. §ñ ®iÒu kiÖn råi h·y quay l¹i gÆp ta..")
		return		
	end
	if gf_Judge_Room_Weight(2, 10, "Chñ Phßng M¸y") == 0 then
		return
	end	
	local nCheck_getPS275 = VNG_GetTaskPos(TSK_CTVL_ALL, 10, 10)
	if nCheck_getPS275 >= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.")
		return		
	end
	VNG_SetTaskPos(TSK_CTVL_ALL, 1, 10, 10)	
	local nExp1 = 2000000000
	ModifyExp(nExp1)
	Msg2Player("§¹i hiÖp nhËn ®­îc "..nExp1.." ®iÓm kinh nghiÖm")
	gf_AddItemEx2({2,1,30497,290},"Ma tinh", szLogTitle, "add thµnh c«ng")
	gf_WriteLogEx(szLogTitle, "nhËn th­ëng thµnh c«ng", 1, "NhËn th­ëng PS2 lev75 thµnh c«ng ")	
end
function CTVL_PS12_Help()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 6, 5) == 0  then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a nhËn nhiÖm vô nµo hÕt.")
		return		
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7) >= 3 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ®· hoµn thµnh nhiÖm vô h«m nay råi nªn kh«ng cÇn ta hç trî n÷a ®©u.")
		return	
	end
	if GetItemCount(2,1,199) < 2 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp kh«ng mang ®ñ 2 ®¹i ng©n phiÕu.")
		return	
	end
	if DelItem(2,1,199,2) == 1 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 3, 7, 7)
		Msg2Player("Ta ®· gióp ®¹i hiÖp hoµn thµnh hÕt nhiÖm vô trong ngµy. §¹i hiÖp h·y ®i nhËn th­ëng ®i")
		gf_WriteLogEx(szLogTitle, "hç trî thµnh c«ng", 1, "Hç trî hoµn thµnh nhiÖm vô mçi ngµy ")	
	end
end
function CTVL_PS12_finishMission()
	local tFruits = {
		[1] = {2,1,30164},
		[2] = {2,1,30165},
		[3] = {2,1,30166},
		[4] = {2,1,30167},
		[5] = {2,1,30168},
		[6] = {2,1,30169},
		[7] = {2,1,30170},
		[8] = {2,1,30171},
		[9] = {2,1,30172},
		[10] = {2,1,30173},
		[11] = {2,1,30174},
		[12] = {2,1,30175},
		[13] = {2,1,30176},
		[14] = {2,1,30177},
		[15] = {2,1,30178},
		[16] = {2,1,30179},
		[17] = {2,1,30180},
		[18] = {2,1,30181},
		[19] = {2,1,30182},
		[20] = {2,1,30183},
	}
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if gf_Judge_Room_Weight(10, 100, "Chñ Phßng M¸y") == 0 then
		return
	end		
	local nCount = CTVL_CountDailyMission()
	if nCount < 3 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>:§¹i hiÖp ch­a hoµn thµnh ®ñ 3 nhiÖm vô ngµy h«m nay nªn kh«ng thÓ nhËn th­ëng")
		return	
	end
	if nCount > 3 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>:§¹i hiÖp ®· nhËn th­ëng hoµn thµnh nhiÖm vô h«m nay råi.")
		return	
	end
	VNG_SetTaskPos(TSK_CTVL_COUNT, 4, 7, 7) --Set gi¸ trÞ lªn 4 ®· nhËn th­ëng råi
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nExp = 390000000
	if nPhucSinh == 1 then
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓmkinh nghiÖm")
		local nSize = getn(tFruits);
		local nIndex = mod(random(1,1000),nSize)+1
		AddItem(tFruits[nIndex][1],tFruits[nIndex][2],tFruits[nIndex][3],39);	
	elseif nPhucSinh == 2 then
		nExp = 690000000	
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓmkinh nghiÖm")
		gf_AddItemEx2({2,1,30071,6},"Nh©n S©m V¹n N¨m", szLogTitle, "add thµnh c«ng")
	end
	gf_AddItemEx2({2,1,30132,999},"Vâ L©m B¶o H¹p", szLogTitle, "add thµnh c«ng")
	gf_WriteLogEx(szLogTitle, "nhËn th­ëng thµnh c«ng", 1, "NhËn th­ëng mçi ngµy thµnh c«ng, Phôc Sinh "..nPhucSinh)	
end
function CTVL_PS12_ShowCountQuest()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if CTVL_CheckActive() ~= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>:§¹i hiÖp ch­a nhËn nhiÖm vô nµo c¶")
		return
	end
	local nQuest = VNG_GetTaskPos(TSK_CTVL_COUNT, 6, 5)
	local nCount = VNG_GetTaskPos(TSK_CTVL_COUNT, 3, 1)

	Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: B¹n ®ang thùc hiÖn nhiÖm vô "..tbCTVLName[nQuest][1]..". TiÕn ®é ch­a hoµn thµnh lµ "..nCount.." lÇn")
end
function CTVL_PS12_ShowCountMission()
	local nCount = CTVL_CountDailyMission()
	Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: H«m nay ®¹i hiÖp ®· hoµn thµnh "..nCount.."/3 nhiÖm vô")
end

function CTVL_PS12_getMission(nType)
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nLevel = GetLevel()
	if nType == 1 then	--PS 1
		if nLevel < 91 then
			Talk(1, "",szNPCName.."§¼ng cÊp tõ 91 ®Õn 99 míi cã thÓ nhËn nhiÖm vô mçi ngµy")
			return
		end
	else	--PS 2
		if nLevel < 79 then
			Talk(1, "", szNPCName.."§¼ng cÊp tõ 79 ®Õn 99 míi cã thÓ nhËn nhiÖm vô mçi ngµy")
			return
		end
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7)  == 0 then
		if GetItemCount(2,1,30490) < 1 then
			Talk(1, "", szNPCName.."§¹i hiÖp kh«ng cã ®ñ 1 Hoµng Kim §¹i Ng©n PhiÕu ®Ó nhËn nhiÖm vô mçi ngµy")
			return
		end
	end
	------------------
	local nSoLuongNhiemVuNgay =3
	if CTVL_CountDailyMission() >= nSoLuongNhiemVuNgay then
		Talk(1,"",szNPCName.."Ng­¬i ®· hoµn thµnh ®ñ "..nSoLuongNhiemVuNgay.." nhiÖm vô mçi ngµy råi. Ngµy mai h·y quay l¹i nhÐ.")
		return 0
	end
	if CTVL_GetStatus() == 0 and CTVL_GetDailyMission() ~= 0 then
		Talk(1,"",szNPCName.."Ng­¬i ch­a hoµn thµnh nhiÖm vô hiÖn t¹i. H·y hoµn thµnh råi quay l¹i nhÐ.")
		return 0
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7)  == 0 then
		DelItem(2,1,30490,1)
		gf_WriteLogEx(szLogTitle, "trõ thµnh c«ng", 1, "Trõ HKDNP mçi ngµy nhËn nv thµnh c«ng, Phôc Sinh "..nPhucSinh)	
	end
	gf_WriteLogEx(szLogTitle, "nhËn th­ëng thµnh c«ng", 1, "NhËn nhiÖm vô mçi ngµy thµnh c«ng, Phôc Sinh "..nPhucSinh)	
	CTVL_SetDailyMission()	
	CTVL_Active()
end

function CTVL_Tong()
	local tSay = {}
	
	tinsert(tSay, "Bang Chñ ®¨ng ký nhËn th­ëng Bang Héi (tiªu hao 8 vµng)/CTVL_Tong_Active")
	tinsert(tSay, "Thµnh viªn x©y dùng bang héi (tiªu hao 1 xu vËt phÈm, 1 vµng, 10 tr¸i c©y bÊt kú)/CTVL_Tong_Contribute")
	tinsert(tSay, "NhËn th­ëng x©y dùng Bang Héi/CTVL_Tong_Award")
	tinsert(tSay, "Xem sè l­îng thµnh viªn ®· ®ãng gãp x©y dùng Bang/CTVL_Tong_Show")

	tinsert(tSay, "Ta kh«ng muèn lµm g× hÕt/nothing")
	
	Say(szNpcName.."Ta chuyªn phô tr¸ch nhËn th­ëng Bang héi cña ChÝ T«n V­¬ng LÖnh. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end
function CTVL_Tong_Active()
	local nIsMaster = IsTongMaster()
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local szRole = GetName()
	local nWeek = tonumber(date("%W"))
	local nCheckTongName = 0
	local nCheck = CheckAccount_Active1()
		
	if nCheck ~= 1 then
		return
	end			
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."ChØ cã thÓ kÝch ho¹t ë thµnh D­¬ng Ch©u.");
		return 0
	end
	---------
	local nWeek_day = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
	if nWeek_day == 0 then
		if nHour > 2000 then
			Talk ( 1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ thùc hiÖn kÝch ho¹t Bang Héi ChÝ T«n vµo c¸c ngµy trong tuÇn vµ tr­íc 20h00 ngµy chñ nhËt");
			return
		end			
	end
	---------	
	if nIsMaster ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng ký tham gia, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	if GetCash() < 80000 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng mang theo ®ñ ng©n l­îng, khi kh¸c h·y ®Õn gÆp ta.");
		return 0
	end
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()

	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) == tostring(LIB_txtData.tbTextData[i][1]) then
			nCheckTongName = i
			break
		end
	end

	if nCheckTongName > 0 then
		if tonumber(nWeek) == tonumber(LIB_txtData.tbTextData[nCheckTongName][5]) then
			Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®· kÝch ho¹t thµnh c«ng, kh«ng cÇn ®¨ng ký thªm lÇn n÷a.")
			return 0
		else
			Pay(80000)
			LIB_txtData.tbTextData[nCheckTongName][5] = nWeek
			LIB_txtData.tbTextData[nCheckTongName][4] = 0
			LIB_txtData:SaveMultiColumn()
			return 0
		end
	end
	Pay(80000)
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0	"..nWeek
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."TuÇn nµy Bang héi cña c¸c h¹ ®· ®¨ng ký nhËn th­ëng Bang Héi ChÝ T«n thµnh c«ngi, h·y b¸o tin cho c¸c thµnh viªn bang héi.")
	gf_WriteLogEx(szLogTitle, "®¨ng ký", 1, "§¨ng ký thµnh c«ng")
end

function CTVL_Tong_Show()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."ChØ cã thÓ xem ë thµnh D­¬ng Ch©u.");
		return 0
	end	
	local szTong = GetTongName()
	local nWeek = tonumber(date("%W"))
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) == tostring(LIB_txtData.tbTextData[i][1]) then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		Talk(1,"",szNpcName.."Bang héi ch­a ®¨ng ký nhËn th­ëng Bang Héi ChÝ T«n")
		return
	end	
	if tonumber(nWeek) > tonumber(LIB_txtData.tbTextData[nBang][5]) then
		Talk(1,"",szNpcName.."TuÇn nµy bang chñ ch­a kÝch ho¹t nhËn th­ëng Bang Héi ChÝ T«n")
		return
	end
	local nCount = LIB_txtData.tbTextData[nBang][4]
	Talk(1,"",szNpcName.."Sè l­îng thµnh viªn tham gia ®ãng gãp x©y dùng Bang Héi ChÝ T«n lµ: "..nCount)
end

function CTVL_Tong_Contribute()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."ChØ cã thÓ ®ãng gãp ë thµnh D­¬ng Ch©u.");
		return 0
	end	
	local nWeek = tonumber(date("%W")	)
	local nContribute = mod(floor(GetTask(TSK_CTVL_ALL)/10),10)
	local nMod = mod(GetTask(TSK_CTVL_ALL), 10)
	local nFloor = floor(GetTask(TSK_CTVL_ALL)/10)
	local nTask = (nFloor + 1) *10 + nMod
	if nContribute >= 1 then
		Talk(1,"",szNpcName.."TuÇn nµy ®¹i hiÖp ®· thùc hiÖn ®ãng gãp ®Ó x©y dùng Bang Héi ChÝ T«n råi, tuÇn sau h·y quay l¹i")
		return
	end
	----------
	local nWeek_day = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
	if nWeek_day == 0 then
		if nHour > 2000 then
			Talk ( 1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ thùc hiÖn ®ãng gãp ®Ó x©y dùng Bang Héi ChÝ T«n vµo c¸c ngµy trong tuÇn vµ tr­íc 20h00 ngµy chñ nhËt");
			return
		end			
	end
	-----------
	if GetItemCount(2,1,30230) < 1 then
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng mang ®ñ Xu vËt phÈm ")
		return
	end
	if GetCash() < 10000 then
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng cã ®ñ vµng ")
		return
	end
	local nCount_fruite = 0
	for i = 30164, 30183 do
		nCount_fruite = GetItemCount(2,1,i)
		if nCount_fruite >= 10 then
			break
		end
	end
	if nCount_fruite < 10 then
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng cã ®ñ 10 tr¸i c©y cïng lo¹i ")
		return
	end
	local szTong = GetTongName()
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) ==tostring( LIB_txtData.tbTextData[i][1]) then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		Talk(1,"",szNpcName.."Bang héi ch­a ®¨ng ký nhËn th­ëng Bang Héi ChÝ T«n")
		return
	end
	
	if tonumber(nWeek) > tonumber(LIB_txtData.tbTextData[nBang][5]) then
		Talk(1,"",szNpcName.."TuÇn nµy bang chñ ch­a kÝch ho¹t nhËn th­ëng Bang Héi ChÝ T«n")
		return
	end
	DelItem(2,1,30230,1)
	Pay(10000)
	local nDelAllFruite = 10
	for i = 30164, 30183 do
		nCount_fruite = GetItemCount(2,1,i)
		if nCount_fruite >= nDelAllFruite then
			DelItem(2,1,i, nDelAllFruite)
			break
		end
	end
	SetTask(TSK_CTVL_ALL, nTask)	--set task ®· ®ãng gãp råi
	Talk(1,"",szNpcName.."§¹i hiÖp ®· ®ãng gãp x©y dùng Bang héi ChÝ T«n thµnh c«ng. H·y chê ®Õn cuèi tuÇn ®Ó nhËn th­ëng. ")
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + 1
	LIB_txtData:SaveMultiColumn()
	gf_WriteLogEx(szLogTitle1, "nhËn", 1, "X©y dùng bang "..szTong)
	gf_WriteLogEx(szLogTitle, "nhËn", 1, "X©y dùng bang ")
end
function CTVL_Tong_Award()
	local nWeek = date("%W")
	local nGetAward = VNG_GetTaskPos(TSK_CTVL_ALL, 3, 3)
	local nDongGop_Status = VNG_GetTaskPos(TSK_CTVL_ALL, 2, 2)
	local nMod = mod(GetTask(TSK_CTVL_ALL), 100)
	local nFloor = floor(GetTask(TSK_CTVL_ALL)/100)
	local nTask = (nFloor + 1) *100 + nMod
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."ChØ cã thÓ nhËn th­ëng ë thµnh D­¬ng Ch©u.");
		return 0
	end	
	if nDongGop_Status < 1 then
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng tham gia ®ãng gãp x©y dùng bang héi nªn kh«ng thÓ nhËn th­ëng Bang Héi ChÝ T«n ®­îc. TuÇn sau ®¹i hiÖp h·y cè g¾ng lªn")
		return	
	end
	if nGetAward >= 1 then
		Talk(1,"",szNpcName.."TuÇn nµy ®¹i hiÖp ®· nhËn th­ëng Bang Héi ChÝ T«n råi, tuÇn sau h·y quay l¹i")
		return
	end	

	local nWeek_day = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
	if nWeek_day ~= 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ nhËn phÇn th­ëng nµy vµo<color=green> ngµy chñ nhËt, thêi gian tõ 20h30 ®Õn 23h30 <color>");
		return
	end
	if nHour < 2030 or nHour > 2330  then
		Talk ( 1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ nhËn phÇn th­ëng nµy vµo <color=green> thêi gian tõ 20h30 ®Õn 23h30 <color>");
		return
	end		
	local szTong = GetTongName()
	local nExp = 0
	local nCountMem = 0
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) == tostring(LIB_txtData.tbTextData[i][1]) then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		Talk(1,"",szNpcName.."Bang héi ch­a ®¨ng ký nhËn th­ëng Bang Héi ChÝ T«n")
		return
	end	
	if tonumber(nWeek) > tonumber(LIB_txtData.tbTextData[nBang][5]) then
		Talk(1,"",szNpcName.."TuÇn nµy ®¹i hiÖp ®· nhËn th­ëng Bang Héi ChÝ T«n råi, tuÇn sau h·y quay l¹i")
		return
	end
	nCountMem = LIB_txtData.tbTextData[nBang][4]
	SetTask(TSK_CTVL_ALL, nTask)	--set task ®· nhËn th­ëng x©y dùng bang héi råi	
	nExp = 2000000 * nCountMem
	ModifyExp(nExp)
	Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng Tæ ®éi ChÝ T«n!",0)		
	gf_WriteLogEx(szLogTitle, "nhËn th­ëng", 1, "NhËn th­ëng Bang Héi ChÝ T«n")
end

function CTVL_Party()
	local nTeamSize = GetTeamSize()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if nTeamSize == 0 then
		Talk(1,"",szNpcName.."Ch­a cã tæ ®éi nªn kh«ng thÓ nhËn th­ëng")
		return	
	end	
	if GetName() ~= GetCaptainName() then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã ®éi tr­ëng míi cã thÓ kÝch ho¹t nhËn th­ëng!")
		return
	end		
	local tSay = {}
	
	tinsert(tSay, "Tæ ®éi nhËn th­ëng Phæ Th«ng/#CTVL_Party_Award(1)")
	tinsert(tSay, "Tæ ®éi nhËn th­ëng V« Song/#CTVL_Party_Award(2)")
	
	tinsert(tSay, "Ta kh«ng muèn lµm g× hÕt/nothing")
	
	Say(szNpcName.."Ta chuyªn phô tr¸ch nhËn th­ëng Bang héi cña ChÝ T«n V­¬ng LÖnh. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)	
end
function CTVL_Party_Award(nType)
	local nCity = GetWorldPos()	
	local szFailMember = ""
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;	
	
	local nMod = mod(GetTask(TSK_CTVL_ALL), 1000)
	local nFloor = floor(GetTask(TSK_CTVL_ALL)/1000)
	local nTask = (nFloor + 1) *1000 + nMod	
	
	if nTeamSize == 0 then
		Talk(1,"",szNpcName.."Ch­a cã tæ ®éi nªn kh«ng thÓ nhËn th­ëng")
		return	
	end
	if GetName() ~= GetCaptainName() then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã ®éi tr­ëng míi cã thÓ kÝch ho¹t nhËn th­ëng!")
		return
	end
	if nType == 2 then
		if GetItemCount(2,1,30230) < 8 or GetCash() < 80000 then
			Talk(1, "","§¹i hiÖp khæng ®ñ Xu vËt phÈm hoÆc kh«ng ®ñ vµng, vui lßng kiÓm tra l¹i")
			return
		end
	end
	local nTeamSize = GetTeamSize()	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nCheckmem = CheckAccount_Active1()
		local nGetAwardmem = mod(floor(GetTask(TSK_CTVL_ALL)/1000),10)
		local nCity2 = GetWorldPos()
		if nCheckmem ~= 1 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh«ng cã kÝch ho¹t ChÝ T«n V­¬ng LÖnh, kh«ng thÓ nhËn th­ëng.", szFailMember))	
			return
		end	
		if nGetAwardmem >= 1 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ®· nhËn th­ëng Tæ §éi ChÝ T«n råi, kh«ng thÓ nhËn th­ëng.", szFailMember))	
			return
		end	
		if nCity2 ~= nCity then
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh«ng cïng b¶n ®å víi ®éi tr­ëng, kh«ng thÓ nhËn th­ëng.", szFailMember))
			return
		end
	end
	PlayerIndex = nOldPlayerIdx
	if nType == 2 then
		if DelItem(2,1,30230, 8) ~= 1 or Pay(80000) ~= 1 then
				Talk(1, "","§¹i hiÖp khæng ®ñ Xu vËt phÈm hoÆc kh«ng ®ñ vµng, vui lßng kiÓm tra l¹i")
				return	
		end
	end
	
	nTeamSize = GetTeamSize()	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nExp = 3000000 + (3000000 * nTeamSize)
		if nType == 2 then
			nExp = 5000000 + (5000000 * nTeamSize)
		end
		SetTask(TSK_CTVL_ALL, nTask)	--set task ®· nhËn th­ëng tæ ®éi mçi ngµy råi	
		ModifyExp(nExp)
		Msg2Player("§¹i hiÖp nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng Tæ ®éi ChÝ T«n!",0)		
		gf_WriteLogEx(szLogTitle, "nhËn th­ëng", 1, "NhËn th­ëng Tæ §éi ChÝ T«n")
	end
	PlayerIndex = nOldPlayerIdx
end

function CTVL_getHN(nOption)
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
	local nGetNH = VNG_GetTaskPos(TSK_CTVL_ALL, 7, 7)
	if nOption ~= 0 then
		if gf_GetTaskBit(TSK_CHITONNEW3, 9) == 1 then
			Talk(1,"","PhÇn hç trî nµy ng­¬i ®· nhËn thªm 1 lÇn råi, kh«ng thÓ nhËn thªm lÇn n÷a.")
			return 0
		end
		if GetCash() < 290000 then
			Talk(1,"","Hç trî lÇn nµy cÇn 29 vµng, h×nh nh­ ®¹i hiÖp kh«ng ®ñ?")
			return 0
		end
	else
		if nGetNH >= 1 then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ®· nhËn hç trî råi.")
			return 
		end
	end
	if nLevel < 83 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña ®¹i hiÖp qu¸ thÊp, h·y ®¹t cÊp 83 råi quay l¹i gÆp ta ®Ó nhËn quµ hç trî.")
		return 
	end
	if gf_Judge_Room_Weight(10, 400, "Chñ Phßng M¸y") == 0 then
		return
	end	
	if nRoute == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a gia nhËp ph¸i nªn kh«ng thÓ nhËn quµ hç trî.")
		return	
	end
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
	local tbVuKhiHaoNguyet_ctvl = {
		[2] = {item={{gdp={0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name="H¹o NguyÖt-§é N¹n T«n Gi¶ PhËt §ao"}}},
		[4] = {item={{gdp={0,0,8973,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-§é KiÕp T«n Gi¶ PhËt Thñ"}}},
		[3] = {item={{gdp={0,8,8974,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-§é ¸ch T«n Gi¶ PhËt Tr­îng"}}},
		[6] = {item={{gdp={0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Ch©m"}}},
		[8] = {item={{gdp={0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name ="H¹o NguyÖt-PhËt V©n Th¸nh C« Liªn KiÕm"}}},
		[9] = {item={{gdp={0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-PhËt TrÇn Th¸nh C« CÇm"}}},
		[11] = {item={{gdp={0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-Trôc Phông Thiªn C¸i Thñ"}}},
		[12] = {item={{gdp={0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-Du Long §Þa KhÊt C«n"}}},
		[14] = {item={{gdp={0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-V« Cùc Thiªn T«n Tóc KiÕm"}}},
		[15] = {item={{gdp={0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-BÝch L¹c Thiªn T«n Bót"}}},
		[17] = {item={{gdp={0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-C¶m Thiªn §Êu Hån Th­¬ng"}}},
		[18] = {item={{gdp={0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Cung"}}},
		[20] = {item={{gdp={0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-Quû Xóc Tµ ThÇn §ao"}}},
		[21] = {item={{gdp={0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-Vu Cèt §éc V­¬ng Tr¶o"}}},
		[23] = {item={{gdp={0,2,8986,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-BÊt §éng Ch©n Tiªn KiÕm"}}},
		[29] = {item={{gdp={0,13,8990,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-Tª V©n Tiªn Tö PhiÕn"}}},
		[30] = {item={{gdp={0,12,8991,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H¹o NguyÖt-Phi H¹ Tiªn Tö ¦u Lan Tiªu"}}},
	}
	local tbTrangBiHaoNguyet_ctvl = {
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
	for nRoute = 1, 30 do
		if tbTrangBiHaoNguyet_ctvl[nRoute] ~= nil then
			for i=1, 4 do
				if tbTrangBiHaoNguyet_ctvl[nRoute][i] ~= nil then
					for j=1,3 do
						tbTrangBiHaoNguyet_ctvl[nRoute][i]["item"][j]["gdp"][13] = 11
					end
				end
			end
		end
	end
	local nRoute = GetPlayerRoute()
	local tbAward_ctvl = tbTrangBiHaoNguyet_ctvl[nRoute]
--	print(tbTrangBiHaoNguyet_ctvl[nRoute][1][1][3])
	VNG_SetTaskPos(TSK_CTVL_ALL, 1, 7,7)	--Set Task ®· nhËn hç trî lªn 1 ë vÞ trÝ thø 7
	LIB_Award:AwardByBody(tbAward_ctvl)
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet_ctvl)	
	local tbAwardHN_ctvl = {item = {
			{gdp={0,102,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H¹o NguyÖt-¤ L©n B¶o Giíi"},
			{gdp={0,102,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H¹o NguyÖt-Tö Giao Ngäc Béi"},
			{gdp={0,102,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H¹o NguyÖt-V©n Hæ LÖnh"},
			{gdp={0,102,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H¹o NguyÖt-XÝch T­íc Hoµn"},
			{gdp={0,102,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H¹o NguyÖt-BÝch Quy Liªn"},},
	}
	LIB_Award:Award(tbAwardHN_ctvl)
	if nOption ~= 0 then
		gf_SetTaskBit(TSK_CHITONNEW3, 9,1,0)
		Pay(290000)
		gf_WriteLogEx(szLogTitle, "nhËn thµnh c«ng", 1, "CTVL nhËn l¹i HN")
	else
		gf_WriteLogEx(szLogTitle, "nhËn thµnh c«ng", 1, "CTVL nhËn HN")
	end
end