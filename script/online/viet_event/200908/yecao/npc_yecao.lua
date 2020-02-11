-- Created by TuanNA5
-- VNG August event - D¹ Th¶o

Include("\\script\\online\\viet_event\\200908\\yecao\\head.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua")
CHIENTUONG_FILE = "\\script\\vng\\chientuong.lua";

function main()
	page1()
end

function page1()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead = "D¹ Th¶o: §ång ®¹o cã thÓ dïng §ång TiÒn Vµng vµ c¸c vËt phÈm cÇn thiÕt ®Ó ®æi lÊy c¸c vËt phÈm gi¸ trÞ nh­ sau:"
	local nDate = tonumber(date("%Y%m%d"))
	
--	if nDate <= 20100606 then
--		tinsert(tbSayDialog, "Ta muèn mua 1 §Þnh Hån Thiªn Th¹ch (cÇn 4 §ång TiÒn Vµng + 4 Tói Thiªn Th¹ch Tinh Th¹ch + 4 Hoµng Kim §¹i Hång Bao + 4 Tö Kim Hång Bao)/get_soulstone")
--	end
	tinsert(tbSayDialog, "Ta muèn ®æi ChiÕn T­îng Nguyªn So¸i/#buy_elephant(0)")
	if nDate >= 20130528 and nDate <= 20130530 then
		tinsert(tbSayDialog, "Ta muèn ®æi l¹i ChiÕn T­îng kh¸c/change_elephant")
	end
	tinsert(tbSayDialog, "Ta muèn mua ThÇn Hµnh/get_transport")
	tinsert(tbSayDialog, "Ta muèn mua ThÎ bµi cæ ®éng viªn/support_card")
	if nDate <= 20110109 then
		tinsert(tbSayDialog, "Ta muèn ®æi TuÇn Léc (cÇn 1 Phiªu Vò + 99 vµng)/get_reindeer_2010")
	end
	tinsert(tbSayDialog, "HuÊn luyÖn chiÕn m· Tr¾ng (cÇn 1 B¹ch M· + 1 §ång TiÒn Vµng + 99 vµng)/#get_war_horse(3)")
	tinsert(tbSayDialog, "HuÊn luyÖn chiÕn m· §en (cÇn 1 B¹ch M· + 1 §ång TiÒn Vµng + 99 vµng)/#get_war_horse(4)")
	tinsert(tbSayDialog, "HuÊn luyÖn L­u V©n Kú L©n Thó (cÇn 1 ChiÕn m· Nguyªn So¸i + 1 Tö Kim Hång Bao)/#get_war_horse(12)")
	tinsert(tbSayDialog, "C¶i t¹o L­u V©n Kú L©n Thó (cÇn 1 L­u V©n Kú L©n Thó + 1 Tö Kim Hång Bao)/#get_war_horse(13)")
	
--	tinsert(tbSayDialog, "HuÊn luyÖn §»ng Vô (cÇn 1 Tr¶o Hoµng Phi §iÖn + 1 §ång TiÒn Vµng + 99 vµng)/get_horse")
--	tinsert(tbSayDialog, "HuÊn luyÖn Siªu Quang (CÇn 1 Hèt L«i B¸c + 1 §ång TiÒn Vµng + 99 vµng)/get_new_horse")
--	tinsert(tbSayDialog, "HuÊn luyÖn B«n Tiªu (CÇn 1 XÝch Thè + 1 §ång TiÒn Vµng + 99 vµng)/get_new_horse_1")
--	tinsert(tbSayDialog, "HuÊn luyÖn Phiªu Vò (CÇn 1 Bé C¶nh + 1 §ång TiÒn Vµng + 99 vµng)/get_new_horse_2")
--	tinsert(tbSayDialog, "HuÊn luyÖn Phï Dùc (CÇn 1 Bé C¶nh + 1 §ång TiÒn Vµng + 99 vµng)/get_new_horse_3")

	
	tinsert(tbSayDialog, "Xem trang sau/page2")
	tinsert(tbSayDialog, "T¹i h¹ chØ ghÐ ngang!/end_dialogover")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog)
	
end

function page2()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead = "D¹ Th¶o: §ång ®¹o cã thÓ dïng §ång TiÒn Vµng vµ c¸c vËt phÈm cÇn thiÕt ®Ó ®æi lÊy c¸c vËt phÈm gi¸ trÞ nh­ sau:"
	local nDate = tonumber(date("%Y%m%d"))
	
--	tinsert(tbSayDialog, "Ta muèn mua 1 Thiªn Th¹ch Linh Th¹ch (cÇn 3 Hoµ ThÞ BÝch + 5 §ång TiÒn Vµng + 99 vµng)/get_stone")
--	tinsert(tbSayDialog, "Ta muèn mua 1 B¶n vÏ ®óc t¹o thÇn binh (cÇn 12 lo¹i vò khÝ ch­a gi¸m ®Þnh cña 12 hÖ ph¸i kh¸c nhau + 1 §ång TiÒn Vµng + 1 S­ M«n T×nh NguyÖn Th­ + 99 Vµng)/get_weapon_fag")
	tinsert(tbSayDialog, "Ta muèn mua 1 Kú Kim cña Thî rÌn L­u (CÇn 1 §ång TiÒn Vµng + 1000 vµng)/#get_item(10)")
--	tinsert(tbSayDialog, "Ta muèn mua 1 YÕu QuyÕt (CÇn 1 §ång TiÒn Vµng + 1 MËt Hµm S­ M«n + 100 vµng)/#get_yue(1,10)")
	tinsert(tbSayDialog, "Xem trang tr­íc/page1")
	tinsert(tbSayDialog, "T¹i h¹ chØ ghÐ ngang!/end_dialogover")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog)
end

function support_card()
	if GetItemCount(2,1,537) < 2 then
		Say("D¹ Th¶o: C¸c h¹ kh«ng ®ñ 2 Tö Kim Hång Bao ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng.")
		return
	end

	if gf_Judge_Room_Weight(1,10, "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng.")
		return
	end

	if DelItem(2, 1, 537, 2) == 1 then
		local nRetCode, nItem = AddItem(2,1,30204,1,4);
		if nRetCode == 1 then		
			SetItemExpireTime(nItem,30*24*3600)
			Say("D¹ Th¶o: Chóc mõng c¸c h¹ nhËn ®­îc 1 ThÎ bµi cæ ®éng viªn!",0)
			Msg2Player("B¹n nhËn ®­îc 1 ThÎ bµi cæ ®éng viªn.")
			WriteLogEx("Worldcup 2010","D¹ Th¶o",1,"ThÎ bµi cæ ®éng viªn");
		end
	else
		WriteLogEx("Worldcup 2010","AddItem thÊt b¹i",1,"ThÎ bµi cæ ®éng viªn");
	end
end

function get_yue(nPage,nStep)
	local tSay = {}
	local nMaxRow = getn(tYue)
	local nNextPage = nPage + nStep
	
	if nNextPage > nMaxRow then
		nNextPage = nMaxRow
	end
	
	if nNextPage < 1 then
		nNextPage = 1
	end
	
	if nStep <= 0 then
		local nTemp = nPage
		nPage = nNextPage
		nNextPage = nTemp
	end
	
	for i=nPage,nNextPage do
		tinsert(tSay,format("Ta muèn mua 1 %s/#buy_yue(%d)",tYue[i][1],i))
	end
	
	if nNextPage < nMaxRow then
		tinsert(tSay,format("Xem trang sau/#get_yue(%d,%d)",nNextPage + 1,10))
	end
	if nPage > 1 then
		tinsert(tSay,format("Xem trang tr­íc/#get_yue(%d,%d)",nPage - 1,-10))
	end
	
	tinsert(tSay,"T¹i h¹ chØ ghÐ ngang!/end_dialogover")	
	Say("§ång ®¹o cÇn mua YÕu QuyÕt nµo?",getn(tSay),tSay)	
end

function buy_yue(nIndex)
	if CheckGoldCoin(1) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetItemCount(2,1,1020) < 1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 MËt Hµm S­ M«n ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < 1000000 then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(1,10, "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if DelItem(2, 1, 30094, 1) == 1 and DelItem(2,1,1020,1) ==1 and Pay(1000000) == 1  then
		local nRetCode, nItem = gf_AddItemEx(tYue[nIndex][2], tYue[nIndex][1]);
		if nRetCode == 1 then		
			Say("D¹ Th¶o: Chóc mõng c¸c h¹ nhËn ®­îc 1 "..tYue[nIndex][1],0)
			Msg2Player("B¹n nhËn ®­îc 1 "..tYue[nIndex][1])
			WriteLogEx("Hoat dong thang 8","D¹ Th¶o",1,tYue[nIndex][1]);
		end
	else
		WriteLogEx("Hoat dong thang 8","AddItem thÊt b¹i",1,tYue[nIndex][1]);
	end
end

function get_stone()
--	local nExtVal = GetExtPoint(EVENT_EXT)
--	local nExtBit = GetBit(nExtVal,STONE_BIT)	
--	if nExtBit  ~= 0 then
--		Say("D¹ Th¶o: C¸c h¹ ®· ®æi Thiªn Th¹ch Linh Th¹ch "..MAX_STONE_EXCHANGE.." lÇn råi, kh«ng thÓ ®æi thªm ®­îc n÷a!",0)
--		return
--	end 
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if CheckGoldCoin(5) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 5 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetItemCount(2,1,1001) < 3 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 3 Hßa ThÞ BÝch ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[1][3], tAwardItem[1][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if DelItem(2, 1, 30094, 5) == 1 and DelItem(2,1,1001,3) ==1 and Pay(MONEY_EXCHANGE) == 1  then
--		if AddExtPoint(EVENT_EXT,1) == 1 then
			AddEventItem(1,ITEM_TIME_LIMIT)
--		else
--			WriteLogEx("Hoat dong thang 8","Add Ext thÊt b¹i",tAwardItem[1][2][4],tAwardItem[1][1]);
--		end
	end
end

function get_weapon_fag()
--	local nTaskVal = GetTask(WEAPONFAG_TASKID)
--	if nTaskVal >= MAX_WEAPONFAG_EXCHANGE then
--		Say("D¹ Th¶o: C¸c h¹ ®· sö dông hÕt "..MAX_WEAPONFAG_EXCHANGE.." lÇn ®æi th­ëng, kh«ng thÓ ®æi thªm ®­îc n÷a!",0)
--		return
--	end
	
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
--	if GetPlayerRoute() == 0 then
--		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp m«n ph¸i!",0)
--		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
--		return
--	end
		
	if CheckGoldCoin(1) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nCheckWeapon = CheckWeapon()	
	if  nCheckWeapon ~= 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 "..tWeapon[nCheckWeapon][1].." ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetItemCount(2,1,1019) < 1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 S­ m«n t×nh nguyÖn th­ ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[2][3], tAwardItem[2][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if DelItem(2, 1, 30094, 1) == 1 and DelItem(2,1,1019,1) ==1 and Pay(MONEY_EXCHANGE) == 1 and DelWeapon() == 1 then
--		SetTask(WEAPONFAG_TASKID,GetTask(WEAPONFAG_TASKID) + 1)
		AddEventItem(2,0)		
	end		
end

function get_war_horse(nType)
--	local nExtVal = GetExtPoint(EVENT_EXT)
--	local nExtBit = GetBit(nExtVal,WARHORSE_BIT)	
--	if nExtBit  ~= 0 then
--		Say("D¹ Th¶o: C¸c h¹ ®· n©ng cÊp chiÕn m· "..MAX_WARHORSE_EXCHANGE.." lÇn råi!",0)
--		return
--	end 
	
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetPlayerRoute() ~= 17 and GetPlayerRoute() ~= 18  then
		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp D­¬ng M«n hÖ ph¸i!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if nType ~= 12 and nType ~= 13 then
		if CheckGoldCoin(1) == 0 then
			Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end
		
		if GetCash() < MONEY_EXCHANGE then
			Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end
		
		local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or nP ~= 34 then
			Say("D¹ Th¶o: Ph¶i trang bÞ B¹ch M· ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end
	else
		if GetItemCount(2,1,537) < 1 then
			Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 Tö Kim Hång Bao ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end	
	end	
	
	if nType == 12 then
		local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or (nP ~= 51 and nP~= 52) then
			Say("D¹ Th¶o: Ph¶i trang bÞ ChiÕn m· Nguyªn So¸i ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end
	end
	
	if nType == 13 then
		local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or nP ~= 38 then
			Say("D¹ Th¶o: Ph¶i trang bÞ L­u V©n Kú L©n Thó ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
	
	if nType ~= 12 and nType ~= 13 then
		if GetItemCount(0,105,34) < 1 then
			Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 B¹ch M· ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end
	elseif nType == 12 then
		if GetItemCount(0,105,51) <  1 and GetItemCount(0,105,52) < 1 then
			Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 ChiÕn m· Nguyªn So¸i ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end	
	elseif nType == 13 then
		if GetItemCount(0,105,38) <  1 then
			Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1  L­u V©n Kú L©n Thó ®Ó ®æi phÇn th­ëng!",0)
			Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
			return
		end	
	end

	if gf_Judge_Room_Weight(tAwardItem[3][3], tAwardItem[3][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if nType ~= 12 and nType ~= 13 then
		if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
			AddEventItem(nType ,nExpireTime)
		end	
	else
		if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,537,1) == 1 then
			AddEventItem(nType ,nExpireTime)
		end	
	end
end

function get_horse()
--	local nExtVal = GetExtPoint(EVENT_EXT)
--	local nExtBit = GetBit(nExtVal,HORSE_BIT)	
--	if nExtBit  ~= 0 then
--		Say("D¹ Th¶o: C¸c h¹ ®· n©ng cÊp chiÕn m· "..MAX_HORSE_EXCHANGE.." lÇn råi!",0)
--		return
--	end 
	
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp m«n ph¸i!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 11 then
		Say("D¹ Th¶o: Ph¶i trang bÞ Tr¶o Hoµng Phi §iÖn ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,11) <1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 Tr¶o Hoµng Phi §iÖn ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[4][3], tAwardItem[4][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
--		if AddExtPoint(EVENT_EXT,4) == 1 then
			AddEventItem(5,nExpireTime)
--		else
--			WriteLogEx("Hoat dong thang 8","Add Ext thÊt b¹i",tAwardItem[4][2][4],tAwardItem[4][1]);
--		end
	end
end

function get_new_horse()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp m«n ph¸i!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 12 then
		Say("D¹ Th¶o: Ph¶i trang bÞ Hèt L«i B¸c ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,12) <1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 Hèt L«i B¸c ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[6][3], tAwardItem[6][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(6,nExpireTime)
	end
end

function get_new_horse_1()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp m«n ph¸i!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 9 then
		Say("D¹ Th¶o: Ph¶i trang bÞ XÝch Thè ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,9) <1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 XÝch Thè ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[7][3], tAwardItem[7][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(7,nExpireTime)
	end
end

function get_new_horse_2()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp m«n ph¸i!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 13 then
		Say("D¹ Th¶o: Ph¶i trang bÞ Bé C¶nh ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,13) <1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 Bé C¶nh ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[8][3], tAwardItem[8][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(8,nExpireTime)
	end
end


function get_new_horse_3()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp m«n ph¸i!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 13 then
		Say("D¹ Th¶o: Ph¶i trang bÞ Bé C¶nh ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,13) <1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 Bé C¶nh ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[8][3], tAwardItem[8][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(9,nExpireTime)
	end
end

function get_new_horse_4()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ cÊp 70 ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D¹ Th¶o: C¸c h¹ ch­a gia nhËp m«n ph¸i!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if CheckGoldCoin(5) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 5 §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 13 then
		Say("D¹ Th¶o: Ph¶i trang bÞ Bé C¶nh ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,13) <1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ 1 Bé C¶nh ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[11][3], tAwardItem[11][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,5) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(11,nExpireTime)
	end
end

function get_item(nIndex)
--	if nIndex == 4 and GetTask(ITEM4_TASKID) >= 1 then
--		Say("D¹ Th¶o: C¸c h¹ ®· mua vËt phÉm nµy 1 lÇn. Kh«ng thÓ mua thªm.",0)
--		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
--		return
--	end
	
--	if nIndex == 5 and GetTask(ITEM5_TASKID) >= 1 then
--		Say("D¹ Th¶o: C¸c h¹ ®· mua vËt phÉm nµy 1 lÇn. Kh«ng thÓ mua thªm.",0)
--		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
--		return
--	end
	
	if CheckGoldCoin(tNewAwardItem[nIndex][6]) == 0 then
		Say("D¹ Th¶o: C¸c h¹ ch­a ®ñ sè §ång TiÒn Vµng ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if GetCash() < tNewAwardItem[nIndex][7] then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if gf_Judge_Room_Weight(tNewAwardItem[nIndex][3], tNewAwardItem[nIndex][4], "D¹ Th¶o") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end

	if DelItem(2, 1, 30094, tNewAwardItem[nIndex][6]) == 1 and Pay(tNewAwardItem[nIndex][7]) == 1  then
		AddNewEventItem(nIndex,tNewAwardItem[nIndex][8]*24*60*60)
	end
end

function AddEventItem(nIndex, nExpireTime)
	if nIndex ~= 12 and nIndex ~= 13 then
		local nRetCode, nItem = gf_AddItemEx(tAwardItem[nIndex][2], tAwardItem[nIndex][1]);
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
			Say("D¹ Th¶o: Chóc mõng c¸c h¹ nhËn ®­îc 1 "..tAwardItem[nIndex][1],0)		
			WriteLogEx("Hoat dong thang 8","D¹ Th¶o",tAwardItem[nIndex][2][4],tAwardItem[nIndex][1]);
		else
			WriteLogEx("Hoat dong thang 8","AddItem thÊt b¹i",tAwardItem[nIndex][2][4],tAwardItem[nIndex][1]);
		end
	elseif nIndex == 12 then
		local nRand = gf_GetRandItemByTable(tRewardHorseAttribute1,100,3)
		local nRetCode, nItem = AddItem(0, 105, 38, 1, 1, 1, 306, 6, 404, tRewardHorseAttribute1[nRand][3], tRewardHorseAttribute1[nRand][4])
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
			Say("D¹ Th¶o: Chóc mõng c¸c h¹ nhËn ®­îc 1L­u V©n Kú L©n Thó!",0)		
			WriteLogEx("Ngua Option","Hîp thµnh",1,tRewardHorseAttribute1[nRand][1]);
		else
			WriteLogEx("Ngua Option","ThÊt b¹i",1,tRewardHorseAttribute1[nRand][1]);
		end	
	elseif nIndex == 13 then
		local nRand = gf_GetRandItemByTable(tRewardHorseAttribute2,10000,1)
		local nRetCode, nItem = AddItem(0, 105, 38, 1, 1, 1, 306, 6, 404, tRewardHorseAttribute2[nRand][3], tRewardHorseAttribute2[nRand][4])
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
			Say("D¹ Th¶o: Chóc mõng c¸c h¹ nhËn ®­îc 1L­u V©n Kú L©n Thó!",0)		
			WriteLogEx("Ngua Option","Hîp thµnh",1,tRewardHorseAttribute2[nRand][1]);
		else
			WriteLogEx("Ngua Option","ThÊt b¹i",1,tRewardHorseAttribute2[nRand][1]);
		end
	end
end

function AddNewEventItem(nIndex, nExpireTime)
	nRetCodeAll = 1;
	for i = 1, tNewAwardItem[nIndex][2][4] do
		local nRetCode, nItem = 0,0;
		if nIndex ~= 11 then
			nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3], 1, tNewAwardItem[nIndex][2][5]);
		else
			if GetBody() == 1 or GetBody() == 2 then
				nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3] + GetBody() - 1, 1, tNewAwardItem[nIndex][2][5]);
			elseif GetBody() == 3 then
				nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3] + GetBody(), 1, tNewAwardItem[nIndex][2][5]);
			else
				nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3] + GetBody() - 2, 1, tNewAwardItem[nIndex][2][5]);
			end
		end
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
		else
			nRetCodeAll = 0;
		end
	end
	
	if nRetCodeAll == 1 then	
		Say("D¹ Th¶o: Chóc mõng c¸c h¹ nhËn ®­îc "..tNewAwardItem[nIndex][2][4].." "..tNewAwardItem[nIndex][1],0)
		Msg2Player("B¹n nhËn ®­îc "..tNewAwardItem[nIndex][2][4].." "..tNewAwardItem[nIndex][1])
		WriteLogEx("Hoat dong thang 8","D¹ Th¶o",tNewAwardItem[nIndex][2][4],tNewAwardItem[nIndex][1]);
--		if nIndex == 4  then
--			SetTask(ITEM4_TASKID, GetTask(ITEM4_TASKID) + 1);
--		end
--		if nIndex == 5  then
--			SetTask(ITEM5_TASKID, GetTask(ITEM5_TASKID) + 1);
--		end
	else
		WriteLogEx("Hoat dong thang 8","AddItem thÊt b¹i",tNewAwardItem[nIndex][2][4],tNewAwardItem[nIndex][1]);
	end
end

function get_soulstone()
	if gf_GetTaskByte(1538, 1) < 1 then
		Say("D¹ Th¶o: C¸c h¹ ch­a luyÖn thµnh Hîp T­íng Quy Nguyªn nªn kh«ng thÓ mua §Þnh Hån Thiªn Th¹ch!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn mua §Þnh Hån Thiªn Th¹ch")
		return
	elseif GetTask(2430) == 2 then
		Say("D¹ Th¶o: C¸c h¹ ®· mua §Þnh Hån Thiªn Th¹ch 2 lÇn råi, kh«ng thÓ mua tiÕp!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn mua §Þnh Hån Thiªn Th¹ch")
		return
	elseif GetItemCount(2, 1, 30094) < 4 then
		Say("D¹ Th¶o: C¸c h¹ ch­a cã ®ñ §ång TiÒn Vµng ®Ó mua!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn mua §Þnh Hån Thiªn Th¹ch")
		return
	elseif GetItemCount(2, 1, 3356) < 4 then
		Say("D¹ Th¶o: C¸c h¹ ch­a cã ®ñ Bao Thiªn Th¹ch Tinh Th¹ch ®Ó mua!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn mua §Þnh Hån Thiªn Th¹ch")
		return
	elseif GetItemCount(2, 1, 539) < 4 then
		Say("D¹ Th¶o: C¸c h¹ ch­a cã ®ñ Hoµng Kim §¹i Hång Bao ®Ó mua!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn mua §Þnh Hån Thiªn Th¹ch")
		return
	elseif GetItemCount(2, 1, 537) < 4 then
		Say("D¹ Th¶o: C¸c h¹ ch­a cã ®ñ Tö Kim Hång Bao ®Ó mua!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn mua §Þnh Hån Thiªn Th¹ch")
		return
	else
		if DelItem(2, 1, 30094, 4) == 1 and DelItem(2, 1, 3356, 4) == 1 and DelItem(2, 1, 539, 4) == 1 and DelItem(2, 1, 537, 4) == 1 then
			gf_AddItemEx2({2, 1, 1067, 1}, "§Þnh Hån Thiªn Th¹ch", "Hoat dong thang 5", "nhËn ®­îc", 15*24*60*60)
			local nGet = GetTask(2430)
			SetTask(2430, nGet + 1)
		end
	end
end

function get_transport()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead = "D¹ Th¶o: C¸c h¹ muèn mua vËt phÈm nµo:"
	
	tinsert(tbSayDialog, "Ta muèn mua ThÇn Hµnh B¶o §iÓn (1400 vµng)/#get_transport_scroll(1)")
	tinsert(tbSayDialog, "Ta muèn mua ThÇn Hµnh BÝ Phæ (160 vµng)/#get_transport_scroll(2)")
	tinsert(tbSayDialog, "Trë l¹i trang tr­íc/page1")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog)
end

function get_transport_scroll(nType)
	if GetLevel() < 10 then
		Talk(1,"",format("Ch­a ®ñ ®¼ng cÊp ®Ó mua %s!", TB_TRANSPORT_SCROLL[nType][2]))
		return
	end
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		Talk(1,"",format("Ch­a ph¶i lµ thÇn d©n b¶n quèc nªn kh«ng thÓ mua %s!",  TB_TRANSPORT_SCROLL[nType][2]))
		return
	end
	if GetCash() < TB_TRANSPORT_SCROLL[nType][3] then
		Talk(1,"",format("Kh«ng ®ñ tiÒn mua %s!", TB_TRANSPORT_SCROLL[nType][2]))
		return
	end
	if gf_Judge_Room_Weight(2, 200, "D¹ Th¶o") == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc qu¸ nÆng!")
		return
	end
	
	Pay(TB_TRANSPORT_SCROLL[nType][3])
	nRet, nItemIdx = gf_AddItemEx2(TB_TRANSPORT_SCROLL[nType][1],TB_TRANSPORT_SCROLL[nType][2], "Hoat dong thang 6 nam 2010", "D¹ Th¶o")
	if nRet == 1 then
		SetItemExpireTime(nItemIdx,TB_TRANSPORT_SCROLL[nType][4])
	end
end

function get_reindeer_2010()
	if GetCash() < MONEY_EXCHANGE then
		Say("D¹ Th¶o: Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
		
	local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Say("D¹ Th¶o: Ph¶i trang bÞ Phiªu Vò ®Ó ®æi phÇn th­ëng!",0)
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return
	end
	
	if gf_Judge_Room_Weight(2, 200, "D¹ Th¶o") == 0 then		
		Msg2Player("Hµnh trang kh«ng ®ñ chç chøa hoÆc qu¸ nÆng!")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx,-1) == 1 and Pay(MONEY_EXCHANGE) == 1  then
		local nRetCode, nItem = AddItem(0, 105, 35, 1, 4, -1, -1, -1, -1, -1, -1)
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			else
				SetItemExpireTime(nItem, 30 * 24 * 3600)
			end
			Say("D¹ Th¶o: Chóc mõng c¸c h¹ nhËn ®­îc TuÇn Léc!",0)
			WriteLogEx("Hoat dong thang 12 nam 2010", "®æi TuÇn Léc thµnh c«ng")
		else
			WriteLogEx("Hoat dong thang 12 nam 2010", "®æi TuÇn Léc thÊt b¹i")
		end
	end
end

function buy_elephant(nStep)
	local szNPC = "<color=green>D¹ Th¶o:<color> "
	local nTichluy = 200000
	local nXu = 2400
	local nHSD = 90
	local tSay = {}
	if nStep == 0 then
		tinsert(tSay, "Ta ®ång ý, h·y giao nã cho ta!/#buy_elephant(1)")
		tinsert(tSay, "T¹i h¹ tµi hÌn søc män, kh«ng ®ñ kh¶ n¨ng/end_dialogover")
		Say("§­a ta <color=yellow>" .. nTichluy .. "<color> tÝch lòy Tèng Liªu vµ <color=yellow>" .. nXu .. "<color> vËt phÈm xu, <color=green>ChiÕn T­îng Nguyªn So¸i<color> sÏ theo c¸c h¹ chinh chiÕn <color=red>" .. nHSD .. " ngµy<color>. C¸c h¹ ®ång ý chø?", getn(tSay), tSay)
		return 0
	end
	
	if nStep == 1 then
		if gf_Judge_Room_Weight(1, 10) == 0 then
			Talk(1,"", szNPC .. "Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
			return 0
		end
		if GetTask(707) < nTichluy then
			Talk(1,"", szNPC .. "§iÓm tÝch lòy kh«ng ®ñ, c¸c h¹ quay l¹i sau nhÐ.")
			return 0
		end
		if GetItemCount(2,1,30230) < nXu then
			Talk(1,"", szNPC .. "Kh«ng ®ñ vËt phÈm xu, hay lµ c¸c h¹ quªn mang theo?.")
			return 0
		end
	
		LIB_Award.szLogTitle = "CHIEN TUONG"
		LIB_Award.szLogAction = "mua"
		local tbAward = {item = {{gdp = {0,105,30033,1,1,-1,-1,-1,-1,-1,-1,-1}, nExpired = (nHSD*24*60*60), name = "ChiÕn T­îng Nguyªn So¸i"}}}
		
		if DelItem(2,1,30230,nXu) == 1 and GetTask(707) >= nTichluy then
			SetTask(707, GetTask(707) - nTichluy)
			LIB_Award:Award(tbAward)
			Talk(1,"",szNPC .. "ChiÕn T­îng Nguyªn So¸i ®· theo c¸c h¹.")
		end
		return 0
	end
end


function change_elephant()
	PutinItemBox("§æi ChiÕn T­îng" ,1 , "ChiÕn T­îng nµy ch¹y kh«ng nhanh, ta muèn ®æi ChiÕn T­îng Nguyªn So¸i kh¸c!", CHIENTUONG_FILE, 1)
end

function end_dialogover()
end