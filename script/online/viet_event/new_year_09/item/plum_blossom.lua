--File name:	plum_blossom.lua
--Describe:		√∑ª®Ω≈±æ
--Item ID:		2,1,30053
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")

TYPE_NULL 	= 0;	--√ª”–Ω±¿¯
TYPE_ITEM 	= 1;	--∆’Õ®ŒÔ∆∑
TYPE_EQUIP 	= 2;	--¥¯ Ù–‘◊∞±∏¿‡ŒÔ∆∑
TYPE_CMD 	= 3;	--√¸¡Ó

--=========================================================================================
g_szLogTitle = "Hoat dong Tet 2009"			--¥À¥¶∑÷Œ™2∂Œ÷ª «Œ™¡À≤ª‘ˆº”–¬µƒ∑≠“Î
g_nVietUseBoxEnd = 2009022300					-- π”√Ωÿ÷π»’∆⁄
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 1000000						--∑÷ƒ∏£¨±Ì æ∏≈¬ µƒµ•Œª «x∑÷÷Æ1
g_nExpNum = 125000								-- π”√“ª∏ˆ√∑ª®ªÒµ√µƒæ≠—È÷µ

g_szFileName = "plum_blossom.lua"				--Œƒº˛√˚

g_tbItem = 
{
	--		¿‡–Õ	   ∏≈¬ 		 ˝¡ø √˚◊÷			ID1,ID2,ID3		∆⁄œﬁ(-1Œ™√ª”– ±º‰œﬁ÷∆)
	[1] = {TYPE_ITEM,	2,			1,	"Kim Cang PhÙc Ma kinh",			0,	107,	1,	-1,	},
	[2] = {TYPE_ITEM,	2,			1,	"Ti“m Long MÀt tﬁch",				0,	107,	3,	-1,	},
	[3] = {TYPE_ITEM,	2,			1,	"V´ Tr«n MÀt tﬁch",				0,	107,	5,	-1,	},
	[4] = {TYPE_ITEM,	2,			1,	"Thi™n La MÀt Tﬁch",				0,	107,	7,	-1,	},
	[5] = {TYPE_ITEM,	2,			1,	"Nh≠ ˝ MÀt Tﬁch",				0,	107,	9,	-1,	},
	[6] = {TYPE_ITEM,	2,			1,	"B›ch H∂i PhÊ",				0,	107,	11,	-1,	},
	[7] = {TYPE_ITEM,	2,			1,	"HÁn ßÈn MÀt tﬁch",				0,	107,	13,	-1,	},
	[8] = {TYPE_ITEM,	2,			1,	"Qu˝ Thi™n MÀt tﬁch",				0,	107,	15,	-1,	},
	[9] = {TYPE_ITEM,	2,			1,	"Huy“n ∂nh MÀt tﬁch",				0,	107,	17,	-1,	},
	[10] = {TYPE_ITEM,	2,			1,	"Qu©n Tˆ MÀt tﬁch",				0,	107,	19,	-1,	},
	[11] = {TYPE_ITEM,	2,			1,	"Tr n Qu©n MÀt tﬁch",				0,	107,	21,	-1,	},
	[12] = {TYPE_ITEM,	2,			1,	"Xuy™n V©n MÀt tﬁch",				0,	107,	23,	-1,	},
	[13] = {TYPE_ITEM,	2,			1,	"U Minh Qu˚ LÙc",				0,	107,	25,	-1,	},
	[14] = {TYPE_ITEM,	2,			1,	"Linh CÊ MÀt tﬁch",				0,	107,	27,	-1,	},
	[15] = {TYPE_ITEM,	10,			1,	"B∏t B∂o T»y TÒy Ti™n ß¨n",			2,	0,	138,	7,	},
	[16] = {TYPE_ITEM,	50,			1,	"T»y TÒy linh Æ¨n",				2,	0,	137,	7,	},
	[17] = {TYPE_ITEM,	1000,		1,	"Chi™m Y PhÊ",				0,	107,	66,	-1,	},
	[18] = {TYPE_ITEM,	2000,		1,	"Tˆ Hµ MÀt tﬁch",				0,	107,	65,	-1,	},
	[19] = {TYPE_ITEM,	3000,		1,	"Thi™n Hµ MÀt tﬁch",				0,	107,	64,	-1,	},
	[20] = {TYPE_ITEM,	10000,		1,	"M∂nh Thi™n thπch",				2,	2,		7,	-1,	},
	[21] = {TYPE_ITEM,	10000,		1,	"Thi™n thπch",					2,	2,		8,	-1,	},
	[22] = {TYPE_ITEM,	40000,		1,	"M∂nh B®ng thπch",				2,	1,	148,	-1,	},
	[23] = {TYPE_ITEM,	40000,		1,	"B®ng thπch",					2,	1,	149,	-1,	},
	[24] = {TYPE_ITEM,	10000,		1,	"BÂng Lai Ti™n ThÒy",				2,	1,	1012,	-1,	},
	[25] = {TYPE_ITEM,	20000,		1,	"BÂng Lai LÈ ThÒy",				2,	1,	1052,	-1,	},
	[26] = {TYPE_ITEM,	10000,		1,	"Ch˜ Mai",					2,	1,	30054,	-1,	},
	[27] = {TYPE_ITEM,	10000,		1,	"Ch˜ Lan",					2,	1,	30055,	-1,	},
	[28] = {TYPE_ITEM,	10000,		1,	"Ch˜ CÛc",					2,	1,	30057,	-1,	},
	[29] = {TYPE_ITEM,	10000,		1,	"Ch˜ TrÛc",					2,	1,	30056,	-1,	},
	[30] = {TYPE_ITEM,	10000,		1,	"Th’ Th©n phÔ",				2,	0,	556,	7,	},
	[31] = {TYPE_ITEM,	2000,		1,	"Th«n hµnh b› phÊ",				0,	200,	39,	7,	},
	[32] = {TYPE_ITEM,	20000,		1,	"Ti™u Ki’p t∏n",				2,	0,	141,	7,	},
	[33] = {TYPE_EQUIP,	100,		1,	"Hoµng T´ng m∑",				0,	105,	6,	7,	},
	[34] = {TYPE_EQUIP,	100,		1,	"HÂng T´ng m∑",				0,	105,	5,	7,	},
	[35] = {TYPE_EQUIP,	100,		1,	"Bπch K˝",					0,	105,	4,	7,	},
	[36] = {TYPE_EQUIP,	100,		1,	"Bπch T´ng m∑",				0,	105,	8,	7,	},
	[37] = {TYPE_EQUIP,	100,		1,	"Hæc T´ng m∑",				0,	105,	7,	7,	},
	[38] = {TYPE_ITEM,	20000,		1,	"Ng≠ng HÂn t∏n",				1,	0,		63,	-1,	},
	[39] = {TYPE_ITEM,	20000,		1,	"V´ Ûy t∏n",				1,	0,		65,	-1,	},
	[40] = {TYPE_ITEM,	10000,		1,	"Th«n Gi∏p Æ¨n",				1,	0,		54,	-1,	},
	[41] = {TYPE_ITEM,	10000,		1,	"Th«n Tr∏o Æ¨n",				1,	0,		55,	-1,	},
	[42] = {TYPE_ITEM,	15000,		1,	"Th t X∂o Linh Æ¨n",				1,	0,		68,	-1,	},
	[43] = {TYPE_ITEM,	15000,		1,	"NgÚ Chuy”n Linh B∂o Æ¨n",			1,	0,		53,	-1,	},
	[44] = {TYPE_ITEM,	12000,		1,	"Ch›nh Nguy™n HÂi T©m Æ¨n",			1,	0,		50,	-1,	},
	[45] = {TYPE_ITEM,	70000,		15,	"D≠Óc th∂o qu©n dÙng",				2,	0,	312,	-1,	},
	[46] = {TYPE_ITEM,	70000,		15,	"LÛa mπch qu©n dÙng",				2,	0,	309,	-1,	},
	[47] = {TYPE_ITEM,	70000,		15,	"Kho∏ng thπch qu©n dÙng",				2,	0,	307,	-1,	},
	[48] = {TYPE_ITEM,	70000,		15,	"Linh huy’t qu©n dÙng",				2,	0,	313,	-1,	},
	[49] = {TYPE_ITEM,	70000,		15,	"T¨ tªm qu©n dÙng",				2,	0,	311,	-1,	},
	[50] = {TYPE_ITEM,	70000,		15,	"GÁ qu©n dÙng",				2,	0,	308,	-1,	},
	[51] = {TYPE_ITEM,	70000,		15,	"ThuÈc da qu©n dÙng",				2,	0,	310,	-1,	},
	[52] = {TYPE_ITEM,	1,			1,	"ßπt Ma VÚ quy’t",			2,	6,	10,		-1,	},
	[53] = {TYPE_ITEM,	1,			1,	"Long Tr∂o ThÒ quy’t",		2,	6,	20,		-1,	},
	[54] = {TYPE_ITEM,	1,			1,	"Kim Cang Chÿ quy’t",		2,	6,	31,		-1,	},
	[55] = {TYPE_ITEM,	1,			1,	"M∑n Thi™n VÚ quy’t",			2,	6,	46,		-1,	},
	[56] = {TYPE_ITEM,	1,			1,	"ßπi Bi quy’t",		2,	6,	59,		-1,	},
	[57] = {TYPE_ITEM,	1,			1,	"M™ T©m KhÛc quy’t",		2,	6,	70,		-1,	},
	[58] = {TYPE_ITEM,	1,			1,	"TÛy Quy“n",				2,	6,	79,		-1,	},
	[59] = {TYPE_ITEM,	1,			1,	"ß∂ C»u quy’t",			2,	6,	88,		-1,	},
	[60] = {TYPE_ITEM,	1,			1,	"Th t Ti÷t Ki’m quy’t",		2,	6,	108,	-1,	},
	[61] = {TYPE_ITEM,	1,			1,	"Th≠Óng Thanh C´ng quy’t",		2,	6,	119,	-1,	},
	[62] = {TYPE_ITEM,	1,			1,	"B›ch Th≠¨ng quy’t",		2,	6,	130,	-1,	},
	[63] = {TYPE_ITEM,	1,			1,	"L≠u Tuy÷t Ti‘n quy’t",		2,	6,	141,	-1,	},
	[64] = {TYPE_ITEM,	1,			1,	"B› ki’p Thi Li÷t Ma C´ng",			2,	6,	154,	-1,	},
	[65] = {TYPE_ITEM,	1,			1,	"B› ki’p Tµm CÊ",				2,	6,	168,	-1,	},

	--		¿‡–Õ	   ∏≈¬   ˝÷µ	Ã· æ◊÷∑˚¥Æ 		√¸¡Ó◊÷∑˚¥Æ
	[66] = {TYPE_CMD,	50000,	3,	{"Æi”m danh v‰ng"},		"ModifyReputation(%d,0)"},
	[67] = {TYPE_CMD,	70000,	20,	"Æi”m tu luy÷n",		"ModifyPopur(%d)"},
	[68] = {TYPE_CMD,	79398,	100,"ßi”m Tµng ki’m",	"SetTask(1801, GetTask(1801)+%d)"},
}


--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("VÀt ph»m nµy Æ∑ qu∏ hπn, kh´ng th” sˆ dÙng th™m n˜a.")
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
	local nExpTotal = GetTask(PLUM_TOTALEXP_09_NEWYEAR_VIET)
	if nExpTotal >= PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		Msg2Player("ßπi hi÷p Æ∑ thu Æ≠Óc kinh nghi÷m tı hoπt ÆÈng Mai ßµo ChÛc T’t v≠Ót qu∏ giÌi hπn. "..PLUM_EXP_LIMIT_09_NEWYEAR_VIET.." , Hi÷n tπi kh´ng th” nhÀn th™m kinh nghi÷m tı hoπt ÆÈng nµy, nh≠ng c„ th” sœ c„ c¨ hÈi nhÀn ph«n th≠Îng kh∏c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > PLUM_EXP_LIMIT_09_NEWYEAR_VIET then
		nExp = PLUM_EXP_LIMIT_09_NEWYEAR_VIET - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( PLUM_TOTALEXP_09_NEWYEAR_VIET, (nExpTotal+nExp) )
		Msg2Player("Bπn nhÀn Æ≠Óc  "..nExp.."  Æi”m kinh nghi÷m");

		local szItemName = "Æi”m kinh nghi÷m"
		local nItemNum = nExp
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		WriteLogEx(g_szLogTitle, "Hoa Mai", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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
		nRetCode = 1	--ƒ¨»œ√¸¡Ó≥…π¶÷¥––
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("Bπn nhÀn Æ≠Óc  "..nItemNum.." "..szItemName)
		end
		if (nType == TYPE_ITEM or nType == TYPE_EQUIP) and g_tbItem[nRandIdx][8] > 0 then
			SetItemExpireTime(nItemIdx, g_tbItem[nRandIdx][8]*24*3600)
		end
		WriteLogEx(g_szLogTitle, "Hoa Mai", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Hoa Mai", "", "", szInfoDescribe, GetTongName(), "Thu Æ≠Óc th t bπi, ".."AddItem return value = "..nRetCode)
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

