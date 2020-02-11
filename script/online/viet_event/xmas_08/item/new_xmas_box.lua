--File name:	new_xmas_box.lua
--Describe:		ÀñºÐ½Å±¾
--Item ID:		2,1,30035
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")

TYPE_NULL 	= 0;	--Ã»ÓÐ½±Àø
TYPE_ITEM 	= 1;	--ÆÕÍ¨ÎïÆ·
TYPE_EQUIP 	= 2;	--´øÊôÐÔ×°±¸ÀàÎïÆ·
TYPE_CMD 	= 3;	--ÃüÁî

--=========================================================================================
g_szLogTitle = "Giang Sinh 2008"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_nVietUseBoxEnd = 2009010500				--ÀñºÐµÄÊ¹ÓÃ½ØÖ¹ÈÕÆÚ
g_nNeedRoom = 1
g_nNeedWeight = 100
g_nDenominator = 100000						--·ÖÄ¸£¬±íÊ¾¸ÅÂÊµÄµ¥Î»ÊÇx·ÖÖ®1

g_szFileName = "new_xmas_box.lua"			--ÎÄ¼þÃû

g_tbItem = 
{
	--		ÀàÐÍ	   ¸ÅÂÊ		ÊýÁ¿ Ãû×Ö		ID1,ID2,ID3
	[1] = {TYPE_EQUIP,	10,		1,	"Tµng KiÕm Kim Ên",		0,	102,	40},
	[2] = {TYPE_EQUIP,	10,		1,	"Tµng KiÕm Kú Th¹ch",		0,	102,	39},
	[3] = {TYPE_EQUIP_BODY,	10,		1,	"Tµng KiÕm Tö Kim m·o",	0,	103,	95},
	[4] = {TYPE_EQUIP,	33330,	1,	"Tµng KiÕm B¶o Ch©u",		0,	102,	38},
	[5] = {TYPE_EQUIP_BODY,	33320,	1,	"Kim Lò Th­êng",	0,	100,	95},
	[6] = {TYPE_EQUIP_BODY,	33320,	1,	"Tµng KiÕm ¤ kim phôc",	0,	101,	95},
}



--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
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
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	
	if nType == TYPE_EQUIP_BODY then
		local nBodyType = GetBody()
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7]  + nBodyType - 1,g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	end


	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." "..szItemName)
		end
		WriteLogEx(g_szLogTitle, "Hép quµ", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Hép quµ", "", "", "", "", "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

--°´ÕÕ¸ÅÂÊ»ñµÃg_tbItemÀïÃæµÄÒ»ÏîÄÚÈÝ
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

