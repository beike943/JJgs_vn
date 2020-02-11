-- Ô½Ò°Èü½éÉÜNPC
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\crosscountry\\quarter_final.lua")

YY_FILE = new(KTabFile, "\\script\\online\\crosscountry\\intro_setting.txt")

-- ¼ì²âÕËºÅÊÇ·ñÎª4ÌìÇ°´´½¨µÄ£¬2006ÄêÄÚÓĞĞ§
function chktime()
	-- Time in seconds since UTC 1/1/70
	local nBaseTimeGmt = 1150387200			-- 2006.6.16 00:00:00
	
	--nBaseTimeGmtµÄÔÂÈÕÊ±·ÖÃë
	local nBaseDay = 167					-- 2006.6.16 ÈÕÊÇÒ»ÄêÖĞµÄµÚ167Ìì
	
	local nCurDay = tonumber(date("%j"))
	local nCurHour = tonumber(date("%H"))
	local nCurMin = tonumber(date("%M"))
	local nCurSec = tonumber(date("%S"))
	
	-- ¼ÆËãÏÖÔÚºÍ nBaseTimeGmt Ö®¼ä²îÁË¶àÉÙÃë
	local nDeffNowSec = nCurSec + nCurMin * 60 + nCurHour * 3600 + (nCurDay - nBaseDay) * 86400
	local n4DaySec = 345600					-- 4ÌìÓĞ¶àÉÙÃë
	
	local nCreateTime = GetCreateTime()
	-- ¼ÆËã´´½¨ÕËºÅµÄÊ±¼äºÍBaseTimtGmt²îÁË¶àÉÙÃë
	local nDeffCreateSec = nCreateTime - nBaseTimeGmt
	
	if nDeffNowSec - nDeffCreateSec > n4DaySec then
		return 1
	else
		return 0
	end
end

function main()
	if YY_FILE:getRow() > 0 then
		main_yes()
	else
		main_no()
	end
end

function main_yes()		-- ÊÇÔ½Ò°ÈüµÄÇø·ş
	local szSay = "TrËn b¸n kÕt thi ®Êu ViÖt D· ®· kÕt thóc<color=yellow><color>. Chung kÕt sÏ diÔn ra vµo tr­a 28/7 sau khi server b¶o tr× ®Õn khi server thi ®Êu b¾t ®Çu, kĞo dµi ®Õn 30/7 tr­íc khi server thi ®Êu b¶o tr×. Chi tiÕt xin xem trang chñ"
	Say(szSay, 0)
--	local t = 
--	{
--		--"ÁË½âÔ¤ÈüÏêÏ¸Çé¿ö/game_info_yu",
--		"ÁË½â³¬¼¶Íæ¼ÒÔ½Ò°Èü/game_info_yes",
--		"ÁìÈ¡Ô½Ò°ÈüÔ¤Èü½±Àø/get_award_yu",
--		"¸´ÈüÕ½¶ÓÏà¹Ø²Ù×÷/qf_team_operation",
--		"ÁìÈ¡¸´Èü¹ÄÀøÆ·²¢»ã×Ü¸´Èü»ı·Ö/qf_get_award",
--		"²é¿´Õ½¶ÓÅÅĞĞ/qf_rank",
--		--"¸´Èü»ı·Ö»ã×Ü/quarter_final_point_collect",
--		"Àë¿ª/end_say",
--	}
--	Say(szSay, getn(t), t)
end

function game_info_yes()	--¸ÃÇø·şÎªÔ½Ò°Èü¿ªÈüÇø·ş
	local szSay = "Thi ®Êu ViÖt d· siªu cÊp<color=yellow>HiÖn t¹i ®· vµo vßng ®Êu lo¹i<color>, nhÊn vµo c¸c h¹ng môc d­íi ®©y ®Ó xem ch­¬ng tr×nh thi ®Êu, chi tiÕt xin xem trang chñ"
	local t=
	{
		"Giai ®o¹n 1: b¸o danh/sign_info",
		"\nGiai ®o¹n 2: vßng lo¹i\n\n/game_info_yu",
		"Giai ®o¹n 3: B¸n kÕt/game_info2",
		"Giai ®o¹n 4: chung kÕt/game_info3",
		"Tin tøc kh¸c./game_info4",
		"Rêi khái/end_say",
	}
	Say(szSay, getn(t), t)
end

function game_info_yu()
	local szSay = "Thêi gian thi ®Êu: sau ®ît b¶o tr×, ng­êi ch¬i h·y ®¨ng nhËp vµo server chØ ®Şnh tiÕn hµnh thi ®Êu kĞo dµi ®Õn tr­íc ®ît b¶o tr× lÇn sau\n §iÒu kiÖn tham dù: tÊt c¶ ng­êi ch¬i nhËn ®­îc tµi kho¶n thi ®Êu vµ ®iÒn ®Çy ®ñ nh÷ng th«ng tin c¸ nh©n \nH×nh thøc b¸o danh: a. nhËn lÊy tµi kho¶n thi ®Êu tõ c¸c tiÖm net, c¸c tr­êng ®¹i häc, c¸c chi nh¸nh cña VNG b.vµo trang web chİnh thøc nhËn lÊy tµi kho¶n thi ®Êu \n H×nh thøc thi ®Êu: t¨ng cÊp \n Chó ı: ng­êi ch¬i tham gia thi ®Êu kh«ng ph¶i ë c¸c server chØ ®Şnh th× sÏ kh«ng ®­îc tİnh.\n b¶n update trß ch¬i: ph¶i lµ b¶n míi nhÊt\n khu vùc tham gia: bÊt cø n¬i nµo (tiÖm net, tr­êng ®¹i häc, gia ®×nh vv...)"
	Say(szSay, 2, "TiÕp tôc t×m hiÓu (server chØ ®Şnh)/game_info_yu_svr", "Rêi khái/end_say")
end

function game_info_yu_svr()
	local szSay = "Côm server §iÖn Tİn trËn 1: V©n Nam, Quı Ch©u, Tø Xuyªn, T©y T¹ng, ThiÓm T©y, Cam Tóc, T©n C­¬ng\n Côm server §iÖn Tİn trËn 2: Hå B¾c, Giang T©y, ChiÕt Giang, Th­îng H¶i, Giang T«, An Huy \n Côm server §iÖn Tİn trËn 3: Hå Nam, Phóc KiÕn, Qu¶ng §«ng, Qu¶ng T©y, H¶i Nam\n\n Côm server viÔn th«ng trËn 1: B¾c Kinh, Thiªn T©n, S¬n T©y, S¬n §«ng, T©n C­¬ng, Hµ Nam, Hµ B¾c\n Côm server ViÔn Th«ng trËn 2: Liªu Ninh, C¸t L©m, H¾c Long Giang, Néi M«ng, Thanh H¶i."
	Say(szSay, 2, "TiÕp tôc t×m hiÓu quy t¾c./game_info_yu_guize", "Rêi khái/end_say")
end

function game_info_yu_guize()
	local szSay = "1. Nghiªm cÊm sö dông auto hoÆc lîi dông lçi game (BUG), nÕu ph¸t hiÖn sÏ hñy bá t­ c¸ch thi ®Êu\n2. Sau khi thi ®Êu kÕt thóc, chóng t«i sÏ chän ra nh÷ng nh©n vËt cã ®¼ng cÊp cao nhÊt trong server thi ®Êu ®Ó trao th­ëng (vİ dô: mét tµi kho¶n cã 3 nh©n vËt cÊp 12, cÊp 60, cÊp 47, chóng t«i sÏ chän nh©n vËt cÊp 60 tiÕn hµnh xÕp h¹ng)\n3.Sau khi server thi ®Êu më ra, ng­êi ch¬i ph¶i tù t¹o nh©n vËt míi, tªn, chän h×nh t­îng, m«n ph¸i\n4.Trong khi thi ®Êu, cã thÓ nhê ng­êi kh¸c trî gióp\n5.Mèc ®¼ng cÊp lµ 30\n6. Ngµy cuéc thi t¨ng cÊp kÕt thóc sÏ chiÕu theo ®¼ng cÊp nh©n vËt h«m ®ã tiÕn hµnh xĞt chän qu¸n qu©n m«n ph¸i vµ tæng qu¸n qu©n cho vßng lo¹i (nÕu ®¼ng cÊp b»ng nhau sÏ so s¸nh trŞ kinh nghiÖm, nÕu vÉn b»ng nhau sÏ so s¸nh ®iÓm danh väng)"
	Say(szSay, 2, "Tra xem phÇn th­ëng./game_info_yu_award", "Rêi khái/end_say")
end

function game_info_yu_award()
	local szSay = "1. BÊt kú nh©n vËt nµo trong tµi kho¶n thi ®Êu ®¹t ®Õn cÊp 30 vµ thêi gian t¹o nh©n vËt İt nhÊt 4 ngµy, ®Òu cã thÓ nhËn lÊy phÇn th­ëng: (1)1 ngùa hång m· hay hoµng m· cÊp 30; (2)1 trang bŞ s­ m«n cÊp 40; (3) thİ luyÖn qu¶ tõ 1- 3 viªn ; (4) 5 Thiªn th¹ch. Thêi gian nhËn th­ëng: tõ vßng lo¹i ngµy 16/06 ®Õn trËn b¸n kÕt ngµy 25/07, ®Şa ®iÓm nhËn th­ëng: Sø gi¶ viÖt d· ë ba ®¹i thµnh thŞ\n2.Gi¶i nhÊt giµnh cho ng­êi ch¬i ®¹t ®¼ng cÊp cao nhÊt cña 7 m«n ph¸i tÊt c¶ server thi ®Êu lµ 1 MP3 trŞ gi¸ 500 NDT\n3.Tæng qu¸n qu©n toµn server thi ®Êu lµ 1 bé card mµn h×nh trŞ gi¸ 1000 NDT\nKh«ng thÓ nhËn cïng lóc 2,3 gi¶i th­ëng."
	Say(szSay, 2, "trë l¹i/game_info_yes", "Rêi khái/end_say")
end

function get_award_yu()
	local nRoute = GetPlayerRoute()
	if GetLevel() < 30 then
		Talk(1, "", "Xin lçi, nh©n vËt trªn 30 cÊp míi cã thÓ nhËn th­ëng.")
		return
	elseif nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or
		nRoute == 13 or nRoute == 16 or nRoute == 19 or nRoute > 21 then
		Talk(1,"","Xin lçi, h·y gia nhËp tr­êng ph¸i råi quay l¹i nhËn th­ëng.")
		return 0
	elseif chktime() == 0 then
		Talk(1, "", "Xin lçi, thêi gian t¹o nh©n vËt İt nhÊt 4 ngµy míi cã thÓ nhËn lÊy phÇn th­ëng")
		return
	elseif GetTask(1785) == 1 then
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nµy råi.")
		return
	elseif GetTask(1785) == 0 then
		Talk(1, "", "Xin lçi, chØ cã ng­êi ch¬i ®¹t ®iÒu kiÖn nhËn th­ëng ë vßng lo¹i vµ ch­a nhËn míi cã thÓ nhËn th­ëng.")
		return
	elseif GetTask(1785) == 2 then
		Say("PhÇn th­ëng vßng lo¹i bao gåm:\n(1)1 con ngùa hång m· hay hoµng m· cÊp 30\n(2)1 trang bŞ s­ m«n cÊp 40\n(3) thİ luyÖn qu¶ tõ 1 - 3 viªn\n(4) 5 miÕng Thiªn th¹ch\n\n<color=yellow>Khi nhËn th­ëng, h·y s¾p xÕp hµnh trang l¹i<color>", 2, "NhËn lÊy phÇn th­ëng./get_award_yu_yes", "Th«i! LÇn sau ®i!/end_say")
	end
end

function get_award_yu_yes()
	if chktime() == 0 or GetTask(1785) ~= 2 or GetLevel() < 30 then
		return
	end
	SetTask(1785, 1)

	local nRet = 0
	if random(10000) >= 5000 then
		nRet = AddItem(0, 105, 1, 1, 1, -1, -1, -1, -1, -1, -1)		--ºì
	else
		nRet = AddItem(0, 105, 2, 1, 1, -1, -1, -1, -1, -1, -1)		--»Æ
	end
	if nRet ~= 1 then
		WriteLog("[Thi ®Êu viÖt d·]lçi: ngùa cÊp 30 vÉn ch­a ph©n ph¸t;"..GetAccount().." : "..GetName())
	end
	-- ¸øĞÂÊÖÌ××°
	local nType = random(1, 3)			-- ¸øÎäÆ÷/¿ã×Ó/Ã±×Ó/ÒÂ·ş
	if nType == 1 then
		nRet = GiveWeapon()
	else
		nRet = GiveEquip(nType)
	end
	if nRet ~= 1 then
		WriteLog("[Thi ®Êu viÖt d·]lçi: Trang bŞ s­ m«n vÉn ch­a ph©n ph¸t;"..GetAccount().." : "..GetName())
	end
	
	local nCount = mod(random(1, 100000), 3) + 1
	nRet = AddItem(2, 0, 392, nCount, 1)
	if nRet ~= 1 then
		WriteLog("[Thi ®Êu viÖt d·]lçi: Thİ luyÖn qu¶ vÉn ch­a ph©n ph¸t;"..GetAccount().." : "..GetName())
	end
	
	nRet = AddItem(2, 2, 8, 5, 1)
	if nRet ~= 1 then
		WriteLog("[Thi ®Êu viÖt d·]lçi: Thiªn th¹ch vÉn ch­a ph©n ph¸t;"..GetAccount().." : "..GetName())
	end
end

function GiveWeapon()
	local nBody = GetBody()
    local nRoute = GetPlayerRoute()
	local nRet = 0
	local nRetEx = 1

	if nRoute == 2 then
		nRet = AddItem(0, 3, 201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
		nRetEx = AddItem(0, 5, 201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 3 then
		nRet = AddItem(0, 8, 301 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 4 then
		nRet = AddItem(0, 0, 401 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 6 then
		nRet = AddItem(0, 1, 601 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 8 then
		nRet = AddItem(0, 2, 801 + nBody - 3, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 9 then
		nRet = AddItem(0, 10, 901 + nBody - 3, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 11 then
		nRet = AddItem(0, 0, 1101 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 12 then
		nRet = AddItem(0, 5, 1201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 14 then
		nRet = AddItem(0, 2, 1401 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 15 then
		nRet = AddItem(0, 9, 1501 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 17 then
		nRet = AddItem(0, 6, 1701 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 18 then
		nRet = AddItem(0, 4, 1801 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 20 then
		nRet = AddItem(0, 7, 2001 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 21 then
		nRet = AddItem(0, 11, 2101 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	end
	
	if nRet == 1 and nRetEx == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 mãn vò khİ.")
		return 1
	else
		return 0
	end
end

function GiveEquip(nType)
	local nBody = GetBody()
    local nRoute = GetPlayerRoute()
	local nRet = 0
	--¿ã×Ó/Ã±×Ó/ÒÂ·ş
	local tType =
	{
		[2] = 101,
		[3] = 103,
		[4] = 100,
	}
	local nParticular = 0
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or
		nRoute == 13 or nRoute == 16 or nRoute == 19 or nRoute > 21 then
		return 0
	elseif nRoute == 8 or nRoute == 9 then
		nParticular = nRoute * 100 + nBody - 2
	else
		nParticular = nRoute * 100 + nBody
	end
	
	nRet = AddItem(0, tType[nType], nParticular, 1, 1, -1,-1,-1,-1,-1,-1)
	if nRet == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 mãn trang bŞ.")
		return 1
	else
		return 0
	end
end


-------------------------------------------------------------------------------------------


function main_no()		-- ²»ÊÇÔ½Ò°ÈüµÄÇø·ş
	local szSay = "Cuéc thi ViÖt d· viÖt vâ hiÖp 2007 ®· chİnh thøc khëi ®éng!"
	local t =
	{
		"T×m hiÓu cuéc thi t¨ng cÊp./game_info",
		"Rêi khái/end_say",
	}
	Say(szSay, getn(t), t)
end

function game_info()

	local szSay = "Cuéc thi ViÖt d· viÖt vâ hiÖp 2007 ®· chİnh thøc khëi ®éng!"
	local t=
	{
		"Giai ®o¹n 1: b¸o danh/sign_info",
		"\nGiai ®o¹n 2: vßng lo¹i\n\n/game_info1",
		"Giai ®o¹n 3: B¸n kÕt/game_info2",
		"Giai ®o¹n 4: chung kÕt/game_info3",
		"Tin tøc kh¸c./game_info4",
		"Rêi khái/end_say"
	}
	Say(szSay, getn(t), t)
end

function sign_info()
	Say("Cuéc thi ViÖt d· viÖt vâ hiÖp 2007 ®· chİnh thøc khëi ®éng!", 2, "trë l¹i/game_info", "Rêi khái/end_say")
end

function game_info1()
	Say("Cuéc thi ViÖt d· viÖt vâ hiÖp 2007 ®· chİnh thøc khëi ®éng!", 2, "trë l¹i/game_info", "Rêi khái/end_say")
end

function game_info2()
	Say("Cuéc thi ViÖt d· viÖt vâ hiÖp 2007 ®· chİnh thøc khëi ®éng!", 2, "trë l¹i/game_info", "Rêi khái/end_say")
end

function game_info3()
	Say("Cuéc thi ViÖt d· viÖt vâ hiÖp 2007 ®· chİnh thøc khëi ®éng!", 2, "trë l¹i/game_info", "Rêi khái/end_say")
end

function game_info4()
	Say("C¸c côm server thi ®Êu vßng lo¹i, vßng b¸n kÕt cuéc thi t¨ng cÊp còng cho nh÷ng ng­êi ch¬i b×nh th­êng t¹o nh©n vËt, sau khi cuéc thi kÕt thóc c¸c server thi ®Êu sÏ vËn hµnh b×nh th­êng nh­ c¸c server cò. Sau khi thi ®Êu kÕt thóc, tÊt c¶ tin tøc cña ng­êi ch¬i thi ®Êu sÏ ®­îc b¶o l­u tr¹ng th¸i, ng­êi ch¬i cã thÓ tiÕp tôc sö dông tµi kho¶n nµy ®Ó ®¨ng nhËp vµo trß ch¬i.", 2, "trë l¹i/game_info", "Rêi khái/end_say")
end

function end_say()

end
