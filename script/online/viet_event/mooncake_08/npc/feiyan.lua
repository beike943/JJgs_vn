--File name:	feiyan.lua
--Describe:		ÖÐÇï»î¶¯·ÉÑàÏÉ×ÓnpcÎÄ¼þ
--Create Date:	2008-08-26
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."Phi YÕn Tiªn Tö"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>Phi YÕn Tiªn Tö<color>: "

g_szThisFile = "\\script\\online\\viet_event\\mooncake_08\\npc\\feiyan.lua"


g_tbItem = 
{
	--		Ãû³Æ		G1	G2	G3		ÊýÁ¿ ÀàÐÍ
	[1] = {"TiÓu Nh­ ý",	2,	1,	30030,	20,	1},
	[2] = {"Chiªm Y Phæ",	0,	107,66,		1,	2},
	[3] = {"Tö Hµ MËt tÞch",	0,	107,65,		1,	3},
	[4] = {"Tö Hµ MËt tÞch",	0,	107,65,		1,	3},
	[5] = {"Thiªn Hµ MËt tÞch",	0,	107,64,		1,	4},
	[6] = {"Thiªn Hµ MËt tÞch",	0,	107,64,		1,	4},
	[7] = {"Thiªn Hµ MËt tÞch",	0,	107,64,		1,	4},
	[8] = {"Thiªn Hµ MËt tÞch",	0,	107,64,		1,	4},
}


function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	if GetLevel() < 20 then
		Say(g_szInfoHead.."Ta chØ tÆng th­ëng cho ng­êi ®¼ng cÊp 20 trë lªn. Ng­¬i rÌn luyÖn thªm nhÐ!",0)
		return
	end
	local nTime = tonumber(date("%H"))
	if nTime == 19 or nTime == 6 then
		Say("Quay l¹i sau!",0)
	elseif nTime > 6 and nTime < 19 then
		exchange_confirm()
	else
		give_prize()
	end
end

function exchange_confirm()
	local selTab = {
				"Ta muèn d©ng tÆng 4 b¸nh trung thu th­êng./#give_mooncake(1)",
				"Ta muèn d©ng tÆng 4 b¸nh trung thu ®Æc biÖt./#give_mooncake(2)",
				"Ta sÏ quay l¹i sau.!/no",
				}
	Say(g_szInfoHead.."Ho¹t ®éng “TÆng B¸nh Trung Thu” diÔn ra h»ng ngµy tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Hµng ngµy tõ 7:00 ®Õn 19:00, ng­êi ch¬i mang 4 b¸nh trung thu b×nh th­êng hoÆc 4 b¸nh trung thu ®Æc biÖt ®Õn tÆng cho NPC Phi YÕn Tiªn Tö ®Ó nhËn lÊy 1 ®iÒu ­íc. Tõ 20:00 ®Õn 06:00 s¸ng h«m sau, ng­êi ch¬i ®Õn NPC Phi YÕn Tû Tû ®Ó nhËn phÇn th­ëng tõ ®iÒu ­íc cña m×nh.\nChó ý: Sau thêi gian quy ®Þnh mµ ng­êi ch¬i kh«ng ®Õn nhËn th­ëng th× phÇn th­ëng sÏ bÞ hñy bá.",getn(selTab),selTab);
end

function give_mooncake(nType)
	local nDate = tonumber(date("%Y%m%d"))

	if GetTask(CAKE_DATE_08_MOONCAKE_VIET) >= nDate then
		Say(g_szInfoHead.."H«m nay ng­¬i ®· tÆng b¸nh Trung thu råi, mçi ng­êi chØ ®­îc tÆng 1 lÇn trong ngµy. Ngµy mai h·y tiÕp tôc nhÐ!", 0)
		return
	end
	local nExp = 0
	if nType == 1 then
		if GetItemCount(2,1,30025) < 4 then
			Say(g_szInfoHead.."Ch­a ®ñ sè B¸nh Trung Thu cÇn thiÕt th× ta kh«ng thÓ cho c¸c h¹ ®iÒu ­íc.!",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
			return
		end
		if DelItem(2,1,30025,4) == 1 then
			nExp = 150000
			ModifyExp(nExp)
			Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm")
			SetTask(CAKE_DATE_08_MOONCAKE_VIET, nDate)
			WriteLogEx(szLogTrungThuName,"nhËn",nExp,"®iÓm kinh nghiÖm")
		else
			Say(g_szInfoHead.."Ch­a ®ñ sè B¸nh Trung Thu cÇn thiÕt th× ta kh«ng thÓ cho c¸c h¹ ®iÒu ­íc.!",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
			return
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30026) < 4 then
			Say(g_szInfoHead.."Ch­a ®ñ sè B¸nh Trung Thu cÇn thiÕt th× ta kh«ng thÓ cho c¸c h¹ ®iÒu ­íc.!",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
			return
		end
		if DelItem(2,1,30026,4) == 1 then
			nExp = 400000
			ModifyExp(nExp)
			Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm")
			SetTask(CAKE_DATE_08_MOONCAKE_VIET, nDate)
			WriteLogEx(szLogTrungThuName,"nhËn",nExp,"®iÓm kinh nghiÖm")
			local selTab = {
						"Ta ­íc ®­îc 20 TiÓu Nh­ ý./#make_wish(1)",
						"Ta ­íc ®­îc 1 Chiªm Y Phæ./#make_wish(2)",
						"Ta ­íc ®­îc 1 Tö Hµ MËt TÞch./#make_wish(3)",
						"Ta ­íc ®­îc 1 Thiªn Hµ MËt TÞch./#make_wish(4)",
						"Ta ­íc ®­îc tÊt c¶ nh÷ng mãn trªn./#make_wish(5)",
						}
			Say(g_szInfoHead.."§a t¹, ta ®· nhËn ®ñ sè l­îng b¸nh trung thu, ta sÏ cho ng­¬i mét ®iÒu ­íc, ng­¬i ­íc ®iÒu g×?",getn(selTab),selTab);
		else
			Say(g_szInfoHead.."Ch­a ®ñ sè B¸nh Trung Thu cÇn thiÕt th× ta kh«ng thÓ cho c¸c h¹ ®iÒu ­íc.!",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
			return
		end
	end
end

function make_wish(nType)
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = tonumber(GetTime())
	nWishType = tonumber(nType)
	AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
end

function give_prize()
	local selTab = {
				"Ta ®Õn ®©y ®Ó nhËn phÇn th­ëng cña m×nh./obtain_prize",
				"Ta sÏ quay l¹i sau.!/no",
				}
	Say(g_szInfoHead.."ChØ cã ng­êi ch¬i tÆng b¸nh cho ta míi ®­îc nhËn phÇn th­ëng.",getn(selTab),selTab);
end

function obtain_prize()
	ApplyRelayShareData(RELAY_DB_08_MOONCAKE_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("B¹n vÉn ch­a nhËn ®­îc phÇn th­ëng tõ Phi YÕn Tiªn Tö.",0)
		return
	end

	local szPlayerName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())
	szPlayerName = GetName()

	nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByKey(szKey, nKey1, nKey2, szPlayerName)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if nWishType == 0 or nWishType == nil then
		Say("B¹n vÉn ch­a nhËn ®­îc phÇn th­ëng tõ Phi YÕn Tiªn Tö.",0)
		return
	else
		if nDateNow - nDateFlag > 82800  then
			Say("B¹n vÉn ch­a nhËn ®­îc phÇn th­ëng tõ Phi YÕn Tiªn Tö.",0)
			return
		end
		if nPrizeType == 0 then
			Say("B¹n vÉn ch­a nhËn ®­îc phÇn th­ëng tõ Phi YÕn Tiªn Tö.",0)
			return
		end
		if nPrizeFlag == 1 then
			Say("H«m nay ng­¬i ®· nhËn phÇn th­ëng råi, ngµy mai h·y ®Õn nhÐ!",0)
			return
		end
		
		add_item_ex(g_tbItem[nPrizeType][1], g_tbItem[nPrizeType][2], g_tbItem[nPrizeType][3],g_tbItem[nPrizeType][4],g_tbItem[nPrizeType][5])
		nPrizeFlag = 1
		AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		
		Say(g_szInfoHead.."Chóc mõng ®¹i hiÖp! "..g_tbItem[nPrizeType][1].."  ®· thuéc vÒ ®¹i hiÖp.",1,"§a t¹ Phi YÕn Tiªn Tö!/no");
	end

end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(szLogTrungThuName,"Phi YÕn tû tû",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

