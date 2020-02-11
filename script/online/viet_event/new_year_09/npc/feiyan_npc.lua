--File name:	feiyan_npc.lua
--Describe:		´º½Ú»î¶¯·ÉÑàÏÉ×ÓnpcÎÄ¼ş
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

TYPE_ITEM 	= 1;	--ÆÕÍ¨ÎïÆ·
TYPE_EQUIP 	= 2;	--´øÊôĞÔ×°±¸ÀàÎïÆ·
TYPE_CMD 	= 3;	--ÃüÁî

g_szLogTitle = "Hoat dong Tet 2009"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë
g_szInfoHead = "<color=green>".."Phi YÕn Tiªn Tö".."<color>: "

g_szThisFile = "\\script\\online\\viet_event\\new_year_09\\npc\\feiyan_npc.lua"


g_tbItem = 
{
	--		ÀàĞÍ	   ÆÚÏŞ	ÊıÁ¿ Ãû×Ö					ID1	ID2		ID3		
	[1] = {TYPE_ITEM,	-1,	1,	"Ngò Hµnh MËt tŞch",				0,	107,	155,	},
	[2] = {TYPE_ITEM,	-1,	1,	"Thiªn Hµ MËt tŞch",				0,	107,	64,	},
	[3] = {TYPE_ITEM,	-1,	1,	"Tö Hµ MËt tŞch",				0,	107,	65,	},
	[4] = {TYPE_ITEM,	-1,	1,	"Chiªm Y Phæ",				0,	107,	66,	},
	[5] = {TYPE_ITEM,	7,	1,	"Sæ tay sèng",				2,	19,		1,	},
	[6] = {TYPE_ITEM,	7,	1,	"TÈy Tñy ®¬n",				2,	0,		136,	},
	[7] = {TYPE_ITEM,	7,	1,	"TÈy Tñy linh ®¬n",				2,	0,		137,	},
	[8] = {TYPE_ITEM,	7,	1,	"B¸t B¶o TÈy Tñy Tiªn §¬n",			2,	0,		138,	},
	[9] = {TYPE_ITEM,	7,	1,	"Tiªu KiÕp t¸n",				2,	0,		141,	},
	[10] = {TYPE_ITEM,	7,	1,	"§¹i Nh©n s©m",				2,	0,		553,	},
	[11] = {TYPE_ITEM,	7,	1,	"Tinh luyÖn B¨ng Th¹ch",				2,	1,		533,	},
	[12] = {TYPE_ITEM,	7,	1,	"Phong lÖnh-trung cÊp",		2,	1,		1054,	},
	[13] = {TYPE_ITEM,	7,	1,	"Phong lÖnh-cao cÊp",		2,	1,		1018,	},
	[14] = {TYPE_ITEM,	7,	1,	"Phong lÖnh-tèi cao",		2,	1,		1055,	},
	[15] = {TYPE_ITEM,	7,	1,	"Vâ L©m Cao Thñ",	2,	1,		1040,	},
	[16] = {TYPE_ITEM,	7,	1,	"NhÊt §¹i §¹i HiÖp",	2,	1,		1041,	},

	--		ÀàĞÍ	    ÊıÖµ	ÌáÊ¾×Ö·û´® 		ÃüÁî×Ö·û´®
	[17] = {TYPE_CMD,	800000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[18] = {TYPE_CMD,	800000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[19] = {TYPE_CMD,	800000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[20] = {TYPE_CMD,	800000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[21] = {TYPE_CMD,	800000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[22] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[23] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[24] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[25] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[26] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[27] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[28] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[29] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[30] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[31] = {TYPE_CMD,	400000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[32] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[33] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[34] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[35] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[36] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[37] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[38] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[39] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[40] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[41] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[42] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[43] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[44] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[45] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[46] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[47] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[48] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[49] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[50] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
	[51] = {TYPE_CMD,	200000,	" ®iÓm kinh nghiÖm",		"ModifyExp(%d)"},
}


function main()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho¹t ®éng tÕt ®· kÕt thóc.");
		return
	end
	local nTime = tonumber(date("%H%M"))
	if nTime >= 0005 and nTime < 1900 then
		exchange_confirm()
	elseif nTime >= 1905 and nTime < 2400 then
		give_prize()
	else
		Say("Quay l¹i sau!",0)
	end
end

function exchange_confirm()
	if GetLevel() < 10 then
		Talk(1,"",g_szInfoHead.."Ng­êi ch¬i ph¶i tõ cÊp 10 hoÆc cÊp 10 trë lªn míi cã thÓ tham gia.");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."Ho¹t ®éng nµy yªu cÇu ng­êi ch¬i ph¶i gia nhËp vµo m«n ph¸i.");
		return
	end
	local selTab = {
				"T¹i h¹ muèn tÆng 4 hoa mai/give_plum",
				"Ta sÏ quay l¹i sau.!/no",
				}
	Say(g_szInfoHead.."Mçi ngµy ng­êi ch¬i cã cÊp 10 trë lªn vµ ®· vµo m«n ph¸i tÆng hoa mai cho NPC Phi YÕn Tiªn Tö sÏ ®­îc phÇn th­ëng cã gi¸ trŞ: \n-Tõ 0:05 ®Õn 19:00 ng­êi ch¬i tÆng 4 hoa mai cho NPC Phi YÕn Tiªn Tö sÏ ®­îc phÇn th­ëng kinh nghiÖm\n-Tõ 19:05 ®Õn 24:00, ng­êi ch¬i ®· tÆng ®ñ 4 hoa mai ®Õn ®èi tho¹i víi Phi YÕn sÏ ®­îc nh÷ng phÇn quµ ®Æc biÖt\n-Ng­êi ch¬i may m¾n nhÊt trong ngµy sÏ ®­îc 1 Ngò Hµnh MËt TŞch.",getn(selTab),selTab);
end

function give_plum()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET) >= nDate then
		Say(g_szInfoHead.."H«m nay ®¹i hiÖp ®· tÆng 4 hoa Mai råi, xin h·y ®îi ngµy mai tiÕp tôc tham gia ho¹t ®éng!", 0)
		return
	end
	local nExp = 200000

	if GetItemCount(2,1,30053) < 4 then
		Say(g_szInfoHead.."§¹i hiÖp kh«ng mang theo ®ñ sè Hoa Mai trong hµnh trang cña m×nh.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
		return
	end
	if DelItem(2,1,30053,4) == 1 then
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm")
		WriteLogEx(g_szLogTitle, "Phi YÕn", nExp, "®iÓm kinh nghiÖm", format("ModifyExp(%d)", nExp), GetTongName() )
		SetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET, nDate)


		local nWishType = 0
		local nPrizeType = 0
		local nPrizeFlag = 0
		local nDateFlag = tonumber(GetTime())

		AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
	else
		Say(g_szInfoHead.."§¹i hiÖp kh«ng mang theo ®ñ sè Hoa Mai trong hµnh trang cña m×nh.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
		return
	end
end

function give_prize()
	local selTab = {
				"T¹i h¹ ®Õn ®Ó nhËn phÇn th­ëng/obtain_prize",
				"Ta sÏ quay l¹i sau.!/no",
				}
	Say(g_szInfoHead.."Mçi ngµy ng­êi ch¬i cã cÊp 10 trë lªn vµ ®· vµo m«n ph¸i tÆng hoa mai cho NPC Phi YÕn Tiªn Tö sÏ ®­îc phÇn th­ëng cã gi¸ trŞ: \n-Tõ 0:05 ®Õn 19:00 ng­êi ch¬i tÆng 4 hoa mai cho NPC Phi YÕn Tiªn Tö sÏ ®­îc phÇn th­ëng kinh nghiÖm\n-Tõ 19:05 ®Õn 24:00, ng­êi ch¬i ®· tÆng ®ñ 4 hoa mai ®Õn ®èi tho¹i víi Phi YÕn sÏ ®­îc nh÷ng phÇn quµ ®Æc biÖt\n-Ng­êi ch¬i may m¾n nhÊt trong ngµy sÏ ®­îc 1 Ngò Hµnh MËt TŞch.",getn(selTab),selTab);
end

function obtain_prize()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET) < nDate then
		Say("§¹i hiÖp vÉn ch­a ®ñ ®iÒu kiÖn ®Ó nhËn th­ëng lÇn nµy.",0)
		return
	end

	if GetTask(AWARD_PLUM_09_NEWYEAR_VIET) >= nDate then
		Say("H«m nay ng­¬i ®· nhËn phÇn th­ëng råi, ngµy mai h·y ®Õn nhĞ!",0)
		return
	end

	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end

	ApplyRelayShareData(RELAY_DB_09_NEWYEAR_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("§¹i hiÖp vÉn ch­a ®ñ ®iÒu kiÖn ®Ó nhËn th­ëng lÇn nµy.",0)
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

	if nPrizeFlag == 1 then
		Say("H«m nay ng­¬i ®· nhËn phÇn th­ëng råi, ngµy mai h·y ®Õn nhĞ!",0)
		return
	end

	if nDateNow - nDateFlag > 86400  then
		Say("B¹n vÉn ch­a nhËn ®­îc phÇn th­ëng tõ Phi YÕn Tiªn Tö.",0)
		return
	end

	local nRetCode = 0
	if nPrizeType == 0 then
		local nExp = 100000
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm")
		WriteLogEx(g_szLogTitle, "Phi YÕn", nExp, "®iÓm kinh nghiÖm", format("ModifyExp(%d)", nExp), GetTongName() )
		nRetCode = 1	--Ä¬ÈÏÃüÁî³É¹¦Ö´ĞĞ
	elseif nPrizeType >= 1 and nPrizeType <= 51 then
		local nType = g_tbItem[nPrizeType][1]
		if nType == TYPE_ITEM then
			nRetCode = add_item_ex(g_tbItem[nPrizeType])
		elseif nType == TYPE_CMD then
			local nItemNum = g_tbItem[nPrizeType][2]
			local szItemName = g_tbItem[nPrizeType][3]
			local szCMDString = format(g_tbItem[nPrizeType][4], nItemNum)
			dostring(szCMDString)
			Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." "..szItemName)
			WriteLogEx(g_szLogTitle, "Phi YÕn", nItemNum, szItemName, szCMDString, GetTongName() )
			nRetCode = 1	--Ä¬ÈÏÃüÁî³É¹¦Ö´ĞĞ
		end
	else
		return
	end

	if nRetCode == 1 or nRetCode == 2 then
		nPrizeFlag = 1
		AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		SetTask(AWARD_PLUM_09_NEWYEAR_VIET, tonumber(date("%Y%m%d")))
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[4]
	local G, D, P = tItem[5], tItem[6], tItem[7]
	local nItemNum = tItem[3]
	local nRetCode, nItemIdx = 0, 0

	nRetCode,nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		if tItem[2] > 0 then
			SetItemExpireTime(nItemIdx, tItem[2]*24*3600)
		end
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		if G == 0 and D == 107 and P == 155 then
			Msg2Global("Chóc mõng "..GetName().." Th«ng qua Phi YÕn Tiªn Tö thu ®­îc 1 Ngò Hµnh MËt TŞch")
		end
		WriteLogEx(g_szLogTitle, "Phi YÕn", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Phi YÕn", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode
end

function no()
end

