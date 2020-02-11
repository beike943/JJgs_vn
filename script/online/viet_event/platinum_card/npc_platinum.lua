Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua");
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua");
Include("\\script\\weapon_upgrade\\upgrade_npc.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\loiholenh\\caitheanhhao.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")

-- 20120416: Chimc Modify: Dieu chinh gia ban Bach Kim Lenh
function PlatinumCard_GetPrice()
	local nDate = tonumber(date("%Y%m%d"))
	local nPrice = 2400
	local tbPrice = {
			{startdate=20120605, enddate=20120617, price=600}
		}
	for i=1,getn(tbPrice) do
		if nDate>=tbPrice[i]["startdate"] and nDate<=tbPrice[i]["enddate"] then
			nPrice = tbPrice[i]["price"]
		end
	end
	return nPrice
end

function platinum_award()
	local nType = CheckAccountExt_BKL()
	if nType == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh Bµi .")
		return
	end
	local tSay = {
--		"Ta muèn mua m· Hoµng Kim LÖnh Bµi/get_golden_card",
--		"Ta muèn kİch ho¹t LÖnh bµi B¹ch Kim (tèn "..PlatinumCard_GetPrice().." Xu VËt PhÈm)/activate_BKL",
--		"Xem thêi h¹n cßn l¹i cña thÎ B¹ch Kim LÖnh/get_info_BKL",
--		"Ta muèn kİch ho¹t nhËn th­ëng C¸i ThÕ Anh Hµo (nhËn th­ëng theo ®¼ng cÊp)/#activate_account_BKL(1)",
--		"Ta muèn kİch ho¹t nhËn th­ëng TuyÖt ThÕ Cao Nh©n/#activate_account_BKL(2)",
--		"Ta muèn nhËn th­ëng TuyÖt ThÕ Cao Nh©n/#get_friendly_award_BKL(1)",
--		"Ta muèn nhËn th­ëng TuyÖt ThÕ Cao Nh©n - VIP/#get_friendly_award_BKL(2)",
--Ch­a xong, cßn C¸i ThÕ Anh Hµo--		"Ta muèn nhËn phÇn th­ëng mçi ngµy/get_platinum_day",
--		"Ta muèn nhËn th­ëng ngµy vµng/get_platinum_weekday",
--		"Ta muèn nhËn th­ëng theo ®¼ng cÊp (®· kİch ho¹t thµnh c«ng)/award_level_BKL",
		--"Ta muèn ®æi Tø Linh Bèi/award_golden_jewel",
--		"T¹i h¹ chØ ghĞ ngang!/dlgover",
	}
	if nType == 1 then	
		tinsert(tSay,"Ta muèn kİch ho¹t nhËn th­ëng C¸i ThÕ Anh Hµo (nhËn th­ëng theo ®¼ng cÊp/#activate_account_BKL(1)")		
	elseif nType == 2 then
		tinsert(tSay,"Ta muèn kİch ho¹t nhËn th­ëng TuyÖt ThÕ Cao Nh©n/#activate_account_BKL(2)")	
	elseif nType == 3 then	
		tinsert(tSay,"Ta muèn nhËn th­ëng theo ®¼ng cÊp (®· kİch ho¹t thµnh c«ng)/LHL_menu_award")
		tinsert(tSay,"Ta muèn nhËn th­ëng ngµy vµng/get_platinum_weekday")
		tinsert(tSay,"Ta muèn nhËn phÇn th­ëng mçi ngµy/get_platinum_day_CTAH")
		tinsert(tSay,"NhËn vËt phÈm miÔn phİ mçi ngµy (cÊp 88 trë lªn: 44 vµng + 2 th¸i dŞch hçn nguyªn c«ng))/get_platinum_day_freeAward_CTAH")
	elseif nType == 4 then	
		tinsert(tSay,"Ta muèn nhËn th­ëng TuyÖt ThÕ Cao Nh©n/#get_friendly_award_BKL(1)")	
		tinsert(tSay,"Ta muèn nhËn th­ëng TuyÖt ThÕ Cao Nh©n - VIP/#get_friendly_award_BKL(2)")	
		tinsert(tSay,"Ta muèn nhËn th­ëng ngµy vµng/get_platinum_weekday")
		tinsert(tSay,"Ta muèn nhËn phÇn th­ëng mçi ngµy/get_platinum_day_TTCN")
	end	
	tinsert(tSay,"T¹i h¹ chØ ghĞ ngang/dlgover")
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>L«i Hæ LÖnh<color>, c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng sau:", getn(tSay),tSay)
end

function get_platinum_day_CTAH()
	local tSay = {}
	tinsert(tSay,"§ång ı/confirm_get_platinum_day_CTAH")
	tinsert(tSay,"T¹i h¹ chØ ghĞ ngang/dlgover")
	Say("<color=green>Chñ Phßng M¸y<color>: NhiÖm vô cèng hiÕn c¸c vËt phÈm (1 B¸t nh· nhá, 1 B¸t nh· lín, 1 H¹t gièng, 1 Tµng r­¬ng) ®Ó nhËn th­ëng c¸c vËt phÈm: 2 th¸i dŞch hçn nguyªn c«ng ®å, 30 m¶nh thiªn cang, 7 m¶nh thiªn m«n, 20 danh väng, 20 s­ m«n, 2000 qu©n c«ng, 4,7 triÖu ®iÓm kinh nghiÖm.", getn(tSay),tSay)
end

function confirm_get_platinum_day_CTAH()
	local tbdailyCTAH = {
									{2,0,504,1}, --b¸t nh· nhá
									{2,0,398,1}, --b¸t nh· lín
									{2,1,30086,1},  --h¹t gièng
									{2,1,30341,1},	 --tµng r­¬ng				
								}
	local nType = CheckActivatedExt_BKL()
	if nType ~= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	local nType = CheckActivatedExt_BKL()
	if nType ~= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_BKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_DAILYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_BKLB_DAILYAWARD), 10)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn th­ëng h«m nay råi. Mai quay l¹i nhĞ.")
		return
	end
	local nCheckItemCountCTAH = 1
	for i =1, getn(tbdailyCTAH) do
		if GetItemCount(tbdailyCTAH[i][1],tbdailyCTAH[i][2],tbdailyCTAH[i][3]) < tbdailyCTAH[i][4] then
			nCheckItemCountCTAH = 0
			break
		end
	end			
	if nCheckItemCountCTAH == 0 then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ nguyªn liÖu ®Ó nhËn nhiÖm vô !!!!")
		return
	end				
	if gf_Judge_Room_Weight(10, 100, "Chñ Phßng M¸y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	local nDelItemCountCTAH = 1
	for i =1, getn(tbdailyCTAH) do
		if DelItem(tbdailyCTAH[i][1],tbdailyCTAH[i][2],tbdailyCTAH[i][3],tbdailyCTAH[i][4]) ~= 1 then
			nDelItemCountCTAH = 0
			gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Mçi ngµy CTAH kh«ng thµnh c«ng")
			break
		end
	end
	if nDelItemCountCTAH == 1 then
		SetTask(TSK_BKLB_DAILYAWARD, GetTask(TSK_BKLB_DAILYAWARD) + 1)
		gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Mçi ngµy CTAH thµnh c«ng")
	end
	gf_AddItemEx2({2,0,1082, 2,1},"Th¸i DŞch Hçn Nguyªn C«ng §å", szBKLBLogHeader, szBKLBLogAction) 
	gf_AddItemEx2({2,1,30390, 30,1},"M¶nh Thiªn Cang", szBKLBLogHeader, szBKLBLogAction)
	gf_AddItemEx2({2,1,30410, 7,1},"M¶nh Thiªn M«n", szBKLBLogHeader, szBKLBLogAction)
	ModifyReputation(20,0)	--thªm 20 danh väng
	SetTask(336,GetTask(336) +20) --thªm 20 s­ m«n
	Msg2Player("B¹n nhËn ®­îc 20 ®iÓm s­ m«n")
	if GetTask(701) > 0 then
				SetTask(701, GetTask(701) + 2000)
			elseif GetTask(701) < 0 then
				SetTask(701, GetTask(701) - 2000)
			end
	Msg2Player("B¹n nhËn ®­îc 2000 ®iÓm qu©n c«ng.")
	ModifyExp(4700000)
end

function get_platinum_day_freeAward_CTAH()
	local nType = CheckActivatedExt_BKL()
	if nType ~= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	if gf_Judge_Room_Weight(4, 100, "Chñ Phßng M¸y") == 0 then
		return
	end	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end	
	if GetLevel() < 88 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¹i hiÖp ch­a ®¹t cÊp 88, kh«ng thÓ nhËn th­ëng.");
		return
	end	
	local nReceiveDate = floor(GetTask(TSK_BKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_DAILYAWARD, nDate * 100)
	end	
	local nReceiveCount = VNG_GetTaskPos(TSK_BKLB_DAILYAWARD, 2, 2)--mod(GetTask(TSK_BKLB_DAILYAWARD), 100)
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn th­ëng h«m nay råi. Mai quay l¹i nhĞ.")
		return
	end
	VNG_SetTaskPos(TSK_BKLB_DAILYAWARD, 1, 2, 2)--SetTask(TSK_BKLB_DAILYAWARD, GetTask(TSK_BKLB_DAILYAWARD) + 1)	
	Earn(440000)
	gf_AddItemEx2({2,0,1082, 2,1},"Th¸i DŞch Hçn Nguyªn C«ng §å", szBKLBLogHeader, szBKLBLogAction) 
	gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "MiÔn phİ mçi ngµy CTAH thµnh c«ng")

end

function get_platinum_day_TTCN()
	local tSay = {
		"Ta muèn nhËn vËt phÈm thu thËp + H¹t gièng/#confirm_get_platinum_day(1)",
		"Ta muèn nhËn vËt phÈm thu thËp + Vµng/#confirm_get_platinum_day(2)",
		"Ta muèn nhËn vËt phÈm thu thËp + Tu Ch©n YÕu QuyÕt/#confirm_get_platinum_day(3)",
--		"Ta muèn nhËn vËt phÈm thu thËp + Tr¸i C©y/#confirm_get_platinum_day(4)",
		"T¹i h¹ chØ ghĞ ngang!/dlgover",
	}	
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>L«i Hæ LÖnh<color>, mçi ngµy c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng sau:", getn(tSay),tSay)	
end

function activate_BKL()
	local nPlatinumPrice = PlatinumCard_GetPrice()
	local nBKL_End = GetTime()
	if nBKL_End - GetTask(TSK_BKLB_START) < 5270400 or CheckAccountExt_BKL() ~= 0 then
		Msg2Player("L«i Hæ LÖnh vÉn cßn ®ang hiÖu lùc. §¹i hiÖp kh«ng thÓ kİch ho¹t thªm ®­îc n÷a.")
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: L«i Hæ LÖnh vÉn cßn ®ang hiÖu lùc. §¹i hiÖp kh«ng thÓ kİch ho¹t thªm ®­îc n÷a.")
		return
	end	
	
	if GetItemCount(2,1,30230) < nPlatinumPrice then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng ®ñ Xu VËt PhÈm ®Ó kİch ho¹t L«i Hæ LÖnh")
		return
	end
	local nCreateTime = GetCreateTime()  --1332435468
	if DelItem(2,1,30230,nPlatinumPrice) == 1 then
		if nCreateTime >= 1332370895 and GetTask(TSK_BKLB_COUNT) == 0 and CheckCharged_BKL() == 0 then
			SetTask(TSK_BKLB_START, GetTime())
			SetTask(TSK_BKLB_ACTIVE,1)
			gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 1) 	
			WriteLogEx(szBKLBLogHeader, "kich hoat CTAH",1);
			Msg2Player("Kİch ho¹t L«i Hæ LÖnh thµnh c«ng trë thµnh C¸i ThÕ Anh Hµo. Vui lßng kİch ho¹t nhËn th­ëng C¸i ThÕ Anh Hµo.")
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kİch ho¹t L«i Hæ LÖnh thµnh c«ng trë thµnh C¸i ThÕ Anh Hµo. Vui lßng kİch ho¹t nhËn th­ëng C¸i ThÕ Anh Hµo.")
		else
			SetTask(TSK_BKLB_START, GetTime())
			SetTask(TSK_BKLB_ACTIVE,2)
			gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 2) 		
			WriteLogEx(szBKLBLogHeader, "kich hoat TTCN",1);
			Msg2Player("Kİch ho¹t L«i Hæ LÖnh thµnh c«ng trë thµnh TuyÖt ThÕ Cao Nh©n. Vui lßng kİch ho¹t nhËn th­ëng TuyÖt ThÕ Cao Nh©n.")
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kİch ho¹t L«i Hæ LÖnh thµnh c«ng trë thµnh TuyÖt ThÕ Cao Nh©n. Vui lßng kİch ho¹t nhËn th­ëng TuyÖt ThÕ Cao Nh©n.")
		end
	end
	SetTask(TSK_BKLB_COUNT, GetTask(TSK_BKLB_COUNT) + 1)
	local nCoutBKL = CheckCharged_BKL()
	gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_COUNT, nCoutBKL + 1) 		
	gf_WriteLogEx(szBKLBLogHeader, "Tæng sè kİch ho¹t")
end
function get_info_BKL()
	local nType = CheckActivated_BKL()
	if nType == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	local nBKL_End = GetTime()
	local nDay = floor((5270400 - (nBKL_End - GetTask(TSK_BKLB_START))) / 86400)
	Msg2Player("Thêi gian hiÖu lùc cña L«i Hæ LÖnh cßn : "..nDay.." ngµy")
	Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Thêi gian hiÖu lùc cña L«i Hæ LÖnh cßn : "..nDay.." ngµy")
	 end
function confirm_get_platinum_day(nIndex)
	local nType = CheckActivatedExt_BKL()
	if nType ~= 2 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_BKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_DAILYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_BKLB_DAILYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn th­ëng h«m nay råi. Mai quay l¹i nhĞ.")
		return
	end
	
	if gf_Judge_Room_Weight(10, 100, "Chñ Phßng M¸y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	SetTask(TSK_BKLB_DAILYAWARD, GetTask(TSK_BKLB_DAILYAWARD) + 1)
	
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end
	
	gf_AddItemEx2({2,0,1082, tb_everyday_award_BKL[nType][nLevel][1]},"Th¸i DŞch Hçn Nguyªn C«ng §å", szBKLBLogHeader, szBKLBLogAction)
	if nIndex == 1 then
		gf_AddItemEx2({2,1,30086, tb_everyday_award_BKL[nType][nLevel][2],4},"H¹t gièng", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Mçi ngµy: H¹t gièng, cÊp "..nLevel)
	elseif nIndex == 2 then
		Earn(tb_everyday_award_BKL[nType][nLevel][4] * 10000)
		gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Mçi ngµy: Vµng, cÊp "..nLevel)		
	elseif nIndex == 3 then
		gf_AddItemEx2({2,0,554, tb_everyday_award_BKL[nType][nLevel][3],4},"Tu ch©n yÕu quyÕt", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Mçi ngµy: YÕu QuyÕt, cÊp "..nLevel)
--	elseif nIndex == 4 then
		--gf_AddItemEx2(tb_everyday_award_BKL[nType][nLevel][6], tb_everyday_award_BKL[nType][nLevel][5], szBKLBLogHeader, szBKLBLogAction)
--		local nIndex_fruit = mod(random(1,10000),20)
--		gf_AddItemEx2({2,1,tb_everyday_fruit_BKL[nIndex_fruit][1],tb_everyday_award_BKL[nType][nLevel][7]}, "Tr¸i c©y", szBKLBLogHeader, szBKLBLogAction)		
--		gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Mçi ngµy: Tr¸i c©y, cÊp "..nLevel)
	end
end

function get_platinum_weekday()
	local tSay = {}
	tinsert(tSay, "Ta muèn nhËn Gç Qu©n Dông + Qu©n C«ng + B¸t Nh· Nhá/#confirm_get_platinum_weekday_BKL(1)")
	tinsert(tSay, "Ta muèn nhËn Gç Qu©n Dông + Vµng/#confirm_get_platinum_weekday_BKL(2)")
	tinsert(tSay, "T¹i h¹ chØ ghĞ ngang!/dlgover")
	
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>L«i Hæ LÖnh<color>, vµo c¸c ngµy thø 6, 7, Chñ NhËt hµng tuÇn c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng sau:", getn(tSay),tSay)		
end

function confirm_get_platinum_weekday_BKL(nIndex)
	--local nType = CheckActivated_BKL()
	local nType1 = CheckActivatedExt_BKL()
	if nType1 == 0 then		--nType == 0 or 
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ nhËn phÇn th­ëng nµy vµo thø s¸u, thø b¶y vµ chñ nhËt.");
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_BKLB_GOLDENDAYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_GOLDENDAYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_BKLB_GOLDENDAYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn th­ëng h«m nay råi. Mai quay l¹i nhĞ.")
		return
	end
	
	if gf_Judge_Room_Weight(10, 800, "Chñ Phßng M¸y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	SetTask(TSK_BKLB_GOLDENDAYAWARD, GetTask(TSK_BKLB_GOLDENDAYAWARD) + 1)
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end

	if nIndex == 1 then
		gf_AddItemEx2({2,0,308,tb_golden_material_goldenday_BKL[nLevel][3]}, "Gç Qu©n Dông", szBKLBLogHeader, szBKLBLogAction)		
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday_BKL[nLevel][5],4}, "B¸t Nh· nhá", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		if nLevel == 9 then
			gf_AddItemEx2({2,1,9977,1,4}, "Qu©n C«ng Huy Hoµng", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)	
		elseif nLevel == 8 then
			gf_AddItemEx2({2,1,9998,1,4}, "Qu©n C«ng §¹i", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		elseif nLevel == 7 then	
			gf_AddItemEx2({2,1,9999,1,4}, "Qu©n C«ng Ch­¬ng", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		end
		 gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Ngµy vµng: Gç + B¸t nh·, cÊp "..nLevel)
	else
		local nCash = tb_golden_material_goldenday_BKL[nLevel][6] * 10000
		gf_AddItemEx2({2,0,308,tb_golden_material_goldenday_BKL[nLevel][3]}, "Gç Qu©n Dông", szBKLBLogHeader, szBKLBLogAction)	
		Earn(nCash)
		gf_WriteLogEx(szBKLBLogHeader, "®æi thµnh c«ng", 1, "Ngµy vµng: Gç + vµng, cÊp "..nLevel)
	end

end

function activate_account_BKL(nType)
	local nLevel = GetLevel()
	local nExp = GetExp()
	if CheckAccountExt_BKL() <= 0 then  --CheckAccount_BKL() <= 0 	--GetTask(TSK_BKLB_ACTIVE) == 0 and 
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã L«i Hæ LÖnh.")
		return
	end
	
	if CheckActivatedExt_BKL() ~= 0 then	--CheckActivated_BKL() ~= 0 or 
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ®· ®­îc kİch ho¹t råi, kh«ng cÇn kİch ho¹t n÷a!");
		return
	end
	
	if nType == 1 then
		if CheckAccountExt_BKL() ~= 1 then	--GetTask(TSK_BKLB_ACTIVE) ~= 1 and 
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kh«ng ph¶i C¸i ThÕ Anh Hµo, kh«ng thÓ kİch ho¹t.");
			return
		end
		
		if CheckCharged_BKL() > 1 then 	--GetTask(TSK_BKLB_COUNT) > 1 and 
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ho¹t ®éng chØ ¸p dông ®èi víi tµi kho¶n n¹p L«i Hæ LÖnh lÇn ®Çu.");
			return
		end
		
		if nLevel <= NEEDED_LEVEL then		
			if nLevel == NEEDED_LEVEL then
					if nExp <= NEEDED_EXP then
						if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 3) == 1 then
							--SetTask(TSK_BKLB_ACTIVE, 3)
							--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_LEVELAWARD, 1)
							--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_STATUS, 3)
							SetLevel(73,0)
							ModifyExp(20000000)			
							ModifyReputation(3000, 0)
							Earn(999999)
							gf_WriteLogEx(szBKLBLogHeader, "Kİch ho¹t thµnh c«ng C¸i ThÕ Anh Hµo",1, "C¸i ThÕ Anh Hµo")
							Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ®· ®­îc kİch ho¹t C¸i ThÕ Anh Hµo! Vui lßng ®¨ng nhËp l¹i!");	
						end	
					else
--						if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 4) == 1 then
--							SetTask(TSK_BKLB_REWARD, 0)
--							SetTask(TSK_BKLB_EXCHANGE,0)
--							gf_WriteLogEx(szBKLBLogHeader, "Kİch ho¹t thµnh c«ng TuyÖt ThÕ Cao Nh©n",1, "TuyÖt ThÕ Cao Nh©n do level cao")
--							Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ cã level qu¸ cao nªn kh«ng thÓ trë thµnh C¸i ThÕ Anh Hµo ®­îc. Chóc mõng ®¹i hiÖp ®· trë thµnh TuyÖt ThÕ Cao Nh©n. Vui lßng ®¨ng nhËp l¹i!");	
--						end	
						Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §Ó kİch ho¹t C¸i ThÕ Anh Hµo cÇn ®¼ng cÊp <= 73 vµ ®iÓm kinh nghiÖm ph¶i İt h¬n 20 triÖu.")
						return 0
					end
			elseif nLevel < NEEDED_LEVEL then
					if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 3) == 1 then
						--SetTask(TSK_BKLB_ACTIVE, 3)
						--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_LEVELAWARD, 1)
						--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_STATUS, 3)
						SetLevel(73,0)
						ModifyExp(20000000)			
						ModifyReputation(3000, 0)
						Earn(999999)
						gf_WriteLogEx(szBKLBLogHeader, "Kİch ho¹t thµnh c«ng C¸i ThÕ Anh Hµo",1, "C¸i ThÕ Anh Hµo")
						Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ®· ®­îc kİch ho¹t C¸i ThÕ Anh Hµo! Vui lßng ®¨ng nhËp l¹i!");	
					end	
			end
		else
--			if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 4) == 1 then
--				SetTask(TSK_BKLB_REWARD, 0)
--				SetTask(TSK_BKLB_EXCHANGE,0)
--				gf_WriteLogEx(szBKLBLogHeader, "Kİch ho¹t thµnh c«ng TuyÖt ThÕ Cao Nh©n",1, "TuyÖt ThÕ Cao Nh©n")
--				Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ cã level qu¸ cao nªn kh«ng thÓ trë thµnh C¸i ThÕ Anh Hµo ®­îc. Chóc mõng ®¹i hiÖp ®· trë thµnh TuyÖt ThÕ Cao Nh©n. Vui lßng ®¨ng nhËp l¹i!");	
--			end	
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §Ó kİch ho¹t C¸i ThÕ Anh Hµo cÇn ®¼ng cÊp <= 73 vµ ®iÓm kinh nghiÖm ph¶i İt h¬n 20 triÖu.")
			return 0
		end
	elseif nType == 2 then
		if CheckAccountExt_BKL() ~= 2 then		--GetTask(TSK_BKLB_ACTIVE) ~= 2 and 
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kh«ng ph¶i TuyÖt ThÕ Cao Nh©n, kh«ng thÓ kİch ho¹t.");
			return
		end
		if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 4) == 1 then
			--SetTask(TSK_BKLB_ACTIVE, 4)  --
			--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_STATUS, 4)
			SetTask(TSK_BKLB_REWARD, 0)
			SetTask(TSK_BKLB_EXCHANGE,0)
			gf_WriteLogEx(szBKLBLogHeader, "Kİch ho¹t thµnh c«ng TuyÖt ThÕ Cao Nh©n",1, "TuyÖt ThÕ Cao Nh©n")
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ®· ®­îc kİch ho¹t TuyÖt ThÕ Cao Nh©n! Vui lßng ®¨ng nhËp l¹i!");	
		end
	end
end

function award_level_BKL()
	local tSay = {
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 74/#get_BKL_award(74)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 75/#get_BKL_award(75)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 76/#get_BKL_award(76)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 77/#get_BKL_award(77)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 78/#get_BKL_award(78)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 79/#get_BKL_award(79)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 80/#get_BKL_award(80)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 81/#get_BKL_award(81)",			
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 82/#get_BKL_award(82)",	
					"Trang kÕ/award_level_2_BKL",
					"T¹i h¹ chØ ghĞ ngang!/dlgover",
			}
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>L«i Hæ LÖnh<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",	getn(tSay),tSay)	
end

function award_level_2_BKL()
	local tSay = {							
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 83/#get_BKL_award(83)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 84/#get_BKL_award(84)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 85/#get_BKL_award(85)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 86/#get_BKL_award(86)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 87/#get_BKL_award(87)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 88/#get_BKL_award(88)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 89/#get_BKL_award(89)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 90/#get_BKL_award(90)",
					"Trang kÕ/award_level_3_BKL",	
					"Trang tr­íc/award_level_BKL",
					"T¹i h¹ chØ ghĞ ngang!/dlgover",
			}
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>L«i Hæ LÖnh<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",	getn(tSay),tSay)		
end

function award_level_3_BKL()
	local tSay = {							
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 91/#get_BKL_award(91)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 92/#get_BKL_award(92)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 93/#get_BKL_award(93)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 94/#get_BKL_award(94)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 95/#get_BKL_award(95)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 96/#get_BKL_award(96)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 97/#get_BKL_award(97)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 98/#get_BKL_award(98)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 99/#get_BKL_award(99)",										
					"Trang tr­íc/award_level_2_BKL",
					"T¹i h¹ chØ ghĞ ngang!/dlgover",
			}
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>L«i Hæ LÖnh<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",	getn(tSay),tSay)		
end

function get_BKL_award(nLevel)
	if CheckActivatedExt_BKL() ~= 1 then		--CheckActivated_BKL() ~= 1 and 
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ch­a kİch ho¹t nhËn th­ëng hoÆc kh«ng ph¶i C¸i ThÕ Anh Hµo!");
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if tRouteSkillInfo[nRoute]== 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if GetLevel() < 74 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña c¸c h¹ ch­a ®ñ 74, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55MaxSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	confim_get_golden_award_BKL(nLevel)
end

function confim_get_golden_award_BKL(nLevel)
	do return end
	local nAwardLevel = CheckLevel_BKL();
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kh«ng ®ñ ®iÒu kiÖn ®iÓm qu©n c«ng, danh väng vµ ®iÓm s­ m«n ®Ó nhËn phÇn th­ëng nµy");
		return
	end
	if nLevel >= 90 and nLevel< 99 then
		if GetExp() < tb_golden_award_BKL[nLevel][5] then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ph¶i cã ®ñ ".. tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm míi cã thÓ nhËn phÇn th­ëng cÊp "..nLevel.."!")
			return
		end
		if GetReputation() < tb_golden_award_BKL[nLevel][6] then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ph¶i cã ®ñ ".. tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng míi cã thÓ nhËn phÇn th­ëng cÊp "..nLevel.."!")
			return
		end
		if GetTask(336) < tb_golden_award_BKL[nLevel][7] then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ph¶i cã ®ñ ".. tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n míi cã thÓ nhËn phÇn th­ëng cÊp "..nLevel.."!")
			return
		end
		if GetItemCount() < tb_golden_award_BKL[nLevel][8] then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ph¶i cã ®ñ ".. tb_golden_award_BKL[nLevel][8].." Xu vËt phÈm míi cã thÓ nhËn phÇn th­ëng cÊp "..nLevel.."!")
			return	
		end
--		if GetCash() < tb_golden_award_BKL[nLevel][8]*10000 then
--			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ph¶i cã ®ñ ".. tb_golden_award_BKL[nLevel][8].." vµng míi cã thÓ nhËn phÇn th­ëng cÊp "..nLevel.."!")
--			return
--		end
	end
	warning_get_golden_award_BKL(nLevel, nAwardLevel);
end

function warning_get_golden_award_BKL(nWantLevel, nLevel)
	do return end
	Say("<color=green>Chñ Phßng M¸y<color>: NhËn phÇn th­ëng cÊp <color=red>"..nWantLevel.."<color>, c¸c h¹ cã thÓ nhËn phÇn th­ëng cao nhÊt lµ  phÇn th­ëng cÊp <color=red>"..nLevel.."<color>. Cã ch¾c muèn nhËn phÇn th­ëng cÊp "..nWantLevel.." kh«ng?",
		2,
		"Ta muèn nhËn /#confirm_confirm_BKL("..nWantLevel..")",
		"§Ó ta suy nghÜ l¹i xem./dlgover");
end

function confirm_confirm_BKL(nLevel)
	do return end
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc nhËn th­ëng")
		return
	end
	if CheckActivatedExt_BKL() ~= 1 then		--CheckActivated_BKL() ~= 1
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ch­a kİch ho¹t nhËn th­ëng hoÆc kh«ng ph¶i C¸i ThÕ Anh Hµo!");
		return
	end
	
	local nGet = CheckAwardLevel_BKL()
	if nGet > tb_golden_award_BKL[nLevel][4] then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn tiÕp n÷a!");
		return
	end
	if nLevel == 78 then	
		if gf_Judge_Room_Weight(20, 500, "Chñ Phßng M¸y") == 0 then
			return
		end
	else
		if gf_Judge_Room_Weight(12, 500, "Chñ Phßng M¸y") == 0 then
			return
		end
	end
	
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	local nGuanGong = GetTask(701)
	local szLogTitle = szBKLBLogHeader
	local szLogAction = "nhËn th­ëng theo cÊp"
	local nRet, nItemIdx = 0,0;
	local nCashPay = tb_golden_award_BKL[nLevel][8]*10000
	local nCash1= tb_golden_award_BKL[nLevel][8]
	
	if tRouteSkillInfo[nRoute] == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end	
	
	gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_LEVELAWARD, nGet + 1)
	if nLevel == 74 then										
		gf_AddItemEx2({2, 0, 553,3,1},"§¹i Nh©n S©m", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({2, 0, 554,15,1},"Tu Ch©n YÕu QuyÕt", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({0, 107, 64,1,1},"Thiªn Hµ MËt tŞch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 65,1,1},"Tö Hµ MËt tŞch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 66,1,1},"Chiªm Y Phæ", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 60,1,1},"Tu La MËt tŞch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 59,1,1},"Kim ThiÒn Phæ", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 61,1,1},"Bæ Kim MËt tŞch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 62,1,1},"Bæ Th¹ch MËt tŞch", szLogTitle, szLogAction)		
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		 gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 75 then
		 gf_AddItemEx2({2, 1, 9977,7,1},"Huy hiÖu chiÕn c«ng (Huy Hoµng)", szLogTitle, szLogAction, 7*24*60*60)
		 if nGuanGong >= 0 then
		 	gf_AddItemEx2({0, 109, 992 + nBody -1,1,4},"Tèng Qu©n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 else
		 	gf_AddItemEx2({0, 109, 996 + nBody -1,1,4},"Liªu Qu©n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 end	
		 Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 76 then
		--gf_AddItemEx2({2,1,30178,100}, "§u §ñ", szLogTitle, szLogAction)
--		local nIndex_fruit = mod(random(1,10000),20)
--		gf_AddItemEx2({2,1,tb_everyday_fruit_BKL[nIndex_fruit][1],200}, "Tr¸i c©y", szBKLBLogHeader, szBKLBLogAction)		
		gf_AddItemEx2({2, 2, 7,100,1},"M¶nh Thiªn Th¹ch", szLogTitle, szLogAction)	
		gf_AddItemEx2({2, 2, 8,100,1},"Thiªn Th¹ch", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 77 then
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 100, 30029 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Tèng TU §« Thèng chiÕn")
			gf_AddItemEx({0, 101, 30029 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Tèng TU §« Thèng chiÕn")
			gf_AddItemEx({0, 103, 30029 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Tèng TU §« Thèng chiÕn")
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9988,1,1},"Phong th­ëng lÖnh_Tèng (§« Thèng)")
		else
			gf_AddItemEx({0, 100, 30041 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Liªu TU §« Thèng chiÕn")
			gf_AddItemEx({0, 101, 30041 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Liªu TU §« Thèng chiÕn")
			gf_AddItemEx({0, 103, 30041 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Liªu TU §« Thèng chiÕn")	
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9987,1,1},"Phong th­ëng lÖnh_Liªu (§« Thèng)")
		end
		if nRet == 1 then
		 	SetItemExpireTime(nItemIdx,30*24*60*60)
		end
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 78 then
		if nRoute == 23 or nRoute == 29 or nRoute == 30 then
			if gf_Judge_Room_Weight(19,100) ~= 1 then
				Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
				return 0
			end
			TraoBiKiepPhaiMoi()
		else
			gf_AddItemEx2(tb_golden_skillbag[nRoute][2], tb_golden_skillbag[nRoute][1], szLogTitle, "nhËn ®­îc")
		end
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11], tb_golden_faction_tree[nRoute][10], szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11], tb_golden_faction_tree[nRoute][10], szLogTitle, "nhËn ®­îc")			
		--gf_AddItemEx2(tb_golden_faction_tree[nRoute][7], tb_golden_faction_tree[nRoute][6], szLogTitle, "nhËn ®­îc")
		--gf_AddItemEx2(tb_golden_faction_tree[nRoute][9], tb_golden_faction_tree[nRoute][8], szLogTitle, "nhËn ®­îc")		
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 79 then
--		local nBody = GetBody()
--		local tWeapons = {0, 3, 8, 0, 0, 1,  0, 2, 10, 0, 0, 5, 0, 2, 9, 0, 6, 4, 0, 7, 11}
--		if nRoute ==8 or nRoute == 9 then
--			nBody = nBody - 2		
--		end
--		AddItem(0, tWeapons[nRoute], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0 , 7);	
--		if nRoute == 2 then
--			AddItem(0, tWeapons[12], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0, 7);	
--		end
		gf_AddItemEx2({2,1,30340,800,4}, "Méc R­¬ng", szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11], tb_golden_faction_tree[nRoute][10], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 80 then
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13], tb_golden_faction_tree[nRoute][12], szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2({2, 0, 554, 15, 4},"Tu ch©n yÕu quyÕt", szLogTitle, "nhËn ®­îc", 7*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		--thªm kİch ho¹t kinh m¹ch vâ gi¶
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 81 then
		gf_AddItemEx2({2, 1, 1068, 1, 4},"Thiªn Th¹ch Linh Th¹ch", szLogTitle, "nhËn ®­îc", 15*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 82 then
		--GoldenGiveJewel_BKL()
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 102, 30044 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"Tèng Th­¬ng ¦ng Tiªn Phong kú")
		else
			gf_AddItemEx({0, 102, 30080 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"Liªu Th­¬ng ¦ng Tiªn Phong kú")
		end
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)	
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 83 then
		--GoldenGiveJewel_BKL()
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 102, 30048 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"Tèng Th­¬ng ¦ng Tiªn Phong phï")
		else
			gf_AddItemEx({0, 102, 30084 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"Liªu Th­¬ng ¦ng Tiªn Phong phï")
		end		
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)	
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 84 then
		gf_AddItemEx2(tb_golden_book_all[nRoute][2], tb_golden_book_all[nRoute][1], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 85 then
		gf_AddItemEx2({2,1,30368,88,4}, "Cæ Linh Th¹ch", szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2({2,1,30369,88,4}, "Cæ Linh Ngäc", szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 86 then
		--GetTQVD()
--		if nRoute == 23 or nRoute == 29 or nRoute == 30 then
--			gf_AddItemEx2({2,1,30390,999},"nhËn th­ëng",szLogTitle,"NhËn Thµnh C«ng M¶nh Thiªn Cang")
--		else	
--			gf_AddItemEx2(tb_golden_dvy_weapon[nRoute][2],tb_golden_dvy_weapon[nRoute][1],szLogTitle,"NhËn Thµnh C«ng")
--			Msg2Player("B¹n ®· nhËn ®­îc "..tb_golden_dvy_weapon[nRoute][1])		
--		end
		gf_AddItemEx2({2, 1, 1068, 1, 4},"Thiªn Th¹ch Linh Th¹ch", szLogTitle, "nhËn ®­îc", 15*24*60*60)
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13] , tb_golden_faction_tree[nRoute][12], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 87 then
		--GetTQVD()
		--gf_AddItemEx2({0,107,155,1}, "Ngò Hµnh MËt tŞch", szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2({2,1,30408,3}, "Thiªn HuyÔn Kh¾c B¶n cÊp 3", szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2({2,1,30491,7,1}, "VĞ TiÕu Y Vµng", szLogTitle, "nhËn ®­îc", 15*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 88 then
		--GetTQVD()
		--gf_EventGiveRandAward(tb_golden_book_gaojimiji,10000,1, szLogTitle, szLogAction)
--		local G_nNonHN = tbHaoNguyet_Non_BKL[nRoute][nBody][2]
--		local D_nNonHN = tbHaoNguyet_Non_BKL[nRoute][nBody][3]
--		local P_nNonHN = tbHaoNguyet_Non_BKL[nRoute][nBody][4]				
--		gf_AddItemEx2({G_nNonHN, D_nNonHN, P_nNonHN, 1,4,-1,-1,-1,-1,-1,-1,0,9},"Nãn H¹o NguyÖt", szLogTitle, "nhËn ®­îc")
--		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13] , tb_golden_faction_tree[nRoute][12], szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2({2,1,1067,1,1}, "§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch", szLogTitle, "nhËn ®­îc", 15*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 89 then
		--gf_AddItemEx2({2, 1, 504, 8, 4},"N÷ Oa Tinh Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		--gf_AddItemEx2(tb_golden_book_gaojimiji_faction[nRoute][2], tb_golden_book_gaojimiji_faction[nRoute][1], szLogTitle, "nhËn ®­îc")	
		local G_nAoHN = tbHaoNguyet_Ao_BKL[nRoute][nBody][2]
		local D_nAoHN = tbHaoNguyet_Ao_BKL[nRoute][nBody][3]
		local P_nAoHN = tbHaoNguyet_Ao_BKL[nRoute][nBody][4]				
		gf_AddItemEx2({G_nAoHN, D_nAoHN, P_nAoHN, 1,4,-1,-1,-1,-1,-1,-1,0,9},"Aã H¹o NguyÖt", szLogTitle, "nhËn ®­îc")	
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13], tb_golden_faction_tree[nRoute][12], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 90 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		gf_AddItemEx2({2,1,1113,1,1}, "§¹i §Şnh Hån", szLogTitle, szLogAction, 30*24*60*60)	
		local G_nQuanHN = tbHaoNguyet_Quan_BKL[nRoute][nBody][2]
		local D_nQuanHN = tbHaoNguyet_Quan_BKL[nRoute][nBody][3]
		local P_nQuanHN = tbHaoNguyet_Quan_BKL[nRoute][nBody][4]				
		gf_AddItemEx2({G_nQuanHN, D_nQuanHN, P_nQuanHN, 1,4,-1,-1,-1,-1,-1,-1,0,9},"QuÇn H¹o NguyÖt", szLogTitle, "nhËn ®­îc")		
		--gf_AddItemEx2({2,1,1067,1,1}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		--AddTrangBiSuMon4()
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 91 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		

		for i = 1, 5 do
			gf_AddItemEx2(tbHaoNguyet_NgocBoi_BKL[i][2],"NhÉn H¹o NguyÖt", szLogTitle, "nhËn ®­îc")					
		end
		gf_AddItemEx2({2,1,30346,3,1}, "M¶nh B¹ch Kim", szLogTitle, szLogAction)
		--AddTrangBiSuMon4()		
		--gf_AddItemEx2({2,0,1084,3,1}, "Thiªn Qu¸i Th¹ch", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 92 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		--gf_AddItemEx2({2,1,1067,1,1}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 93 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		--gf_AddItemEx2({0,112,78,1,4}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		gf_AddItemEx2({2,1,1067,1,1}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 94 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		gf_AddItemEx2({2,1,1009,39,1}, "Thiªn Th¹ch Tinh Th¹ch", szLogTitle, szLogAction)
		gf_AddItemEx2(tbHaoNguyet_VuKhi_BKL[nRoute][2],tbHaoNguyet_VuKhi_BKL[nRoute][1],szLogTitle,szLogAction)		
		--AddweaponFYVYDV94()
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 95 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")	
		Pay(nCashPay)			
		gf_AddItemEx2({0,112,158,1,4}, "L¨ng Ba Vi Bé toµn tËp", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		AddGlobalNews("Qu¶ lµ C¸i ThÕ Anh Hµo, "..GetName().." ®· nhËn thµnh c«ng 1 L¨ng Ba Vi Bé Toµn TËp, phÇn th­ëng cÊp 95 L«i Hæ LÖnh")
  		Msg2SubWorld("Qu¶ lµ C¸i ThÕ Anh Hµo, "..GetName().." ®· nhËn thµnh c«ng 1 L¨ng Ba Vi Bé Toµn TËp, phÇn th­ëng cÊp 95 L«i Hæ LÖnh")		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 96 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		Pay(nCashPay)
		Msg2Player("B¹n ®· bŞ trõ "..nCash1.." vµng.")		
		--gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		--gf_AddItemEx2({2,1,1067,1,1}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({2,1,30345,1,1}, "ChuyÓn sinh ®¬n", szLogTitle, szLogAction, 60*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)	
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 97 then
	ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		Pay(nCashPay)
		local nCash1 = tb_golden_award_BKL[nLevel][8]*10000
		Msg2Player("B¹n ®· bŞ trõ "..nCash1.." vµng.")			
		--gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		--gf_AddItemEx2(tb_VK_SuMon[nRoute][2][nBody], tb_VK_SuMon[nRoute][1], szLogTitle, "nhËn ®­îc")		
		gf_AddItemEx2({2,1,30345,1,4}, "ChuyÓn sinh ®¬n", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 98 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		Pay(nCashPay)
		local nCash1 = tb_golden_award_BKL[nLevel][8]*10000
		Msg2Player("B¹n ®· bŞ trõ "..nCash1.." vµng.")				
		gf_AddItemEx2({2,1,1113,1,1}, "§¹i §Şnh Hån", szLogTitle, szLogAction, 30*24*60*60)	
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	elseif nLevel == 99 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][5].." ®iÓm kinh nghiÖm.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][6].." ®iÓm danh väng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B¹n ®· bŞ trõ "..tb_golden_award_BKL[nLevel][7].." ®iÓm s­ m«n.")		
		Pay(nCashPay)
		local nCash1 = tb_golden_award_BKL[nLevel][8]*10000
		Msg2Player("B¹n ®· bŞ trõ "..nCash1.." vµng.")		
		gf_AddItemEx2({2,1,30345,1,1}, "ChuyÓn sinh ®¬n", szLogTitle, szLogAction, 60*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)	
		AddGlobalNews("Qu¶ lµ C¸i ThÕ Anh Hµo, "..GetName().." ®· nhËn thµnh c«ng 1 ChuyÓn Sinh §¬n, phÇn th­ëng cÊp 99 L«i Hæ LÖnh. Qu¸ tr×nh b«n tÈu giang hå b¾t ®Çu")
  		Msg2SubWorld("Qu¶ lµ C¸i ThÕ Anh Hµo, "..GetName().." ®· nhËn thµnh c«ng 1 ChuyÓn Sinh §¬n , phÇn th­ëng cÊp 99 L«i Hæ LÖnh. Qu¸ tr×nh b«n tÈu giang hå b¾t ®Çu")		
		gf_WriteLogEx(szLogTitle, "®æi thµnh c«ng", 1, "6/2013 nhËn th­ëng theo cÊp "..nLevel)		
	else
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp kh«ng ®óng!");
		return
	end
end


function TraoBiKiepPhaiMoi()
	local tbBiKipConLon = {
		[1] = {[1] = {item={{gdp={2,6,169,1}, name = "Bİ kiÕp L«i TÕ"}}}, nRate = 7.15},
		[2] = {[1] = {item={{gdp={2,6,170,1}, name = "Bİ kiÕp Phong TÕ"}}}, nRate = 7.15},
		[3] = {[1] = {item={{gdp={2,6,171,1}, name = "Bİ kiÕp Thiªn l«i phï"}}}, nRate = 7.15},
		[4] = {[1] = {item={{gdp={2,6,172,1}, name = "Bİ kiÕp B¨ng Phong QuyÕt"}}}, nRate = 7.15},
		[5] = {[1] = {item={{gdp={2,6,173,1}, name = "Bİ kiÕp Ngù Phong QuyÕt"}}}, nRate = 7.14},
		[6] = {[1] = {item={{gdp={2,6,174,1}, name = "Bİ KiÕp Cuång L«i Phï"}}}, nRate = 7.14},
		[7] = {[1] = {item={{gdp={2,6,175,1}, name = "Bİ KiÕp D­¬ng Sa QuyÕt"}}}, nRate = 7.14},
		[8] = {[1] = {item={{gdp={2,6,176,1}, name = "Bİ KiÕp Oanh L«i Phï"}}}, nRate = 7.14},
		[9] = {[1] = {item={{gdp={2,6,177,1}, name = "Bİ KiÕp Cang phong quyÕt"}}}, nRate = 7.14},
		[10] = {[1] = {item={{gdp={2,6,178,1}, name = "Bİ KiÕp B¹o L«i Phï"}}}, nRate = 7.14},
		[11] = {[1] = {item={{gdp={2,6,179,1}, name = "Bİ KiÕp Tiªu phong t¸n quyÕt"}}}, nRate = 7.14},
		[12] = {[1] = {item={{gdp={2,6,180,1}, name = "Bİ KiÕp Ngò L«i chİnh ph¸p phï"}}}, nRate = 7.14},
		[13] = {[1] = {item={{gdp={2,6,181,1}, name = "Bİ KiÕp V¹n L«i To¸i Tinh phï"}}}, nRate = 7.14},
		[14] = {[1] = {item={{gdp={2,6,182,1}, name = "Bİ KiÕp HuyÒn Phong triÒn quyÕt"}}}, nRate = 7.14},
	}
	local tbBiKipThuyYen = {
		[1] = {[1] = {item={{gdp={2,6,219,1}, name = "YÕu quyÕt Khëi Vò"}}}, nRate = 4.55},
		[2] = {[1] = {item={{gdp={2,6,220,1}, name = "YÕu quyÕt Linh Miªu VËn"}}}, nRate = 4.55},
		[3] = {[1] = {item={{gdp={2,6,221,1}, name = "YÕu quyÕt Vò V©n T©m Ph¸p"}}}, nRate = 4.55},
		[4] = {[1] = {item={{gdp={2,6,222,1}, name = "YÕu quyÕt MŞ Hoa"}}}, nRate = 4.55},
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
	
	for i=1,15 do
		if GetPlayerRoute() == 23 then
			LIB_Award:AwardByRate(tbBiKipConLon)
		elseif GetPlayerRoute() == 29 or GetPlayerRoute() == 30 then
			LIB_Award:AwardByRate(tbBiKipThuyYen)
		end
	end
end
function dlgover()
end	
