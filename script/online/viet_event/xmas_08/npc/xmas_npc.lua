--File name:	xmas_npc.lua
--Describe:		Î÷Ñó´«½ÌÊ¿npcÎÄ¼þ
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"				--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>".."Gi¸o sÜ".."<color>: "

g_szFileName = "xmas_npc.lua"			--ÎÄ¼þÃû


g_tbItem = 
{
	--		Ãû³Æ					G1	G2		G3	ÊýÁ¿	ÐÒÔËÀñºÐÊýÁ¿	ÎïÆ·ÆÚÏÞ
	[1] = {"S­ m«n lÖnh th­",				2,	1,	1016,	1,		3,			30,	},
	[2] = {"H¾c Ngäc §o¹n Tôc Cao",			1,	0,	6,		30,		5,			-1,	},
	[3] = {"Sinh Sinh Hãa T¸n",			1,	0,	16,		30,		5,			-1,	},
	[4] = {"V¹n VËt Quy Nguyªn §¬n",			1,	0,	11,		30,		5,			-1,	},
	[5] = {"ThÊt CÊp Gi¸m §Þnh phï-bao nhá",		2,	1,	1057,	1,		5,			30,	},
	[6] = {"M¶nh mËt tÞch thÊt l¹c",		2,	1,	1088,	10,		10,			-1,	},
	[7] = {"Vßng Th¸i H­ B¸t Qu¸i - Ly",			2,	1,	473,	1,		10,			-1,	},
	[8] = {"B¹ch C©u Tiªn ®¬n",				2,	1,	1008,	1,		10,			30,	},
	[9] = {"Vßng Th¸i H­ B¸t Qu¸i - CÊn",			2,	1,	475,	1,		20,			-1,	},
	[10] = {"Sæ tay chÕ t¹o vò khÝ",	2,	0,	397,	1,		20,			-1,	},
	[11] = {"Qu©n C«ng bµi",				2,	1,	9997,	1,		20,			30,	},
	[12] = {"§»ng Vô",					0,	105,20,		1,		30,			30,	},
	[13] = {"Qu©n dông-thu thËp th­",			2,	1,	1028,	1,		30,			30,	},
	[14] = {"Qu©n C«ng §¹i",				2,	1,	9998,	1,		30,			7,	},
	[15] = {"TÈy Tñy ®¬n",				2,	0,	136,	1,		30,			30,	},
	[16] = {"S­ m«n ®¹i sù hµm",			2,	1,	1021,	1,		30,			30,	},
	[17] = {"Ngù dông b¹ch ngäc th¹ch",			2,	1,	1024,	1,		60,			30,	},
	[18] = {"Qu©n C«ng Huy Hoµng",			2,	1,	9977,	1,		150,		7,	},
	[19] = {"Kú L©n hoµn",				2,	1,	1003,	1,		300,		7,	},
	[20] = {"TÈy Tñy linh ®¬n",				2,	0,	137,	1,		600,		30,	},	
	[21] = {"Kim Chung Tr¸o quyÕt",			2,	6,	5,		1,		1200,		-1,	},
	[22] = {"§¹t Ma Vò quyÕt",			2,	6,	10,		1,		1200,		-1,	},
	[23] = {"HuÖ Nh·n quyÕt",			2,	6,	14,		1,		1200,		-1,	},
	[24] = {"Long Tr¶o Thñ quyÕt",		2,	6,	20,		1,		1200,		-1,	},
	[25] = {"S­ Tö Hèng",			2,	6,	29,		1,		1200,		-1,	},
	[26] = {"Kim Cang ChØ quyÕt",		2,	6,	31,		1,		1200,		-1,	},
	[27] = {"M·n Thiªn Vò quyÕt",			2,	6,	46,		1,		1200,		-1,	},
	[28] = {"Thanh Ph¹n quyÕt",			2,	6,	53,		1,		1200,		-1,	},
	[29] = {"§¹i Bi quyÕt",		2,	6,	59,		1,		1200,		-1,	},
	[30] = {"Phóc Thñy ph¸p",			2,	6,	67,		1,		1200,		-1,	},
	[31] = {"Mª T©m Khóc quyÕt",		2,	6,	70,		1,		1200,		-1,	},
	[32] = {"Tóy §iÖp",				2,	6,	78,		1,		1200,		-1,	},
	[33] = {"Tóy QuyÒn",				2,	6,	79,		1,		1200,		-1,	},
	[34] = {"Nª Thu quyÕt",			2,	6,	83,		1,		1200,		-1,	},
	[35] = {"§¶ CÈu quyÕt",			2,	6,	88,		1,		1200,		-1,	},
	[36] = {"TÝch D­¬ng KiÕm quyÕt",			2,	6,	99,		1,		1200,		-1,	},
	[37] = {"ThÊt TiÖt KiÕm quyÕt",		2,	6,	108,	1,		1200,		-1,	},
	[38] = {"ThiÕu D­¬ng QuyÕt",			2,	6,	114,	1,		1200,		-1,	},
	[39] = {"Th­îng Thanh C«ng quyÕt",		2,	6,	119,	1,		1200,		-1,	},
	[40] = {"Ngù M· quyÕt",		2,	6,	129,	1,		1200,		-1,	},
	[41] = {"BÝch Th­¬ng quyÕt",		2,	6,	130,	1,		1200,		-1,	},
	[42] = {"To¸i TiÔn quyÕt",		2,	6,	138,	1,		1200,		-1,	},
	[43] = {"L­u TuyÖt TiÔn quyÕt",		2,	6,	141,	1,		1200,		-1,	},
	[44] = {"BÝ kiÕp Th«i Thi Tµ KhÝ",			2,	6,	151,	1,		1200,		-1,	},
	[45] = {"BÝ kiÕp Thi LiÖt Ma C«ng",			2,	6,	154,	1,		1200,		-1,	},
	[46] = {"BÝ kiÕp Tµm Cæ",				2,	6,	168,	1,		1200,		-1,	},
	[47] = {"BÝ kiÕp HuyÔn Cæ",				2,	6,	167,	1,		1200,		-1,	},
	[48] = {"B¶n vÏ ®óc t¹o thÇn khÝ",			2,	1,	1086,	10,		1200,		-1,	},
	[49] = {"Thiªn Th¹ch linh th¹ch",				2,	1,	1068,	1,		1500,		7,	},
}

g_tbOption = {}

function main()
	if is_xmas_08_viet_open() == 0 then
		Say(g_szInfoHead.."Gi¸ng Sinh vui vÎ !", 0)
		return
	end
	
	local nMapID = GetWorldPos()
	if nMapID ~= 200 then
		Say(g_szInfoHead.."Gi¸ng Sinh vui vÎ !", 0)
		return
	end

	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][6].." Hép Quµ May M¾n".." = "..g_tbItem[i][5]..g_tbItem[i][1]..format("/#exchange_prize(%d)", i)
	end

	exchange_talk()
end

function exchange_talk()
	local selTab = {
				g_tbOption[1],
				g_tbOption[2],
				g_tbOption[3],
				g_tbOption[4],
				g_tbOption[5],
				g_tbOption[6],
				"Xem trang sau/exchange_talk_2",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				g_tbOption[7],
				g_tbOption[8],
				g_tbOption[9],
				g_tbOption[10],
				g_tbOption[11],
				"Xem trang tr­íc/exchange_talk",
				"Xem trang sau/exchange_talk_3",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_3()
	local selTab = {
				g_tbOption[12],
				g_tbOption[13],
				g_tbOption[14],
				g_tbOption[15],
				g_tbOption[16],
				"Xem trang tr­íc/exchange_talk_2",
				"Xem trang sau/exchange_talk_4",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_4()
	local selTab = {
				g_tbOption[17],
				g_tbOption[18],
				g_tbOption[19],
				g_tbOption[20],
				g_tbOption[21],
				"Xem trang tr­íc/exchange_talk_3",
				"Xem trang sau/exchange_talk_5",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_5()
	local selTab = {
				g_tbOption[22],
				g_tbOption[23],
				g_tbOption[24],
				g_tbOption[25],
				g_tbOption[26],
				"Xem trang tr­íc/exchange_talk_4",
				"Xem trang sau/exchange_talk_6",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_6()
	local selTab = {
				g_tbOption[27],
				g_tbOption[28],
				g_tbOption[29],
				g_tbOption[30],
				g_tbOption[31],
				"Xem trang tr­íc/exchange_talk_5",
				"Xem trang sau/exchange_talk_7",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_7()
	local selTab = {
				g_tbOption[32],
				g_tbOption[33],
				g_tbOption[34],
				g_tbOption[35],
				g_tbOption[36],
				"Xem trang tr­íc/exchange_talk_6",
				"Xem trang sau/exchange_talk_8",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_8()
	local selTab = {
				g_tbOption[37],
				g_tbOption[38],
				g_tbOption[39],
				g_tbOption[40],
				g_tbOption[41],
				"Xem trang tr­íc/exchange_talk_7",
				"Xem trang sau/exchange_talk_9",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_9()
	local selTab = {
				g_tbOption[42],
				g_tbOption[43],
				g_tbOption[44],
				g_tbOption[45],
				g_tbOption[46],
				"Xem trang tr­íc/exchange_talk_8",
				"Xem trang sau/exchange_talk_10",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_talk_10()
	local selTab = {
				g_tbOption[47],
				g_tbOption[48],
				g_tbOption[49],
				"Xem trang tr­íc/exchange_talk_9",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Sö dông Hép Quµ May M¾n ®æi ®­îc nh÷ng phÇn quµ nh­ sau:",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(2, 1, 30038) < g_tbItem[nType][6] then
			Say(g_szInfoHead.."C¸c h¹ vÉn ch­a ®ñ Hép Quµ May M¾n ®Ó ®æi thµnh tÆng phÈm",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 120) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if DelItem(2, 1, 30038, g_tbItem[nType][6]) == 1 then
				add_item_ex(g_tbItem[nType]);
			else
				Say(g_szInfoHead.."C¸c h¹ vÉn ch­a ®ñ Hép Quµ May M¾n ®Ó ®æi thµnh tÆng phÈm",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!/no");
				return
			end
		end
		
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function exchange_prize(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode, nItemIdx = 0, 0

	if G == 0 and D == 105 then
		nRetCode,nItemIdx = AddItem(G, D, P, nItemNum, 1, -1, -1, -1, -1, -1, -1)
	else
		nRetCode,nItemIdx = AddItem(G, D, P, nItemNum)
	end
	if nRetCode == 1 then
		if tItem[7] > 0 then
			SetItemExpireTime(nItemIdx, tItem[7]*24*3600)
		end
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName)
		WriteLogEx(g_szLogTitle, "Gi¸o sÜ", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Gi¸o sÜ", "", "", "", "", "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

function no()
end

