--File name:	jester_npc.lua
--Describe:		´º½Ú»î¶¯Ð¡³ónpcÎÄ¼þ
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

TYPE_NULL 	= 0;	--Ã»ÓÐ½±Àø
TYPE_ITEM 	= 1;	--ÆÕÍ¨ÎïÆ·
TYPE_EQUIP 	= 2;	--´øÊôÐÔ×°±¸ÀàÎïÆ·
TYPE_CMD 	= 3;	--ÃüÁî

g_szLogTitle = "Hoat dong Tet 2009"				--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>".."TiÓu Söu".."<color>: "

g_nDenominator = 10000								--·ÖÄ¸£¬±íÊ¾¸ÅÂÊµÄµ¥Î»ÊÇx·ÖÖ®1
g_nExpNum = 100000									--Ê¹ÓÃÃ·¨CÀ¼¨C¾Õ¨CÖñ»ñµÃµÄ¾­ÑéÖµ

g_szFileName = "jester_npc.lua"						--ÎÄ¼þÃû


g_tbOldItem = 
{
	--		Ãû×Ö		ID1,ID2,ID3,	ÊýÁ¿
	[1] = {"N­íc Tinh KhiÕt",		2,	1,	30047,	5,	},
	[2] = {"B×nh Hoa",		2,	1,	30048,	1,	},
	[3] = {"D­ìng ChÊt",		2,	1,	30049,	4,	},
	[4] = {"Nh¸nh §µo",	2,	1,	30050,	1,	},
	[5] = {"Nh¸nh hoa Mai",	2,	1,	30051,	1,	},
}

g_tbNewItem = 
{
	--		Ãû×Ö		ID1,ID2,ID3,	ÊýÁ¿
	[1] = {"Hoa §µo",	2,	1,	30052,	1,	},
	[2] = {"Hoa Mai",	2,	1,	30053,	1,	},
}

g_tbWord =
{
	--		Ãû×Ö		ID1,ID2,ID3,	ÊýÁ¿
	[1] = {"Ch÷ Mai",	2,	1,	30054,	1,	},
	[2] = {"Ch÷ Lan",	2,	1,	30055,	1,	},
	[3] = {"Ch÷ Tróc",	2,	1,	30056,	1,	},
	[4] = {"Ch÷ Cóc",	2,	1,	30057,	1,	},
}

g_tbWordAward = 
{
	--		ÀàÐÍ	   ¸ÅÂÊ		ÊýÁ¿ Ãû×Ö		ID1,ID2,ID3
	[1] = {TYPE_NULL,	9545,	},
	[2] = {TYPE_EQUIP,	10,		1,	"TiÓu Th­ Giíi ChØ",		0,	102,	36,	},
	[3] = {TYPE_EQUIP,	10,		1,	"Trang Chñ m·o",		0,	103,	91,	},
	[4] = {TYPE_EQUIP,	10,		1,	"Trang Chñ m·o",		0,	103,	92,	},
	[5] = {TYPE_EQUIP,	10,		1,	"Trang Chñ m·o",		0,	103,	93,	},
	[6] = {TYPE_EQUIP,	10,		1,	"Trang Chñ m·o",		0,	103,	94,	},
	[7] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n Ngo¹i trang",		0,	100,	91,	},
	[8] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n Ngo¹i trang",		0,	100,	92,	},
	[9] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n Ngo¹i trang",		0,	100,	93,	},
	[10] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n Ngo¹i trang",		0,	100,	94,	},
	[11] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n khè",		0,	101,	91,	},
	[12] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n khè",		0,	101,	92,	},
	[13] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n khè",		0,	101,	93,	},
	[14] = {TYPE_EQUIP,	50,		1,	"Tæng Qu¶n khè",		0,	101,	94,	},
	[15] = {TYPE_EQUIP,	5,		1,	"Tr­ëng L·o ChØ Hoµn",		0,	102,	37,	},
}

function main()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho¹t ®éng tÕt ®· kÕt thóc.");
		return
	end
	local selTab = {
				"§æi 1 hoa §µo/#want_exchange(1)",
				"§æi 1 hoa Mai/#want_exchange(2)",
				"Mua nh¸nh hoa ®µo (1 vµng 50 b¹c)/bug_peach",
				"Ta ®· thu thËp ®ñ bé ch÷ [Mai-Lan-Tróc-Cóc]/exchange_word",
				"NhËn vËt phÈm cÈm nang ®¹i sù kiÖn/give_pouch",
				"Ta chØ ®Õn xem thö/no",
				}
	Say(g_szInfoHead.."T¹i h¹ lµ ng­êi trång ch¨m sãc Hoa Mai vµ Hoa §µo ®Õn tõ vïng giang nam, ch¼ng hay t¹i h¹ cã thÓ gióp g× cho ®¹i hiÖp?",getn(selTab),selTab);
end

function bug_peach()
	if GetCash() < 15000 then
		Say(g_szInfoHead.."§¹i hiÖp kh«ng ®ñ ng©n l­îng trªn ng­êi råi!",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	if pay_ex(15000) == 1 then
		add_item_ex(g_tbOldItem[4])
	else
		Say(g_szInfoHead.."§¹i hiÖp kh«ng ®ñ ng©n l­îng trªn ng­êi råi!",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no")
		return
	end
	main()
end

function give_pouch()
	if GetItemCount(2, 1, 30045) > 0 then
		Say(g_szInfoHead.."§¹i hiÖp ®· cã mét c¸i råi, kh«ng thÓ nhËn tiÕp ®­îc n÷a!",1,"KÕt thóc ®èi tho¹i/no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	add_item_ex( {"CÈm Nang §¹i Sù KiÖn",	2,	1,	30045,	1} )
end

function want_exchange(nType)
	local selTab = {
				format("§ång ý ®æi /#exchange_box(%d)", nType),
				"Ta chØ ®Õn xem thö/no",
				}
	if nType == 1 then
		Say(g_szInfoHead.."\n  5 N­íc Tinh KhiÕt + 1 B×nh Hoa + 4 D­ìng ChÊt + 1 Nh¸nh Hoa §µo = 1 Hoa §µo \n §¹i hiÖp cã muèn ®æi kh«ng?",getn(selTab),selTab);
	elseif nType == 2 then
		Say(g_szInfoHead.."\n  5 N­íc Tinh KhiÕt + 1 B×nh Hoa + 4 D­ìng ChÊt + 1 Nh¸nh Hoa Mai = 1 Hoa Mai \n §¹i hiÖp cã muèn ®æi kh«ng?",getn(selTab),selTab);
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function want_exchange(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
end

function exchange_box(nType)
	if nType == 1 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[4]) == 0 then
			Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[4]) == 1 then
				add_item_ex(g_tbNewItem[1])
			else
				Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
				return
			end
		end
	elseif nType == 2 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[5]) == 0 then
			Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[5]) == 1 then
				add_item_ex(g_tbNewItem[2])
			else
				Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
				return
			end
		end
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function exchange_box(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
	main()
end

function exchange_word()
	if check_item_count(g_tbWord[1]) == 0 or check_item_count(g_tbWord[2]) == 0 or check_item_count(g_tbWord[3]) == 0 or check_item_count(g_tbWord[4]) == 0 then
		Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
		return
	else
		if gf_Judge_Room_Weight(1,100) == 0 then
			Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
			return
		end;
		if del_item_ex(g_tbWord[1]) == 1 and del_item_ex(g_tbWord[2]) == 1 and del_item_ex(g_tbWord[3]) == 1 and del_item_ex(g_tbWord[4]) == 1 then
			give_word_award()
		else
			Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
			return
		end
	end
end

function give_word_award()
	--¾­Ñé½±Àø²¿·Ö
	local nExp = g_nExpNum
	local nExpTotal = GetTask(PLUM_TOTALEXP_09_NEWYEAR_VIET)
	if nExpTotal >= PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		Msg2Player("§¹i hiÖp ®· thu ®­îc kinh nghiÖm tõ ho¹t ®éng Mai §µo Chóc TÕt v­ît qu¸ giíi h¹n. "..PLUM_EXP_LIMIT_09_NEWYEAR_VIET.." , HiÖn t¹i kh«ng thÓ nhËn thªm kinh nghiÖm tõ ho¹t ®éng nµy, nh­ng cã thÓ sÏ cã c¬ héi nhËn phÇn th­ëng kh¸c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		nExp = PLUM_EXP_LIMIT_09_NEWYEAR_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( PLUM_TOTALEXP_09_NEWYEAR_VIET, (nExpTotal+nExp) )
		Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm");

		local szItemName = "®iÓm kinh nghiÖm"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "NhËn ®­îc", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--ÎïÆ·½±Àø²¿·Ö
	local nRandIdx = get_random_item(g_tbWordAward)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbWordAward[nRandIdx][1]
	local szItemName = g_tbWordAward[nRandIdx][4]
	local nItemNum = g_tbWordAward[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][6],g_tbWordAward[nRandIdx][7],g_tbWordAward[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbWordAward[nRandIdx][5], g_tbWordAward[nRandIdx][6], g_tbWordAward[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][6],g_tbWordAward[nRandIdx][7],g_tbWordAward[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbWordAward[nRandIdx][5], g_tbWordAward[nRandIdx][6], g_tbWordAward[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbWordAward[nRandIdx][5],g_tbWordAward[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--Ä¬ÈÏÃüÁî³É¹¦Ö´ÐÐ
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "NhËn ®­îc", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "NhËn ®­îc", "", "", szInfoDescribe, GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
	main()
end

--°´ÕÕ¸ÅÂÊ»ñµÃg_tbWordAwardÀïÃæµÄÒ»ÏîÄÚÈÝ
function get_random_item(nTab)
	local nRandom = random(1,g_nDenominator)
	local nBase = 0
	if check_item_tab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][2]+nBase then
				return i
			else
				nBase = nBase + nTab[i][2]
			end
		end
	else
		return 0
	end
end

--¼ì²éÊäÈëµÄtableÊÇ·ñÕýÈ·
function check_item_tab(tTab)
	local nTotalProbability= 0
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][2]
	end
	if nTotalProbability == g_nDenominator then
		return 1
	else
		print("\n error item table in "..g_szFileName.." \n")
		return 0
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(g_szLogTitle, "NhËn ®­îc", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "NhËn ®­îc", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

function del_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	
	nRetCode = DelItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, "Trõ vËt phÈm ", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Trõ vËt phÈm thÊt b¹i, ".."DelItem return value = "..nRetCode)
		return 0
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, format("Pay(%d)", nItemNum), nItemNum, "NULL", "NULL", GetTongName(), format("Pay(%d)", nItemNum).." Failed, return value = "..nRetCode)
		return 0
	end
end

function check_item_count(tItem)
	if GetItemCount(tItem[2],tItem[3],tItem[4]) < tItem[5] then
		return 0
	else
		return 1
	end
end

function no()
end

