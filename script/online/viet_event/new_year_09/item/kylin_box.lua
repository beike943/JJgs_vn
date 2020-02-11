--File name:	kylin_box.lua
--Describe:		÷è÷ë±¦Ïä½Å±¾
--Item ID:		2,1,30060
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua")

--=========================================================================================
g_szLogTitle = "N¨m míi mõng xu©n : ".."Kú L©n B¶o R­¬ng"			--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_nVietUseBoxEnd = 2009021600						--Ê¹ÓÃ½ØÖ¹ÈÕÆÚ
g_nNeedRoom = 1
g_nNeedWeight = 100

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
		add_item_ex( {"Kú l©n",	0,	105,	30000,	1} )
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode, nItemIdx = 0, 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum, 1, -1, -1, -1, -1, -1, -1)
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx, 7*24*3600)
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(g_szLogTitle, "NhËn ®­îc", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "NhËn ®­îc", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

