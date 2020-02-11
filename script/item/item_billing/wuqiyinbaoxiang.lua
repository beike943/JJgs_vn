--create date:2007-07-02
--author:yanjun
--describe:
--ÎäÆ÷Òø±¦ÏäÊ¹ÓÃºó£¬¿ÉÒÔÑ¡Ôñ»ñµÃ1°ÑÈÎÒâµÄÎ´¿ª·æµÄ76¼¶ÎäÆ÷¡£
Include("\\script\\lib\\globalfunctions.lua");
TYPE_ITEM = 1;
TYPE_EQUIP = 2;
--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--Ò»Ò³×î´óÏÔÊ¾ÊýÁ¿
g_szPacketName = "R­¬ng vò khÝ B¹c ";	--°üµÄÃû×Ö
g_nNeedRoom = 2;
g_nNeedWeight = 150;	
g_tbItem = 
{		--	ID1,ID2,ID3,Ãû×Ö,ÊýÁ¿/Öµ,ÀàÐÍ
	[1]  = {2,1,375,"V¹n NhÉn ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[2]  = {2,1,376,"Háa Tinh ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[3]  = {2,1,377,"LiÖt DiÖm ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[4]  = {2,1,378,"M·n Thiªn Hoa Vò ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[5]  = {2,1,379,"Cæ §Ýnh ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[6]  = {2,1,380,"Hi Nh©n CÇm ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[7]  = {2,1,381,"ThÇn Hµnh ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[8]  = {2,1,382,"A La H¸n Tr­îng ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[9]  = {2,1,383,"§¹i Hµo L«i Th­¬ng ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[10] = {2,1,384,"ThÇn Cung ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[11] = {2,1,385,"M·nh Hæ ch­a gi¸m ®Þnh",1,TYPE_ITEM},
	[12] = {2,1,386,"L¨ng Phong ch­a gi¸m ®Þnh",1,TYPE_ITEM},
}
--=========ÒÔÏÂ´úÂëÎÞÐë¸Ä¶¯================================================================
function OnUse(nItemIdx)
	list_item(1,getn(g_tbItem),nItemIdx);
end;

function list_item(nPageNum,nRecordCount,nItemIdx)
	local tbItemTab = get_item_list(nItemIdx);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbItemTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n Trang tr­íc/#list_item(%d,%d,%d)",nPageNum-1,nRecordCount,nItemIdx));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n Trang sau/#list_item(%d,%d,%d)",nPageNum+1,nRecordCount,nItemIdx));	
	end;
	tinsert(selTab,"\n §ãng");
	Say("Xin chän vËt phÈm b¹n cÇn: ",getn(selTab),selTab);
end

function get_item_list(nItemIdx)
	local tSelTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(tSelTab,format(g_tbItem[i][4].."/#add_item(%d,%d)",i,nItemIdx));
	end;
	return tSelTab;
end;

function add_item(nIdx,nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Hµnh trang vµ søc lùc kh«ng ®ñ, ®iÒu chØnh l¹i hµnh trang råi më"..g_szPacketName.."!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nType = g_tbItem[nIdx][6];
		local szItemName = g_tbItem[nIdx][4];
		if nType == TYPE_ITEM then
			nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],g_tbItem[nIdx][5],5);
		elseif nType == TYPE_EQUIP then
			nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],g_tbItem[nIdx][5],5,-1,-1,-1,-1,-1,-1);
		end;
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..szItemName);
			WriteLog("["..g_szPacketName.."]:"..GetName().."NhËn ®­îc vËt phÈm"..szItemName);
		else
			WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn ®­îc vËt phÈm"..szItemName.."AddItem b¸o lç, trÞ ph¶n håi: "..nRetCode);
		end;
	end;
end;