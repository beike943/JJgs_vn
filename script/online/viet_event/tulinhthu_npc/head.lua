Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online_activites\\2011_12\\wupanguo\\silin_dogz.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\award\\feature_award.lua")

function main()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	local tSay = {}
	local szHeader = szNpcName.."Anh hïng t×m ta cã viÖc g× kh«ng?"
	
	local nDate = tonumber(date("%y%m%d"));		
	-- Ho¹t ®éng t¹o m©m ngò qu¶ n¨m 2012
	if nDate >= 120113 and nDate <= 120201 then
		tinsert(tSay,"Nhê ThÇn Thó ghÐp gióp ta M©m Ngò Qu¶/blag_blessing")		
	end
	
	local nSelfIndex = GetTargetNpc()
	local nGroup = GetUnitCurStates(nSelfIndex, 6)
--	if nGroup ~= 1 then
--		tinsert(tSay, "Bæn so¸i muèn kÝch ho¹t khiªu chiÕn thÇn d©n Long Tö/do_something")
--	end
--	if nGroup ~= 2 then
--		tinsert(tSay, "Bæn so¸i muèn kÝch ho¹t khiªu chiÕn thÇn d©n Hæ Tö/do_something")
--	end
--	if nGroup ~= 3 then
--		tinsert(tSay, "Bæn so¸i muèn kÝch ho¹t khiªu chiÕn thÇn d©n ¦ng Tö/do_something")
--	end
--	if nGroup ~= 4 then
--		tinsert(tSay, "Bæn so¸i muèn kÝch ho¹t khiªu chiÕn thÇn d©n Phông Tö/do_something")
--	end
	
	-- NhiÖm vô ChuyÓn Sinh 4
	if GetTask(TRANSLIFE_MISSION_ID) == 28 and gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) == 3 then
		tinsert(tSay, "Ta muèn nhËn thö th¸ch ®Ó luyÖn thµnh Hçn Nguyªn C«ng thµnh thø 8/trans_talk_28")
	end
	
	if GetTask(TRANSLIFE_MISSION_ID) == 29 and gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) == 3 then
		tinsert(tSay, "Ta ®· hoµn thµnh nhiÖm vô ®Ó luyÖn Hçn Nguyªn C«ng thµnh thø 8/trans_talk_29")
	end
	tinsert(tSay, "Ta muèn nhËn phÇn th­ëng Cóng TÕ (Tiªu hao 5 N÷ Oa B¶o H¹p vµ 1 Ng«i sao may m¾n)/#confirm_get_award(1)")	
	tinsert(tSay, "Ta muèn nhËn phÇn th­ëng TrÞ An (Tiªu hao 1 Qu©n C«ng Ch­¬ng, 1 Qu©n C«ng §¹i, 1 Qu©n C«ng Huy Hoµng)/#confirm_get_award(2)")	
	tinsert(tSay, "Ta muèn nhËn phÇn th­ëng Thñy Lîi (Tiªu hao 1 B¸t Nh· nhá, 1 B¸t Nh· lín, 1 c©y Tø Linh)/#confirm_get_award(3)")	
	tinsert(tSay, "Ta muèn nhËn phÇn th­ëng LuyÖn §¬n (Tiªu hao 1 Båi Nguyªn §¬n, 1 Tø Linh Quy Nguyªn §¬n, 6 §¹i Ng©n PhiÕu)/#confirm_get_award(4)")	
	tinsert(tSay, "HiÖn t¹i ch­a muèn lµm g× c¶/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_something()
	Talk(1,"","§iÒu kiÖn ch­a ®ñ nªn kh«ng thÓ kÝch ho¹t khiªu chiÕn!")
	return
end

function confirm_get_award(nType)
	local nLimit = 3
	local tbAward = { --cét 1 exp, cét 2 ch©n khÝ, ....
			[1] = {2000000, 10, 1, 10, 10, 10	},
			[2] = {18000000, 100, 600},
			[3] = {2000000, 10, 10},
			[4] = {1000000, 550, 55, 5},
		}
	local tbCheck = {
			[1] = {5, 1},
			[2] = {1, 1, 1},
			[3] = {1, 1, 1},
			[4] = {1, 1, 6},
		}
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = GetTask(TSK_RESET_DATE)
		
	if nDate >= 130405 and nDate <= 130428 then
		nLimit = 10
	end
	-- New server Tuy Ho
--	if GetGlbValue(1023) == 79 then -- and nDate <= 130210
--		nLimit = 1
--	end
	
	if nDate ~= nCurdate then
		SetTask(TSK_RESET_DATE , nDate)
		SetTask(TSK_BTH_EXCHANGE , 0)
	end	
	if (gf_GetTaskByte(TSK_BTH_EXCHANGE, nType) >= nLimit) then
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng nµy " .. nLimit .. " lÇn trong ngµy, mai h·y nhËn tiÕp nhÐ.")
		return 0
	end
	-------
	if nType == 1 then
		if GetItemCount(2,1,30154) < tbCheck[nType][1] or GetItemCount(2,1,30191) < tbCheck[nType][2] then
			Talk(1,"","§¹i hiÖp kh«ng mang ®ñ nguyªn liÖu ®Ó Cóng TÕ !!!")			
			return
  	   end
	end
	if nType == 2 then
		if GetItemCount(2,1,9999) < tbCheck[nType][1] or GetItemCount(2,1,9998) < tbCheck[nType][2] or GetItemCount(2,1,9977) < tbCheck[nType][3] then
			Talk(1,"","§¹i hiÖp kh«ng mang ®ñ nguyªn liÖu ®Ó TrÞ An !!!")			
			return
  	   end
	end
	if nType == 3 then
		if GetItemCount(2,0,504) < tbCheck[nType][1] or GetItemCount(2,0,398) < tbCheck[nType][2] or GetItemCount(2,1,30269) < tbCheck[nType][3] then
			Talk(1,"","§¹i hiÖp kh«ng mang ®ñ nguyªn liÖu ®Ó Thñy Lîi !!!")			
			return
  	   end
	end	
	if nType == 4 then
		if GetItemCount(2,1,30351) < tbCheck[nType][1] or GetItemCount(2,1,30352) < tbCheck[nType][2] or GetItemCount(2,1,199) < tbCheck[nType][3] then
			Talk(1,"","§¹i hiÖp kh«ng mang ®ñ nguyªn liÖu ®Ó LuyÖn §¬n !!!")			
			return
  	   end
	end	
	------
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if GetLevel() < 79 then
		Talk(1, "", "§¹i hiÖp ph¶i cã ®¼ng cÊp 79 trë lªn míi tham gia tÝnh n¨ng nµy ®­îc !!!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","§¹i hiÖp ch­a gia nhËp m«n ph¸i nªn kh«ng thÓ tham gia tÝnh n¨ng nµy ®­îc !!!!");
		return
	end
--	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	if nType == 1 and nChoose == 2 then
--		if nCurPetLevel < 1 then
--			Talk(1,"","§¹i hiÖp ch­a cã B¹n §ång Hµnh, kh«ng thÓ nhËn phÇn th­ëng nµy !!!")			
--			return
--  	   end
--	end
--	if nType == 1 and nChoose == 3 then
--		if nCurPetLevel < 2 then
--			Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ nhËn phÇn th­ëng nµy !!!")
--			return
--  	   end
--	end
--	if GetExp() >= 2000000000 - tbAward[nType][1] then
--		Msg2Player("§iÓm kinh nghiÖm cña ®¹i hiÖp sau khi nhËn th­ëng cã qu¸ nhiÒu. H·y sö dông bít råi nhËn th­ëng l¹i !!!")
--		Talk(1,"","§iÓm kinh nghiÖm cña ®¹i hiÖp sau khi nhËn th­ëng cã qu¸ nhiÒu. H·y sö dông bít råi nhËn th­ëng l¹i !!!");							
--		return
--	end

--	if (nType == 1 and nChoose == 4) or (nType == 2 and nChoose == 3) or (nType == 3 and nChoose == 3) then
--		if MeridianGetLevel() <= 0 then
--			Talk ( 1, "", "§¹i hiÖp ch­a kÝch ho¹t xong kinh m¹ch nªn kh«ng thÓ nhËn phÇn th­ëng nµy !!!" )
--			return
--		end
--	end	
	----------ph¸t th­ëng
	--nhiÖm vô lµm giµu
	if CFG_NhiemVuLamGiau == 1 then
	     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 5) == 0 then
	     		gf_SetTaskBit(TSK_LAMGIAU, 5, 1, 0)
	     		TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Hoµn thµnh 01 lÇn nhiÖm vô Thñy Lîi.")
	     end
	end
	-----------------------Chuçi nhiÖm vô §ång Hµnh
	if CFG_NhiemVuDongHanh == 1 then
		if nType == 3 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 16 then
				DongHanh_SetStatus()
			end			
		end
	end
	----------------------- Chuçi nhiÖm vô ChuyÓn Sinh §¬n, l­u sè thø 4 vµ 5 ®Çu bªn ph¶i
	local nCSD_TA = floor(GetTask(TSK_CSD_COUNT_B) / 1000)
	local nNumTA = mod(GetTask(TSK_CSD_COUNT_B),1000)
	local nCSD_TL = floor(GetTask(TSK_CSD_COUNT_B) / 100000)
	local nNumTL = mod(GetTask(TSK_CSD_COUNT_B),100000)
	if nType == 2 then
		if mod(nCSD_TA, 100) < 33 and GetTask(TSK_CSD) == 1 then
			nCSD_TA = (nCSD_TA + 1) * 1000 + nNumTA
			SetTask(TSK_CSD_COUNT_B, nCSD_TA)
		end
	elseif nType == 3 then
		if mod(nCSD_TL, 100) < 33 and GetTask(TSK_CSD) == 1 then
			nCSD_TL = (nCSD_TL + 1) * 100000 + nNumTL
			SetTask(TSK_CSD_COUNT_B, nCSD_TL)
		end
	end
	----------------------- Chuçi nhiÖm vô M¶nh Thiªn Th¹ch, l­u sè thø 45 vµ 67 ®Çu bªn ph¶i
	local nMTT_CT = floor(GetTask(TSK_MTT_COUNT) / 1000)
	local nNumCT_MTT = mod(GetTask(TSK_MTT_COUNT),1000)
	local nMTT_TL = floor(GetTask(TSK_MTT_COUNT) / 100000)
	local nNumTL_MTT = mod(GetTask(TSK_MTT_COUNT),100000)
	local nMTT_BTT_NV =  mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	--Msg2Player("Vµo 1")
	if nType == 1 then
	--	Msg2Player("Vµo 2")
		if mod(nMTT_CT, 100) < 6 and nMTT_BTT_NV == 1 then
			nMTT_CT = (nMTT_CT + 1) * 1000 + nNumCT_MTT
			SetTask(TSK_MTT_COUNT, nMTT_CT)
		end
	elseif nType == 3 then
	--	Msg2Player("Vµo 3")
		if mod(nMTT_TL, 100) < 6 and nMTT_BTT_NV == 1 then
			nMTT_TL = (nMTT_TL + 1) * 100000 + nNumTL_MTT
			SetTask(TSK_MTT_COUNT, nMTT_TL)
		end
	end
	----------------------Chuçi nhiÖm vô ChuyÓn sinh 6
	local nCS6_CT = mod(GetTask(TSK_CS6_COUNTA),100)
	local nCS6_CT_Num = floor(GetTask(TSK_CS6_COUNTA)/100)
	local nCS6_TA = mod(nCS6_CT_Num,100)
	--local nCS6_TA_Num = floor(GetTask(TSK_CS6_COUNTA)/10000)
	local cCS6_TL = mod(GetTask(TSK_CS6_COUNTB),100)
	local nCS6_TL_Num = floor(GetTask(TSK_CS6_COUNTB)/100)
	local nCS6_LD = mod(nCS6_TL_Num,100)
	--local nCS6_LD_Num = floor(GetTask(TSK_CS6_COUNTB)/10000)
	--if GetTaskTrans() == 38 then
	if GetTask(TSK_CS6_TULINH) < 2 then
		if nType == 1 then
			if nCS6_CT < 30 then
				SetTask(TSK_CS6_COUNTA, GetTask(TSK_CS6_COUNTA)+1)
			end
		elseif nType == 2 then
			if nCS6_TA < 30 then
				nCS6_CT_Num = (nCS6_CT_Num + 1) * 100 + nCS6_CT
				SetTask(TSK_CS6_COUNTA, nCS6_CT_Num)
			end
		elseif nType == 3 then
			if cCS6_TL < 30 then
				SetTask(TSK_CS6_COUNTB, GetTask(TSK_CS6_COUNTB)+1)
			end
		elseif nType == 4 then
			if nCS6_LD < 30 then
				nCS6_TL_Num = (nCS6_TL_Num + 1) * 100 + cCS6_TL
				SetTask(TSK_CS6_COUNTB, nCS6_TL_Num)
			end
		end
	end
	------------------------------chuçi nhiÖm vô Phôc Sinh PET
	local nActive_CT_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100)
	local nActive_TA_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10000)
	local nActive_TL_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/1000000)
	local nActive_LD_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100000000)
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if nType == 1 then
			if mod(nActive_CT_PET_PS,100) < 30 then
				nActive_CT_PET_PS = (nActive_CT_PET_PS + 1) * 100 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 100)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_CT_PET_PS)
			end
		elseif nType == 2 then
			if mod(nActive_TA_PET_PS,100) < 30 then
				nActive_TA_PET_PS = (nActive_TA_PET_PS + 1) *10000 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 10000)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_TA_PET_PS)
			end		
		elseif nType == 3 then
			if mod(nActive_TL_PET_PS,100) < 30 then
				nActive_TL_PET_PS = (nActive_TL_PET_PS + 1) * 1000000 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 1000000)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_TL_PET_PS)
			end		
		elseif nType == 4 then
			if mod(nActive_LD_PET_PS,100) < 3 then
				nActive_LD_PET_PS = (nActive_LD_PET_PS + 1) * 100000000 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 100000000)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_LD_PET_PS)
			end		
		end
		gf_WriteLogEx("PHUC SINH PET", "kick ho¹t thµnh c«ng", 1, "KÝch ho¹t  Tø Linh lo¹i"..nType)
	end
	----------------	
	gf_SetTaskByte(TSK_BTH_EXCHANGE, nType, gf_GetTaskByte(TSK_BTH_EXCHANGE,nType)+1)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nType == 1 then
		DelItem(2,1,30154,tbCheck[nType][1]) 
		DelItem(2,1,30191,tbCheck[nType][2]) 
		if nCurPetLevel >= 1 then
			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (10 * 100))
			Msg2Player("B¹n nhËn ®­îc 10 §iÓm N©ng CÊp B¹n §ång Hµnh")	
		end
		--gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "§iÓm n©ng cÊp PET")
		if nCurPetLevel >= 2 then
			Pet_AddGP(1)
			Msg2Player("B¹n nhËn ®­îc 1 §iÓm Linh Lùc B¹n §ång Hµnh")					
		end
		--gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "§iÓm linh lùc PET")
		SetTask(336,GetTask(336) + 10)
		--gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "§iÓm S­ m«n")
		Msg2Player("B¹n nhËn ®­îc 10 §iÓm S­ m«n")		
		ModifyReputation(10,0)
		--gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "§iÓm Danh väng")
		--Msg2Player("B¹n nhËn ®­îc 10 §iÓm Danh väng")
		gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "Cóng TÕ")		
	end
	if nType == 2 then
		DelItem(2,1,9999,tbCheck[nType][1]) 
		DelItem(2,1,9998,tbCheck[nType][2]) 
		DelItem(2,1,9977,tbCheck[nType][3]) 
		--Nhan diem linh luc ban dong hanh
		if nCurPetLevel >= 2 then
			Pet_AddGP(10)
			Msg2Player("B¹n nhËn ®­îc 10 §iÓm Linh Lùc B¹n §ång Hµnh")					
		end
		--gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "§iÓm linh lùc PET")
		--Nhan diem cong trang
		local nCongTrang = tbAward[nType][3]
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + nCongTrang)
		else
			SetTask(701, GetTask(701) - nCongTrang)
		end
		--gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "§iÓm C«ng tr¹ng")
		Msg2Player("B¹n nhËn ®­îc " ..nCongTrang.." §iÓm C«ng tr¹ng")		
		gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "TrÞ An")				
	end
	if nType == 3 then
		DelItem(2,0,504,tbCheck[nType][1]) 
		DelItem(2,0,398,tbCheck[nType][2]) 
		DelItem(2,1,30269,tbCheck[nType][3]) 
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),10}, "Item Tr¸i c©y", "BINH THIEN HA", "nhËn thµnh c«ng")    
		gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "Thñy Lîi")					
	end		
	if nType == 4 then
		DelItem(2,1,30351,tbCheck[nType][1]) 
		DelItem(2,1,30352,tbCheck[nType][2]) 
		DelItem(2,1,199,tbCheck[nType][3]) 
		--AwardGenuineQi(tbAward[nType][1])
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + 55)
		else
			SetTask(701, GetTask(701) - 55)
		end
		Msg2Player("B¹n nhËn ®­îc 55 §iÓm C«ng tr¹ng")	
		Earn(55000)
		gf_WriteLogEx("BINH THIEN HA", "nhËn thµnh c«ng", 1, "LuyÖn §¬n")		
	end
	AwardGenuineQi(tbAward[nType][2])
	ModifyExp(tbAward[nType][1])	
	Msg2Player("B¹n nhËn ®­îc " ..tbAward[nType][1].." §iÓm kinh nghiÖm")
	--- §iÓm VËn May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*tbAward[nType][1]
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--	else
--		Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--	end
-------------------------------------	
	TriQuocBinhThienHa_NhanThuong(nType)	
	
end

function do_nothing()

end