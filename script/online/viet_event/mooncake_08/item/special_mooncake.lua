--File name:	special_mooncake.lua
--Describe:		Ãÿ±‘¬±˝Ω≈±æ
--Item ID:		2,1,30026
--Create Date:	2008-08-20
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

TYPE_NULL = 0;	--√ª”–Ω±¿¯
TYPE_ITEM = 1;	--∆’Õ®ŒÔ∆∑
TYPE_EQUIP = 2;	--¥¯ Ù–‘◊∞±∏¿‡ŒÔ∆∑
TYPE_CMD = 3;	--√¸¡Ó

--=========================================================================================
g_szLogTitle = "Hoπt ÆÈng trung thu : ".."B∏nh Trung thu Æ∆c bi÷t"		--¥À¥¶∑÷Œ™2∂Œ÷ª «Œ™¡À≤ª‘ˆº”–¬µƒ∑≠“Î
g_nVietUseMoonCakeEnd = 2008101300				--‘¬±˝µƒ π”√Ωÿ÷π»’∆⁄
g_nNeedRoom = 1;
g_nNeedWeight = 20;	
g_nDenominator = 1000000						--∑÷ƒ∏£¨±Ì æ∏≈¬ µƒµ•Œª «x∑÷÷Æ1
g_nExpNum = 50000								-- π”√“ª∏ˆ‘¬±˝ªÒµ√µƒæ≠—È÷µ

g_szFileName = "special_mooncake.lua"			--Œƒº˛√˚

g_tbItem = 
{
	--		¿‡–Õ	   ∏≈¬ 		 ˝¡ø √˚◊÷			ID1,ID2,ID3
	[1] = {TYPE_ITEM,	1,		1,	"Kim Cang PhÙc Ma kinh",	0,	107,	1},
	[2] = {TYPE_ITEM,	1,		1,	"Ti“m Long MÀt tﬁch",		0,	107,	3},
	[3] = {TYPE_ITEM,	1,		1,	"V´ Tr«n MÀt tﬁch",		0,	107,	5},
	[4] = {TYPE_ITEM,	1,		1,	"Thi™n La MÀt Tﬁch",		0,	107,	7},
	[5] = {TYPE_ITEM,	1,		1,	"Nh≠ ˝ MÀt Tﬁch",		0,	107,	9},
	[6] = {TYPE_ITEM,	1,		1,	"B›ch H∂i PhÊ",		0,	107,	11},
	[7] = {TYPE_ITEM,	1,		1,	"HÁn ßÈn MÀt tﬁch",		0,	107,	13},
	[8] = {TYPE_ITEM,	1,		1,	"Qu˝ Thi™n MÀt tﬁch",		0,	107,	15},
	[9] = {TYPE_ITEM,	1,		1,	"Huy“n ∂nh MÀt tﬁch",		0,	107,	17},
	[10] = {TYPE_ITEM,	1,		1,	"Qu©n Tˆ MÀt tﬁch",		0,	107,	19},
	[11] = {TYPE_ITEM,	1,		1,	"Tr n Qu©n MÀt tﬁch",		0,	107,	21},
	[12] = {TYPE_ITEM,	1,		1,	"Xuy™n V©n MÀt tﬁch",		0,	107,	23},
	[13] = {TYPE_ITEM,	1,		1,	"U Minh Qu˚ LÙc",		0,	107,	25},
	[14] = {TYPE_ITEM,	1,		1,	"Linh CÊ MÀt tﬁch",		0,	107,	27},
	[15] = {TYPE_ITEM,	5,		1,	"B∏t B∂o T»y TÒy Ti™n ß¨n",	2,	0,		138},
	[16] = {TYPE_ITEM,	10,		1,	"T»y TÒy linh Æ¨n",		2,	0,		137},
	[17] = {TYPE_ITEM,	3000,	1,	"Ti”u Nh≠ ˝",		2,	1,		30030},
	[18] = {TYPE_ITEM,	70,		1,	"Chi™m Y PhÊ",		0,	107,	66},
	[19] = {TYPE_ITEM,	100,	1,	"Tˆ Hµ MÀt tﬁch",		0,	107,	65},
	[20] = {TYPE_ITEM,	150,	1,	"Thi™n Hµ MÀt tﬁch",		0,	107,	64},
	[21] = {TYPE_ITEM,	2000,	1,	"M∂nh Thi™n thπch",		2,	2,		7},
	[22] = {TYPE_ITEM,	5000,	1,	"Thi™n thπch",			2,	2,		8},
	[23] = {TYPE_ITEM,	5000,	1,	"M∂nh B®ng thπch",		2,	1,		148},
	[24] = {TYPE_ITEM,	5000,	1,	"B®ng thπch",			2,	1,		149},
	[25] = {TYPE_ITEM,	10000,	1,	"C©y B∏t Nh∑",		2,	0,		398},
	[26] = {TYPE_ITEM,	20000,	1,	"C©y B∏t Nh∑ nh·",	2,	0,		504},
	[27] = {TYPE_ITEM,	140000,	1,	"LÈ thÒy",			2,	0,		351},
	[28] = {TYPE_ITEM,	10000,	1,	"BÂng Lai Ti™n ThÒy",		2,	1,		1012},
	--		¿‡–Õ	   ∏≈¬   ˝÷µ	Ã· æ◊÷∑˚¥Æ 		√¸¡Ó◊÷∑˚¥Æ
	[29] = {TYPE_CMD,	50000,	1,	"Æi”m danh v‰ng",	"ModifyReputation(%d,0)"},
	[30] = {TYPE_CMD,	150000,	2,	"Æi”m danh v‰ng","ModifyReputation(%d,0)"},
	[31] = {TYPE_CMD,	150000,	3,	"Æi”m danh v‰ng","ModifyReputation(%d,0)"},
	[32] = {TYPE_CMD,	200000,	20,	"Æi”m tu luy÷n",		"ModifyPopur(%d)"},
	[33] = {TYPE_CMD,	150000,	1,	"Æi”m cËng hi’n s≠ m´n",	"SetTask(336, GetTask(336)+%d)"},
	[34] = {TYPE_CMD,	99651,	100,"Æi”m Tµng ki’m",	"SetTask(1801, GetTask(1801)+%d)"},
}

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseMoonCakeEnd then
		return
	end
	if GetLevel() < 20 then
		Talk(1,"","Chÿ c„ ng≠Íi ch¨i Æπt Æºng c p tı 20 trÎ l™n mÌi c„ th” sˆ dÙng vÀt ph»m nµy.")
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
	local nExpTotal = GetTask(TOTALEXP_08_MOONCAKE_VIET)
	if nExpTotal >= g_nExpTotal_MoonCakeViet then
		Msg2Player("Bπn Æ∑ Æπt giÌi hπn Æi”m kinh nghi÷m c„ th” nhÀn Æ≠Óc trong hoπt ÆÈng Trung thu l«n nµy. "..g_nExpTotal_MoonCakeViet.." , Hi÷n tπi sˆ dÙng B∏nh trung thu sœ kh´ng nhÀn Æ≠Óc Æi”m kinh nghi÷m nh≠ng sœ c„ c¨ hÈi nhÀn Æ≠Óc ph«n th≠Îng kh∏c.");
		nExp = 0;
	elseif nExpTotal + g_nExpNum > g_nExpTotal_MoonCakeViet then
		nExp = g_nExpTotal_MoonCakeViet - nExpTotal;
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_MOONCAKE_VIET, (nExpTotal+nExp) )
		Msg2Player("Bπn nhÀn Æ≠Óc  "..nExp.."  Æi”m kinh nghi÷m");		
		WriteLogEx(szLogTrungThuName,"nhÀn",nExp,"Æi”m kinh nghi÷m")
	end
	--ŒÔ∆∑Ω±¿¯≤ø∑÷
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szMsgText = ""
	if szItemName ~= "Æi”m danh v‰ng" then
		szMsgText = "Bπn nhÀn Æ≠Óc  "..nItemNum.." c∏i "..szItemName
	end
	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	elseif nType == TYPE_CMD then
		dostring(format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3]))
		nRetCode = 1	--ƒ¨»œ√¸¡Ó≥…π¶÷¥––
		if szItemName ~= "Æi”m danh v‰ng" then
			szMsgText = "Bπn nhÀn Æ≠Óc  "..nItemNum.." "..szItemName
		end
	end;
	if nRetCode == 1 then
		if g_tbItem[nRandIdx][4] ~= "Æi”m danh v‰ng"  then
			Msg2Player(szMsgText)
		end
		WriteLogEx(szLogTrungThuName,"B∏nh trung thu Æ∆c bi÷t",nItemNum,szItemName)			
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name: "..GetName().."] "..szMsgText.." Failed, return value = "..nRetCode)
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
