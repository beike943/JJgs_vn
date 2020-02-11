--File name:	blue_xmas_box.lua
--Describe:		¿∂…´¿Ò∫–Ω≈±æ
--Item ID:		2,1,30033
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
g_nDenominator = 10000							--∑÷ƒ∏£¨±Ì æ∏≈¬ µƒµ•Œª «x∑÷÷Æ1
g_nExpNum = 80000								-- π”√“ª∏ˆ¿∂…´¿Ò∫–ªÒµ√µƒæ≠—È÷µ

g_szFileName = "blue_xmas_box.lua"			--Œƒº˛√˚

g_tbItem = 
{
	--		¿‡–Õ	   ∏≈¬ 		 ˝¡ø √˚◊÷		ID1,ID2,ID3
	[1]  = {TYPE_NULL,	4535},
	[2]  = {TYPE_ITEM,	10,		1,	"Thi™n Hµ MÀt tﬁch",	0,	107,64},
	[3]  = {TYPE_ITEM,	10,	1,	"NgÚ Qu˚ MÀt tﬁch",	0,	107,63},
	[4]  = {TYPE_ITEM,	10,	1,	"BÊ Kim MÀt tﬁch",	0,	107,61},
	[5]  = {TYPE_ITEM,	10,	1,	"BÊ Thπch MÀt tﬁch",	0,	107,62},
	[6]  = {TYPE_ITEM,	2,	1,	"M∂nh Thi™n thπch",	2,	2,	7},
	[7]  = {TYPE_ITEM,	10,	1,	"Thi™n thπch",		2,	2,	8},
	[8]  = {TYPE_ITEM,	10,	1,	"M∂nh B®ng thπch",	2,	1,	148},
	[9]  = {TYPE_ITEM,	10,	1,	"B®ng thπch",		2,	1,	149},
	[10]  = {TYPE_ITEM,	1,	1,	"C©y B∏t Nh∑",	2,	0,	398},
	[11] = {TYPE_ITEM,	1,	1,	"C©y B∏t Nh∑ nh·",	2,	0,	504},
	[12] = {TYPE_ITEM,	341,	1,	"LÈ thÒy",		2,	0,	351},
	[13] = {TYPE_ITEM,	50,	1,	"BÂng Lai LÈ ThÒy",	2,	1,	1052},
	--		¿‡–Õ	   ∏≈¬   ˝÷µ	Ã· æ◊÷∑˚¥Æ 	√¸¡Ó◊÷∑˚¥Æ
	[14] = {TYPE_CMD,	3000,	1,	{"Æi”m danh v‰ng"},	"ModifyReputation(%d,0)"},
	[15] = {TYPE_CMD,	2000,	5,	"Æi”m tu luy÷n",	"ModifyPopur(%d)"},
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
		WriteLogEx(g_szLogTitle, "HÈp Quµ Xanh", nItemNum, szItemName, szInfoDescribe, GetTongName() )
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
		WriteLogEx(g_szLogTitle, "HÈp Quµ Xanh", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "HÈp Quµ Xanh", "", "", "", "", "Thu Æ≠Óc th t bπi, ".."AddItem return value = "..nRetCode)
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
