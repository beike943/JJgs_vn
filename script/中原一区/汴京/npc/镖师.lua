
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ïÚÊ¦½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\task\\teach\\teach_main.lua");

g_InfoHeader_BSh = "<color=green>Tiªu S­<color>: "
g_szThisFile = "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ïÚÊ¦.lua"

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00();
		return
	else
		Say("<color=green>Tiªu s­<color>: Huhu, ngµy ®©y mai ®ã, kh«ng biÕt khi nµo tÊm x­¬ng kh« nµy cã chç dõng ch©n.",
			2,
			"NhËn phÇn th­ëng ho¹t ®éng bang héi tinh anh/first_tong_event",
			"KÕt thóc ®èi tho¹i/no"
		)
	end;
end;

function first_tong_event()
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ng­¬i kh«ng gia nhËp bang héi, v× vËy kh«ng thÓ nhËn phÇn th­ëng ho¹t ®éng bang héi tinh anh!", 0)
		return
	end
	ApplyRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "first_tong_prize_cb")
end

function first_tong_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_InfoHeader_BSh.."VÞ ®¹i hiÖp nµy kh«ng phï hîp víi ®iÒu kiÖn nhËn th­ëng!", 0)
		return
	end
	local nDateStart, nPrizeFlag, szTongName = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."VÞ ®¹i hiÖp nµy kh«ng phï hîp víi ®iÒu kiÖn nhËn th­ëng!", 0)
		return
	end

	local selTab = {
--				format("ÁìÈ¡°ïÖ÷½±Àø/#get_first_tong_reward_1(%d,%d,\"%s\")",nDateStart, nPrizeFlag, szTongName),
				format("NhËn phÇn th­ëng bang chóng/#get_first_tong_reward_2(%d,\"%s\")",nDateStart, szTongName),
				"Redeem later/no",
				}
	Say(g_InfoHeader_BSh.."Xin mêi chän phÇn th­ëng!",getn(selTab),selTab)
end

function get_first_tong_reward_1(nDateStart, nPrizeFlag, szTongName)
	if IsTongMember() ~= 1 then
		Say(g_InfoHeader_BSh.."ChØ cã bang chñ míi cã thÓ nhËn phÇn th­ëng nµy.", 0)
		return
	end
	if nPrizeFlag == 0 then
		Say(g_InfoHeader_BSh.."§¹i hiÖp ®· nhËn qua phÇn th­ëng bang chñ råi, ng­¬i chØ ®­îc nhËn 1 lÇn.", 0)
		return
	end
	local selTab = {
				format("Ta muèn l·nh ngay/#obtain_first_tong_reward_1(%d,%d,\"%s\")",nDateStart, nPrizeFlag, szTongName),
				"§îi ta kiÓm tra l¹i!/no",
				}
	Say(g_InfoHeader_BSh.."Ng­¬i cã ch¾c b©y giê muèn nhËn phÇn th­ëng bang héi?",getn(selTab),selTab)
end

function obtain_first_tong_reward_1(nDateStart, nPrizeFlag, szTongName)
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ng­¬i kh«ng gia nhËp bang héi, v× vËy kh«ng thÓ nhËn phÇn th­ëng ho¹t ®éng bang héi tinh anh!", 0)
		return
	end
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."VÞ ®¹i hiÖp nµy kh«ng phï hîp víi ®iÒu kiÖn nhËn th­ëng!", 0)
		return
	end
	if IsTongMember() ~= 1 then
		Say(g_InfoHeader_BSh.."ChØ cã bang chñ míi cã thÓ nhËn phÇn th­ëng nµy.", 0)
		return
	end
	if nPrizeFlag == 0 then
		Say(g_InfoHeader_BSh.."§¹i hiÖp ®· nhËn qua phÇn th­ëng bang chñ råi, ng­¬i chØ ®­îc nhËn 1 lÇn.", 0)
		return
	end
	
	if gf_Judge_Room_Weight(9,50) == 0 then
		Say(g_InfoHeader_BSh.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!", 0)
		return
	end
	
	Earn(50000000)--¸ÄÎª»Æ½ð5000Á½
	WriteLog("[Jx2 First Guild]: [Role Name:"..GetName().."]  Obtain 5000 gold.")

	if random(1, 100) > 50 then
		if AddItem(0,107,155,1,1) == 1 then			--ÎåÐÐÃØ¼®
			Msg2Player("B¹n nhËn ®­îc 1 quyÓn  ".."Ngò Hµnh MËt tÞch");
			WriteLog("[Jx2 First Guild]:"..GetName().." B¹n nhËn ®­îc 1 quyÓn  ".."Ngò Hµnh MËt tÞch");
		else
			WriteLog("[Jx2 First Guild]:"..GetName().." B¹n nhËn ®­îc 1 quyÓn  ".."Ngò Hµnh MËt tÞch");
		end
	else
		local tBookList = {
			--  "Ãû×Ö",						G1,G2,G3,ÊýÁ¿
			[1] = { "Kim Cang Phôc Ma T©m Ph¸p",	0,107, 2,1},
			[2] = { "TiÒm Long T©m Ph¸p",		0,107, 4,1},
			[3] = { "V« TrÇn T©m Ph¸p",		0,107, 6,1},
			[4] = { "Thiªn La T©m Ph¸p",		0,107, 8,1},
			[5] = { "Nh­ ý T©m Ph¸p",		0,107,10,1},
			[6] = { "BÝch H¶i T©m Ph¸p",		0,107,12,1},
			[7] = { "Hçn §én T©m Ph¸p",		0,107,14,1},
			[8] = { "Quý Thiªn T©m Ph¸p",		0,107,16,1},
			[9] = { "HuyÒn ¶nh T©m Ph¸p",		0,107,18,1},
			[10] = {"Qu©n Tö T©m Ph¸p",		0,107,20,1},
			[11] = {"TrÊn Qu©n T©m Ph¸p",		0,107,22,1},
			[12] = {"Xuyªn V©n T©m Ph¸p",		0,107,24,1},
			[13] = {"U Minh T©m Ph¸p",		0,107,26,1},
			[14] = {"Linh Cæ T©m Ph¸p",		0,107,28,1},
			[15] = {"Kim Cang Phôc Ma kinh",	0,107, 1,1},
			[16] = {"TiÒm Long MËt tÞch",		0,107, 3,1},
			[17] = {"V« TrÇn MËt tÞch",		0,107, 5,1},
			[18] = {"Thiªn La MËt TÞch",		0,107, 7,1},
			[19] = {"Nh­ ý MËt TÞch",		0,107, 9,1},
			[20] = {"BÝch H¶i Phæ",		0,107,11,1},
			[21] = {"Hçn §én MËt tÞch",		0,107,13,1},
			[22] = {"Quý Thiªn MËt tÞch",		0,107,15,1},
			[23] = {"HuyÒn ¶nh MËt tÞch",		0,107,17,1},
			[24] = {"Qu©n Tö MËt tÞch",		0,107,19,1},
			[25] = {"TrÊn Qu©n MËt tÞch",		0,107,21,1},
			[26] = {"Xuyªn V©n MËt tÞch",		0,107,23,1},
			[27] = {"U Minh Quû Lôc",		0,107,25,1},
			[28] = {"Linh Cæ MËt tÞch",		0,107,27,1},
		}

		gf_SetLogCaption("Jx2 First Guild")
		local nRandom = random(1,28)
		gf_AddItemEx({tBookList[nRandom][2],tBookList[nRandom][3],tBookList[nRandom][4],tBookList[nRandom][5],1}, tBookList[nRandom][1]);
		gf_SetLogCaption("")
	end
	
	local nPrizeFlagNew = 0;
	AddRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "", 0, "0", "dds", nDateStart, nPrizeFlagNew, szTongName)
end

function get_first_tong_reward_2(nDateStart, szTongName)
	local nDateNow = tonumber(date("%y%m%d"))
	if nDateNow <= nDateStart then
		Say(g_InfoHeader_BSh.."VÞ ®¹i hiÖp nµy kh«ng phï hîp víi ®iÒu kiÖn nhËn th­ëng!", 0)
		return
	end

	local selTab = {
				format("Ta muèn l·nh ngay/#obtain_first_tong_reward_2(%d,\"%s\")",nDateStart, szTongName),
				"§îi ta kiÓm tra l¹i!/no",
				}
	Say(g_InfoHeader_BSh.."Ng­¬i cã ch¾c b©y giê muèn nhËn phÇn th­ëng bang chóng?",getn(selTab),selTab)
end

function obtain_first_tong_reward_2(nDateStart, szTongName)
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ng­¬i kh«ng gia nhËp bang héi, v× vËy kh«ng thÓ nhËn phÇn th­ëng ho¹t ®éng bang héi tinh anh!", 0)
		return
	end
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."VÞ ®¹i hiÖp nµy kh«ng phï hîp víi ®iÒu kiÖn nhËn th­ëng!", 0)
		return
	end
	local nDateNow = tonumber(date("%y%m%d"))
	if nDateNow <= nDateStart then
		Say(g_InfoHeader_BSh.."VÞ ®¹i hiÖp nµy kh«ng phï hîp víi ®iÒu kiÖn nhËn th­ëng!", 0)
		return
	end
	if nDateNow <= GetTask(2446) then
		Say(g_InfoHeader_BSh.."Ng­¬i ®· nhËn hÕt phÇn th­ëng h«m nay råi, ngµy mai l¹i ®Õn nhÐ!",0)
		return
	end

	local tItemInfo = {"Bång Lai Lé Thñy", "Bång Lai Tiªn Thñy", "Bång Lai Tiªn Lé", "Bång Lai Tiªn §¬n"}
	local nType, nTime, nSpeed = GetExistXclInfo()
	if nTime > 0 then
		if nSpeed == 300 then
			Say("B¹n nhËn ®­îc hiÖu qu¶ "..tItemInfo[4].."  cña hiÖu qu¶, kh«ng thÓ ®æi b»ng  "..tItemInfo[3], 0)
		elseif nSpeed == 200 then
			obtain_xcl_reward();
		elseif nSpeed == 150 then
			Say(g_InfoHeader_BSh.."HiÖn b¹n b¹n cã  "..tItemInfo[2].." , muèn ®æi thµnh "..tItemInfo[3].."?\n<color=red>Chó ý: Sau khi thay ®æi thêi gian hiÖu qu¶ ban ®Çu sÏ trë vÒ 0<color>", 2, "Yes/obtain_xcl_reward", "No/no")
		elseif nSpeed == 120 then
			Say(g_InfoHeader_BSh.."HiÖn b¹n b¹n cã  "..tItemInfo[1].." , muèn ®æi thµnh "..tItemInfo[3].."?\n<color=red>Chó ý: Sau khi thay ®æi thêi gian hiÖu qu¶ ban ®Çu sÏ trë vÒ 0<color>", 2, "Yes/obtain_xcl_reward", "No/no")
		end
	else
		obtain_xcl_reward()
	end
end

function obtain_xcl_reward()
	local nDate = tonumber(date("%y%m%d"))
	if EatXcl(2,3600) == 1 then
		SetTask(2446,nDate)
		Say(g_InfoHeader_BSh.."Ng­¬i nhËn ®­îc 1 giê ®¸nh qu¸i nh©n ®«i kinh nghiÖm",0)
		Msg2Player("Ng­¬i nhËn ®­îc 1 giê ®¸nh qu¸i nh©n ®«i kinh nghiÖm")
		WriteLog("[Jx2 First Guild]: [Role Name:"..GetName().."] obtained 1 hours of 2 times EXP effect.");
	end
end

function no()
end

