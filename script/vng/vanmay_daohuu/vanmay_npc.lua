Include("\\script\\lib\\globalfunctions.lua");

tVanMay_change = {
		[1] = { --20 l­ît ®Çu tiªn
					[1] = {1000,100,100},
					[2] = {1000,101,101},
					[3] = {1000,102,102},
					[4] = {1000,103,103},
					[5] = {1000,104,104},
					[6] = {1000,105,105},
					[7] = {1000,106,106},
					[8] = {1000,107,107},
					[9] = {1000,108,108},
					[10] = {1000,109,109},
			},
		[2] = { --l­ît 21 - 40
					[1] = {1000,100,100},
					[2] = {1000,105,105},
					[3] = {1000,110,110},
					[4] = {1000,111,111},
					[5] = {1000,113,113},
					[6] = {1000,114,114},
					[7] = {1000,115,115},
					[8] = {1000,111,120},
					[9] = {1000,111,130},
					[10] = {1000,120,140},
			},		
		[3] = { --l­ît 41 - 100
					[1] = {2000,100,100},
					[2] = {2000,111,111},
					[3] = {2000,110,130},
					[4] = {2000,120,150},
					[5] = {2000,130,150},
				},		
		[4] = { --l­ît 101 trë ®i
					[1] = {3900,100,100},
					[2] = {1100,105,105},
					[3] = {1100,107,107},
					[4] = {600,111,130},
					[5] = {600,131,150},
					[6] = {600,151,170},
					[7] = {600,171,190},
					[8] = {300,191,191},
					[9] = {300,192,192},
					[10] = {300,193,193},
					[11] = {300,195,195},
					[12] = {100,200,220},
					[13] = {100,221,240},
					[14] = {50,245,245},
					[15] = {50,250,250},
			},					
	}
	
function main()
	Talk(1, "", "Ta ®ang chuÈn bÞ lªn ®­êng ®Ó tÇm s­ häc ®¹o, ®¹i hiÖp h·y quay l¹i sau nha !!!!")
	do return end
	
	local nDate = tonumber(date("%Y%m%d"))
--	if nDate > 20130421 then
--		return 0
--	end
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	Talk(1, "",  "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\n §¹i hiÖp cã muèn ta xem thªm 1 quÎ kh¸c kh«ng ???? 	")		
	local tbSayDialog = {};
	local nSaySize = 0;
	local szName = "ThÇy Bãi Siªu H¹ng"	
	local szHeader = "<color=green>"..szName.." :<color> Mçi ngµy mçi ng­êi ®Òu mang 1 vËn mÖnh kh¸c nhau, cã lóc may m¾n, cã lóc kh«ng may, mäi chuyÖn ®Òu do ý trêi vµ c¬ duyªn. C«ng thøc tÝnh ®iÓm kinh nghiÖm khi cã ®iÓm vËn may: §iÓm KN + [(®iÓm vËn may - 100)/100 x §iÓm KN].\n§iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm. §¹i hiÖp cã muèn ta xem thªm 1 quÎ kh¸c kh«ng ???? "

	tinsert(tbSayDialog, "Xem vËn may h«m nay cña ta/vanmay_show")
	if nDate > 20130423 then
		tinsert(tbSayDialog, "Gi¶i vËn xui (tiªu hao 2 vµng sÏ cã ®iÓm vËn may ngÉu nhiªn tõ 100 ®Õn 250)/vanmay_change")		--vanmay_list
	end
	tinsert(tbSayDialog, "Ta chØ ghÐ qua/do_nothing")	

	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
end
function vanmay_show()
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	local szName = "ThÇy Bãi Siªu H¹ng"		
	if nPointVM <= 96 then
		Talk(1, "", "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nH«m nay kh«ng ph¶i lµ ngµy may m¾n ®Ó lµm mäi viÖc, ®¸nh ®©u thua ®ã, lµm ¨n thÊt b¸t. Ph¶i bãi 1 quÎ ®Ó gi¶i vËn th«i")
	elseif nPointVM == 250 then
		Talk(1, "",  "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nH«m nay lµ ngµy §¹i C¸t ®Ó lµm mäi viÖc, ®¸nh ®©u th¾ng ®ã, ph¶i tham gia c¸c ho¹t ®éng ngay míi ®­îc. NiÒm vui ®­îc nh©n ®«i.")
	else
		Talk(1, "", "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nMét ngµy nh­ mäi ngµy, lao ®éng nhiÒu th× niÒm vui ®Õn nhiÒu. §¹i hiÖp cã thÓ thö bãi 1 quÎ ®Ó gi¶i vËn.")
	end	
end
function vanmay_list()
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	if nPointVM == 250 then
		Talk(1, "", "<color=green>ThÇy Bãi Siªu H¹ng<color>: §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm nªn kh«ng cÇn ph¶i gi¶i vËn xui ®©u.\nH«m nay lµ ngµy §¹i C¸t ®Ó lµm mäi viÖc, ®¸nh ®©u th¾ng ®ã, ph¶i tham gia c¸c ho¹t ®éng ngay míi ®­îc. NiÒm vui ®­îc nh©n ®«i..")
		return
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szName = "ThÇy Bãi Siªu H¹ng"	
	local szHeader = "<color=green>"..szName.." :<color> Thay ®æi vËn mÖnh ®Ó ®¹t ®­îc nhiÒu thµnh tùu trong Vâ L©m"

--	tinsert(tbSayDialog, "VËn khÝ b×nh b×nh (tèn1 xu vËt phÈm, ®iÓm vËn may ngÉu nhiªn tõ 101 ®Õn 120)/#vanmay_change(1)")
--	tinsert(tbSayDialog, "Phóc Tinh Cao ChiÕu (tèn 6 xu vËt phÈm, ®iÓm vËn may ngÉu nhiªn tõ 110 ®Õn 124)/#vanmay_change(2)")
--	tinsert(tbSayDialog, "V­¬ng NguyÖt Chóc Thä (tèn 9 xu vËt phÈm, ®iÓm vËn may ngÉu nhiªn tõ 125 ®Õn 139)/#vanmay_change(3)")
--	tinsert(tbSayDialog, "Th¸i D­¬ng TÒ T©m (tèn 39 xu vËt phÈm, ®iÓm vËn may ngÉu nhiªn tõ 140 ®Õn 175)/#vanmay_change(4)")
--	tinsert(tbSayDialog, "Thiªn §Þa §ång ThuËn (tèn 79 xu vËt phÈm, ®iÓm vËn may ngÉu nhiªn tõ 176 ®Õn 199)/#vanmay_change(5)")			
--	tinsert(tbSayDialog, "Phóc Nh­ §«ng H¶i (tèn 179 vËt phÈm xu, ®iÓm vËn may ®¹t tèi ®a 200 ®iÓm)/#vanmay_change(6)")	
	tinsert(tbSayDialog, "Gi¶i vËn xui (tèn 2 vµng sÏ cã ®iÓm vËn may ngÉu nhiªn tõ 100 ®Õn 250)/vanmay_change")
--	tinsert(tbSayDialog, "Phóc Nh­ §«ng H¶i (tèn 11 vËt phÈm xu, ®iÓm vËn may ®¹t tèi ®a 250 ®iÓm)/#vanmay_change(2)")		
	tinsert(tbSayDialog, "Ta chØ ghÐ qua/do_nothing")	
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)			
end


function vanmay_change()
	--local tbItem = {1, 6, 9, 39, 79, 179}
	local tbItem = {1, 11}
	local szName = "ThÇy Bãi Siªu H¹ng"
	local nPointVM = 0
	if GetCash() < 20000 then
		Talk(1, "", "<color=green>"..szName.."<color>: §¹i hiÖp kh«ng ®ñ 2 vµng ®Ó thay ®æi vËn mÖnh.");
		return
	end
	Pay(20000)

--	if nType == 2 then --gi¸ trÞ 250 ®iÓm vËn may
--		gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, 250)
--		nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		Talk(1, "",  "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nH«m nay lµ ngµy §¹i C¸t ®Ó lµm mäi viÖc, ®¸nh ®©u th¾ng ®ã, ph¶i tham gia c¸c ho¹t ®éng ngay míi ®­îc. NiÒm vui ®­îc nh©n ®«i.")	
--	else
	local nRan_table = 1
	local nTime_first = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_TIME_VM)	--sè lÇn thay ®æi vËn may
	if nTime_first < 105 then
		gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_TIME_VM, nTime_first + 1) --sè lÇn thay ®æi vËn may
	end
	local nTime_second = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_TIME_VM)
	if nTime_second > 100 then
		nRan_table = 4
	elseif nTime_second > 40 and nTime_second < 101 then
		nRan_table = 3
	elseif nTime_second > 20 and nTime_second < 41 then
		nRan_table = 2
	else
		nRan_table = 1
	end
	
	local nRan_vanmay_change = get_random_vanmay(tVanMay_change[nRan_table], 10000, 1)
	local nRan_vanmay_finish = random(tVanMay_change[nRan_table][nRan_vanmay_change][2], tVanMay_change[nRan_table][nRan_vanmay_change][3])
	
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, nRan_vanmay_finish)
--	nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	Talk(1, "",  "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\n §¹i hiÖp cã muèn ta xem thªm 1 quÎ kh¸c kh«ng ???? 	")		
	--Msg2Player("LÇn thay ®æi vËn may thø: "..nTime_second)		
	--Msg2Player("B¶ng phÇn th­ëng thø: "..nRan_table)	

--	end
	gf_WriteLogEx("VAN MAY DAO HUU","®æi thµnh c«ng", 1, "§æi ®iÓm vËn may b»ng vµng")
	main()
end

-- VËn may ®¹o h÷u
function vanmay_daohuu()
	----®ãng vËn may ph¶i set ®iÓm vËn may vÒ 100
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, 100)
	do return end
	-----
 	local nFlag = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY)	
 	if nFlag == 1 then
 		return
 	end
	local tVanMay = { 
				[1] = {13000,50},
				[2] = {13000,69},
				[3] = {13000,75},
				[4] = {13000,88},
				[5] = {13000,96},
				[6] = {8550,100},
				[7] = {5750,103},
				[8] = {6000,106},
				[9] = {6000,110},
				[10] = {6000,113},
				[11] = {500,115},
				[12] = {500,120},
				[13] = {500,122},
				[14] = {300,130},
				[15] = {300,133},
				[16] = {300,140},
				[17] = {150,143},
				[18] = {101,150},
				[19] = {10,160},
				[20] = {10,170},
				[21] = {10,180},
				[22] = {10,190},
				[23] = {5,200},
				[24] = {3,222},
				[25] = {1,250},
			}
	local nRan_vanmay = get_random_vanmay(tVanMay, 100000, 1)
	local nPoint = tVanMay[nRan_vanmay][2]
	--Msg2Player("Gia tri Random: "..nRan_vanmay)
	--Msg2Player("Diem VM: "..nPoint)
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, nPoint)
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY, 1)	
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	gf_WriteLogEx("VAN MAY DAO HUU","nhËn thµnh c«ng", 1, "NhËn ®iÓm vËn may")
	--Msg2Player("Diem VM 1 = Diem VM: "..nPointVM)	--------------------------------------------------------------------------
	local szName = "VËn May §¹o H÷u"

	local tbSayDialog = {};
	local nSaySize = 0;
	local szHeader = ""
	if nPointVM <= 96 then
		szHeader = "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nH«m nay kh«ng ph¶i lµ ngµy may m¾n ®Ó lµm mäi viÖc, ®¸nh ®©u thua ®ã, lµm ¨n thÊt b¸t. Ph¶i ®i t×m ThÇy Bãi Siªu H¹ng ®Ó gi¶i vËn xui míi ®­îc."
		tinsert(tbSayDialog, "§i ®Õn ThÇy Bãi Siªu H¹ng gi¶i vËn/goThayBoi")
	elseif nPointVM == 250 then
		szHeader = "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nH«m nay lµ ngµy §¹i C¸t ®Ó lµm mäi viÖc, ®¸nh ®©u th¾ng ®ã, ph¶i tham gia c¸c ho¹t ®éng ngay míi ®­îc. NiÒm vui ®­îc nh©n ®«i."
	else
		szHeader = "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nMét ngµy nh­ mäi ngµy, lao ®éng nhiÒu th× niÒm vui ®Õn nhiÒu.Hay lµ ®Õn gËp ThÇy Bãi Siªu H¹ng ®Ó xem thö 1 quÎ coi nh­ thÕ nµo. BiÕt ®©u ThÇn Tµi l¹i mØm c­êi víi m×nh."
		tinsert(tbSayDialog, "§i ®Õn ThÇy Bãi Siªu H¹ng gi¶i vËn/goThayBoi")
	end
	tinsert(tbSayDialog, "Ta lu«n thuËn theo tù nhiªn/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
end	
function goThayBoi()
	NewWorld(100,1274,2960)
end	
function get_random_vanmay(tVanMay, nMaxPE, nDefault)
	local nPos = 0;
	local nRand = random(1, nMaxPE);
	for i = 1, getn(tVanMay) do
		if nRand > nPos and nRand <= nPos + tVanMay[i][1] then
			return i;
		end
		nPos = nPos + tVanMay[i][1];
	end
	return nDefault;
end

function vanmay_daohuu_denbu()
	local szName = "VËn May §¹o H÷u"
	local nFlag = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY)	
 	if nFlag == 1 then
 		return
 	end
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, 150)
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY, 1)	
	Talk(1, "",  "<color=green>"..szName.." :<color> §iÓm may m¾n h«m nay cña ®¹i hiÖp lµ <color=green>"..nPointVM.."<color> ®iÓm.\nH«m nay lµ ngµy §¹i C¸t ®Ó lµm mäi viÖc, ®¸nh ®©u th¾ng ®ã, ph¶i tham gia c¸c ho¹t ®éng ngay míi ®­îc.")	

end

function do_nothing()

end