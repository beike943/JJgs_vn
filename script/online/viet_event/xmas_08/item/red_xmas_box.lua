--File name:	red_xmas_box.lua
--Describe:		∫Ï…´¿Ò∫–Ω≈±æ
--Item ID:		2,1,30034
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")

TYPE_NULL 	= 0;	--√ª”–Ω±¿¯
TYPE_ITEM 	= 1;	--∆’Õ®ŒÔ∆∑
TYPE_EQUIP 	= 2;	--¥¯ Ù–‘◊∞±∏¿‡ŒÔ∆∑
TYPE_CMD 	= 3;	--√¸¡Ó

--=========================================================================================
g_szLogTitle = "Giang Sinh 2008"		--¥À¥¶∑÷Œ™2∂Œ÷ª «Œ™¡À≤ª‘ˆº”–¬µƒ∑≠“Î
g_nVietUseBoxEnd = 2009011200					--¿Ò∫–µƒ π”√Ωÿ÷π»’∆⁄
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100000000						--∑÷ƒ∏£¨±Ì æ∏≈¬ µƒµ•Œª «x∑÷÷Æ1
g_nExpNum = 150000								-- π”√“ª∏ˆ∫Ï…´¿Ò∫–ªÒµ√µƒæ≠—È÷µ

g_szFileName = "red_xmas_box.lua"			--Œƒº˛√˚

g_tbItem = 
{
	--		¿‡–Õ	   ∏≈¬ 		 ˝¡ø √˚◊÷			ID1,ID2,ID3
	[1] = {TYPE_ITEM,	250,		1,	"Kim Cang PhÙc Ma kinh",	0,	107,	1},
	[2] = {TYPE_ITEM,	250,		1,	"Ti“m Long MÀt tﬁch",		0,	107,	3},
	[3] = {TYPE_ITEM,	250,		1,	"V´ Tr«n MÀt tﬁch",		0,	107,	5},
	[4] = {TYPE_ITEM,	250,		1,	"Thi™n La MÀt Tﬁch",		0,	107,	7},
	[5] = {TYPE_ITEM,	250,		1,	"Nh≠ ˝ MÀt Tﬁch",		0,	107,	9},
	[6] = {TYPE_ITEM,	250,		1,	"B›ch H∂i PhÊ",		0,	107,	11},
	[7] = {TYPE_ITEM,	250,		1,	"HÁn ßÈn MÀt tﬁch",		0,	107,	13},
	[8] = {TYPE_ITEM,	250,		1,	"Qu˝ Thi™n MÀt tﬁch",		0,	107,	15},
	[9] = {TYPE_ITEM,	250,		1,	"Huy“n ∂nh MÀt tﬁch",		0,	107,	17},
	[10] = {TYPE_ITEM,	250,		1,	"Qu©n Tˆ MÀt tﬁch",		0,	107,	19},
	[11] = {TYPE_ITEM,	250,		1,	"Tr n Qu©n MÀt tﬁch",		0,	107,	21},
	[12] = {TYPE_ITEM,	250,		1,	"Xuy™n V©n MÀt tﬁch",		0,	107,	23},
	[13] = {TYPE_ITEM,	250,		1,	"U Minh Qu˚ LÙc",		0,	107,	25},
	[14] = {TYPE_ITEM,	250,		1,	"Linh CÊ MÀt tﬁch",		0,	107,	27},
	[15] = {TYPE_ITEM,	250,		1,	"ßπt Ma VÚ quy’t",	2,	6,		10},
	[16] = {TYPE_ITEM,	250,		1,	"Long Tr∂o ThÒ quy’t",2,	6,		20},
	[17] = {TYPE_ITEM,	250,		1,	"Kim Cang Chÿ quy’t",2,	6,		31},
	[18] = {TYPE_ITEM,	250,		1,	"M∑n Thi™n VÚ quy’t",	2,	6,		46},
	[19] = {TYPE_ITEM,	250,		1,	"ßπi Bi quy’t",2,	6,		59},
	[20] = {TYPE_ITEM,	250,		1,	"M™ T©m KhÛc quy’t",2,	6,		70},
	[21] = {TYPE_ITEM,	250,		1,	"TÛy Quy“n",		2,	6,		79},
	[22] = {TYPE_ITEM,	250,		1,	"ß∂ C»u quy’t",	2,	6,		88},
	[23] = {TYPE_ITEM,	250,		1,	"Th t Ti÷t Ki’m quy’t",2,	6,		108},
	[24] = {TYPE_ITEM,	250,		1,	"Th≠Óng Thanh C´ng quy’t",2,	6,		119},
	[25] = {TYPE_ITEM,	250,		1,	"B›ch Th≠¨ng quy’t",2,	6,		130},
	[26] = {TYPE_ITEM,	250,		1,	"L≠u Tuy÷t Ti‘n quy’t",2,	6,		141},
	[27] = {TYPE_ITEM,	250,		1,	"B› ki’p Thi Li÷t Ma C´ng",	2,	6,		154},
	[28] = {TYPE_ITEM,	250,		1,	"B› ki’p Tµm CÊ",		2,	6,		168},
	[29] = {TYPE_ITEM,	1000,		1,	"B∏t B∂o T»y TÒy Ti™n ß¨n",	2,	0,		138},
	[30] = {TYPE_ITEM,	2000,		1,	"T»y TÒy linh Æ¨n",		2,	0,		137},
	[31] = {TYPE_ITEM,	500000,	1,	"Ti”u Nh≠ ˝",		2,	1,		30030},
	[32] = {TYPE_ITEM,	10000,		1,	"Chi™m Y PhÊ",		0,	107,	66},
	[33] = {TYPE_ITEM,	15000,	1,	"Tˆ Hµ MÀt tﬁch",		0,	107,	65},
	[34] = {TYPE_ITEM,	20000,	1,	"Thi™n Hµ MÀt tﬁch",		0,	107,	64},
	[35] = {TYPE_ITEM,	400000,	1,	"M∂nh Thi™n thπch",		2,	2,		7},
	[36] = {TYPE_ITEM,	800000,	1,	"Thi™n thπch",			2,	2,		8},
	[37] = {TYPE_ITEM,	1000000,	1,	"M∂nh B®ng thπch",		2,	1,		148},
	[38] = {TYPE_ITEM,	1000000,	1,	"B®ng thπch",			2,	1,		149},
	[39] = {TYPE_ITEM,	10000,	1,	"C©y B∏t Nh∑",		2,	0,		398},
	[40] = {TYPE_ITEM,	10000,	1,	"C©y B∏t Nh∑ nh·",	2,	0,		504},
	[41] = {TYPE_ITEM,	25000000,	1,	"LÈ thÒy",			2,	0,		351},
	[42] = {TYPE_ITEM,	2000000,	1,	"BÂng Lai LÈ ThÒy",		2,	1,		1012},
	--		¿‡–Õ	   ∏≈¬   ˝÷µ	Ã· æ◊÷∑˚¥Æ 		√¸¡Ó◊÷∑˚¥Æ
	[43] = {TYPE_CMD,	14000000,	1,	{"Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[44] = {TYPE_CMD,	14000000,	2,	{"Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[45] = {TYPE_CMD,	14000000,	3,	{"Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[46] = {TYPE_CMD,	14000000,	20,	"Æi”m tu luy÷n",		"ModifyPopur(%d)"},
	[47] = {TYPE_CMD,	13225000,	100,"ßi”m Tµng ki’m",	"SetTask(1801, GetTask(1801)+%d)"},
}



--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		return
	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho∂ng trËng hµnh trang ho∆c s¯c l˘c kh´ng ÆÒ, xin ki”m tra lπi!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--æ≠—ÈΩ±¿¯≤ø∑÷
	local nExp = g_nExpNum
	local nExpTotal = GetTask(TOTALEXP_08_XMAS_VIET)
	if nExpTotal >= EXP_LIMIT_08_XMAS_VIET then
		Msg2Player("ß∑ v≠Ót qu∏ kinh nghi÷m cao nh t cÒa hoπt ÆÈng gi∏ng sinh "..EXP_LIMIT_08_XMAS_VIET.." , Hi÷n tπi kh´ng th” nhÀn th™m kinh nghi÷m tı hoπt ÆÈng nµy, nh≠ng c„ th” sœ c„ c¨ hÈi nhÀn ph«n th≠Îng kh∏c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > EXP_LIMIT_08_XMAS_VIET then
		nExp = EXP_LIMIT_08_XMAS_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_XMAS_VIET, (nExpTotal+nExp) )
		Msg2Player("Bπn nhÀn Æ≠Óc  "..nExp.."  Æi”m kinh nghi÷m");

		local szItemName = "Æi”m kinh nghi÷m"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "HÈp Quµ ß·", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
	--ŒÔ∆∑Ω±¿¯≤ø∑÷
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = ""

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
		szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--ƒ¨»œ√¸¡Ó≥…π¶÷¥––
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("Bπn nhÀn Æ≠Óc  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "HÈp Quµ ß·", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "HÈp Quµ ß·", "", "", "", "", "Thu Æ≠Óc th t bπi, ".."AddItem return value = "..nRetCode)
	end
end

--∞¥’’∏≈¬ ªÒµ√g_tbItem¿Ô√Êµƒ“ªœÓƒ⁄»›
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

--ºÏ≤È ‰»Îµƒtable «∑Ò’˝»∑
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

function nothing()

end
