--File name:	specilize_xmas_box.lua
--Describe:		Ãÿ±¿Ò∫–Ω≈±æ
--Item ID:		2,1,30037
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
g_nNeedWeight = 100
g_nDenominator = 100							--∑÷ƒ∏£¨±Ì æ∏≈¬ µƒµ•Œª «x∑÷÷Æ1

g_szFileName = "specilize_xmas_box.lua"			--Œƒº˛√˚

g_tbItem = 
{
	--		¿‡–Õ	   ∏≈¬ 		 ˝¡ø √˚◊÷		ID1,ID2,ID3
	[1]  = {TYPE_EQUIP,	6,		1,	"Ph∏ Y™n Æao",	0,	3,	6001},
	[2]  = {TYPE_EQUIP,	6,		1,	"Ph∏ Y™n c´n",	0,	5,	6002},
	[3]  = {TYPE_EQUIP,	6,		1,	"Hµm Y™n thÒ",	0,	0,	6004},
	[4]  = {TYPE_EQUIP,	6,		1,	"PhÔ Y™n tr≠Óng",	0,	8,	6003},
	[5]  = {TYPE_EQUIP,	6,		1,	"Phi Y™n ki’m",	0,	2,	6006},
	[6]  = {TYPE_EQUIP,	7,		1,	"VÀn Y™n c«m",	0,	10,	6007},
	[7]  = {TYPE_EQUIP,	7,		1,	"V©n Y™n thÒ",	0,	0,	6008},
	[8]  = {TYPE_EQUIP,	7,		1,	"L≠u Y™n c´n",	0,	5,	6009},
	[9]  = {TYPE_EQUIP,	7,		1,	"Huy“n Y™n ki’m",	0,	2,	6010},
	[10] = {TYPE_EQUIP,	7,		1,	"VÚ Y™n bÛt",	0,	9,	6011},
	[11] = {TYPE_EQUIP,	7,		1,	"Hµ Ti™m Th≠¨ng",	0,	6,	6012},
	[12] = {TYPE_EQUIP,	7,		1,	"Hµnh Y™n Cung",	0,	4,	6013},
	[13] = {TYPE_EQUIP,	7,		1,	"Tr‰c Y™n nh…n",	0,	7,	6014},
	[14] = {TYPE_EQUIP,	7,		1,	"Y™u Y™n tr∂o",	0,	11,	6015},
	[15] = {TYPE_EQUIP,	7,		1,	"Tµng Y™n ch©m",	0,	1,	6005},
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
	--ŒÔ∆∑Ω±¿¯≤ø∑÷
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
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

		for i=1, 3 do
			AddGlobalNews("ChÛc mıng  "..GetName().." MÎ HÈp Quµ ß∆c Bi÷t thu Æ≠Óc  "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "HÈp Quµ ß∆c Bi÷t", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "HÈp Quµ ß∆c Bi÷t", "", "", "", "", "Thu Æ≠Óc th t bπi, ".."AddItem return value = "..nRetCode)
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

