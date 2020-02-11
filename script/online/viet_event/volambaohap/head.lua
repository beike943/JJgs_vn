Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

MAX_KEY_EXP = 1800000000
VLBH_MAX_DAY =  200
VLBH_MAX_WEEK = 1400
VLBH_MAX_Qi = 1500
VLBH_MAX_QUANCONG = 52500

tExpKeyAward =
{
	[1] = {"Ch×a Khãa Thanh §ång", 30135, 1000000, 0, 1},
	[2] = {"Ch×a Khãa B¹ch Ng©n", 30134, 10000000, 200, 15},
	[3] = {"Ch×a Khãa Vµng", 30133, 120000000, 3500, 100},
}
-- Chó thÝch: item name, chØ sè P cña item, exp, qu©n c«ng, ch©n khi

function vlbh_exchange_key_gold()
	if GetLevel() < 79 then
		Talk(1, "", "§¼ng cÊp 79 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
		return
	end
	if gf_Check55MaxSkill() == 0 then
		Talk(1,"","Max Skill 55 míi cã thÓ tham gia ho¹t ®éng  ")
		return
	end	
	local tSay = {}
	local szHeader = "§¹i hiÖp muèn ®æi lo¹i ch×a khãa nµo?"
	tinsert(tSay, "§æi Ch×a Khãa Thanh §ång (cÇn 10 Vâ L©m B¶o H¹p vµ 11 vµng)/vlbh_exchange_bronzekey")
	tinsert(tSay, "§æi Ch×a Khãa B¹ch Ng©n (cÇn 100 Vâ L©m B¶o H¹p vµ 123 vµng)/vlbh_exchange_silverkey")
	tinsert(tSay, "§æi Ch×a Khãa Vµng (cÇn 999 Vâ L©m B¶o H¹p vµ 1200 vµng)/vlbh_exchange_goldenkey")
	tinsert(tSay, "§æi 1 Huy HiÖu ChiÕn C«ng Huy Hoµng (cÇn 999 Vâ L©m B¶o H¹p vµ 869 vµng)/vlbh_exchange_HCHH")
	tinsert(tSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	Say(szHeader, getn(tSay), tSay)
end


function vlbh_exchange_key_xu()
	if GetLevel() < 79 then
		Talk(1, "", "§¼ng cÊp 79 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
		return
	end
	if gf_Check55MaxSkill() == 0 then
		Talk(1,"","Max Skill 55 míi cã thÓ tham gia ho¹t ®éng  ")
		return
	end	
	local tSay = {}
	local szHeader = "§¹i hiÖp muèn ®æi lo¹i ch×a khãa nµo?"
	tinsert(tSay, "§æi Ch×a Khãa Thanh §ång (cÇn 10 Vâ L©m B¶o H¹p vµ 3 xu vËt phÈm)/vlbh_exchange_bronzekey_xu")
	tinsert(tSay, "§æi Ch×a Khãa B¹ch Ng©n (cÇn 100 Vâ L©m B¶o H¹p vµ 30 xu vËt phÈm)/vlbh_exchange_silverkey_xu")
	tinsert(tSay, "§æi Ch×a Khãa Vµng (cÇn 999 Vâ L©m B¶o H¹p vµ 349 xu vËt phÈm)/vlbh_exchange_goldenkey_xu")
	tinsert(tSay, "§æi 1 Huy HiÖu ChiÕn C«ng Huy Hoµng (cÇn 999 Vâ L©m B¶o H¹p vµ 249 xu vËt phÈm)/vlbh_exchange_HCHH_xu")
	tinsert(tSay, "§æi 1 Huy HiÖu ChiÕn C«ng §¹i (cÇn 399 Vâ L©m B¶o H¹p vµ 99 xu vËt phÈm)/vlbh_exchange_HCDai_xu")
	tinsert(tSay, "§æi 1 Qu©n C«ng Ch­¬ng (cÇn 99 Vâ L©m B¶o H¹p vµ 24 xu vËt phÈm)/vlbh_exchange_QCC_xu")
	tinsert(tSay, "§æi 1 Tô Linh Tiªn §¬n (cÇn 449 Vâ L©m B¶o H¹p vµ 249 xu vËt phÈm)/vlbh_exchange_TLTDon_xu")
--	tinsert(tSay, "§æi 1 §¹i Ng©n PhiÕu (cÇn 149 Vâ L©m B¶o H¹p vµ 90 xu vËt phÈm)/vlbh_exchange_DaiNganPhieu_xu")
	tinsert(tSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	Say(szHeader, getn(tSay), tSay)
end


function vlbh_receive_key_prize()
	if GetLevel() < 79 then
		Talk(1, "", "§¼ng cÊp 79 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
		return
	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1,"","Max Skill 55 míi cã thÓ tham gia ho¹t ®éng  ")
--		return
--	end		
	local tSay = {}
	local szHeader = "§¹i hiÖp h·y chän lo¹i ch×a khãa ®Ó më th­ëng, l­u ý lµ chØ cã thÓ nhËn th­ëng tèi ®a 180.000 v¹n ®iÓm kinh nghiÖm tõ ch×a khãa mçi tuÇn:"
	
	tinsert(tSay, "NhËn th­ëng b»ng Ch×a Khãa Thanh §ång/#receive_keyprize(1)")
	tinsert(tSay, "NhËn th­ëng b»ng Ch×a Khãa B¹ch Ng©n/#receive_keyprize(2)")
	tinsert(tSay, "NhËn th­ëng b»ng Ch×a Khãa Vµng/#receive_keyprize(3)")
	tinsert(tSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

-- §æi ch×a khãa b»ng vµng
function vlbh_exchange_bronzekey()
	AskClientForNumber("confirm_exchange_bronzekey", 1, 10, "Ch×a Khãa §ång:")
end

function vlbh_exchange_silverkey()
	AskClientForNumber("confirm_exchange_silverkey", 1, 10, "Ch×a Khãa B¹c:")
end

function vlbh_exchange_goldenkey()
	AskClientForNumber("confirm_exchange_goldenkey", 1, 10, "Ch×a Khãa Vµng:")
end

function vlbh_exchange_HCHH()
	AskClientForNumber("confirm_vlbh_exchange_HCHH", 1, 10, "Hu©n Ch­¬ng Huy Hoµng:")
end

function confirm_exchange_bronzekey(nCount)
	local nGold = 110000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
     if GetItemCount(2, 1, 30132) < (10 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ vµng ®Ó ®æi!")
		return
	end
	if DelItem(2, 1, 30132, 10 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30135, nQuantity}, "Ch×a khãa Thanh §ång ®æi = vµng", "Vo Lam Bao Hap", "®æi Ch×a khãa Thanh §ång")
	end
end

function confirm_exchange_silverkey(nCount)
	local nGold = 1230000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return
	end
     if GetItemCount(2, 1, 30132) < (100 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ vµng ®Ó ®æi!")
		return
	end
	if DelItem(2, 1, 30132, 100 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30134, nQuantity}, "Ch×a kho¸ B¹ch Ng©n ®æi = vµng", "Vo Lam Bao Hap", "®æi Ch×a kho¸ B¹ch Ng©n")
	end	
end

function confirm_exchange_goldenkey(nCount)
	local nGold = 12000000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ vµng ®Ó ®æi!")
		return
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30133, nQuantity}, "Ch×a Khãa Vµng ®æi = vµng", "Vo Lam Bao Hap", "®æi Ch×a Khãa Vµng")
	end
end

function confirm_vlbh_exchange_HCHH(nCount)
	local nGold = 8690000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ vµng ®Ó ®æi!")
		return
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9977, nQuantity}, "Huy hiÖu Huy Hoµng ®æi = vµng", "Vo Lam Bao Hap", "®æi Huy HiÖu Huy Hoµng",7*24*3600)
	end
end


-- §æi ch×a khãa b»ng xu
function vlbh_exchange_bronzekey_xu()
	AskClientForNumber("confirm_exchange_bronzekey_xu", 1, 10, "Ch×a Khãa §ång:")
end

function vlbh_exchange_silverkey_xu()
	AskClientForNumber("confirm_exchange_silverkey_xu", 1, 10, "Ch×a Khãa B¹c:")
end

function vlbh_exchange_goldenkey_xu()
	AskClientForNumber("confirm_exchange_goldenkey_xu", 1, 10, "Ch×a Khãa Vµng:")
end

function vlbh_exchange_HCHH_xu()
	AskClientForNumber("confirm_vlbh_exchange_HCHH_xu", 1, 10, "Hu©n Ch­¬ng Huy Hoµng:")
end

function vlbh_exchange_HCDai_xu()
	AskClientForNumber("confirm_vlbh_exchange_HCDai_xu", 1, 10, "Hu©n Ch­¬ng §¹i:")
end

function vlbh_exchange_QCC_xu()
	AskClientForNumber("confirm_vlbh_exchange_QCC_xu", 1, 10, "Hu©n C«ng Ch­¬ng:")
end

function vlbh_exchange_TLTDon_xu()
	AskClientForNumber("confirm_vlbh_exchange_TLTDon_xu", 1, 10, "Tô Linh Tiªn §¬n:")
end

function vlbh_exchange_DaiNganPhieu_xu()
	AskClientForNumber("confirm_vlbh_exchange_DaiNganPhieu_xu", 1, 10, "§¹i Ng©n PhiÕu:")
end

function confirm_exchange_bronzekey_xu(nCount)
	local nXu = 3
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (10 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 10 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30135, nQuantity}, "Ch×a khãa Thanh §ång ®æi = xu", "Vo Lam Bao Hap", "®æi Ch×a khãa Thanh §ång - xu")
	end
end

function confirm_exchange_silverkey_xu(nCount)
	local nXu = 30
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (100 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 100 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30134, nQuantity}, "Ch×a kho¸ B¹ch Ng©n ®æi = xu", "Vo Lam Bao Hap", "®æi Ch×a kho¸ B¹ch Ng©n - xu")
	end	
end

function confirm_exchange_goldenkey_xu(nCount)
	local nXu = 349
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30133, nQuantity}, "Ch×a Khãa Vµng ®æi = xu", "Vo Lam Bao Hap", "®æi Ch×a Khãa Vµng - xu")
	end
end

function confirm_vlbh_exchange_HCHH_xu(nCount)
	local nXu = 249
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9977, nQuantity}, "Hu©n Ch­¬ng Huy Hoµng ®æi = xu", "Vo Lam Bao Hap", "®æi Hu©n Ch­¬ng Huy Hoµng - xu",7*24*3600)
	end
end

function confirm_vlbh_exchange_HCDai_xu(nCount)
	local nXu = 99
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (399 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 399 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9998, nQuantity}, "Hu©n Ch­¬ng §¹i ®æi = xu", "Vo Lam Bao Hap", "®æi Hu©n Ch­¬ng §¹i - xu",7*24*3600)
	end
end


function confirm_vlbh_exchange_QCC_xu(nCount)
	local nXu = 24
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (99 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 99 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9999, nQuantity}, "Hu©n C«ng Ch­¬ng ®æi = xu", "Vo Lam Bao Hap", "®æi Hu©n C«ng Ch­¬ng - xu",7*24*3600)
	end
end

function confirm_vlbh_exchange_TLTDon_xu(nCount)
	local nXu = 249
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (449 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 449 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30460, nQuantity}, "Tô Linh Tiªn §¬n ®æi = xu", "Vo Lam Bao Hap", "®æi Tô Linh Tiªn §¬n - xu",7*24*3600)
	end
end

function confirm_vlbh_exchange_DaiNganPhieu_xu(nCount)
	local nXu = 90
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (149 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Vâ L©m B¶o H¹p hoÆc kh«ng ®ñ xu vËt phÈm ®Ó ®æi!")
		return 0
	end
	if DelItem(2, 1, 30132, 149 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 199, nQuantity}, "§¹i Ng©n PhiÕu ®æi = xu", "Vo Lam Bao Hap", "®æi §¹i Ng©n PhiÕu - xu",7*24*3600)
	end
end

-- Nh©n th­ëng ch×a khãa
function receive_keyprize(nType)
	local nReceiveDate = floor(tonumber(GetTask(TSK_VLBH_MARK)/100))
	local nReceiveWeek = mod(GetTask(TSK_VLBH_MARK),100)
	
	local nCurrentDate = tonumber(date("%m%d"))
	local nCurrentWeek = tonumber(date("%W"))


--	if MeridianGetLevel()==0 then
--		VLBH_MAX_Qi = 0
--	end
-- Reset kinh nghiÖm tuÇn
	if nReceiveWeek ~= nCurrentWeek then
		SetTask(TSK_VLBH_EXP,0)
		SetTask(TSK_VLBH_QI,0)
		SetTask(TSK_VLBH_Qty,0)
		SetTask(TSK_VLBH_QUANCONG,0)
	end
			
	local nCurrentExpVLBH = GetTask(TSK_VLBH_EXP)
	local nCurrentQiVLBH = GetTask(TSK_VLBH_QI)
	local nCurrentQuanCong = GetTask(TSK_VLBH_QUANCONG)

	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + 390000 > 2000000000 then
			Talk(1,"",format("C¸c h¹ kh«ng nhËn ®­îc ®iÓm kinh nghiÖm v× sÏ v­ît qu¸ 2 tû ®iÓm !!!!!"))
			--return 0
		end
	end	
-- Check max exp, ch©n khÝ
	if nCurrentExpVLBH >= MAX_KEY_EXP  then	--and nCurrentQiVLBH>=VLBH_MAX_Qi
		Talk(1, "", "§· nhËn ®­îc tèi ®a møc ®iÓm kinh nghiÖm trong tuÇn, kh«ng thÓ nhËn thªm n÷a!")
		return
	end
	
	if nCurrentQuanCong >= VLBH_MAX_QUANCONG  then
		Talk(1, "", "§· nhËn ®­îc tèi ®a møc ®iÓm c«ng tr¹ng  trong tuÇn, kh«ng thÓ nhËn thªm n÷a!")
		return
	end
	
	local nExp = min(MAX_KEY_EXP - nCurrentExpVLBH, tExpKeyAward[nType][3])
	local nQuanCong = min(VLBH_MAX_QUANCONG - nCurrentQuanCong, tExpKeyAward[nType][4])
--	local nQi = min(VLBH_MAX_Qi - nCurrentQiVLBH, tExpKeyAward[nType][5])
---- §Ò phßng ch©n khÝ ©m
--	if nQi<0 then
--		nQi = 0
--	end
	
-- §æi th­ëng
	SetTask(TSK_VLBH_MARK, nCurrentDate*100 + nCurrentWeek)
	if DelItem(2, 1, tExpKeyAward[nType][2], 1) == 1 then
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!")
		--- §iÓm VËn May
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--		else
--			Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--		end
		---------			
		SetTask(TSK_VLBH_EXP, nCurrentExpVLBH + nExp)
		SetTask(TSK_VLBH_QUANCONG, nCurrentQuanCong + nQuanCong)
--		if MeridianGetLevel() > 0 then
--			AwardGenuineQi(nQi)
--			SetTask(TSK_VLBH_Qi, nCurrentQiVLBH + nQi)
--		end
		
		if nQuanCong > 0 then
			if GetTask(701) ~= 0 then
				if GetTask(701) > 0 then
					SetTask(701, GetTask(701) + tExpKeyAward[nType][4])
				elseif GetTask(701) < 0 then
					SetTask(701, GetTask(701) - tExpKeyAward[nType][4])
				end
				Msg2Player("B¹n nhËn ®­îc "..tExpKeyAward[nType][4].." ®iÓm qu©n c«ng!")
			end
		end
		if nType == 3 then
			SetTask(TSK_VLBH_QI, nCurrentQiVLBH + 1)
		end
		 gf_WriteLogEx("Vo Lam Bao Hap", "nhËn th­ëng", 1, "nhËn th­ëng "..tExpKeyAward[nType][1])
		--WriteLogEx("Vo Lam Bao Hap", "nhËn th­ëng "..tExpKeyAward[nType][1])
	else
		Talk(1,"","§¹i HiÖp kh«ng mang theo "..tExpKeyAward[nType][1].. " trong hµnh trang.")
		return
	end
	vlbh_receive_key_prize()
end

function check_quantity(nQuantity)
	if nQuantity == nil then
		return 0
	end
	if nQuantity < 1 or nQuantity > 10 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, chØ cho phÐp nhËp sè tõ 1 ®Õn 10 xin vui lßng nhËp l¹i!")
		return 0
	end
	if gf_Judge_Room_Weight(2, nQuantity + 100," ") ~= 1 then
        	return 0
     end
     return 1
end

function Rec_VLBH()
	local nQty = 1
	local nMaxDay = 100
	local nReceiveDate = floor(tonumber(GetTask(TSK_VLBH_MARK)/100))
	local nReceiveWeek = mod(GetTask(TSK_VLBH_MARK),100)
	local nCurrentDate = tonumber(date("%m%d"))
	local nCurrentWeek = tonumber(date("%W"))
	
	local nTotalReceiveWeek = floor(tonumber(GetTask(TSK_VLBH_Qty)/100000))
	local nTotalReceiveDay = floor(mod(GetTask(TSK_VLBH_Qty),100000)/10)
	local nHoTroNhanVLBH = mod(GetTask(TSK_VLBH_Qty),10)
	local nHour = tonumber(date("%H%M"))
	if (nHour >= 0000 and nHour < 0830) or (nHour > 1030 and nHour < 1530) or (nHour > 1730 and nHour < 2000) or (nHour > 2200 and nHour < 2359) then
		Talk(1,"","Ch­a ®Õn giê nhËn b¶o h¹p, c¸c h¹ vui lßng quay l¹i sau");
		return
	end
	if GetLevel() < 80 then --or GetReputation() < 3000 then
		Talk(1,"","§¹i hiÖp ch­a ®ñ ®iÒu kiÖn ®Ó nhËn vâ l©m b¶o h¹p, vui lßng quay l¹i sau");
		return
	end
	if gf_Check55MaxSkill() == 0 then
		Talk(1,"","Max Skill 55 míi cã thÓ tham gia ho¹t ®éng  ")
		return
	end	
--	if GetLevel() >= 82 then
		nQty =  2
--		nMaxDay = VLBH_MAX_DAY
--	end
	
-- Reset sè l­îng nhËn theo ngµy	
	if nReceiveDate ~= nCurrentDate then
		nTotalReceiveDay = 0
		nHoTroNhanVLBH = 0
	end
-- Reset sè l­îng nhËn theo tuÇn
	if nReceiveWeek ~= nCurrentWeek then
		SetTask(TSK_VLBH_EXP,0)
		SetTask(TSK_VLBH_QI,0)
		nTotalReceiveWeek = 0
		SetTask(TSK_VLBH_QUANCONG,0)
	end
	
 --Check delay nhËn b¶o h¹p (c¸ch 3 phót)
	local nTimePoint = GetTask(TSK_VLBH_TIME)
	if (GetTime()  - nTimePoint ) < 180 then
		Talk(1,"","Cßn "..(2 - floor((GetTime()  - nTimePoint )/60)).." phót "..(60 - mod((GetTime()  - nTimePoint ),60)).." gi©y n÷a míi cã thÓ ®æi Vâ L©m B¶o H¹p tiÕp.")
		return
	end
-- IP bonus
--	if GetExtPoint(4) == 1 then
--		VLBH_MAX_DAY =  200
--		VLBH_MAX_WEEK = 1400
--	else
--		VLBH_MAX_DAY =  100
--		VLBH_MAX_WEEK = 700
--	end
-- Check nhËn max trong ngµy
	if nTotalReceiveDay >= nMaxDay then
		Talk(1,"","H«m nay ng­¬i ®· nhËn ®ñ ".. nMaxDay.." Vâ L©m B¶o H¹p råi!")
		return
	end

-- Check nhËn max trong tuÇn
	if nTotalReceiveWeek >= VLBH_MAX_WEEK then
		Talk(1,"","TuÇn nµy ng­¬i ®· nhËn ".. VLBH_MAX_WEEK .." Vâ L©m B¶o H¹p råi!")
		return
	end
	
	if gf_Judge_Room_Weight(1, 100,"") == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ");
		return
	end
	
--	if GetExtPoint(4) == 1 then
--		nTotalReceiveDay = nTotalReceiveDay +2
--		nTotalReceiveWeek = nTotalReceiveWeek + 2
--	else
		nTotalReceiveDay = nTotalReceiveDay +nQty
		nTotalReceiveWeek = nTotalReceiveWeek + nQty
--	end
	gf_WriteLogEx("Vo Lam Bao Hap", "nhËn thµnh c«ng", 1, "Tæng sè lÇn click nhËn thµnh c«ng")
	if nTotalReceiveDay == nMaxDay then
		gf_WriteLogEx("Vo Lam Bao Hap", "nhËn thµnh c«ng", 1, "NhËn Max VLBH trong ngµy")
	end
	if nTotalReceiveWeek == VLBH_MAX_WEEK then
		gf_WriteLogEx("Vo Lam Bao Hap", "nhËn thµnh c«ng", 1, "NhËn Max VLBH trong tuÇn")
	end
	SetTask(TSK_VLBH_TIME,GetTime())
	SetTask(TSK_VLBH_MARK, nCurrentDate*100 + nCurrentWeek)
	SetTask(TSK_VLBH_Qty, (nTotalReceiveWeek*10000 + nTotalReceiveDay)*10 + nHoTroNhanVLBH)
--	if GetExtPoint(4) == 1 then
--		gf_AddItemEx2({2,1,30132,2}, "Vâ L©m B¶o H¹p", "Vo Lam Bao Hap", "nhËn")
--		Msg2Player("B¹n nhËn ®­îc 2 Vâ L©m B¶o H¹p!")
--	else
		gf_AddItemEx2({2,1,30132,nQty}, "Vâ L©m B¶o H¹p", "Vo Lam Bao Hap", "nhËn")
		Msg2Player("B¹n nhËn ®­îc "..nQty.." Vâ L©m B¶o H¹p!")
--	end

end

function Rec_VLBH_2()
	if GetCash()<200000 then
		Talk(1,"","NhËn Vâ L©m B¶o H¹p tiÖn lîi cÇn tèn 20 vµng, c¸c h¹ ®· ®em ®ñ ch­a?");
		return
	end
	local nQty = 20
	local nDayQty = 0
	local nWeekQty = 0
	local nRealQty = 0
	local nReceiveDate = floor(tonumber(GetTask(TSK_VLBH_MARK)/100))
	local nReceiveWeek = mod(GetTask(TSK_VLBH_MARK),100)
	local nCurrentDate = tonumber(date("%m%d"))
	local nCurrentWeek = tonumber(date("%W"))
	
	local nTotalReceiveWeek = floor(tonumber(GetTask(TSK_VLBH_Qty)/10000))
	local nTotalReceiveDay = mod(GetTask(TSK_VLBH_Qty),10000)

-- Reset sè l­îng nhËn theo ngµy	
	if nReceiveDate ~= nCurrentDate then
		nTotalReceiveDay = 0
	end
-- Reset sè l­îng nhËn theo tuÇn
	if nReceiveWeek ~= nCurrentWeek then
		nTotalReceiveWeek = 0
		SetTask(TSK_VLBH_EXP,0)
		SetTask(TSK_VLBH_QI,0)	
		SetTask(TSK_VLBH_QUANCONG,0)		
	end
	
 --Check delay nhËn b¶o h¹p (c¸ch 15 phót)
	local nTimePoint = GetTask(TSK_VLBH_TIME2)
	if (GetTime()  - nTimePoint ) < (15*60) then
		Talk(1,"","Cßn "..(14 - floor((GetTime()  - nTimePoint )/60)).." phót "..(60 - mod((GetTime()  - nTimePoint ),60)).." gi©y n÷a míi cã thÓ ®æi Vâ L©m B¶o H¹p tiÕp.")
		return
	end

-- Check nhËn max trong ngµy
	if nTotalReceiveDay>=VLBH_MAX_DAY then
		Talk(1,"","H«m nay ng­¬i ®· nhËn ®ñ ".. VLBH_MAX_DAY.." Vâ L©m B¶o H¹p råi!")
		return
	end

-- Check nhËn max trong tuÇn
	if nTotalReceiveWeek>=VLBH_MAX_WEEK then
		Talk(1,"","TuÇn nµy ng­¬i ®· nhËn ".. VLBH_MAX_WEEK .." Vâ L©m B¶o H¹p råi!")
		return
	end
	
	if gf_Judge_Room_Weight(1, 100,"") == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ");
		return
	end
	
	-- Check sè l­îng thùc nhËn
	nDayQty = min(VLBH_MAX_DAY - nTotalReceiveDay, nQty)
	nWeekQty = min(VLBH_MAX_WEEK - nTotalReceiveWeek, nQty)
	nRealQty = min(nDayQty, nWeekQty)
		
	if Pay(200000)==1 then
		nTotalReceiveDay = nTotalReceiveDay + nRealQty
		nTotalReceiveWeek = nTotalReceiveWeek + nRealQty
		SetTask(TSK_VLBH_TIME2,GetTime())
		SetTask(TSK_VLBH_MARK, nCurrentDate*100 + nCurrentWeek)
		SetTask(TSK_VLBH_Qty, (nTotalReceiveWeek*10000 + nTotalReceiveDay)*10 + nHoTroNhanVLBH)
		
		gf_AddItemEx2({2,1,30132,nRealQty}, "Vâ L©m B¶o H¹p", "Vo Lam Bao Hap", "nhËn")
		Msg2Player("B¹n nhËn ®­îc "..nRealQty.." Vâ L©m B¶o H¹p!")
	end
end


function gold_key_shop()
	tbSay = {}
	tinsert(tbSay,"Ta muèn ®æi 01 C­êng hãa quyÓn cÊp 12 (tiªu hao 3 ch×a khãa vµng)/#gold_key_shop_trade(2)")
	tinsert(tbSay,"Ta muèn ®æi 01 C­êng hãa quyÓn cÊp 13 (tiªu hao 6 ch×a khãa vµng)/#gold_key_shop_trade(3)")
	tinsert(tbSay,"Ta muèn ®æi 01 C­êng hãa quyÓn cÊp 14 (tiªu hao 5 ch×a khãa vµng)/#gold_key_shop_trade(4)")
	tinsert(tbSay,"Ta muèn ®æi 01 C­êng hãa quyÓn cÊp 15 (tiªu hao 6 ch×a khãa vµng)/#gold_key_shop_trade(5)")
	tinsert(tbSay,"Ta muèn dïng 01 ch×a khãa vµng ®Ó nhËn th­ëng ngÉu nhiªn/#gold_key_shop_trade(1)")
	tinsert(tbSay,"Ta chØ xem thö/do_nothing")
	Say("Ta cã mét sè vËt phÈm quÝ, c¸c h¹ cã muèn dïng ch×a khãa vµng ®Ó ®æi lÊy kh«ng?", getn(tbSay), tbSay)
end


function gold_key_shop_trade(nOrder)
	local tbTHKhacBan1 = {item={{gdp={2,1,30406,1}, name ="Thiªn HuyÔn Kh¾c B¶n cÊp 1"}}}
	local tbTHKhacBan2 = {item={{gdp={2,1,30407,1}, name ="Thiªn HuyÔn Kh¾c B¶n cÊp 2"}}}
	local tbTHKhacBan3 = {item={{gdp={2,1,30408,1}, name ="Thiªn HuyÔn Kh¾c B¶n cÊp 3"}}}
	local tbMaDaoThach1 = {item={{gdp={2,1,30428,1}, name ="Ma §ao Th¹ch cÊp 1", nExpired = 15*24*60*60}}}
	local tbMaDaoThach2 = {item={{gdp={2,1,30429,1}, name ="Ma §ao Th¹ch cÊp 2", nExpired = 15*24*60*60}}}
	local tbMaDaoThach3 = {item={{gdp={2,1,30430,1}, name ="Ma §ao Th¹ch cÊp 3", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen12 = {item={{gdp={2,1,30424,1}, name ="C­êng hãa quyÓn 12", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen13 = {item={{gdp={2,1,30425,1}, name ="C­êng hãa quyÓn 13", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen14 = {item={{gdp={2,1,30426,1}, name ="C­êng hãa quyÓn 14", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen15 = {item={{gdp={2,1,30427,1}, name ="C­êng hãa quyÓn 15", nExpired = 15*24*60*60}}}
	local tbManhBachKim = {item={{gdp={2,1,30346,1}, name ="M¶nh B¹ch Kim"}}}
	local tbExp = {nExp = 5000000}
	local tbAwardSet = {
		[1] = {[1] = tbTHKhacBan1, nRate = 5},
		[2] = {[1] = tbTHKhacBan2, nRate = 5},
		[3] = {[1] = tbTHKhacBan3, nRate = 3},
		[4] = {[1] = tbMaDaoThach1, nRate = 8},
		[5] = {[1] = tbMaDaoThach2, nRate = 11},
		[6] = {[1] = tbMaDaoThach3, nRate = 5},
		[7] = {[1] = tbCuongHoaQuyen12, nRate = 7},
		[8] = {[1] = tbCuongHoaQuyen13, nRate = 6},
		[9] = {[1] = tbCuongHoaQuyen14, nRate = 7},
		[10] = {[1] = tbCuongHoaQuyen15, nRate = 10},
		[11] = {[1] = tbManhBachKim, nRate = 33},
	}
	
	local tbShopItem = {
		[2] = {tbCuongHoaQuyen12, 3},
		[3] = {tbCuongHoaQuyen13, 6},
		[4] = {tbCuongHoaQuyen14, 5},
		[5] = {tbCuongHoaQuyen15, 6},
	}
	
	LIB_Award.szLogTitle = "SHOP CHIA KHOA VANG"
	LIB_Award.szLogAction = "nhËn"
	
	if nOrder > 1 then
		if GetItemCount(2,1,30133) < tbShopItem[nOrder][2] then
			Talk(1,"","C¸c h¹ kh«ng cã ®ñ sè ch×a khãa vµng ta cÇn.")
			return 0
		end
		if DelItem(2,1,30133,tbShopItem[nOrder][2]) == 1 then
			LIB_Award:Award(tbShopItem[nOrder][1]);
			gold_key_shop()
		end
	else
		if GetItemCount(2,1,30133) < 1 then
			Talk(1,"","C¸c h¹ kh«ng cã ®ñ sè ch×a khãa vµng ta cÇn.")
			return 0
		end
		if GetItemCount(2,1,30133,1) >= 1 then
			if LIB_Award:Award(tbExp) == 1 then
				DelItem(2,1,30133,1)
			end
			LIB_Award:AwardByRate(tbAwardSet)
			gold_key_shop()
		end
	end
end


function HoTroVLBH(nOption)
	if GetGlbValue(1023) ~= 80 then
		return 0
	end
	if gf_Judge_Room_Weight(1, 1000,"") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
     end
     local nTotalReceiveDay = floor(mod(GetTask(TSK_VLBH_Qty),100000)/10)
     local nHoTroNhanVLBH = mod(GetTask(TSK_VLBH_Qty),10)
     if nTotalReceiveDay < 100 then
		Talk(1,"","C¸c h¹ ch­a nhËn ®ñ 100 VLBH trong ngµy, kh«ng thÓ nhËn hç trî nµy.")
		return 0
	end
     if GetBit(nHoTroNhanVLBH,nOption) ~= 0 then
		Talk(1,"","C¸c h¹ ®· nhËn hç trî nµy råi, mai h·y nhËn l¹i nhÐ.")
		return 0
	end
     if nOption == 1 then
     		if GetItemCount(2,1,30230) < 21 then
     			Talk(1,"","§­a ta 21 xu vËt phÈm, ta sÏ hç trî c¸c h¹.")
        		return 0
     		end
     	else
     		if GetCash() < 660000 then
     			Talk(1,"","§­a ta 66 vµng, ta sÏ hç trî c¸c h¹.")
        		return 0
     		end
     	end

	if nOption == 1 then
		DelItem(2,1,30230,21)
	else
		Pay(660000)
	end
	nHoTroNhanVLBH = SetBit(nHoTroNhanVLBH, nOption, 1)
	SetTask(TSK_VLBH_Qty, floor(GetTask(TSK_VLBH_Qty)/10)*10 + nHoTroNhanVLBH)
	gf_AddItemEx2({2,1,30132,900}, "Vâ L©m B¶o H¹p hç trî", "Vo Lam Bao Hap", "nhËn")
end


function do_nothing()

end