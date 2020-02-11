-- ¹¥³ÇÕ½³ÇÊÐ¹ÜÀíNPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\city_manage\\manage_head.lua")
Include("\\script\\lib\\writelog.lua");

function get_tong_sex_name()
	local sex_name = ""
	if GetSex() == 1 then
		sex_name = "Thµnh Chñ"
	else
		sex_name = "QuËn Chóa "
	end
	return sex_name
end

function deal_abnormal()
	-- È¥RelayÉÏ¿´¿´ÓÐÃ»ÓÐ
	local nMapID = GetWorldPos()
	ApplyRelayShareData("_TongCityWar", 0, nMapID, "\\script\\gongcheng\\city_manage\\manage_npc.lua", "cb_citywar")
end

function cb_citywar(szKey, nKey1, nKey2, nCount)
	if szKey == "_TongCityWar" then
		-- RelayÉÏÓÐÊý¾ÝµÄ,ÄÇÃ´¾ÍÖ±½Ó¹¹½¨³ÇÊÐÐÅÏ¢°É
		BuildCityWarData(szKey, nKey1, nKey2)
		main()
	else
		-- RelayÉÏÃ»ÓÐÁË¾ÍÕæµÄÃ»ÓÐÁË
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 
			3, 
			"Giíi thiÖu Qu¶n lý thµnh thÞ/jieshao_city", 
			"\nNhiÖm vô Håi Phong tr¹i/tongcitywar_task", 
--			"Thu håi trang bÞ x­ng hiÖu/shou_zhuang", 
			"Rêi khái/no_say")
	end
end

function main()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")
	if szTongName == nil then
		deal_abnormal()
		return
	end
	if szTongName == "" then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 
			3, 
			"Giíi thiÖu Qu¶n lý thµnh thÞ/jieshao_city", 
			"\nNhiÖm vô Håi Phong tr¹i/tongcitywar_task", 
--			"Thu håi trang bÞ x­ng hiÖu/shou_zhuang", 
			"Rêi khái/no_say")
		return
	end
	if GetTongName() ~= szTongName then		-- ²»ÊÇÕ¼Áì³ÇÊÐµÄ°ïÅÉ¶Ô»°
		local szTongViewName = szTongName
		szTongViewName = replace(szTongViewName, "/" ,"-")
		szTongViewName = replace(szTongViewName, "|" ,"-")
		szTongViewName = replace(szTongViewName, ":" ,"-")
		Say("Thµnh nµy do <color=yellow>"..szTongViewName.."<color> chiÕm lÜnh", 
			3, 
			"Giíi thiÖu Qu¶n lý thµnh thÞ/jieshao_city", 
			"\nNhiÖm vô Håi Phong tr¹i/tongcitywar_task", 
--			"Thu håi trang bÞ x­ng hiÖu/shou_zhuang", 
			"Rêi khái/no_say")
		return
	end
	Say("Thµnh nµy do quý bang chiÕm lÜnh",
		7,
		"Giíi thiÖu Qu¶n lý thµnh thÞ/jieshao_city",
		"Qu¶n lý thµnh thÞ/manage_city",
		"X­ng hiÖu trang bÞ/fuli_city",
		"Ta ch­a cã x­ng hiÖu, ph¶i lÊy l¹i x­ng hiÖu/get_title_again",
		"NhiÖm vô Håi Phong tr¹i/tongcitywar_task",
		"Phôc vô ®Æc biÖt thµnh viªn bang héi/#tongcitywar_service(0)",
--		"Thu håi trang bÞ x­ng hiÖu/shou_zhuang",
		"Rêi khái/no_say")
end

function tongcitywar_service(nParam)
	if GetLevel() < 70 then
		Say("B¹n ch­a ®ñ cÊp 70, kh«ng ®­îc phôc vô ®Æc biÖt",0)
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	
	if nParam == 0 then
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: TÊt c¶ thµnh viªn trong bang thµnh chñ ph¶i gia nhËp bang trªn 7 ngµy vµ cÊp 70 trë lªn ®Õn NPC chØ ®Þnh nhËn 8 giê ñy th¸c b¹ch c©u hoµn hoÆc 4 tiÕng thÇn n«ng ®¬n hoÆc 8 tiÕng lôc thÇn hoµn hoÆc 8 tiÕng tam thµnh hoµn. Mçi tuÇn chØ ®­îc nhËn 1 lÇn",
			5,
			"NhËn 8 giê ñy th¸c B¹ch C©u Hoµn/#tongcitywar_service(1)",
			"L·nh ThÇn n«ng ®¬n 4 giê /#tongcitywar_service(2)",
			"NhËn 8 giê ñy th¸c Lôc ThÇn Hoµn/#tongcitywar_service(3)",
			"NhËn 8 giê ñy th¸c Tam Thanh Hoµn/#tongcitywar_service(4)",
			"KÕt thóc ®èi tho¹i/no_say")
	elseif nParam == 1 then		
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("thêi gian nhËp bang ch­a ®­îc 7 ngµy, kh«ng nhËn ®­îc phôc vô ®Æc biÖt", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" TuÇn nµy b¹n ®· l·nh h¬n 1 lÇn phôc vô ®Æc biÖt.",0)
			return
		end
		SetTask(2501, GetTask(2501) + 8 * 60)
		SetTask(447, nTime)
		Msg2Player("§¹i hiÖp thu ®­îc 8 giê ñy th¸c B¹ch C©u Hoµn")
		WriteLog("[C«ng thµnh chiÕn-phôc vô ®Æc biÖt]:"..GetName().."Thu ®­îc 8 giê ñy th¸c B¹ch C©u Hoµn")
	elseif nParam == 2 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("thêi gian nhËp bang ch­a ®­îc 7 ngµy, kh«ng nhËn ®­îc phôc vô ®Æc biÖt", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" TuÇn nµy b¹n ®· l·nh h¬n 1 lÇn phôc vô ®Æc biÖt.",0)
			return
		end
		SetTask(2502, GetTask(2502) + 4 * 60)
		SetTask(447, nTime)
		Msg2Player("§¹i hiÖp thu ®­îc 8 giê ñy th¸c ThÇn N«ng §¬n")
		WriteLog("[C«ng thµnh chiÕn-phôc vô ®Æc biÖt]:"..GetName().."Thu ®­îc 8 giê ñy th¸c ThÇn N«ng §¬n")
	elseif nParam == 3 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("thêi gian nhËp bang ch­a ®­îc 7 ngµy, kh«ng nhËn ®­îc phôc vô ®Æc biÖt", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" TuÇn nµy b¹n ®· l·nh h¬n 1 lÇn phôc vô ®Æc biÖt.",0)
			return
		end
		--SetTask(2296, GetTask(2296) + 8 * 60)
		EatLiushen(1, 8 * 60);
		SetTask(447, nTime)
		Msg2Player("§¹i hiÖp thu ®­îc 8 giê ñy th¸c Lôc ThÇn Hoµn")
		WriteLog("[C«ng thµnh chiÕn-phôc vô ®Æc biÖt]:"..GetName().."Thu ®­îc 8 giê ñy th¸c Lôc ThÇn Hoµn")
	elseif nParam == 4 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("thêi gian nhËp bang ch­a ®­îc 7 ngµy, kh«ng nhËn ®­îc phôc vô ®Æc biÖt", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" TuÇn nµy b¹n ®· l·nh h¬n 1 lÇn phôc vô ®Æc biÖt.",0)
			return
		end
		EatSanqin(1, 8 * 60)
		SetTask(447, nTime)
		Msg2Player("§¹i hiÖp thu ®­îc 8 giê ñy th¸c Tam Thanh Hoµn")
		WriteLog("[C«ng thµnh chiÕn-phôc vô ®Æc biÖt]:"..GetName().."Thu ®­îc 8 giê ñy th¸c Tam Thanh Hoµn")
	end
end

function tongcitywar_task()
	Talk(1,"","NhiÖm vô nµy hiÖn t¹i ch­a më!")
	do return end
	local nMapID = GetWorldPos()
	local szTongName = GetCityWarInfo(nMapID, "base")
	local szMsg = " Thµnh §« Th¸i thó ph¸t hiÖn tµi chÝnh Thµnh §« bÞ thÊt tho¸t lín…ch¾c ch¾c ®· cã kÎ th«ng ®ång víi ®Þch…"
	if szTongName == nil then
		local tSay =
		{
			"\nHuy ch­¬ng Thµnh thÞ ®æi gi¶i th­ëng/task_jiangli",
			"\nCø hái/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	elseif GetTongName() ~= szTongName then
		local tSay =
		{
			"\nChiÕn sù/task_zhankuang",
			"Ta ph¶i ®Õn Håi Phong tr¹i/task_huifeng",
			"§Þch binh Hé gi¸p/task_hujia",
			"Huy ch­¬ng thµnh thÞ ®æi gi¶i th­ëng/task_jiangli",
			"Cø hái/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		local tSay =
		{
			"\nChiÕn sù/task_zhankuang",
			"Ta ph¶i ®Õn Håi Phong tr¹i/task_huifeng",
			"§Þch binh Hé gi¸p/task_hujia",
			"Huy ch­¬ng thµnh thÞ ®æi gi¶i th­ëng/task_jiangli",
			"Cø hái/no_say",
		}
		if szName == szBoss or szName == szManager then
			tinsert(tSay, 2, "Lo¹n trong giÆc ngoµi/task_youhuan")
		end
		Say(szMsg,getn(tSay),tSay)
	end
end

function task_huifeng()
	if GetPlayerRoute() == 0 then
		Say("V« danh tiÓu tèt cßn kh«ng nªn vµo Håi Phong tr¹i! Ng­¬i nªn gia nhËp m«n ph¸i rÌn luyÖn tr­íc ®·",0)
		return
	end
	
	if GetLevel() < 75 then
		Say(" Ng­¬i ch­a ®¹t cÊp 75, ®Õn Håi Phong tr¹i rÊt nguy hiÓm",0)
		return
	end
	CleanInteractive()
	LeaveTeam()
	local nIsExist = CustomDataRead("tongcitywar_person_map_task")	-- ³õÊ¼»¯Ã¿ÈÕÈÎÎñ
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0,0,0,0,0,0,0)
	end
	nIsExist = CustomDataRead("tongcitywar_person_task")
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_task", "dddd", 0, 0, 0, 0)
	end
	
	CreateTrigger(2, 1811, 267)
	NewWorld(889,1764,3808)
end

function task_youhuan()
	Say("Th¸i thó c¶m thÊy Tr¹i chñ Lý ThuËn lo ng¹i , gÇn ®©y d©n chóng Thµnh §« lÇm than khæ cùc, Lý ThuËn míi tËp hîp m­u ph¶n... §ang lóc dÇu s«i löa báng, triÒu ®×nh cã mËt chØ ®Õn sai Thµnh §« Th¸i thó tÊn c«ng Håi Phong tr¹i…",
	2,
	"Tuyªn chiÕn/task_xuanzhan",
	"KÕt thóc ®èi tho¹i/no_say")
end

tTaskInfo =
{
	{30000, "TuÇn nµy thu ®­îc 30000 ®Þch binh Hé gi¸p - Gi¶i th­ëng:", "500 l­îng"},
	{45000, "TuÇn nµy thu ®­îc 45000 ®Þch binh Hé gi¸p - Gi¶i th­ëng:", "1200 l­îng"},
	{60000, "TuÇn nµy thu ®­îc 60000 ®Þch binh Hé gi¸p - Gi¶i th­ëng:", "2000 l­îng"},
	{90000, "TuÇn nµy thu ®­îc 90000 ®Þch binh Hé gi¸p - Gi¶i th­ëng:", "2 tói huy ch­¬ng, 1 tói 50 huy ch­¬ng"},
	{150000, "TuÇn nµy thu ®­îc 150000 ®Þch binh Hé gi¸p - Gi¶i th­ëng:", "4 tói huy ch­¬ng, 1 tói 50 huy ch­¬ng"},
	{210000, "TuÇn nµy thu ®­îc 210000 ®Þch binh Hé gi¸p - Gi¶i th­ëng:", "6 tói huy ch­¬ng, 1 tói 50 huy ch­¬ng"},
	{300000, "TuÇn nµy thu ®­îc 300000 ®Þch binh Hé gi¸p - Gi¶i th­ëng:", "1 mãn vò khÝ Hoµng kim Bé Phi Yªn tïy ý"},
}

function task_xuanzhan()
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" Bang héi ®· tuyªn chiÕn víi Håi Phong tr¹i.",0)
	else
		Say(" Tuyªn chiÕn kh«ng ph¶i viÖc tïy tiÖn, ng­¬i ph¶i huy ®éng mäi ng­êi, tiªu diÖt ®Þch sÏ lÊy ®­îc l·nh Hé gi¸p cña chóng, ng­¬i tù ®Þnh ra môc tiªu, tr­íc thø b¶y hoµn thµnh sÏ th­ëng c«ng hËu hÜnh",
			8,
			tTaskInfo[1][2]..tTaskInfo[1][3].."/#task_shouji(1)",
			tTaskInfo[2][2]..tTaskInfo[2][3].."/#task_shouji(2)",
			tTaskInfo[3][2]..tTaskInfo[3][3].."/#task_shouji(3)",
			tTaskInfo[4][2]..tTaskInfo[4][3].."/#task_shouji(4)",
			tTaskInfo[5][2]..tTaskInfo[5][3].."/#task_shouji(5)",
			tTaskInfo[6][2]..tTaskInfo[6][3].."/#task_shouji(6)",
			tTaskInfo[7][2]..tTaskInfo[7][3].."/#task_shouji(7)",
			"Kh«ng nhËn nhiÖm vô/no_say")
	end
end

function task_shouji(nType)
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" Bang héi ®· tuyªn chiÕn víi Håi Phong tr¹i.",0)
		return
	end
	SetCityWarTask(nMapID, nType)
	Say(" Bang héi tuyªn chiÕn víi Håi Phong tr¹i, tuÇn nµy ®Þnh môc tiªu:"..tTaskInfo[nType][2]..tTaskInfo[nType][3], 0)
	SendTongMessage(GetName().."Më nhiÖm vô tuyªn chiÕn víi Håi Phong tr¹i.")
	SendTongMessage("Môc tiªu tuÇn nµy:"..tTaskInfo[nType][2]..tTaskInfo[nType][3])
end

function task_zhankuang()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say(" TuÇn nµy Thµnh Chñ bang ph¸i kh«ng tuyªn chiÕn víi Håi Phong tr¹i.",0)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		if nItemCount < tTaskInfo[nType][1] then
			Say(" TuÇn nµy ®· thu ®­îc §Þch Binh Hé Gi¸p <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, vÉn ch­a ®¹t ®­îc môc tiªu\nGi¶i th­ëng chiÕm thµnh: <color=green>"..tTaskInfo[nType][3].."<color>",0)
			return
		end
		local szSay = " TuÇn nµy ®· thu ®­îc §Þch Binh Hé Gi¸p <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, ®¹t môc tiªu, cã thÓ l·nh th­ëng.\nGi¶i th­ëng chiÕm thµnh: <color=green>"..tTaskInfo[nType][3].."<color>"
		if szName == szBoss or szName == szManager then
			Say(szSay,3,"L·nh phÇn th­ëng bang héi/task_tong_finish","Hu©n ch­¬ng thµnh thÞ ngÉu nhiªn/task_person_more","KÕt thóc ®èi tho¹i/no_say")
		else
			Say(szSay,2,"Hu©n ch­¬ng thµnh thÞ ngÉu nhiªn/task_person_more","KÕt thóc ®èi tho¹i/no_say")
		end
	end
end

function task_tong_finish()
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 then
		Say("Bang héi cña ban ®· l·nh PhÇn th­ëng bang héi cña tuÇn nµy råi!",0)
		return
	end
	
	if nType == 0 then
		return
	elseif nType == 1 then
		Earn(5000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 500 l­îng")
		WriteLog(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 500 l­îng")
	elseif nType == 2 then
		Earn(12000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 1200 l­îng")
		WriteLog(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 1200 l­îng")
	elseif nType == 3 then
		Earn(20000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 2000 l­îng")
		WriteLog(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 2000 l­îng")
	elseif nType == 4 then
		if Zgc_pub_goods_add_chk(2,2) == 1 then
			if AddItem(2,0,766,2) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 2 tói Hu©n ch­¬ng thµnh thÞ")
				WriteLog(GetName().."§· nhËn 2 tói Hu©n ch­¬ng thµnh thÞ")
			end
		end
	elseif nType == 5 then
		if Zgc_pub_goods_add_chk(4,4) == 1 then
			if AddItem(2,0,766,4) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 4 tói Hu©n ch­¬ng thµnh thÞ")
				WriteLog(GetName().."§· nhËn 4 tói Hu©n ch­¬ng thµnh thÞ")
			end
		end
	elseif nType == 6 then	
		if Zgc_pub_goods_add_chk(6,6) == 1 then
			if AddItem(2,0,766,6) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: 6 tói Hu©n ch­¬ng thµnh thÞ")
				WriteLog(GetName().."§· nhËn 6 tói Hu©n ch­¬ng thµnh thÞ")
			end
		end
	elseif nType == 7 then
		sel_task_weapon(1)
	end
end

tTaskWeapon = 
{
	{0,3,6001,"Ph¸ Yªn ®ao"},
	{0,5,6002,"Ph¸ Yªn c«n"},
	{0,8,6003,"Phï Yªn tr­îng"},
	{0,0,6004,"Hµm Yªn thñ"},
	{0,1,6005,"Tµng Yªn ch©m"},
	{0,2,6006,"Phi Yªn kiÕm"},
	{0,10,6007,"VËn Yªn cÇm"},
	{0,0,6008,"V©n Yªn thñ"},
	{0,5,6009,"L­u Yªn c«n"},
	{0,2,6010,"HuyÒn Yªn kiÕm"},
	{0,9,6011,"Vò Yªn bót"},
	{0,6,6012,"Hµ Tiªm Th­¬ng"},
	{0,4,6013,"Hµnh Yªn Cung"},
	{0,7,6014,"Träc Yªn nhÉn"},
	{0,11,6015,"Yªu Yªn tr¶o"},
}

function sel_task_weapon(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang tr­íc/#sel_task_weapon("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tTaskWeapon) then
		nEnd = getn(tTaskWeapon)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tTaskWeapon[i][4].."/#sel_task_weapon_one("..i..")"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tTaskWeapon) then
		tSay[nTabIndex] = "Trang kÕ/#sel_task_weapon("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "Rêi khái/no_say"
	
	Say("Xin chän Vò KhÝ Bé Phi Yªn muèn nhËn!",getn(tSay),tSay)
end

function sel_task_weapon_one(nIndex)
	Say("Ng­¬i ®· chän "..tTaskWeapon[nIndex][4]..", x¸c ®Þnh chø?",
		3,
		"§ång ý/#sel_task_weapon_yes("..nIndex..")",
		"Chän l¹i/#sel_task_weapon(1)",
		"KÕt thóc ®èi tho¹i/no_say")
end

function sel_task_weapon_yes(nIndex)
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 or nType ~= 7 then
		return
	end
	if Zgc_pub_goods_add_chk(1,50) == 1 then
		if AddItem(tTaskWeapon[nIndex][1],tTaskWeapon[nIndex][2],tTaskWeapon[nIndex][3],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			SetCityWarTaskAwardFlag(nMapID, 1)
			SendTongMessage(GetName().."L·nh phÇn th­ëng bang héi tuÇn nµy: "..tTaskWeapon[nIndex][4].."_1")
			WriteLog("PhÇn th­ëng bang héi "..GetName().."®æi "..tTaskWeapon[nIndex][4])
		end
	end
end

function task_person_more()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say(" TuÇn nµy Thµnh Chñ bang ph¸i kh«ng tuyªn chiÕn víi Håi Phong tr¹i.",0)
		return
	end
	
	local szMsg = "Bang ph¸i Thµnh Chñ hoµn thµnh nhiÖm vô toµn m¸y chñ xong. Néi trong tuÇn ng­êi chíi cã ®­îc sù c«ng hiÕn sÏ ngÉu nhiªn nhËn ®­îc Hu©n ch­¬ng thµnh thÞ. Mçi lÇn giao <color=yellow>60<color> ®Þch binh Hé gi¸p sÏ ngÉu nhiªn nhËn thªm ®­îc <color=yellow>1<color> Hu©n ch­¬ng thµnh thÞ.? (Tèi ®a 300 c¸i)"

	if nItemCount < tTaskInfo[nType][1] then
		Say(szMsg.."\nTuÇn nµy §Þch Binh Hé Gi¸p thu ®­îc "..nItemCount.."/"..tTaskInfo[nType][1]..", vÉn ch­a ®¹t môc tiªu ",0)
		return
	end

	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount > 300 or nJHCount > 300 then
		WriteLog("[C«ng thµnh -qu¶n lý] name="..GetName().." event=Hé gi¸p ngÉu nhiªn error=data dÞ th­êng C="..nSJCount..";J="..nJHCount)
		return
	end
	
	if nDLCount == nil then
		Say(szMsg.."\nTuÇn nµy b¹n ch­a giao §Þch Binh Hé Gi¸p, kh«ng thÓ nhËn phÇn th­ëng!",0)
		return
	end
	
	if nSJCount < 60 then
		Say(szMsg.."\nTuÇn nµy b¹n ch­a giao ®ñ 60 §Þch Binh Hé Gi¸p, kh«ng thÓ nhËn phÇn th­ëng!",0)
		return
	end
	
	if nSJCount - nJHCount < 60 then
		Say(szMsg.."\nTuÇn nµy b¹n giao ®­îc §Þch Binh Hé Gi¸p <color=yellow>"..nSJCountView.."<color>, trong ®ã sè l­îng cã thÓ ®æi Hu©n ch­¬ng thµnh thÞ lµ <color=yellow>"..nSJCount.."<color>, ®· sö dông <color=yellow>"..nJHCount.."<color> §Þch Binh Hé Gi¸p ®æi Hu©n ch­¬ng thµnh thÞ, phÇn cßn d­ kh«ng ®ñ ®æi Hu©n ch­¬ng thµnh thÞ, kh«ng thÓ nhËn phÇn th­ëng!",0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end
	
	local nCount = floor((nSJCount - nJHCount)/60)
	Say(szMsg.."\nTuÇn nµy b¹n giao ®­îc §Þch Binh Hé Gi¸p <color=yellow>"..nSJCountView.."<color>, trong ®ã sè l­îng cã thÓ ®æi Hu©n ch­¬ng thµnh thÞ lµ <color=yellow>"..nSJCount.."<color>, ®· sö dông <color=yellow>"..nJHCount.."<color>§Þch Binh Hé Gi¸p ®æi Hu©n ch­¬ng thµnh thÞ, phÇn cßn d­ cã thÓ ®æi <color=yellow>"..nCount.."<color> Hu©n ch­¬ng thµnh thÞ! §æi b©y giê chø?",2,"§æi Hu©n ch­¬ng thµnh thÞ/#task_person_more_yes("..nCount..")","KÕt thóc ®èi tho¹i/no_say")
end

function task_person_more_yes(nCount)
	if AddItem(2,0,765,nCount) == 1 then
		local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
		nJHCount = nJHCount + nCount * 60
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount, nSJCount, nJHCount, nSJCountView)
		Msg2Player("B¹n nhËn ®­îc "..nCount.." Hu©n ch­¬ng thµnh thÞ")
		WriteLog(GetName().."®æi "..nCount.." Hu©n ch­¬ng thµnh thÞ ngÉu nhiªn")
	end
end

function task_hujia()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	local szMsg = "Mçi lÇn giao <color=yellow>10<color> ®Þch binh Hé gi¸p sÏ nhËn ®­îc <color=yellow>1<color>Hu©n ch­¬ng thµnh thÞ, <color=yellow>v­ît qu¸ 300<color> sÏ <color=yellow>kh«ng thÓ ®æi<color> Hu©n ch­¬ng thµnh thÞ. Mçi ng­êi mçi tuÇn th«ng qua tiªu diÖt ®Þch cã thÓ thu ®­îc tèi ®a <color=yellow>600<color> §Þch Binh Hé Gi¸p "
	if nType > 0 then
		szMsg = szMsg.."\nMôc tiªu nhiÖm vô tuÇn nµy lµ thu thËp §Þch Binh Hé Gi¸p <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>"
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount >= 300 then
		szMsg = szMsg.."\nTuÇ nµy ®· giao ®Þch binh Hé gi¸p <color=yellow>"..nSJCountView.."/300<color>, v­ît qu¸ <color=yellow>300<color> bé sÏ kh«ng thÓ nhËn ®­îc Hu©n ch­¬ng thµnh thÞ, nh­ng sÏ ®­îc tÝch lòy qua cho nhiÖm vô tuyªn chiÕn bang héi. Giao chø?"
	else
		szMsg = szMsg.."\nTuÇ nµy ®· giao ®Þch binh Hé gi¸p <color=yellow>"..nSJCountView.."/300<color>, cã ph¶i muèn giao §Þch Binh Hé Gi¸p. Mçi lÇn giao 10 §Þch Binh Hé Gi¸p sÏ nhËn ®­îc 1 Hu©n ch­¬ng thµnh thÞ. (v­ît qu¸ <color=yellow>300<color> bé sÏ kh«ng thÓ nhËn ®­îc Hu©n ch­¬ng thµnh thÞ)"
	end
	Say(szMsg,3,
		"Giao 10 ®Þch binh Hé gi¸p/#task_hujia_sj(10)",
		"Giao 100 ®Þch binh Hé gi¸p/#task_hujia_sj(100)",
		"KÕt thóc ®èi tho¹i/no_say")
end

function task_hujia_sj(nCount)
	local nMaxCount = GetItemCount(2,0,764)
	if nMaxCount < nCount then
		Say("Ng­¬i kh«ng mang ®ñ ®Þch binh Hé gi¸p "..nCount..", cã ph¶i ®Ó quªn trong r­¬ng råi kh«ng?",0)
		return
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCountView > 300 and nSJCount < 300 then
		WriteLog("[C«ng thµnh -qu¶n lý] name="..GetName().." event=Giao hé gi¸p error=data dÞ th­êng CV="..nSJCountView..";C="..nSJCount)
		return
	elseif nSJCount > 300 then
		WriteLog("[C«ng thµnh -qu¶n lý] name="..GetName().." event=Giao hé gi¸p error=data dÞ th­êng C="..nSJCount)
		return
	end

	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end

	local nDiff = nCount + nSJCount - 300
	local nGiveCount = floor(nCount / 10)
	if nDiff > 0 then
		nGiveCount = floor((nCount-nDiff)/10)
	end
	
	if DelItem(2,0,764,nCount) == 1 then
		local szMsg = "<color=green>Qu¶n thµnh sø<color>: "
		local szMsg2 = ""
		if nGiveCount > 0 then
			AddItem(2,0,765,nGiveCount)
			szMsg = "B¹n nhËn ®­îc "..nGiveCount.." Hu©n ch­¬ng thµnh thÞ."
			szMsg2 = "B¹n nhËn ®­îc "..nGiveCount.." Hu©n ch­¬ng thµnh thÞ."
		end
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount,(nGiveCount*10)+nSJCount,nJHCount,nSJCountView+nCount)
		
		szMsg = szMsg.."\nTuÇ nµy ®· giao ®Þch binh Hé gi¸p <color=yellow>"..(nSJCountView+nCount).."/300<color>."
		szMsg2 = szMsg2.."TuÇn nµy ®· giao ®Þch binh Hé gi¸p "..(nSJCountView+nCount).."/300."
		
		local nMapID = GetWorldPos()
		local nType, nItemCount = GetCityWarInfo(nMapID, "task")
		if nType > 0 then			-- Èç¹ûÓÐ³ÇÊÐÈÎÎñ,°ÑÉÏ½»µÄµÐ±ø»¤¼×¼Óµ½×Ü¼ÆÊýÀïÃæ
			SetCityWarTask(nMapID, nType, nCount)
			szMsg = szMsg.."\nMôc tiªu nhiÖm vô tuÇn nµy lµ thu thËp §Þch Binh Hé Gi¸p <color=yellow>"..(nItemCount+nCount).."/"..tTaskInfo[nType][1].."<color>"
			szMsg2 = szMsg2.."Môc tiªu nhiÖm vô tuÇn nµy lµ thu thËp §Þch Binh Hé Gi¸p"..(nItemCount+nCount).."/"..tTaskInfo[nType][1]
		end
		Say(szMsg,2,"TiÕp tôc giao ®Þch binh Hé gi¸p /task_hujia", "Rêi khái/no_say")
		Msg2Player(szMsg2)
	end
end

function task_jiangli()
	Say("C¸c h¹ cã thÓ dïng Hu©n ch­¬ng thµnh thÞ ®æi c¸c phÇn th­ëng sau: ",
		3,
		"\nMËt tÞch trang bÞ\n/#task_jiangli_zm(0,0,0)",
		"\nHiÖu qu¶ c­êng hãa\n/#task_jiangli_xg(1)",
		"\nKÕt thóc ®èi tho¹i/no_say")
end

tRoute2Weapon = 
{
	[2] = {{0,3,6001,"Ph¸ Yªn ®ao"}, {0,5,6002,"Ph¸ Yªn c«n"}},
	[3] = {{0,8,6003,"Phï Yªn tr­îng"},},
	[4] = {{0,0,6004,"Hµm Yªn thñ"}},
	[6] = {{0,1,6005,"Tµng Yªn ch©m"}},
	[8] = {{0,2,6006,"Phi Yªn kiÕm"}},
	[9] = {{0,10,6007,"VËn Yªn cÇm"}},
	[11] = {{0,0,6008,"V©n Yªn thñ"}},
	[12] = {{0,5,6009,"L­u Yªn c«n"}},
	[14] = {{0,2,6010,"HuyÒn Yªn kiÕm"}},
	[15] = {{0,9,6011,"Vò Yªn bót"}},
	[17] = {{0,6,6012,"Hµ Tiªm Th­¬ng"}},
	[18] = {{0,4,6013,"Hµnh Yªn Cung"}},
	[20] = {{0,7,6014,"Träc Yªn nhÉn"}},
	[21] = {{0,11,6015,"Yªu Yªn tr¶o"}},
}

function task_jiangli_zm(nType,nParam1,nParam2)
	if nType == 0 then
		Say("Ng­¬i cã thÓ chän c¸c phÇn th­ëng sau",
			4,
			"KhuÊt Nguyªn Béi (CÇn 600 Hu©n ch­¬ng thµnh thÞ)/#task_jiangli_zm(1,0,0)",
			"§¹i Lùc ThÇn H¹ng Liªn (CÇn 750 Hu©n ch­¬ng thµnh thÞ)/#task_jiangli_zm(2,0,0)",
			--"¶ÔÓ¦ÃÅÅÉ²½·ÇÑÌ»Æ½ðÎäÆ÷£¨ÐèÒª500³ÇÊÐ½±ÕÂ£©/#task_jiangli_zm(3,0,0)",
			"L¨ng Ba Vi Bé (CÇn 600 Hu©n ch­¬ng thµnh thÞ)/#task_jiangli_zm(4,0,0)",
			"KÕt thóc ®èi tho¹i/no_say")
	elseif nType == 1 then
		Say("§æi KhuÊt Nguyªn Béi cÇn 600 Hu©n ch­¬ng thµnh thÞ, ®æi chø?",2,"§ång ý/#task_jiangli_zm(11,0,0)","§Ó ta suy nghÜ!/no_say")
	elseif nType == 2 then
		Say("§æi §¹i Lùc ThÇn H¹ng Liªn cÇn 750 Hu©n ch­¬ng thµnh thÞ, ®æi chø?",2,"§ång ý/#task_jiangli_zm(12,0,0)","§Ó ta suy nghÜ!/no_say")
	elseif nType == 3 then
		local nRoute = GetPlayerRoute()
		if tRoute2Weapon[nRoute] == nil then
			Say("Ng­¬i vÉn ch­a gia nhËp L­u ph¸i nµo, ch­a thÓ nhËn Vò KhÝ Bé Phi Yªn.",0)
			return
		end
		if getn(tRoute2Weapon[nRoute]) > 1 then
			local tSay = {}
			for index, value in tRoute2Weapon[nRoute] do
				tSay[index] = value[4].."/#task_jiangli_zm(10,"..nRoute..","..index..")"
			end
			Say("Ng­¬i cã thÓ chän 1 mãn vò khÝ Hoµng Kim tóy ý",getn(tSay),tSay)
		else
			Say("§æi "..tRoute2Weapon[nRoute][1][4].." cÇn 500 Hu©n ch­¬ng thµnh thÞ, ®æi chø?",2,"§ång ý/#task_jiangli_zm(13,"..nRoute..",1)", "§Ó ta suy nghÜ!/no_say")
		end
	elseif nType == 4 then
		Say("§æi L¨ng Ba Vi Bé cÇn 600 Hu©n ch­¬ng thµnh thÞ, ®æi chø?",2,"§ång ý/#task_jiangli_zm(14,0,0)","§Ó ta suy nghÜ!/no_say")
	elseif nType == 10 then
		Say("§æi "..tRoute2Weapon[nParam1][nParam2][4].." cÇn 900 Hu©n ch­¬ng thµnh thÞ, ®æi chø?",2,"§ång ý/#task_jiangli_zm(13,"..nParam1..","..nParam2..")", "§Ó ta suy nghÜ!/no_say")
	elseif nType == 11 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,102,27,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B¹n ®· ®æi 1 KhuÊt Nguyªn Béi ")
				WriteLog(GetName().." ®· ®æi 1 KhuÊt Nguyªn Béi ")
			else
				Say("C¸c h¹ kh«ng cã ®ñ Hu©n ch­¬ng thµnh thÞ.",0)
			end
		end
	elseif nType == 12 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,750) == 1 then
				AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B¹n ®· ®æi §¹i Lùc ThÇn h¹ng liªn")
				WriteLog(GetName().."®· ®æi §¹i Lùc ThÇn h¹ng liªn")
			else
				Say("C¸c h¹ kh«ng cã ®ñ Hu©n ch­¬ng thµnh thÞ.",0)
			end
		end
	elseif nType == 13 then
		if tRoute2Weapon[nParam1][nParam2] == nil then
			return
		end
		if Zgc_pub_goods_add_chk(1,50) == 1 then
			if DelItem(2,0,765,500) == 1 then
				AddItem(tRoute2Weapon[nParam1][nParam2][1],tRoute2Weapon[nParam1][nParam2][2],tRoute2Weapon[nParam1][nParam2][3],1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B¹n ®· ®æi "..tRoute2Weapon[nParam1][nParam2][4])
				WriteLog(GetName().."®æi "..tRoute2Weapon[nParam1][nParam2][4])
			else
				Say("C¸c h¹ kh«ng cã ®ñ Hu©n ch­¬ng thµnh thÞ.",0)
			end
		end
	elseif nType == 14 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,112,78,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B¹n ®· ®æi L¨ng Ba Vi Bé")
				WriteLog(GetName().."®· ®æi L¨ng Ba Vi Bé")
			else
				Say("C¸c h¹ kh«ng cã ®ñ Hu©n ch­¬ng thµnh thÞ.",0)
			end
		end
	end
end

tMagicAttr=
{
	{"state_add_vitality",				30, 194400,"G©n cèt t¨ng 30 (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_add_strength", 				30, 194400,"Søc m¹nh t¨ng 30 (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_add_dexterity", 			30, 194400,"Th©n ph¸p t¨ng 30 (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_add_observe",				30, 194400,"Linh ho¹t t¨ng 30 (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_add_energy",				30, 194400,"Néi c«ng t¨ng 30 (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_add_allability",			20, 194400,"Toµn bé thuéc tÝnh t¨ng 20 (CÇn 10 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 150)",10,150},
	{"state_life_max_percent_add",		10,	194400,"Sinh lùc t¨ng 10% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_receive_half_damage", 		10, 194400,"Gi¶m s¸t th­¬ng khi thä th­¬ng 10% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_inc_exp_gain", 				5,  194400,"Kinh nghiÖm nhËn ®­îc t¨ng 5% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_paralysis_time_dec",		30, 194400,"Gi¶m thêi gian tª liÖt 30% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_vertigo_time_dec",          30, 194400,"Rót ng¾n thêi gian h«n mª 30% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_fetter_time_dec",           30, 194400,"Rót ng¾n thêi gian ®Þnh th©n 30% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_confusion_time_dec",        30, 194400,"Rót ng¾n thêi gian hçn lo¹n 30% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_sleep_time_dec",            30, 194400,"Rót ng¾n thêi gian ngñ mª 30% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_attack_burst_dec_time_dec", 30, 194400,"Gi¶m thêi gian lµm chËm 30% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_slow_time_dec",             30, 194400,"Rót ng¾n thêi gian gi¶m tèc 30% (CÇn 5 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 75)",5,75},
	{"state_p_attack_percent_add",		8, 194400,"T¨ng ngo¹i c«ng 8% (CÇn 6 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 90)",6,90},
	{"state_m_attack_percent_add",		8, 194400,"T¨ng Néi c«ng 8% (CÇn 6 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 90)",6,90},
	{"state_damage_point",				30, 194400,"T¨ng s¸t th­¬ng 30 (CÇn 6 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 90)",6,90},
	{"state_move_speed_percent_add", 	10, 194400,"T¨ng tèc ®é di chuyÓn 10% (CÇn 10 Hu©n ch­¬ng thµnh thÞ hoÆc §Þch Binh Hé Gi¸p 150)",10,150},
}

function task_jiangli_xg(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang tr­íc/#task_jiangli_xg("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tMagicAttr) then
		nEnd = getn(tMagicAttr)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tMagicAttr[i][4].."/#task_jiangli_xg_buy("..i..",0)"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tMagicAttr) then
		tSay[nTabIndex] = "Trang kÕ/#task_jiangli_xg("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "Rêi khái/no_say"
	
	Say("HiÖu qu¶ nµy kh«ng thÓ dïng chung víi lo¹i kh¸c, duy tr× 3 giê, rêi m¹ng hoÆc tö vong ®Òu b¶o l­u, nh­ng trong mét vµi tr­êng hîp ®Æc biÖt sÏ bÞ c­ìng chÕ hñy bá",getn(tSay),tSay)
end

function task_jiangli_xg_buy(nIndex,nParam)
	if nParam == 0 then
		Say("§æi "..tMagicAttr[nIndex][4].."CÇn"..tMagicAttr[nIndex][5].." Hu©n ch­¬ng thµnh thÞ hoÆc cÇn "..tMagicAttr[nIndex][6].." §Þch Binh Hé Gi¸p, ®æi chø?\n<color=red>NÕu hiÖu qu¶ lo¹i nµy ®· tån t¹i, ®æi lo¹i míi sÏ cã hiÖu qu¶ <color>",
			4,
			"Dïng Hu©n ch­¬ng thµnh thÞ ®æi /#task_jiangli_xg_buy("..nIndex..",1)",
			"Dïng §Þch Binh Hé Gi¸p ®æi /#task_jiangli_xg_buy("..nIndex..",2)",
			"VÒ trang tr­íc/#task_jiangli_xg(1)",
			"§Ó ta suy nghÜ!/no_say")
	elseif nParam == 1 then
		if DelItem(2,0,765,tMagicAttr[nIndex][5]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("Ng­¬i kh«ng mang theo ®ñ Hu©n ch­¬ng thµnh thÞ",0)
		end
	elseif nParam == 2 then
		if DelItem(2,0,764,tMagicAttr[nIndex][6]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("Ng­¬i kh«ng mang theo ®ñ §Þch Binh Hé Gi¸p ",0)
		end
	end
end

function get_title_again()
	local nMapID = GetWorldPos()
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local szName = GetName()
	local n, szBoss = GetCityWarInfo(nMapID, "boss")
	if szBoss == szName then
		local tBossTitle =
		{
			[100] = {5},
			[300] = {1},
			[350] = {9},
		}
		AddTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		SetCurTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		Say("Ta ®· gióp ng­¬i phôc håi l¹i X­ng hiÖu råi!", 0)
		return
	end
	
	local n, szManager = GetCityWarInfo(nMapID, "manager")
	if szManager == szName then
		local tManagerTitle =
		{
			[100] = {7},
			[300] = {3},
			[350] = {11},
		}
		AddTitle(51, tManagerTitle[nMapID][1])
		SetCurTitle(51, tManagerTitle[nMapID][1])
		Say("Ta ®· gióp ng­¬i phôc håi l¹i X­ng hiÖu råi!", 0)
		return
	end
	
	local n, szF1, szF2, szF3, szF4 = GetCityWarInfo(nMapID, "fighter")
	if szName == szF1 or szName == szF2 or szName == szF3 or szName == szF4 then
		local tFighterTitle =
		{
			[100] = {8},
			[300] = {4},
			[350] = {12},
		}
		AddTitle(51, tFighterTitle[nMapID][1])
		SetCurTitle(51, tFighterTitle[nMapID][1])
		Say("Ta ®· gióp ng­¬i phôc håi l¹i X­ng hiÖu råi!", 0)
		return
	end
	Say("Ng­¬i kh«ng cã chøc vô g× ë thµnh nµy, kh«ng thÓ phôc håi X­ng hiÖu!", 0)
end

function shou_zhuang()
	Say("NÕu c¸c h¹ kh«ng muèn sö dông Trang bÞ X­ng hiÖu, ta sÏ thu håi l¹i rang bÞ nµy. Xin ®Æt l¹i c¸c trang bÞ muèn thu håi vµo hang trang!",
		5,
		"Thu håi trang bÞ Thµnh Chñ/hui_taishou",
		"Thu håi trang bÞ Qu©n S­/hui_shiye",
		"Thu håi trang bÞ Danh Bé/hui_tixia",
		"Thu håi Trang bÞ VÖ binh/hui_weibin",
		"Rêi khái/no_say")
end

function hui_taishou()
	Say("<color=green>Qu¶n lý thµnh thÞ<color>: C¸c h¹ x¸c nhËn muèn thu håi trang bÞ Thµnh Chñ trong hµnh trang?", 2, "§ång ý/yes_hui_taishou", "§Ó ta suy nghÜ!/no_say")
end

function yes_hui_taishou()
	local nBeDelete = 0
	for i=8013, 8016 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Thµnh Chñ]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Thµnh Chñ]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Thµnh Chñ]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8013,8020 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Thµnh Chñ]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: §· thu håi trang bÞ Thµnh Chñ trong hµnh trang thµnh c«ng", 0)
	else
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: Trong hµnh trang c¸c h¹ kh«ng cã trang bÞ Thµnh Chñ.", 0)
	end
end

function hui_shiye()
	Say("<color=green>Qu¶n lý thµnh thÞ<color>: C¸c h¹ x¸c nhËn muèn thu håi trang bÞ Qu©n S­ trong hµnh trang? ", 2, "§ång ý/yes_hui_shiye", "§Ó ta suy nghÜ!/no_say")
end

function yes_hui_shiye()
	local nBeDelete = 0
	if DelItem(0,102,8021,1) == 1 then
		WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Qu©n S­]: "..GetName()..";102,8021")
		nBeDelete = 1
	end
	if DelItem(0,102,8022,1) == 1 then
		WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Qu©n S­]: "..GetName()..";102,8022")
		nBeDelete = 1
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: ®· thu håi thµnh c«ng trang bÞ Qu©n S­", 0)
	else
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: Trong hµnh trang kh«ng cã trang bÞ Qu©n S­", 0)
	end
end

function hui_tixia()
	Say("<color=green>Qu¶n lý thµnh thÞ<color>: C¸c h¹ x¸c nhËn muèn thu håi trang bÞ Danh Bé trong hµnh trang?", 2, "§ång ý/yes_hui_tixia", "§Ó ta suy nghÜ!/no_say")
end

function yes_hui_tixia()
	local nBeDelete = 0
	for i=8005, 8008 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Danh Bé]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Danh Bé]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Danh Bé]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Danh Bé]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8023,8026 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-Thu håi trang bÞ Danh Bé]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: ®· thu håi thµnh c«ng trang bÞ Danh Bé.", 0)
	else
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: Trong hµnh trang kh«ng cã trang bÞ Danh Bé.", 0)
	end
end

function hui_weibin()
	Say("C¸c h¹ x¸c ®Þnh muèn thu håi Trang bÞ VÖ binh trong hµnh trang?", 2, "§ång ý/yes_hui_weibin", "§Ó ta suy nghÜ!/no_say")
end

function yes_hui_weibin()
	local nBeDelete = 0
	for i=8009, 8012 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-thu håi Trang bÞ VÖ binh]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-thu håi Trang bÞ VÖ binh]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-thu håi Trang bÞ VÖ binh]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-thu håi Trang bÞ VÖ binh]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	for i=0,3 do
		if DelItem(0,110,221+i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-thu håi VÖ Binh trangThu håi ]:"..GetName()..";110,"..(224+i))
			nBeDelete = 1
		end
		if DelItem(0,108,481+i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-thu håi VÖ Binh trangThu håi ]:"..GetName()..";108,"..(481+i))
			nBeDelete = 1
		end
		if DelItem(0,109,491+i,1) == 1 then
			WriteLog("[C«ng thµnh chiÕn-thu håi VÖ Binh trangThu håi ]:"..GetName()..";109,"..(491+i))
			nBeDelete = 1
		end
	end
	
	if nBeDelete == 1 then
		Say("§· thu håi thµnh c«ng Trang bÞ VÖ binh trong hµnh trang!", 0)
	else
		Say("Hµnh trang cña ng­¬i kh«ng cã Trang bÞ VÖ binh", 0)
	end
end

function fuli_city()
	Say("Ng­êi ch¬i cã X­ng hiÖu ®Æc biÖt cã thÓ l·nh hoÆc chÕ t¹o trang bÞ ®Æc biÖt, toµn bé thµnh viªn trong bang héi ®Òu cã thÓ l·nh VÖ binh Kh«i gi¸p",
		6,
		"ChÕ t¹o trang bÞ Thµnh Chñ/mk_taishou_equip",
		"ChÕ t¹o trang bÞ Danh Bé/mk_tixia_equip",
		"ChÕ t¹o trang bÞ Qu©n S­/get_shiye_equip",
		"L·nh Trang bÞ VÖ binh/get_weibing_suit",
		"§æi trang bÞ Thµnh Chñ míi/#change_old_taishou_equip(0)",
		"Ta chØ ghÐ ch¬i/no_say")
end

function change_old_taishou_equip(nParam)
	local nWhen = 1196028000			-- 2007-11-26 6:00 AM
	local nBody = GetBody() - 1
	if nParam == 0 then
		Say("<color=green>Qu¶n lý thµnh thÞ<color>: Ta cã thÓ lÊy trang bÞ Thµnh Chñ (quËn chñ) cò ®æi thµnh trang bÞ míi m¹nh h¬n.",
			3,
			--"»»È¡ÐÂµÄ³ÇÖ÷(¿¤Ö÷)Õ½¿ø/#change_old_taishou_equip(1)",
			"§æi Thµnh Chñ (quËn chñ) chiÕn gi¸p/#change_old_taishou_equip(2)",
			"§æi Thµnh Chñ (quËn chñ) chiÕn trang/#change_old_taishou_equip(3)",
			--"»»È¡ÐÂµÄ³ÇÖ÷(¿¤Ö÷)½ðÓ¡/#change_old_taishou_equip(4)",
			--"»»È¡ÐÂµÄ³ÇÖ÷(¿¤Ö÷)»·Åå/#change_old_taishou_equip(5)",
			"KÕt thóc ®èi tho¹i/no_say")
	elseif nParam == 1 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(0)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu¶n lý thµnh thÞ<color>: Thµnh Chñ (quËn chñ) chiÕn kh«i cña c¸c h¹ lµ míi, kh«ng cÇn ph¶i ®æi l¹i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,103,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."§æi Thµnh Chñ chiÕn kh«i;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu¶n lý thµnh thÞ<color>: H·y mang trªn ng­êi Thµnh Chñ (quËn chñ) chiÕn kh«i råi quay l¹i ®©y.",0)
		end
	elseif nParam == 2 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(1)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu¶n lý thµnh thÞ<color>: Thµnh Chñ (quËn chñ) chiÕn gi¸p cña c¸c h¹ lµ míi, kh«ng cÇn ph¶i ®æi l¹i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,100,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."§æi Thµnh Chñ chiÕn gi¸p;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu¶n lý thµnh thÞ<color>: H·y mang trªn ng­êi Thµnh Chñ (quËn chñ) chiÕn gi¸p råi quay l¹i ®©y.",0)
		end
	elseif nParam == 3 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(3)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu¶n lý thµnh thÞ<color>: Thµnh Chñ quËn chñ) chiÕn trang cña c¸c h¹ ®· ®æi míi, kh«ng cÇn ph¶i ®æi l¹i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,101,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."§æi Thµnh Chñ chiÕn gi¸p;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu¶n lý thµnh thÞ<color>: H·y mang trªn ng­êi Thµnh Chñ (quËn chñ) chiÕn trang råi quay l¹i ®©y",0)
		end
	elseif nParam == 4 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8013 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu¶n lý thµnh thÞ<color>: Thµnh Chñ (QuËn Chóa) kim Ên cña c¸c h¹ ®· ®æi míi, kh«ng cÇn ph¶i ®æi l¹i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."§æi Thµnh Chñ kim Ên;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu¶n lý thµnh thÞ<color>: H·y mang Thµnh Chñ (QuËn Chóa) kim Ên råi l¹i ®©y.",0)
		end
	elseif nParam == 5 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8017 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8017 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu¶n lý thµnh thÞ<color>: Thµnh Chñ (QuËn Chóa) ngäc béi cña c¸c h¹ ®· ®æi míi, kh«ng cÇn ph¶i ®æi thªm",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8017+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."§æi Thµnh Chñ ngäc béi;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu¶n lý thµnh thÞ<color>: Xin h·y mang Thµnh Chñ (QuËn Chóa) ngäc béi råi ®Õn ®©y l¹i.",0)
		end
	end
end

function manage_city()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")

	local ldiff = nTime - GetTime()
	local nDay = floor(ldiff / 86400)
	local nHour = floor(mod(ldiff, 86400) / 3600)
	local nMin = floor(mod(ldiff, 3600) / 60)
	local nSec = mod(ldiff, 60)
	
	if nCount == 0 then
		if GetTongName() ~= szTongName then		-- ²»ÊÇÕ¼Áì³ÇÊÐµÄ°ïÅÉ¶Ô»°
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")			
			Say("Thµnh nµy do <color=yellow>"..szTongViewName.."<color> chiÕm lÜnh", 0)
		else										-- ÊÇÕ¼Áì³ÇÊÐµÄ°ïÅÉ¶Ô»°
			if IsTongMaster() == 1 then				-- ÊÇ°ïÖ÷
				yes_get_boss()
			else
				Say("Thµnh nµy do Quý bang chiÕm lÜnh", 0)
			end
		end
	else
		local szSelfName = GetName()
		if szBoss == szSelfName or szManager == szSelfName then		-- ³ÇÖ÷»ò¾üÊ¦
			local tTab = 
			{
				"NhËn Thµnh §« Ên/manager_getarchivebox",
				--"ÁìÈ¡°ï»á»ù½ð/manager_getmoney",
				--"ÉèÖÃË°ÂÊ/manager_setcess",
				"L·nh B¶o r­¬ng tµi nguyªn/res_box_add",
				"KÕt thóc ®èi tho¹i/no_say"
			}
			Say("Thµnh nµy do Quý bang chiÕm lÜnh", getn(tTab), tTab)
		elseif GetTongName() == szTongName then
			Say("Thµnh nµy do Quý bang chiÕm lÜnh", 1, "Rêi khái/no_say")
		else
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")
			Say("Thµnh nµy do <color=yellow>"..szTongViewName.."<color> chiÕm lÜnh", 0)
		end
	end
end

function mk_taishou_equip()
	Say("<color=green>Qu¶n lý thµnh thÞ<color>: Trang bÞ Thµnh Chñ cã thêi h¹n vÜnh cöu, nh­ng mét khi mÊt ®i danh hiÖu Thµnh Chñ th× sÏ kh«ng mang ®­îc, vµ cho dï mang lªn ®­îc th× còng kh«ng cã bÊt kú hiÖu øng nµo.",
		7,
		"ChÕ t¹o Thµnh Chñ (QuËn Chóa) chiÕn kh«i (8 hßa thÞ bÝch + 15 hoµng kim ®¹i hång bao)/#mk_taishou_ep(10,103,8013)",  --0£¬103£¬8013--0£¬103£¬8016
		"ChÕ t¹o Thµnh Chñ (QuËn Chóa) chiÕn gi¸p (8 hßa thÞ bÝch + 15 hoµng kim ®¹i hång bao)/#mk_taishou_ep(10,100,8013)",   --0£¬100£¬8013--0£¬100£¬8016
		"ChÕ t¹o Thµnh Chñ (QuËn Chóa) chiÕn trang (8 hßa thÞ bÝch + 15 hoµng kim ®¹i hång bao)/#mk_taishou_ep(12,101,8013)",   --0£¬101£¬8013--0£¬101£¬8016
		"ChÕ t¹o Thµnh Chñ (QuËn Chóa) ngäc béi (8 hßa thÞ bÝch + 15 hoµng kim ®¹i hång bao)/#mk_taishou_ep(8,102,8017)", --0£¬102£¬8017--0£¬102£¬8020
		"ChÕ t¹o Thµnh Chñ (QuËn Chóa) kim Ên (8 hßa thÞ bÝch + 15 hoµng kim ®¹i hång bao)/#mk_taishou_ep(0,102,8013)", --0£¬102£¬8013--0£¬102£¬8016
		"NhËn Thµnh Chñ (QuËn Chóa) ngo¹i trang/#mk_taishou_ep_3(0,109,300)",  --0£¬109£¬300 --0£¬109£¬303
		"Rêi khái/no_say")
end

function mk_taishou_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B¹n ®· cã vËt phÈm nµy råi!", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 8 or GetItemCount(2, 1, 539) < 15 then
		Talk(1, "", "Hµnh trang kh«ng ®ñ hßa thÞ bÝch hoÆc hoµng kim ®¹i hång bao.");
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh«ng ph¶i lµ Thµnh Chñ cña thµnh nµy, kh«ng thÓ nhËn ®­îc lo¹i trang bÞ nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[C«ng thµnh chiÕn]:"..GetName().."ChÕ ra 1 trang bÞ Thµnh Chñ (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			if nDetail == 109 then
				local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
				SetItemExpireTime(nIndex, nTime - GetTime())
			else
				AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			end
			WriteLog("[C«ng thµnh chiÕn]:"..GetName().."ChÕ ra 1 trang bÞ Thµnh Chñ (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	end
end

function mk_taishou_ep_1(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8013 + nBody) > 0 then
		Say("B¹n ®· cã vËt phÈm nµy råi!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("Ban kh«ng mang theo ®ñ N÷ Oa Tinh Th¹ch"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh«ng ph¶i lµ Thµnh Chñ cña thµnh nµy, kh«ng thÓ nhËn ®­îc lo¹i trang bÞ nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,100,8013+nBody,1,1,4,394,-1,-1,-1,-1)
		WriteLog("[C«ng thµnh chiÕn]:"..GetName().."ChÕ ra 1 trang bÞ Thµnh Chñ+ s¸t th­¬ng(0,100"..(8013+nBody)..")")
	end
end

function mk_taishou_ep_3(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B¹n ®· cã vËt phÈm nµy råi!", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh«ng ph¶i lµ Thµnh Chñ cña thµnh nµy, kh«ng thÓ nhËn ®­îc lo¹i trang bÞ nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end	

	if nDetail == 109 then
			local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
			SetItemExpireTime(nIndex, nTime - GetTime())
	end
end

function mk_taishou_ep_2(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,101,8013 + nBody) > 0 then
		Say("B¹n ®· cã vËt phÈm nµy råi!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("Ban kh«ng mang theo ®ñ N÷ Oa Tinh Th¹ch"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh«ng ph¶i lµ Thµnh Chñ cña thµnh nµy, kh«ng thÓ nhËn ®­îc lo¹i trang bÞ nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,101,8013+nBody,1,1,2,268,-1,-1,-1,-1)
		WriteLog("[C«ng thµnh chiÕn]:"..GetName().."ChÕ ra 1 trang bÞ Thµnh Chñ+ s¸t th­¬ng(0,101"..(8013+nBody)..")")
	end
end

function mk_tixia_equip()
	Say("<color=green>Qu¶n lý thµnh thÞ<color>: Trang bÞ Danh Bé cã thêi h¹n vÜnh cöu, nh­ng mét khi mÊt ®i danh hiÖu Thµnh Chñ th× sÏ kh«ng mang ®­îc vµ cho dï mang lªn ®­îc th× còng kh«ng cã bÊt kú hiÖu øng nµo.",
		7,
		"ChÕ t¹o Danh Bé chiÕn kh«i (4 hßa thÞ bÝch + 6 hoµng kim ®¹i hång bao)/#mk_tixia_ep(0,103,8005)",  	--0£¬103£¬8005--0£¬103£¬8008
		"ChÕ t¹o Danh Bé chiÕn gi¸p (4 hßa thÞ bÝch + 6 hoµng kim ®¹i hång bao)/#mk_tixia_ep(0,100,8005)",  	--0£¬100£¬8005--0£¬100£¬8008
		"ChÕ t¹o Danh Bé chiÕn trang (4 hßa thÞ bÝch + 6 hoµng kim ®¹i hång bao)/#mk_tixia_ep(0,101,8005)",  	--0£¬101£¬8005 -0£¬101£¬8008
		"ChÕ t¹o Danh Bé liªn kh¶o  (4 hßa thÞ bÝch + 6 hoµng kim ®¹i hång bao)/#mk_tixia_ep(0,102,8005)",						--0£¬102£¬8005--0£¬102£¬8008
		"ChÕ t¹o Danh Bé lÖnh (4 hßa thÞ bÝch + 6 hoµng kim ®¹i hång bao)/#mk_tixia_ep(0,102,8023)",                    	--0£¬102£¬8023--0£¬102£¬8026
		"NhËn Danh Bé ngo¹i trang/mk_tixia_wai",
		"Rêi khái/no_say")
end

function mk_tixia_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B¹n ®· cã vËt phÈm nµy råi!", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 4 or GetItemCount(2, 1, 539) < 6 then
		Talk(1, "", "Hµnh trang kh«ng ®ñ hßa thÞ bÝch hoÆc hoµng kim ®¹i hång bao.");
		return
	end
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("C¸c h¹ kh«ng ph¶i lµ Danh Bé thµnh nµy, kh«ng thÓ nhËn lo¹i trang bÞ nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			Msg2Player("C¸c h¹ nhËn ®­îc 1 trang bÞ Danh Bé")
			WriteLog("[C«ng thµnh chiÕn]:"..GetName().."ChÕ t¹o 1 trang bÞ Danh Bé (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[C«ng thµnh chiÕn]:"..GetName().."ChÕ t¹o 1 trang bÞ Danh Bé (0,"..nDetail..","..(nParticular+nBody)..")")
			Msg2Player("C¸c h¹ nhËn ®­îc 1 trang bÞ Danh Bé")
		end
	end
end

function mk_tixia_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,308+nBody) > 0 and BigGetItemCount(0,108,300+nBody) > 0 and
	 	BigGetItemCount(0,110,300+nBody) > 0 then
		Say("C¸c h¹ ®· cã ®ñ bé trang bÞ Danh Bé råi.", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("C¸c h¹ kh«ng ph¶i lµ Danh Bé thµnh nµy, kh«ng thÓ nhËn lo¹i trang bÞ nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(3, 150) == 0 then
		return
	end
	
	if BigGetItemCount(0,109,308+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,308+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("C¸c h¹ ®· cã ®ñ 1 bé ngo¹i trang Danh Bé råi.")
end

function get_shiye_equip()
	Say("<color=green>Qu¶n lý thµnh thÞ<color>: Trang bÞ Qu©n S­ ®­îc hîp bëi ngo¹i trang Qu©n S­ vµ 1 bé trang søc Qu©n S­",
		4,
		"ChÕ t¹o trang søc TrÝ Gi¶ CÈm Nang (5 hßa thÞ bÝch + 7 hoµng kim ®¹i hång bao)/mk_shiye_ring_1",
		"ChÕ t¹o trang søc Th¸nh HiÒn Ngäc Béi (5 hßa thÞ bÝch + 7 hoµng kim ®¹i hång bao)/mk_shiye_ring_2",
		"NhËn ngo¹i trang Qu©n S­/mk_shiye_wai",
		"Rêi khái/no_say")
end

function mk_shiye_ring_1()
	if BigGetItemCount(0,102,8021) > 0 then
		Say("C¸c h¹ ®· cã TrÝ Gi¶ CÈm Nang råi.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "Hµnh trang kh«ng ®ñ hßa thÞ bÝch hoÆc hoµng kim ®¹i hång bao.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("§¹i hiÖp kh«ng ph¶i lµ Qu©n S­ thµnh nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8021) < 1 then
			local nResult, nIndex = AddItem(0,102,8021, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("§¹i hiÖp nhËn ®­îc 1 TrÝ Gi¶ CÈm Nang")
	end
end

function mk_shiye_ring_2()
	if BigGetItemCount(0,102,8022) > 0 then
		Say("C¸c h¹ ®· cã Th¸nh HiÒn Ngäc Béi råi.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "Hµnh trang kh«ng ®ñ hßa thÞ bÝch hoÆc hoµng kim ®¹i hång bao.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("§¹i hiÖp kh«ng ph¶i lµ Qu©n S­ thµnh nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8022) < 1 then
			local nResult, nIndex = AddItem(0,102,8022, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("§¹i hiÖp nhËn ®­îc 1 Th¸nh HiÒn Ngäc Béi.")
	end
end

function mk_shiye_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,304+nBody) > 0 then
		Say("§¹i hiÖp ®· ®ñ 1 bé ngo¹i trang Qu©n S­", 0)
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("§¹i hiÖp kh«ng ph¶i lµ Qu©n S­ thµnh nµy.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if BigGetItemCount(0,109,304+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,304+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("§¹i hiÖp thu ®­îc ngo¹i trang Qu©n S­.")
end

function get_weibing_suit()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8009+nBody) > 0 and BigGetItemCount(0,101,8009+nBody) > 0 and
		BigGetItemCount(0,103,8009+nBody) > 0 and BigGetItemCount(0,102,8009+nBody) > 0 and
		BigGetItemCount(0,110,221+nBody) > 0 and BigGetItemCount(0,108,481+nBody) > 0 and
		BigGetItemCount(0,109,491+nBody) > 0 then
		
		Say("B¹n ®· cã 1 bé VÖ binh Kh«i gi¸p!", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(6, 250) == 0 then
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	
	if BigGetItemCount(0,100,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,100,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,101,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,101,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,103,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,103,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,102,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,102,8009+nBody,1,1,-1,-1,-1,-1,-1,-1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,221+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,221+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,481+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,481+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,109,491+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,491+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	Msg2Player("B¹n nhËn ®­îc 1 bé VÖ binh Kh«i gi¸p")
end

function yes_get_boss()
	local nMapID = GetWorldPos()
	local tMapTitleID =
	{
		[300] = {51, 1},
		[100] = {51, 5},
		[350] = {51, 9},
	}
	if tMapTitleID[nMapID] == nil then		-- ³ö´íÁË
		Talk(1,"","<color=red>Sö dông script [C«ng thµnh chiÕn] bæ nhiÖm Thµnh Chñ lçi! Xin h·y b¸o l¹i cho nhµ ph¸t hµnh!!<color>")
		return
	end
	
	local nRet = SetCityWarPlayerDuty(nMapID, 0)
	if nRet == -1 then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
	elseif nRet == 1 then
		Say("Thµnh thÞ n·y ®· cã 1 Thµnh Chñ hoÆc ng­¬i ®· cã mét chøc vô kh¸c, kh«ng thÓ nhËn thªm chøc t­íc.", 0)
	elseif nRet == 0 then
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nDetail = tMapTitleID[nMapID][2] + GetSex() - 1
		AddTitle(tMapTitleID[nMapID][1], nDetail)
		SetCurTitle(tMapTitleID[nMapID][1], nDetail)
		SaveNow()
		Say("B¹n ®¶m nhËn chøc "..get_tong_sex_name(), 2, "Vµo Qu¶n lý thµnh thÞ/manage_city", "Rêi khái/no_say")
		WriteLog("C«ng thµnh chiÕn-Qu¶n lý:"..GetTongName().."-"..GetName().." trë thµnh Thµnh Chñ")
	end
end

function manager_getarchivebox()
	if Zgc_pub_goods_add_chk(1, 1) == 0 then		-- Õâ¸öÅÐ¶ÏÒªÏÈ×ö£¬ÒòÎªCanGetArchiveBox²Ù×÷³É¹¦¾ÍÈÏÎªÁìÈ¡³É¹¦ÁË
		return
	end
	local nMapID = GetWorldPos()
	local nRet = CanGetArchiveBox(nMapID)
	if nRet == -1 then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
	elseif nRet == 7 then
		Say("Quý bang ®· nhËn Thµnh §« Ên råi", 0)
	elseif nRet == 5 or nRet == 6 then
		Say("ChØ cã Thµnh Chñ míi cã thÓ nhËn ®­îc Thµnh §« Ên", 0)
	elseif nRet == 0 then
		local _, nIdx = AddItem(2 ,1 ,1207 ,1 , 1)
		local nMapID = GetWorldPos()
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nExpireTime = nTime - GetTime() - 64800
		if nExpireTime < 0 then								-- ³ö´íÁË£¬ÖÁÉÙ¸øÍæ¼Ò3ÌìÊ±¼ä°É
			nExpireTime = 3 * 24 * 3600
		end
		SetItemParam(nIdx, 0, nMapID)						-- ÄÄ¸ö³ÇÊÐµÄ
		SetItemParam(nIdx, 1, 0)							-- ¾üÊ¦µÄÊýÁ¿
		SetItemParam(nIdx, 2, 0)							-- Ãû²¶µÄÊýÁ¿
		SetItemExpireTime(nIdx, nExpireTime)				-- ÎïÆ·µ½Ê±¼äÏûÊ§
		SaveNow()
		Msg2Player("Thu ®­îc 1 Thµnh §« Ên")
		SendTongMessage(GetName().."§· nhËn ®­îc Thµnh §« Ên")
		WriteLog("C«ng thµnh chiÕn-Qu¶n lý:"..GetTongName().."-"..GetName().."Rót ®­îc 1 Thµnh §« Ên")
	end
end

function manager_getmoney()
	
end

function yes_get_money(nGold)
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 0)
	if nCD == -1 then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
	elseif nCD > 2100000000 then
		print("Kh«ng cã thao t¸c nµy ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("Cßn cÇn "..nHour.."h "..nMin.." Phót "..nSec.." gi©y n÷a míi tiÕn hµnh ®­îc thao t¸c nµy!", 0)
	elseif nCD == 0 then
		local _1, _2, _3, _4, nMoney = GetCityWarInfo(nMapID, "base")
		local nGetMaxMoney = (1000000 + (GetLevel() - 1) * 500000) * 2
		
		local nMax = 0
		if nGold < nGetMaxMoney then
			nMax = nGold
		else
			nMax = nGetMaxMoney
		end
		if nGold <= nMax then
			-- ¾­¹ýÇ°Ãæ²ã²ã¼ì²â»¹³ö´í¾Í²»ÐèÒª¸øÌáÊ¾ÁË..Ö±½Ó·âÉ±
			local nMapID = GetWorldPos()
			local nRet = GetCityWarMoney(nMapID, nMax)
		end
	end
end

function manager_setcess()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore = GetCityWarInfo(nMapID, "base")
	if szTongName == nil then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
		return
	end
	Say("Quý bang ®· thiÕt lËp thuÕ suÊt buèn b¸n lµ <color=yellow>"..(nCessBuysell / 10).."%<color>, thuÕ bµy b¸n lµ <color=yellow>"..(nCessStore / 10).."%<color>. Cã ph¶i muèn thay ®æi?",
		2, --"¸ü¸ÄÂòÂôË°/change_mai_cess", 
		"Thay ®æi thuÕ bµy b¸n/change_bai_cess",
		"Rêi khái/no_say")
end

function change_mai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 1)
	if nCD == -1 then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
	elseif nCD > 2100000000 then
		print("Kh«ng cã thao t¸c nµy ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("Cßn cÇn "..nHour.."h "..nMin.." Phót "..nSec.." gi©y n÷a míi tiÕn hµnh ®­îc thao t¸c nµy!", 0)
	elseif nCD == 0 then
		AskClientForNumber("yes_change_mai_cess", 0, 100, "§¬n vÞ: phÇn ngµn")
	end
end

function change_bai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 2)
	if nCD == -1 then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
	elseif nCD > 2100000000 then
		print("Kh«ng cã thao t¸c nµy ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("Cßn cÇn "..nHour.."h "..nMin.." Phót "..nSec.." gi©y n÷a míi tiÕn hµnh ®­îc thao t¸c nµy!", 0)
	elseif nCD == 0 then
		AskClientForNumber("yes_change_bai_cess", 0, 100, "§¬n vÞ: phÇn ngµn")
	end
end

function yes_change_mai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 0, n)
		if nRet == 0 then
			Msg2Player("B¹n ®· thiÕt lËp thuÕ mua b¸n lµ: "..(n / 10).."%")
		end
	end
end

function yes_change_bai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 1, n)
		if nRet == 0 then
			Msg2Player("B¹n ®· thiÕt lËp thuÕ bµy b¸n lµ: "..(n / 10).."%")
		end
	end
end

function res_box_add()
	--ÁìÈ¡È¨ÏÞÅÐ¶Ï
	local nMapID, nDuty = GetCityWarDutyFlag()
	local Map_ID_player = GetWorldPos()
	if Map_ID_player ~= nMapID or (nDuty ~= 1 and nDuty ~= 0 )then
		Talk(1,"","<color=yellow>Qu¶n lý thµnh thÞ<color>: ChØ cã bæn <color=yellow> Thµnh Chñ <color>vµ <color=yellow>Qu©n S­<color> míi cã thÓ nhËn ®­îc <color=yellow> b¶o r­¬ng tµi nguyªn<color>?")
		return
	end
	--Ê±¼ä¶ËÅÐ¶Ï
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local nDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H"))
	if (nDay == 3 and nHour < 21) or nDay == 0 or nDay == 1 or nDay == 2 or nDay == 6 or nDay == 5 then
		Talk(1,"","Thêi gian ®Ó l·nh <color=yellow>B¶o r­¬ng tµi nguyªn<color> lµ gi÷a thêi gian <color=yellow>B¶o hé tµi nguyªn chiÕn (mçi tèi thø T­ tõ 19h-20h)<color> vµ <color=yellow>thø N¨m<color> mçi tuÇn")
		return
	end
	--¶Ô»°
	local box_num = GetCityBoxCount(Map_ID_player) - 10	
	if box_num <= 0 then
		Talk(1,"","HiÖn kh«ng cã <color=yellow>B¶o r­¬ng tµi nguyªn<color> nµo ®Ó l·nh!")
		return
	else
		Say("TuÇn nµy quý bang cßn <color=yellow>"..box_num.."<color> <color=yellow>B¶o r­¬ng tµi nguyªn<color> cã thÓ l·nh! B©y giê l·nh chø?",
		2,
		"L·nh th­ëng/res_box_get",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	end
end
--×ÊÔ´±¦ÏäµÄ»ñÈ¡
function res_box_get()
	local Map_ID_player = GetWorldPos()
	local box_num = GetCityBoxCount(Map_ID_player) - 10
	--ÊýÁ¿¼ì²â£¬·½Ê½¼¸¸öÈËÍ¬Ê±µã
	if box_num <= 0 then
		return
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(box_num+2,box_num) ~= 1 then
		return
	end
	--Ôö¼Ó
		--ÏÈ¼õÉÙÊýÁ¿
	if AddCityBoxCount(Map_ID_player,-(box_num + 10)) > 0 then			
		local nRet, nItemIdx = 0,0
		for i=1,box_num do
			nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet ==1 then
				SetItemExpireTime(nItemIdx,24*60*60)
			end
		end
		SendTongMessage(GetName().." §· nhËn cho bang m×nh "..box_num.." R­¬ng tµi nguyªn!")
		WriteLogEx("Cong Thanh Chien","B¶o vÖ tµi nguyªn",box_num,"R­¬ng tµi nguyªn","",GetTongName())
		Talk(1,"","Ng­¬i ®· nhËn "..box_num.." <color=yellow>B¶o r­¬ng tµi nguyªn<color>, nhÊp chuét ph¶i ph¶i nhËn ®­îc tµi nguyªn trong ®ã!")
		if box_num >= 20 then
			nRet, nItemIdx = AddItem(2,1,1067,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." §· nhËn cho bang m×nh 1 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch")
				WriteLogEx("Cong Thanh Chien","B¶o vÖ tµi nguyªn",1,"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch","",GetTongName())
			end
		elseif box_num >= 15 then
			nRet, nItemIdx = AddItem(2,1,1068,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." §· nhËn cho bang m×nh 1 Thiªn Th¹ch Linh Th¹ch")
				WriteLogEx("Cong Thanh Chien","B¶o vÖ tµi nguyªn",1,"Thiªn Th¹ch Linh Th¹ch","",GetTongName())
			end
		elseif box_num >= 10 then
			nRet, nItemIdx = AddItem(2,1,1001,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." §· nhËn cho bang m×nh 1 Hßa ThÞ BÝch")
				WriteLogEx("Cong Thanh Chien","B¶o vÖ tµi nguyªn",1,"Hßa ThÞ BÝch","",GetTongName())
			end
		end			
	end
end

function jieshao_city()
	Say("ThuyÕt minh qu¶n lý thµnh thÞ", 3, "ThuyÕt minh X­ng hiÖu/chenghao_shuoming", "ThuyÕt minh X­ng hiÖu Trang bÞ/fuli_shuoming", "KÕt thóc ®èi tho¹i/no_say")
end

function chenghao_shuoming()
	Say("Danh hiÖu: Sau khi kÕt thóc c«ng thµnh chiÕn vµ bang chñ sÏ ®Õn NPC qu¶n lý thµnh thÞ nhËn danh hiÖu Thµnh Chñ vµ bæ nhiÖm th­. Ng­êi ch¬i cÇn ph¶i kÝch ho¹t danh hiÖu Thµnh Chñ míi cã thÓ thùc thi c¸c quyÒn lùc Thµnh Chñ. C¸c lo¹i danh hiÖu c«ng thµnh chiÕn kh«ng thÓ nh­êng hoÆc ®æi cho ng­êi kh¸c\nBæ nhiÖm th­: Thµnh Chñ ®Õn qu¶n lý thµnh thÞ ®Ó nhËn 1 tiÕn cö Qu©n S­ vµ 4 tiÕn cö bæ ®Çu. Thµnh Chñ ph¶i tiÕn hµnh tæ ®éi víi ng­êi cÇn bæ nhiÖm råi tra quyÒn lùc t­¬ng øng, khi ng­êi ch¬i sö dông bæ nhiÖm th­ sÏ thu ®­îc danh hiÖu t­¬ng øng.\nH¹n chÕ sö dông bæ nhiÖm th­: Ng­êi ch¬i ®· cã c¸c danh hiÖu (Thµnh Chñ, Thµnh Chñ, Danh Bé) th× kh«ng thÓ sö dông thªm bæ nhiÖm th­, tÊt c¶ c¸c lo¹i bæ nhiÖm th­ sÏ biÕn mÊt vµo s¸ng thø 7, danh hiÖu sÏ biÕn mÊt sau khi kÕt thóc c«ng thµnh.", 3, "ThuyÕt minh chøc vô/zhiwu_shuoming", "trë l¹i/jieshao_city", "KÕt thóc ®èi tho¹i/no_say")
end

function zhiwu_shuoming()
	Say("Chó thÝch chøc vô:", 2, "trë l¹i/jieshao_city", "KÕt thóc ®èi tho¹i/no_say")
end

function ziyuan_shuoming()
	Say("B¶o hé Tµi nguyªn: Cèng phÈm cho triÒu ®×nh sÏ do Bang ph¸i Thµnh Chñ chuyÓn ®i. Sè tµi nguyªn nµy cã 4 phÇn sÏ ®­îc trùc tiÕp ®­a vµo thµnh, 6 phÇn cßn l¹i sÏ bÞ l­u l¹i ë 2 thµnh thÞ l©n cËn trong vßng 2 canh giê, cÇn cã Bang ph¸i Thµnh Chñ tù b¶o vÖ. C¸c tµi nguyªn kh«ng bÞ c­íp vµ c¸c tµi nguyªn ®­îc ®­a trùc tiÕp vµo thµnh sÏ ®­îc b¶o qu¶n t¹i chç Qu¶n thµnh sø.", 3, "Xem c¸c ®Þa ®iÓm b¶o hé Tµi nguyªn/wuzi_didian", "trë l¹i/jieshao_city", "KÕt thóc ®èi tho¹i/no_say")
end

function wuzi_didian()
	Say("§Þa ®iÓm tµi nguyªn: \nThµnh §«: Nam m«n (189.191); (192.186); (188. 186)\n B¾c m«n (181.198); (186.194); (178.191)",  2, "trë l¹i/jieshao_city", "KÕt thóc ®èi tho¹i/no_say")
	--\n	ÈªÖÝ£ºÈªÖÝ¸®±± £¨189£¬191£©£¨184£¬195£©£¨192£¬195£©\n      ÈªÖÝ¸®Î÷ £¨195£¬196£©£¨190£¬196£©£¨184£¬194£©\n	ÏåÑô£ºÁé±¦É½   £¨207£¬221£©£¨214£¬220£©£¨221£¬221£©\n      ÎäÁêÉ½   £¨195£¬177£©£¨192£¬183£©£¨187£¬180£©", 2, "·µ»Ø/jieshao_city", "½áÊø¶Ô»°/no_say")
end

function fuli_shuoming()
	Say("ThuyÕt minh X­ng hiÖu Trang bÞ: Ng­êi ch¬i cã X­ng hiÖu ®Æc biÖt cã thÓ l·nh hoÆc chÕ t¹o trang bÞ ®Æc biÖt, toµn bé thµnh viªn trong bang héi ®Òu cã thÓ l·nh VÖ binh Kh«i gi¸p vµ ngo¹i trang thµnh thÞ", 2, "trë l¹i/jieshao_city", "KÕt thóc ®èi tho¹i/no_say")
end

function no_say()
end
