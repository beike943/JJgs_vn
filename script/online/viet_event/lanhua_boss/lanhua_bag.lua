--File name:	lanhua_bag.lua
--Describe:		´ü×Ó½Å±¾(À¼»¨BOSS¡¢Ó¢×ÓBOSSµôÂä)
--Create Date:	2009-3-25 15:51
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua")

TYPE_NULL 	= 0;	--Ã»ÓĞ½±Àø
TYPE_ITEM 	= 1;	--ÆÕÍ¨ÎïÆ·
TYPE_EQUIP 	= 2;	--´øÊôĞÔ×°±¸ÀàÎïÆ·
TYPE_CMD 	= 3;	--ÃüÁî

--=========================================================================================
g_szLogTitle = "Tói Hµnh Trang".."(2, 1, 30072)"
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100							--·ÖÄ¸£¬±íÊ¾¸ÅÂÊµÄµ¥Î»ÊÇx·ÖÖ®1

g_szFileName = "lanhua_bag.lua"					--ÎÄ¼şÃû

g_tbItem = 
{
	--		ÀàĞÍ	   ¸ÅÂÊ	ÊıÁ¿ Ãû×Ö	ID1,ID2,ID3
	[1] = {TYPE_EQUIP,	50,	1,	"§«ng Ph­¬ng Long Ch©u",	0,	102,	24,	},
	[2] = {TYPE_EQUIP,	25,	1,	"Nh­ ı",		0,	102,	23,	},
	[3] = {TYPE_EQUIP,	25,	1,	"C¸t T­êng",		0,	102,	22,	},
}



--=========================================================================================
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
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

	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)

	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." "..szItemName)
		WriteLogEx("Hoat dong thang 6", "NhËn ®­îc", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx("Hoat dong thang 6", "NhËn ®­îc", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
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

function nothing()

end


