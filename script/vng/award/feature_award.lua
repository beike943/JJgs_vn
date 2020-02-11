Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
Include("\\script\\vng\\weapon_upgrade\\viemde2thienchiviemde.lua");
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");
----script KS
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
----


--Award cho  B¸t nh· nhá
function ThuHoachBatNhaNho()
	--=============== Chuçi nhiÖm vô Phôc Sinh 2 ===================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 9 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(2)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 or ChiTonNew_GetStep() == 2 or ChiTonNew_GetStep() == 4 or ChiTonNew_GetStep() == 10 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--=======	
end

function KichHoatBatNhaNho()
	nhiemvuVBonus(2) --nhiÖm vô VBonus 07/2014
	VBonus_BatNhaNho()
	ModifyReputation(1,0)
	SetTask(336,GetTask(336)+1)
	Msg2Player("B¹n nhËn ®­îc 1 ®iÓm S­ m«n !")
	local nExp = 2100000
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!")
	local nExpChanKhi = 25
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ B¸t nh· nhá")			
	gf_WriteLogEx("KICH HOAT BAT NHA NHO 13/5/2013", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t  B¸t nh· nhá")
	-- chuçi nhiÖm vô Phôc Sinh PET
	local nActive_BNN_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000) --lÊy sè lÇn kÝch ho¹t b¸t nh· nhá cña Pet Phôc Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_BNN_PET_PS,1000) < 160 then
			nActive_BNN_PET_PS = (nActive_BNN_PET_PS + 1) * 10000 -- céng 1 khi kÝch ho¹t thµnh c«ng
			nActive_BNN_PET_PS = nActive_BNN_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000) --céng vµo nguyªn task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_BNN_PET_PS) --set l¹i toµn bé task
			gf_WriteLogEx("PHUC SINH PET", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t  B¸t nh· nhá")
		end
	end
 	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 29 or CTVL_GetDailyMission() == 30 or CTVL_GetDailyMission() == 31 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 
	ChiTonNew_ExpBonus(300000)
end

--Award cho  H¹t Gièng
function ThuHoachHatGiong()
	vaf_award_api("tPlantSeedTree") --2XU
	nhiemvuVBonus(1) --nhiÖm vô VBonus 07/2014
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130524 and nDate <=130613 then		
			gf_AddItemEx2({2,1,30512 , 100}, "Nguyªn liÖu Event ", "MAT LANH NGAY HE THANG 5", "Thu ho¹ch h¹t gièng")
	end
	--=============== Chuçi nhiÖm vô Phôc Sinh 2 ====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 7 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(3)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 or ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 3 or ChiTonNew_GetStep() == 15 or ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--==========
end

function KichHoatHatGiong()
	VBonus_HatGiong()
	ModifyReputation(1,0)
	SetTask(336,GetTask(336)+1)
	Msg2Player("B¹n nhËn ®­îc 1 ®iÓm S­ m«n !")
	local nExp = 1200000
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!")
	local nExpChanKhi = 25
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ h¹t gièng")	
	gf_WriteLogEx("KICH HOAT HAT GIONG 13/5/2013", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t H¹t gièng")
	 -----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 26 or CTVL_GetDailyMission() == 27 or CTVL_GetDailyMission() == 28 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 
	ChiTonNew_ExpBonus(300000)
	--============= NhiÖm vô ®æi trang bÞ Viªm §Õ ==================
	set_value_nv_nangcap(5)
	set_value_nv_nangcap(10)	
end

--Award cho  C©y Tø Linh
function ThuHoachCayTuLinh()
	--=============== Chuçi nhiÖm vô Phôc Sinh 2 ==========================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 13 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(1)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30661 ,200}, "Nguyªn liÖu Event", "Hoat dong thang 06 nam 2014", "hoµn thµnh trång c©y Tø Linh")
		Msg2Player("B¹n nhËn ®­îc 200 Nguyªn LiÖu Event")
	end		
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 2 or ChiTonNew_GetStep() == 3 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 9 or ChiTonNew_GetStep() == 13 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--===========
end

function KichHoatCayTuLinh()
	nhiemvuVBonus(4) --nhiÖm vô VBonus 07/2014
	VBonus_CayTuLinh()
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 10)
	else
		SetTask(701,GetTask(701) - 10)
	end
	Msg2Player("B¹n nhËn ®­îc 10 ®iÓm c«ng tr¹ng")
	SetTask(707, GetTask(707)+ 10)
	Msg2Player("B¹n nhËn ®­îc 10 ®iÓm tÝch lòy")
    	local nBonusExp = 3600000
	ModifyExp(nBonusExp)
	Msg2Player("B¹n nhËn ®­îc "..nBonusExp.." ®iÓm kinh nghiÖm!")
	ModifyReputation(2,0)
	SetTask(336,GetTask(336)+2)
	Msg2Player("B¹n nhËn ®­îc 2 ®iÓm S­ m«n !")
	local nExpChanKhi = 32
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ c©y Tø Linh")		
	gf_WriteLogEx("KICH HOAT CAY TU LINH 13/5/2013", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t C©y Tø Linh")	
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130919 and nDate <=131013 then		
			gf_AddItemEx2({2,1,30567 , 60}, "Nguyªn liÖu Event ", "Hoat dong thang 07 nam 2013", "Kich hoat c©y Tø Linh")
	end	
	-- chuçi nhiÖm vô Phôc Sinh PET
	local nActive_CTL_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000) --lÊy sè lÇn kÝch ho¹t b¸t nh· nhá cña Pet Phôc Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_CTL_PET_PS,1000) < 160 then
			nActive_CTL_PET_PS = (nActive_CTL_PET_PS + 1) * 10000000 -- céng 1 khi kÝch ho¹t thµnh c«ng
			nActive_CTL_PET_PS = nActive_CTL_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000000) --céng vµo nguyªn task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_CTL_PET_PS) --set l¹i toµn bé task
			gf_WriteLogEx("PHUC SINH PET", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t  c©y Tø Linh")
		end
	end
 	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 32 or CTVL_GetDailyMission() == 33 or CTVL_GetDailyMission() == 34 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 	
	ChiTonNew_ExpBonus(300000)
	--============= NhiÖm vô ®æi trang bÞ Viªm §Õ ==================
	set_value_nv_nangcap(4)
	set_value_nv_nangcap(9)	
end

--Award cho N÷ Oa B¶o H¹p
function Use_Award_NuOa() 
	nhiemvuVBonus(10) --nhiÖm vô VBonus 07/2014
	VBonus_NuOa()
  	local nExp = 1000000	--®iÓm vËn may khai b¸o bªn file gèc
  	ModifyExp(nExp)
    	local nExpChanKhi = 2
	AwardGenuineQi(nExpChanKhi)	
	local nQuanCong = 2
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nQuanCong)
	else
		SetTask(701,GetTask(701) - nQuanCong)
	end	
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 40 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
 	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 35 or CTVL_GetDailyMission() == 36 or CTVL_GetDailyMission() == 37 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	if ChiTonNew_CheckNewServer() == 1 then
		--------========== CTVL new server ==========
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 13 or ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 5 or ChiTonNew_GetStep() == 16 or ChiTonNew_GetStep() == 20 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	---------
	ChiTonNew_ExpBonus(100000)
end

function Use_Award_NuOa_100()
	local tbAward = {item ={
			{gdp={2, 0, 553, 3}, name="§¹i Nh©n S©m", nExpired = 7*24*60*60},
			{gdp={2, 0, 552, 3}, name="TiÓu Nh©n S©m", nExpired = 7*24*60*60},
			{gdp={2, 0, 554, 3}, name="Tu Ch©n YÕu QuyÕt", nExpired = 7*24*60*60},},
		nGold = 300000,
		nPetExp = 20,
		nPetLinhluc = 10,
	}
	LIB_Award.szLogTitle = VET_201003_01_STR_LOG_TITLE
	LIB_Award.szLogAction = "NhËn thµnh c«ng sö dông 100"
	LIB_Award:Award(tbAward)
--	Earn(300000)
--	gf_AddItemEx2({2, 0, 553, 3}, "§¹i Nh©n S©m", VET_201003_01_STR_LOG_TITLE, "NhËn thµnh c«ng sö dông 100", 7*24*60*60)	
--	gf_AddItemEx2({2, 0, 552, 3}, "TiÓu Nh©n S©m", VET_201003_01_STR_LOG_TITLE, "NhËn thµnh c«ng sö dông 100", 7*24*60*60)		
--	gf_AddItemEx2({2, 0, 554, 3}, "Tu Ch©n YÕu QuyÕt", VET_201003_01_STR_LOG_TITLE, "NhËn thµnh c«ng sö dông 100", 7*24*60*60)		
end

--Award cho Ng«i Sao May M¾n
function Use_Award_NgoiSao() 
	nhiemvuVBonus(9) --nhiÖm vô VBonus 07/2014
	VBonus_LuckyStar()
	local tbAward = {
		nChankhi = 20,
		nQuancong = 50,
		nPetLinhluc = 3
	}
	LIB_Award:Award(tbAward)
--    	local nExpChanKhi = 20
--	AwardGenuineQi(nExpChanKhi)
--	local nQuanCong = 50
--	if GetTask(701) >= 0 then
--		SetTask(701,GetTask(701) + nQuanCong)
--	else
--		SetTask(701,GetTask(701) - nQuanCong)
--	end
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 41 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end	
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
 	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 38 or CTVL_GetDailyMission() == 39 or CTVL_GetDailyMission() == 40 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--==================== Chi Ton Vuong Lenh NewServer ============
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 5 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 9 then
			ChiTonNew_SetMissionPart(2)
--		elseif ChiTonNew_GetStep() == 13 then
--			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 14 or ChiTonNew_GetStep() == 19 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	---------	 
	ChiTonNew_ExpBonus(300000)
end

function Use_Award_NgoiSao_16()
	Earn(60000)
	SetTask(2501, GetTask(2501) + 60) --b¹ch cÇu hoµn
	EatSanqin(1, 60) --tam thanh hoµn
	EatLiushen(1, 60) --lôc thÇn hoµn
	SetTask(3105, GetTask(3105) + 60, 8)	--tô linh hoµn
end


-- Th­ëng tõng ¶i Th¸i H­
function ThaiHu_ThuongVuotAi()
	local tbAward1 = {
		[1] = {nCheckExp = 0, nExp = 2000000, nChankhi = 10},
		[2] = {nCheckExp = 0, nExp = 3000000, nChankhi = 20},
		[3] = {nCheckExp = 0, nExp = 3500000, nChankhi = 20},
		[4] = {nCheckExp = 0, nExp = 4000000, nChankhi = 20},
		[5] = {nCheckExp = 0, nExp = 4500000, nChankhi = 20},
		[6] = {nCheckExp = 0, nExp = 5000000, nChankhi = 30},
		[7] = {nDanhvong = 60, nSumon = 60, nChankhi = 40},
		[8] = {fn="RandThaiHuRing(8)", nExp = 7000000, nChankhi = 40},
	}
	local tbAward2 = {
		[1] = {nCheckExp = 0, nExp = 3000000, nChankhi = 15},
		[2] = {nCheckExp = 0, nExp = 4500000, nChankhi = 15},
		[3] = {nCheckExp = 0, nExp = 5250000, nChankhi = 25},
		[4] = {nCheckExp = 0, nExp = 6000000, nChankhi = 30},
		[5] = {nCheckExp = 0, nExp = 6750000, nChankhi = 30},
		[6] = {nCheckExp = 0, nExp = 7500000, nChankhi = 40},
		[7] = {nDanhvong = 90, nSumon = 90, nChankhi = 45},
		[8] = {fn="RandThaiHuRing(8)", nExp = 10500000,nChankhi = 50},
	}
	local nCountType = GetTaskTemp(104) -- Sè lÇn v­ît ¶i
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nhËn"
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local tbAward = tbAward1
		if mod(GetTask(TSK_THAIHU_DAY) ,100) > 1 then
			_vjw_SetTaixu()
			if VietCheckEvent() == 1 then
				gf_AddItemEx2({2,1,30742 ,10}, "Nguyªn liÖu Th¸i H­", "Hoat dong thang 11 nam 2014", "hoµn thµnh nhiÖm vô Th¸i H­ lÇn 2 trë lªn")
				Msg2Player("B¹n nhËn ®­îc 10 Nguyªn LiÖu Event")
			end		
			--===== nhiÖm vô Th¨ng TiÕn Phôc Sinh
			if TTPS_GetStatus() == 1 then
				VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,6,6)
			end
			----------------------------------
			tbAward = tbAward2
		end
		if tbAward[nCountType] ~= nil then
			LIB_Award:Award(tbAward[nCountType])
			--- §iÓm VËn May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			if tbAward[nCountType]["nExp"] ~= nil then
--				local nExpVM = (nPointVM - 100)/100*tbAward[nCountType]["nExp"]
--				ModifyExp(nExpVM)
--				if nExpVM > 0 then
--					Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--				else
--					Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--				end
--			end
		end
		--==================== Chi Ton Vuong Lenh NewServer
--		if ChiTonNew_CheckNewServer() == 1 then
--			if ChiTonNew_GetStep() == 4 then
--				ChiTonNew_SetMissionPart(5)
--			end
--		end
	end
	PlayerIndex = nOldPlayer
end


-- Random vßng th¸i h­ theo tû lÖ thiÕt kÕ
function RandThaiHuRing(nQty)	
	nhiemvuVBonus(6) --nhiÖm vô VBonus 07/2014
	local tThaiHuRing = {
		[1] = {[1] = {item={{gdp={2,1,469,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Cµn"}}}, nRate = 35},
		[2] = {[1] = {item={{gdp={2,1,470,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Kh«n"}}}, nRate = 10},
		[3] = {[1] = {item={{gdp={2,1,471,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Kh¶m"}}}, nRate = 10},
		[4] = {[1] = {item={{gdp={2,1,472,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - §oµi"}}}, nRate = 10},
		[5] = {[1] = {item={{gdp={2,1,473,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Ly"}}}, nRate = 20},
		[6] = {[1] = {item={{gdp={2,1,474,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - ChÊn"}}}, nRate = 8},
		[7] = {[1] = {item={{gdp={2,1,475,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - CÊn"}}}, nRate = 6},
		[8] = {[1] = {item={{gdp={2,1,476,1}, name = "Vßng Th¸i H­ B¸t Qu¸i - Tèn"}}}, nRate = 1},
	}
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nhËn"
	for i = 1, nQty do
		LIB_Award:AwardByRate(tThaiHuRing)
	end
end


-- NhËn th­ëng Thiªn M«n TrËn
function ThienMonTran_NhanThuong(nType)
	nhiemvuVBonus(3) --nhiÖm vô VBonus 07/2014
	--Add nguyªn liÖu Event
	if nType == 4 then
		if VietCheckEvent() == 1 then
			gf_AddItemEx2({2,1,30741 ,1000}, "Nguyªn liÖu Event VIP TMT", "Hoat dong thang 11 nam 2014", "hoµn thµnh nhiÖm vô Thiªn M«n TrËn VIP")
			Msg2Player("B¹n nhËn ®­îc 1000 Nguyªn LiÖu Event")
		end		
	end
	------------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="Méc R­¬ng"}}},
		[1] = {item={{gdp={2,1,30340,3}, name="Méc R­¬ng"}}},
		[2] = {item={{gdp={2,1,30340,6}, name="Méc R­¬ng"}}},
		[3] = {item={{gdp={2,1,30340,10}, name="Méc R­¬ng"}}},
		[4] = {item={{gdp={2,1,30340,14}, name="Méc R­¬ng"}}},
	}
	LIB_Award:Award(tbBonus[nType])
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 23 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	---------	 	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 6,5)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 6,5)
			TaskTip("Ho¹t ®éng Linh B¶o S¬n: Hoµn thµnh 1 lÇn nhiÖm vô Thiªn M«n TrËn")
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(5)
	end
	if STVN_GetDailyAwardStatus() == 1 and STVN_GetStatus() == 2 then
		STVN_DailyMissionComplete(4)
	end
	--============= NhiÖm vô ®æi trang bÞ Viªm §Õ ==================
	set_value_nv_nangcap(6)
	set_value_nv_nangcap(7)
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	  	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 17 or CTVL_GetDailyMission() == 18 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T¸i xuÊt giang hå ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 2,1)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 2,1)
				TaskTip("T¸i xuÊt giang hå: Hoµn thµnh 1 lÇn nhiÖm vô Thiªn M«n TrËn")
			end
		end
	end		
	--========================
end

-- NhËn th­ëng Tµi Nguyªn ChiÕn
function TaiNguyenChien_NhanThuong(nType)
	_vjw_SetZyz()
	nhiemvuVBonus(5) --nhiÖm vô VBonus 07/2014
	if VietCheckEvent() == 1 then	
		local tMaterialQuantity2013 = 
		{
			[1] = {100}, -- sö dông qu©n c«ng ch­¬ng
			[2] = {200},-- sö dông qu©n c«ng ®¹i
			[3] = {500}, -- Sö dông qu©n c«ng huy hoµng
			[4] = {50},  -- Kh«ng sö dông qu©n c«ng
			[5] = {1000}, -- VIP
		}
		gf_AddItemEx2({2,1,30742 ,  tMaterialQuantity2013[nType][1]}, "Nguyªn liÖu Event", "Hoat dong thang 11 nam 2014", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn lo¹i"..nType)
		Msg2Player("B¹n nhËn ®­îc "..tMaterialQuantity2013[nType][1].." Nguyªn liÖu Event")
	end						
------------PhÇn th­ëng Hu©n Ch­¬ng Anh Hïng
	local tbHCAnhHung = 
		{
			[1] = {1},
			[2] = {2},
			[3] = {3},
			[4] = {0},
			[5] = {4},
		}
		gf_AddItemEx2({2,1,30499 ,  tbHCAnhHung[nType][1]}, "Hu©n Ch­¬ng Anh Hïng", "TAI NGUYEN CHIEN NEW LOG", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn nhËn th­ëng HCAH")
		Msg2Player("B¹n nhËn ®­îc "..tbHCAnhHung[nType][1].." Hu©n Ch­¬ng Anh Hïng")
------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="Méc R­¬ng"}}},
		[1] = {item={{gdp={2,1,30340,2}, name="Méc R­¬ng"}}},
		[2] = {item={{gdp={2,1,30340,4}, name="Méc R­¬ng"}}},
		[3] = {item={{gdp={2,1,30340,6}, name="Méc R­¬ng"}}},
		[4] = {item={{gdp={2,1,30340,1}, name="Méc R­¬ng"}}}, -- Kh«ng sö dông qu©n c«ng
		[5] = {item={{gdp={2,1,30340,10}, name="Méc R­¬ng"}}}, -- VIP
	}
	LIB_Award:Award(tbBonus[nType])
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 24 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	---------
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 2,1)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 2,1)
			TaskTip("Ho¹t ®éng Linh B¶o S¬n: Hoµn thµnh 1 lÇn nhiÖm vô Tµi Nguyªn ChiÕn")
		end
	end
	--=============== T¸i xuÊt giang hå ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 4,3)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 4,3)
				TaskTip("T¸i xuÊt giang hå: Hoµn thµnh 1 lÇn nhiÖm vô Tµi nguyªn chiÕn")
			end
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(3)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 9 or CTVL_GetDailyMission() == 10 or CTVL_GetDailyMission() == 11 or CTVL_GetDailyMission() == 12 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	if ChiTonNew_CheckNewServer() == 1 then
		--==================== Chi Ton Vuong Lenh NewServer
		if ChiTonNew_GetStep() == 5 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(3)
		end
	end
	--=============	
end

function ThuHoachBatNhaLon()
	VBonus_BatNhaLon()
	--============= Chuçi nhiÖm vô Phôc Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 11 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	--============= NhiÖm vô ®æi trang bÞ Viªm §Õ ==================
	set_value_nv_nangcap(3)
	set_value_nv_nangcap(8)
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a	
	--============= Bonus Chi Ton server moi ==================
	if ChiTonNew_CheckNewServer() == 1 then
		Earn(20000)
		local nRandom = mod(random(1,10000),20)
		AddItem(2,1,(30164 + nRandom), 5)
	end
	--================
end

function Use_Award_PhaoHoa()
	-----------------------Chuçi nhiÖm vô Phôc Sinh 2
	if PhucSinh2_CheckActive() == 1 then
		if PhucSinh2_GetDailyMission() == 1 and PhucSinh2_GetMissionPart() > 0 then
			PhucSinh2_SetMissionPart()
		end
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a		
    	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 19 or CTVL_GetDailyMission() == 20 or CTVL_GetDailyMission() == 21 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--------========== CTVL new server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(5)
		elseif ChiTonNew_GetStep() == 2 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 20 then
			ChiTonNew_SetMissionPart(2)
		end
	end
end

function TriQuocBinhThienHa_NhanThuong(nType)
	--Add nguyªn liÖu Event
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30741 ,200}, "Nguyªn liÖu Event", "Hoat dong thang 11 nam 2014", "hoµn thµnh nhiÖm vô TrÞ Quèc B×nh Thiªn H¹ lo¹i"..nType)
		Msg2Player("B¹n nhËn ®­îc 200 Nguyªn LiÖu Event")
	end		
	
	--do return 0 end
    	-----------------------NhiÖm vô hµng ngµy CTVL
    	if nType == 1 then
    		TriQuocBinhThienHa_NhanThuongCungTe()
    	elseif nType == 2 then
    		TriQuocBinhThienHa_NhanThuongTriAn()
    	elseif nType == 3 then
    		TriQuocBinhThienHa_NhanThuongThuyLoi()
    	elseif nType == 4 then
    		TriQuocBinhThienHa_NhanThuongLuyenDon()
    	end
end


function TriQuocBinhThienHa_NhanThuongCungTe()
	nhiemvuVBonus(7) --nhiÖm vô VBonus 07/2014
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(7)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 22 and  CTVL_GetMissionPart() > 0 then	
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 2 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 3 or  ChiTonNew_GetStep() == 13 then
			ChiTonNew_SetMissionPart(3)
		end
	end
end

function TriQuocBinhThienHa_NhanThuongTriAn()
	nhiemvuVBonus(13) --nhiÖm vô VBonus 07/2014
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 23 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 6 then
			ChiTonNew_SetMissionPart(1)
		end
	end
end


function TriQuocBinhThienHa_NhanThuongThuyLoi()
	nhiemvuVBonus(8) --nhiÖm vô VBonus 07/2014
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(6)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 24 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(6)
		elseif ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(4)
		end
	end
end

function TriQuocBinhThienHa_NhanThuongLuyenDon()
	nhiemvuVBonus(16) --nhiÖm vô VBonus 07/2014
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 25 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
end


function ThitNuong_NhanThuong()
	--===== nhiÖm vô Th¨ng TiÕn Phôc Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,7,7)
	end
	----------------------------------	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a	
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30660 ,50}, "Nguyªn liÖu Event", "Hoat dong thang 06 nam 2014", "hoµn thµnh nhiÖm vô B¹ch Tiªn Sinh")
		Msg2Player("B¹n nhËn ®­îc 50 Nguyªn LiÖu Event")
	end			
    	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 13 or CTVL_GetDailyMission() == 14 or CTVL_GetDailyMission() == 15 or CTVL_GetDailyMission() == 16 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
end


function TongLieu_NhanThuong(nType)
	if nType == 1 then
		TongLieu_NhanThuongNongTrang()
	elseif nType == 2 then
		TongLieu_NhanThuongLuongThao()
	elseif nType == 3 then
		nhiemvuVBonus(15) --nhiÖm vô VBonus 07/2014
		TongLieu_NhanThuongThanhTri()
	elseif nType == 4 then
--		nhiemvuVBonus(14) --nhiÖm vô VBonus 07/2014
		TongLieu_NhanThuongNhanMonQuan()
	end
	--===== nhiÖm vô Th¨ng TiÕn Phôc Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,8,8)
	end
	----------------------------------	
end


function TongLieu_NhanThuongNongTrang()

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 1 or CTVL_GetDailyMission() == 2 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T¸i xuÊt giang hå ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 8,7)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 8,7)
				TaskTip("T¸i xuÊt giang hå: Hoµn thµnh 1 lÇn chiÕn tr­êng n«ng trang")
			end
		end
	end
end


function TongLieu_NhanThuongLuongThao()

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 3 or CTVL_GetDailyMission() == 4 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T¸i xuÊt giang hå ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 2,1)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 2,1)
				TaskTip("T¸i xuÊt giang hå: Hoµn thµnh 1 lÇn chiÕn tr­êng l­¬ng th¶o")
			end
		end
	end
end


function TongLieu_NhanThuongThanhTri()
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(1)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 5 or CTVL_GetDailyMission() == 6 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T¸i xuÊt giang hå ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 4,3)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 4,3)
				TaskTip("T¸i xuÊt giang hå: Hoµn thµnh 1 lÇn chiÕn tr­êng b¶o vÖ thµnh tr×")
			end
		end
	end
end


function TongLieu_NhanThuongNhanMonQuan()
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(2)
	end

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	-----------------------NhiÖm vô hµng ngµy CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 7 or CTVL_GetDailyMission() == 8 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 8,7)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 8,7)
			TaskTip("Ho¹t ®éng Linh B¶o S¬n: Hoµn thµnh 1 lÇn nhiÖm vô Nh¹n M«n Quan")
		end
	end
	--=============== T¸i xuÊt giang hå ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 6,5)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 6,5)
				TaskTip("T¸i xuÊt giang hå: Hoµn thµnh 1 lÇn chiÕn tr­êng Nh¹n M«n Quan")
			end
		end
	end
end


function KichHoatBacDauDuongSinhThuat()

	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a
	--==================== Chi Ton Vuong Lenh NewServer
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 3 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 12 or ChiTonNew_GetStep() == 18 then
			ChiTonNew_SetMissionPart(1)
		end
	end
end


function HoanThanhNhiemVuLuongSonBac()
	nhiemvuVBonus(12) --nhiÖm vô VBonus 07/2014
	-----------------------Chuçi nhiÖm vô §ång Hµnh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 26 then
			if mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1), 10) == 3 or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2), 10) == 3  or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3), 10) == 3  then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 4,3)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 4,3)
			TaskTip("Ho¹t ®éng Linh B¶o S¬n: Hoµn thµnh 1 lÇn nhiÖm vô L­¬ng S¬n B¹c")
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(4)
	end
	
	do return 0 end		--khóc d­íi kh«ng ch¹y n÷a	
	--=============== T¸i xuÊt giang hå ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 6,5)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 6,5)
				TaskTip("T¸i xuÊt giang hå: Hoµn thµnh 1 lÇn nhiÖm vô L­¬ng S¬n B¹c")
			end
		end
	end	
	--===========	
end

function HoanThanhNhiemVuSuMon()
	nhiemvuVBonus(11)
end

function VietCheckEvent()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 141107 and nDate <=141130 then
		return 1
	end
	return 0
end

--====phÇn th­ëng VBonus cho sö dông c¸c item
function VBonus_NuOa()
	if CheckVbonus() == 1 then
		ModifyExp(200000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 200.000 kinh nghiÖm.")
	end
end

function VBonus_BatNhaNho()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 300.000 kinh nghiÖm.")
	end
end

function VBonus_HatGiong()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 300.000 kinh nghiÖm.")
	end
end

function VBonus_CayTuLinh()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 300.000 kinh nghiÖm.")
	end
end

function VBonus_LuckyStar()
	if CheckVbonus() == 1 then
		ModifyExp(250000)
		Msg2Player("Tµi kho¶n cã kÝch ho¹t VBonus, ®­îc nhËn thªm 250.000 kinh nghiÖm.")
	end
end

function VBonus_BatNhaLon()
	local tbFruite = {
		[1] = {"Nh·n" , 30164},			[2] = {"Ch«m Ch«m", 30165},		[3] = {"Cam", 30165},		[4] = {"Dõa", 30167},
		[5] = {"M¨ng Côt", 30168},		[6] = {"M·ng cÇu", 30179},			[7] = {"Khãm", 30180},	[8] = {"Lª", 30181},
		[9] = {"Bßn Bon", 30182},		 [10] = {"KhÕ", 30183},				[11] = {"B­ëi", 30169},	[12] = {"D©u", 30170},
		[13] = {"Chuèi", 30171},			[14] = {"Xoµi", 30172},				[15] = {"§µo", 30173},	[16] = {"MËn", 30174},
		[17] = {"V¶i", 30175},				[18] = {"T¸o", 30176},				[19] = {"B¬", 30177},		[20] = {"§u §ñ", 30178},
		}
	if CheckVbonus() == 1 then
		local nIndex = random(1,20)
		gf_AddItemEx2({2, 1, tbFruite[nIndex][2], 2}, tbFruite[nIndex][1], "NHAN THUONG VBONUS BK", "tr¸i c©y")
	end
end

function TTPS_GetStatus()
	local nStatus = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,1,1)
	return nStatus
end

--interface for viet----------
function _vjw_SetTaixu()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
	if nTimes < 2 then
		gf_SetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Tham gia Th¸i H­ HuyÔn C¶nh", nTimes + 1, 2));
	end
end

function _vjw_SetZyz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Hoµn thµnh Tµi Nguyªn ChiÕn", nTimes + 1, 1));
	end
end
-------------------------------