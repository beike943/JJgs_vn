--File name:	butter_sugar.lua
--Describe:		ÄÌÌÇ½Å±¾
--Item ID:		2,1,30066
--Create Date:	2009-02-17
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--Ã»ÓĞ½±Àø
TYPE_ITEM 	= 1;	--ÆÕÍ¨ÎïÆ·
TYPE_EQUIP 	= 2;	--´øÊôĞÔ×°±¸ÀàÎïÆ·
TYPE_CMD 	= 3;	--ÃüÁî

--=========================================================================================
g_szLogTitle = "Event th¸ng 3"			--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë
g_nVietUseBoxEnd = 2009041300					--Ê¹ÓÃ½ØÖ¹ÈÕÆÚ
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 1000000						--·ÖÄ¸£¬±íÊ¾¸ÅÂÊµÄµ¥Î»ÊÇx·ÖÖ®1
g_nExpNum = 125000								--Ê¹ÓÃÒ»¸öÄÌÌÇ»ñµÃµÄ¾­ÑéÖµ

g_szFileName = "butter_sugar.lua"				--ÎÄ¼şÃû

g_tbItem = 
{
	--		ÀàĞÍ	   ¸ÅÂÊ		ÊıÁ¿ Ãû×Ö			ID1,ID2,ID3		ÆÚÏŞ(-1ÎªÃ»ÓĞÊ±¼äÏŞÖÆ)
	[1] = {TYPE_ITEM,	30000,		1,	"M¶nh Thiªn th¹ch",		2,	2,		7,		-1,	},
	[2] = {TYPE_ITEM,	20000,		1,	"Thiªn th¹ch",			2,	2,		8,		-1,	},
	[3] = {TYPE_ITEM,	30000,		1,	"M¶nh B¨ng th¹ch",		2,	1,		148,	-1,	},
	[4] = {TYPE_ITEM,	20000,		1,	"B¨ng th¹ch",			2,	1,		149,	-1,	},
	[5] = {TYPE_ITEM,	50000,		1,	"Bång Lai Tiªn Thñy",		2,	1,		1012,	-1,	},
	[6] = {TYPE_ITEM,	80000,		1,	"Bång Lai Lé Thñy",		2,	1,		1052,	-1,	},
	[7] = {TYPE_ITEM,	20000,		1,	"ThÕ Th©n phï",		2,	0,		556,	7,	},
	[8] = {TYPE_ITEM,	30000,		1,	"Tiªu KiÕp t¸n",		2,	0,		141,	7,	},
	[9] = {TYPE_ITEM,	10,			1,	"B¸t B¶o TÈy Tñy Tiªn §¬n",	2,	0,		138,	7,	},
	[10] = {TYPE_ITEM,	40,			1,	"TÈy Tñy linh ®¬n",		2,	0,		137,	7,	},
	[11] = {TYPE_ITEM,	5000,		1,	"Thiªn Hµ MËt tŞch",		0,	107,	64,		-1,	},
	[12] = {TYPE_ITEM,	3000,		1,	"Tö Hµ MËt tŞch",		0,	107,	65,		-1,	},
	[13] = {TYPE_ITEM,	2000,		1,	"Chiªm Y Phæ",		0,	107,	66,		-1,	},
	[14] = {TYPE_ITEM,	10,			1,	"Kim Cang Phôc Ma kinh",	0,	107,	1,		-1,	},
	[15] = {TYPE_ITEM,	5,			1,	"TiÒm Long MËt tŞch",		0,	107,	3,		-1,	},
	[16] = {TYPE_ITEM,	10,			1,	"V« TrÇn MËt tŞch",		0,	107,	5,		-1,	},
	[17] = {TYPE_ITEM,	10,			1,	"Thiªn La MËt TŞch",		0,	107,	7,		-1,	},
	[18] = {TYPE_ITEM,	5,			1,	"Nh­ ı MËt TŞch",		0,	107,	9,		-1,	},
	[19] = {TYPE_ITEM,	10,			1,	"Bİch H¶i Phæ",		0,	107,	11,		-1,	},
	[20] = {TYPE_ITEM,	10,			1,	"Hçn §én MËt tŞch",		0,	107,	13,		-1,	},
	[21] = {TYPE_ITEM,	5,			1,	"Quı Thiªn MËt tŞch",		0,	107,	15,		-1,	},
	[22] = {TYPE_ITEM,	10,			1,	"HuyÒn ¶nh MËt tŞch",		0,	107,	17,		-1,	},
	[23] = {TYPE_ITEM,	5,			1,	"Qu©n Tö MËt tŞch",		0,	107,	19,		-1,	},
	[24] = {TYPE_ITEM,	5,			1,	"TrÊn Qu©n MËt tŞch",		0,	107,	21,		-1,	},
	[25] = {TYPE_ITEM,	10,			1,	"Xuyªn V©n MËt tŞch",		0,	107,	23,		-1,	},
	[26] = {TYPE_ITEM,	20,			1,	"U Minh Quû Lôc",		0,	107,	25,		-1,	},
	[27] = {TYPE_ITEM,	10,			1,	"Linh Cæ MËt tŞch",		0,	107,	27,		-1,	},
	[28] = {TYPE_ITEM,	20000,		1,	"Ch×a Khãa Vµng",		2,	1,		30069,	30,	},

	--		ÀàĞÍ	   ¸ÅÂÊ ÊıÖµ	ÌáÊ¾×Ö·û´® 		ÃüÁî×Ö·û´®
	[29] = {TYPE_CMD,	249825,	3,	{" ®iÓm danh väng"},		"ModifyReputation(%d,0)"},
	[30] = {TYPE_CMD,	170000,	5,	{" ®iÓm danh väng"},		"ModifyReputation(%d,0)"},
	[31] = {TYPE_CMD,	100000,	10,	{" ®iÓm danh väng"},		"ModifyReputation(%d,0)"},
	[32] = {TYPE_CMD,	20000,	50,	{" ®iÓm danh väng"},		"ModifyReputation(%d,0)"},
	[33] = {TYPE_CMD,	100000,	20,	" ®iÓm tu luyÖn",		"ModifyPopur(%d)"},
	[34] = {TYPE_CMD,	50000,	100,"§iÓm Tµng kiÕm",	"SetTask(1801, GetTask(1801)+%d)"},
}


--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("VËt phÈm nµy ®· qu¸ h¹n, kh«ng thÓ sö dông thªm n÷a.")
		return
	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--¾­Ñé½±Àø²¿·Ö
	local nExp = g_nExpNum
	local nExpTotal = GetTask(SUGAR_TOTALEXP_09_MARCH_VIET)
	if nExpTotal >= SUGAR_EXP_LIMIT_09_MARCH_VIET then
		Msg2Player("C¸c h¹ ®· thu ®­îc kinh nghiÖm cao nhÊt tõ vËt phÈm KÑo S÷a "..SUGAR_EXP_LIMIT_09_MARCH_VIET.." , HiÖn t¹i kh«ng thÓ nhËn thªm kinh nghiÖm tõ ho¹t ®éng nµy, nh­ng cã thÓ sÏ cã c¬ héi nhËn phÇn th­ëng kh¸c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > SUGAR_EXP_LIMIT_09_MARCH_VIET then
		nExp = SUGAR_EXP_LIMIT_09_MARCH_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( SUGAR_TOTALEXP_09_MARCH_VIET, (nExpTotal+nExp) )
		Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm");

		local szItemName = "®iÓm kinh nghiÖm"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "KÑo s÷a", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--ÎïÆ·½±Àø²¿·Ö
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode, nItemIdx = 0, 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode,nItemIdx = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--Ä¬ÈÏÃüÁî³É¹¦Ö´ĞĞ
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." "..szItemName)
		end
		if (nType == TYPE_ITEM or nType == TYPE_EQUIP) and g_tbItem[nRandIdx][8] > 0 then
			SetItemExpireTime(nItemIdx, g_tbItem[nRandIdx][8]*24*3600)
		end
		WriteLogEx(g_szLogTitle, "KÑo s÷a", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

--°´ÕÕ¸ÅÂÊ»ñµÃg_tbItemÀïÃæµÄÒ»ÏîÄÚÈİ
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

--¼ì²éÊäÈëµÄtableÊÇ·ñÕıÈ·
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

