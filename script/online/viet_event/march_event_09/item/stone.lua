--File name:	stone.lua
--Describe:		ÆæÊ¯½Å±¾
--Item ID:		2,1,30068
--Create Date:	2009-02-18
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
g_nDenominator = 100000							--·ÖÄ¸£¬±íÊ¾¸ÅÂÊµÄµ¥Î»ÊÇx·ÖÖ®1
--g_nExpNum = 125000								--Ê¹ÓÃÒ»¸öÆæÊ¯»ñµÃµÄ¾­ÑéÖµ

g_szFileName = "stone.lua"						--ÎÄ¼şÃû

g_tbItem = 
{
	--		ÀàĞÍ	   ¸ÅÂÊ			ÊıÁ¿ Ãû×Ö			ID1,ID2,ID3		ÆÚÏŞ(-1ÎªÃ»ÓĞÊ±¼äÏŞÖÆ)
	[1] = {TYPE_ITEM,	10000,		100,	"Bao nguyªn liÖu",		2,	1,		30061,	-1,	},
	[2] = {TYPE_ITEM,	10000,		1,	"M¶nh Thiªn th¹ch",		2,	2,		7,		-1,	},
	[3] = {TYPE_ITEM,	3000,		3,	"M¶nh Thiªn th¹ch",		2,	2,		7,		-1,	},
	[4] = {TYPE_ITEM,	15000,		1,	"Thiªn th¹ch",			2,	2,		8,		-1,	},
	[5] = {TYPE_ITEM,	5000,		3,	"Thiªn th¹ch",			2,	2,		8,		-1,	},
	[6] = {TYPE_ITEM,	50,			1,	"Kim Cang Phôc Ma T©m Ph¸p",	0,	107,	2,		-1,	},
	[7] = {TYPE_ITEM,	20,			1,	"TiÒm Long T©m Ph¸p",		0,	107,	4,		-1,	},
	[8] = {TYPE_ITEM,	40,			1,	"V« TrÇn T©m Ph¸p",		0,	107,	6,		-1,	},
	[9] = {TYPE_ITEM,	40,			1,	"Thiªn La T©m Ph¸p",		0,	107,	8,		-1,	},
	[10] = {TYPE_ITEM,	20,			1,	"Nh­ ı T©m Ph¸p",		0,	107,	10,		-1,	},
	[11] = {TYPE_ITEM,	40,			1,	"Bİch H¶i T©m Ph¸p",		0,	107,	12,		-1,	},
	[12] = {TYPE_ITEM,	40,			1,	"Hçn §én T©m Ph¸p",		0,	107,	14,		-1,	},
	[13] = {TYPE_ITEM,	20,			1,	"Quı Thiªn T©m Ph¸p",		0,	107,	16,		-1,	},
	[14] = {TYPE_ITEM,	40,			1,	"HuyÒn ¶nh T©m Ph¸p",		0,	107,	18,		-1,	},
	[15] = {TYPE_ITEM,	30,			1,	"Qu©n Tö T©m Ph¸p",		0,	107,	20,		-1,	},
	[16] = {TYPE_ITEM,	40,			1,	"TrÊn Qu©n T©m Ph¸p",		0,	107,	22,		-1,	},
	[17] = {TYPE_ITEM,	30,			1,	"Xuyªn V©n T©m Ph¸p",		0,	107,	24,		-1,	},
	[18] = {TYPE_ITEM,	50,			1,	"U Minh T©m Ph¸p",		0,	107,	26,		-1,	},
	[19] = {TYPE_ITEM,	50,			1,	"Linh Cæ T©m Ph¸p",		0,	107,	28,		-1,	},
	[20] = {TYPE_ITEM,	6490,		1,	"Tµng KiÕm anh hïng thiÕp",	2,	0,		31,		7,	},
	[21] = {TYPE_ITEM,	50000,		1,	"Ngäc Trai",			2,	1,		30067,	-1,	},
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
		WriteLogEx(g_szLogTitle, "Kú Th¹ch", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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

