--File name:	peach_blossom.lua
--Describe:		Ã“ª®Ω≈±æ
--Item ID:		2,1,30052
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
g_nExpNum = 50000								-- π”√“ª∏ˆÃ“ª®ªÒµ√µƒæ≠—È÷µ

g_szFileName = "peach_blossom.lua"				--Œƒº˛√˚


g_tbItem = 
{
	--		¿‡–Õ	   ∏≈¬ 		 ˝¡ø √˚◊÷		ID1,ID2,ID3
	[1] = {TYPE_NULL,	464800,	},
	[2] = {TYPE_ITEM,	500,	1,	"Thi™n Hµ MÀt tﬁch",	0,	107,	64,	},
	[3] = {TYPE_ITEM,	200,	1,	"Tˆ Hµ MÀt tﬁch",	0,	107,	65,	},
	[4] = {TYPE_ITEM,	100,	1,	"Chi™m Y PhÊ",	0,	107,	66,	},
	[5] = {TYPE_ITEM,	1000,	1,	"NgÚ Qu˚ MÀt tﬁch",	0,	107,	63,	},
	[6] = {TYPE_ITEM,	800,	1,	"BÊ Kim MÀt tﬁch",	0,	107,	61,	},
	[7] = {TYPE_ITEM,	600,	1,	"BÊ Thπch MÀt tﬁch",	0,	107,	62,	},
	[8] = {TYPE_ITEM,	10000,	1,	"M∂nh Thi™n thπch",	2,	2,	7,	},
	[9] = {TYPE_ITEM,	2000,	1,	"Thi™n thπch",	2,	2,	8,	},
	[10] = {TYPE_ITEM,	2000,	1,	"M∂nh B®ng thπch",	2,	1,	148,	},
	[11] = {TYPE_ITEM,	3000,	1,	"B®ng thπch",	2,	1,	149,	},
	[12] = {TYPE_ITEM,	20000,	1,	"BÂng Lai LÈ ThÒy",	2,	1,	1052,	},
	[13] = {TYPE_ITEM,	10000,	1,	"BÂng Lai Ti™n ThÒy",	2,	1,	1012,	},
	[14] = {TYPE_ITEM,	10000,	1,	"Th«n Gi∏p ß¨n (chi’n tr≠Íng)",	1,	0,	209,	},
	[15] = {TYPE_ITEM,	20000,	1,	"Th«n Tr∏o ß¨n (chi’n tr≠Íng)",	1,	0,	210,	},
	[16] = {TYPE_ITEM,	15000,	1,	"Th´ng C©n T∏n (chi’n tr≠Íng)",	1,	0,	211,	},
	[17] = {TYPE_ITEM,	8000,	1,	"V´ C˘c Ti™n ß¨n (chi’n tr≠Íng)",	1,	0,	224,	},
	[18] = {TYPE_ITEM,	10000,	1,	"Th t Khi’u Nguy™n B∂o ß¨n (chi’n tr≠Íng)",	1,	0,	225,	},
	[19] = {TYPE_ITEM,	12000,	1,	"Th´ng Thi™n V´ C˘c ß¨n (chi’n tr≠Íng)",	1,	0,	227,	},
	[20] = {TYPE_ITEM,	30000,	10,	"D≠Óc th∂o qu©n dÙng",	2,	0,	312,	},
	[21] = {TYPE_ITEM,	30000,	10,	"LÛa mπch qu©n dÙng",	2,	0,	309,	},
	[22] = {TYPE_ITEM,	30000,	10,	"Kho∏ng thπch qu©n dÙng",	2,	0,	307,	},
	[23] = {TYPE_ITEM,	30000,	10,	"Linh huy’t qu©n dÙng",	2,	0,	313,	},
	[24] = {TYPE_ITEM,	30000,	10,	"T¨ tªm qu©n dÙng",	2,	0,	311,	},
	[25] = {TYPE_ITEM,	30000,	10,	"GÁ qu©n dÙng",	2,	0,	308,	},
	[26] = {TYPE_ITEM,	30000,	10,	"ThuÈc da qu©n dÙng",	2,	0,	310,	},
	--		¿‡–Õ	   ∏≈¬   ˝÷µ	Ã· æ◊÷∑˚¥Æ 	√¸¡Ó◊÷∑˚¥Æ
	[27] = {TYPE_CMD,	200000,	2,	{"Æi”m danh v‰ng"},	"ModifyReputation(%d,0)"},
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
		WriteLogEx(g_szLogTitle, "Hoa ßµo", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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
		WriteLogEx(g_szLogTitle, "Hoa ßµo", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Hoa ßµo", "", "", szInfoDescribe, GetTongName(), "Thu Æ≠Óc th t bπi, ".."AddItem return value = "..nRetCode)
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

