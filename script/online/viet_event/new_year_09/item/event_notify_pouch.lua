--File name:	event_notify_pouch.lua
--Describe:		½õÄÒ´óÊÂ¼þ½Å±¾
--Item ID:		2,1,30045
--Create Date:	2008-12-26
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")


g_szLogTitle = "N¨m míi mõng xu©n : ".."CÈm Nang §¹i Sù KiÖn"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë

g_szFileName = "\\script\\online\\viet_event\\new_year_09\\item\\event_notify_pouch.lua"

g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}

function OnUse()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"", "Ho¹t ®éng tÕt ®· kÕt thóc.");
		return
	end

	local selTab = {
			"Mai - §µo chóc tÕt./#new_year_09_info_viet(1)",
			"Ng­u V­¬ng H¹ ThÕ./#new_year_09_info_viet(2)",
			"Tiªn Tö Trë L¹i./#new_year_09_info_viet(3)",
			"H¹t gièng h¹nh phóc./#new_year_09_info_viet(4)",
			"Mua nh¸nh hoa ®µo (1 vµng 50 b¹c)/buy_peach",
			"NhËn [Tói Léc Mõng Xu©n]/want_new_bag",
			"KÕt thóc ®èi tho¹i/no"
			}
	
	Say("N¨m hÕt tÕt ®Õn bæn trang xin chóc tÊt c¶ vâ l©m nh©n sü n¨m míi vui vÎ, an khang thÞnh v­îng. \nThêi gian ho¹t ®éng tÕt diÔn ra tõ 16-01-2009 ®Õn 24:00 15-02-2009. Chi tiÕt ho¹t ®éng:\n",getn(selTab),selTab)
end

function buy_peach()
	if GetCash() < 15000 then
		Talk(1,"","§¹i hiÖp kh«ng ®ñ ng©n l­îng trªn ng­êi råi!")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	if pay_ex(15000) == 1 then
		add_item_ex( {"Nh¸nh §µo",	2,	1,	30050,	1},"mua" )
	else
		Talk(1,"","§¹i hiÖp kh«ng ®ñ ng©n l­îng trªn ng­êi råi!")
		return
	end
	OnUse()
end

function new_year_09_info_viet(nType)
	local selTab =
	{
		{
		"- Trong thêi gian ho¹t ®éng, ng­êi ch¬i cã thÓ th«ng qua ®¸nh qu¸i, nhiÖm vô s­ m«n, tµng kiÕm s¬n trang, s¸t thñ ®­êng, th¸i h­, tö quang c¸c ®Ó thu ®­îc Tói Léc Mõng Xu©n. \n- Më Tói Léc Mõng Xu©n sÏ thu ®­îc nguyªn liÖu trång hoa Mai vµ §µo \n- ng­êi ch¬i cã thÓ mua nh¸nh hoa §µo ë NPC TiÓu Söu hoÆc cÈm nang ®¹i sù kiÖn.\n- vµ mua nh¸nh hoa Mai t¹i Ngù C¸c. \n- Sö dông hoa Mai sÏ thu ®­îc kinh nghiÖm vµ bé ch÷ Mai Lan Cóc Tróc ®Ó hîp thµnh phÇn th­ëng.",
		},
		
		{
		"- Ho¹t ®éng Ng­u V­¬ng H¹ ThÕ diÔn ra ngµy thø s¸u, thø b¶y vµ chñ nhËt hµng tuÇn,  mçi ngµy Boss Ng­u V­¬ng xuÊt hiÖn 2 lÇn (LÇn thø nhÊt: 13:00–15:00, lÇn thø 2: 21:00–23:00). Mçi lÇn xuÊt hiÖn cïng lóc 3 Boss t¹i 3 b¶n ®å chØ ®Þnh. Ng­êi ch¬i h¹ Ng­u V­¬ng xong sÏ cã nh÷ng phÇn th­ëng hÊp dÉn vµ 1 thó c­ìi Kú L©n (N©ng cao 100% tèc ®é di chuyÓn).",
		},
			
		{
		"- Trong thêi gian ho¹t ®éng Tiªn Tö Trë L¹i, mçi ngµy ng­êi ch¬i cã cÊp 10 trë lªn vµ ®· gia nhËp m«n ph¸i tÆng hoa Mai cho Phi YÕn Tiªn Tö NPC sÏ ®­îc nh÷ng phÇn quµ thó vÞ: \n-Tõ 0:05 ®Õn 19:00: Ng­êi ch¬i tÆng 4 hoa mai cho Phi YÕn Tiªn Tö sÏ lËp tøc ®­îc phÇn th­ëng kinh nghiÖm.\n-Tõ 19:05 ®Õn 24:00: Nh÷ng ng­êi ch¬i tÆng ®ñ 4 hoa mai vµ ®èi tho¹i víi Phi YÕn sÏ ®­îc phÇn th­ëng hÊp dÉn\n-Ngoµi ra mçi ngµy sÏ cã phÇn th­ëng cho ng­êi may m¾n nhÊt.",
		},
			
		{
		"- Thêi gian ho¹t ®éng h¹t gièng h¹nh phóc tõ thø hai ®Õn thø n¨m, tham gia ph¶i ®¹t  cÊp 10 vµ ®· gia nhËp m«n ph¸i.  Mçi ngµy h¹t gièng h¹nh phóc xuÊt hiÖn 4 lÇn (12:00 - 13:00, 13:30 - 14:30, 21:00 - 22:00, 22:30 - 23:30), mçi lÇn cã 100 h¹t gièng xuÊt hiÖn trªn 24 b¶n ®å. Më Hång B¶o R­¬ng (mua t¹i Ngù C¸c) ®Ó nhËn ®­îc 10 bao tay thu thËp. Mçi lÇn ®µo h¹t gièng sÏ mÊt 1 bao tay thu thËp. Sö dông h¹t gièng h¹nh phóc sÏ thu ®­îc kinh nghiÖm vµ phÇn th­ëng ngÉu nhiªn.",
		},
	}

	Say(selTab[nType][1], 1, "Ta muèn xem ho¹t ®éng kh¸c/OnUse" )
end

function want_new_bag()
	local selTab = {
				"X¸c nhËn nhËn th­ëng/give_new_bag",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("Bang héi thµnh c«ng v­ît ¶i Tö Quang C¸c míi cã thÓ nhËn Tói Léc Mõng Xu©n \n §¹i hiÖp cã ch¾c muèn nhËn?",getn(selTab),selTab)
end

function give_new_bag()
	if GetLevel() < 73 then
		Say("C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn ®Ó nhËn Tói Léc Mõng Xu©n lÇn nµy.", 0)
		return
	end
	if IsTongMember() == 0 then
		Say("C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn ®Ó nhËn Tói Léc Mõng Xu©n lÇn nµy.", 0)
		return
	end
	if GetTime() - GetJoinTongTime() <= JOIN_TONG_DAY_09_NEWYEAR_VIET*24*3600 then
		Say("C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn ®Ó nhËn Tói Léc Mõng Xu©n lÇn nµy.", 0)
		return
	end
	if gf_Judge_Room_Weight(1,100) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end

	local nWeek = tonumber(date("%y%W"))
	if nWeek > GetTask(NEW_BAG_WEEK_09_NEWYEAR_VIET) then
		SetTask(NEW_BAG_WEEK_09_NEWYEAR_VIET, nWeek)
		SetTask(NEW_BAG_NUM_09_NEWYEAR_VIET, 0)
		SetTask(STAGE_NUM_09_NEWYEAR_VIET, 0)
	end

	if GetTask(NEW_BAG_NUM_09_NEWYEAR_VIET) >= 90 then
		Say("Trong vßng  1 tuÇn chØ cã thÓ nhËn ®­îc nhiÒu nhÊt lµ 90 Tói Léc Mõng Xu©n, c¸c h¹ ®· nhËn ®ñ nªn kh«ng thÓ nhËn tiÕp ®­îc n÷a.", 0)
		return
	end

	ApplyRelayShareData(GetTongName(),0,0,g_szFileName,"give_new_bag_cb")
end

function give_new_bag_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("C¸c h¹ cã thÓ nhËn Tói Léc Mõng Xu©n víi sè l­îng lµ 0", 0)
		return
	end

	local nStage = GetRelayShareDataByKey(szKey,nKey1,nKey2,"tong_mission_key_stage")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)

	if nStage == nil then
		nStage = 0
	end

	if nStage == 0 then
		Say("C¸c h¹ cã thÓ nhËn Tói Léc Mõng Xu©n víi sè l­îng lµ 0", 0)
		return
	end

	local tNewBagNum = 
	{
		[0] = 0,
		[1] = 10,
		[2] = 20,
		[3] = 35,
		[4] = 50,
		[5] = 70,
		[6] = 90,
	}
	local nObtainStage = GetTask(STAGE_NUM_09_NEWYEAR_VIET)
	if nObtainStage == nil then
		nObtainStage = 0
	end
	local nNewBagNum = tNewBagNum[nStage] - tNewBagNum[nObtainStage]

	if nNewBagNum == nil or nNewBagNum <= 0 then
		Say("C¸c h¹ cã thÓ nhËn Tói Léc Mõng Xu©n víi sè l­îng lµ 0", 0)
		return
	end

	local nRetCode = add_item_ex( {"Tói Léc Mõng Xu©n",	2,	1,	30046,	nNewBagNum},"Tö Quang C¸c stage "..nStage)
	if nRetCode == 1 or nRetCode == 2 then
		SetTask(STAGE_NUM_09_NEWYEAR_VIET, nStage)
		SetTask(NEW_BAG_NUM_09_NEWYEAR_VIET, GetTask(NEW_BAG_NUM_09_NEWYEAR_VIET)+nNewBagNum )
		Talk(1, "", format("Bang héi hiÖn t¹i cña ®¹i hiÖp ®· v­ît ¶i %d Tö Quang C¸c\nTuÇn nµy ®¹i hiÖp cã thÓ nhËn tæng céng %d Tói Léc Mõng Xu©n\n§¹i hiÖp ®· nhËn %d Tói Léc Mõng Xu©n\nLÇn nµy ®¹i hiÖp cã thÓ nhËn %d Tói Léc Mõng Xu©n", nStage, tNewBagNum[nStage], tNewBagNum[nObtainStage], nNewBagNum) )
	end
end

function add_item_ex(tItem,szLog)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0	
	
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName)
		WriteLogEx(g_szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, szLog, "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode
end

function pay_ex(nNum)
	local nRetCode = 0
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, format("Pay(%d)", nItemNum), nItemNum, "NULL", "NULL", GetTongName(), format("Pay(%d)", nItemNum).." Failed, return value = "..nRetCode)
		return 0
	end
end


function no()
end



