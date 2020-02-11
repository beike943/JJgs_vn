Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--Ò»Ò³×î´óÏÔÊ¾ÊýÁ¿
g_szPacketName = "Tói ¢n S­ khã quªn";	--°üµÄÃû×Ö
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
g_tbItem = 
{		--	ID1,ID2,ID3,Ãû×Ö
	[1]  = {0,2,2501,"KiÕm ¢n s­","S­ ¢n KiÕm (ch­a nhËp ph¸i, Nga Mi, Vâ §ang cã thÓ dïng)"},
	[2]  = {0,5,2501,"C«n ¢n s­","S­ ¢n C«n (ch­a nhËp ph¸i, ThiÕu l©m tôc gia, C¸i Bang « y cã thÓ dïng)"},
	[3]  = {0,0,2501,"¢n s­ Thñ","S­ ¢n Thñ (ch­a nhËp ph¸i, vâ t¨ng ThiÕu L©m, C¸i Bang TÜnh Y cã thÓ dïng)"},
	[4]  = {0,1,2501,"Ch©m ¢n s­","S­ ¢n Ch©m (ch­a nhËp ph¸i, §­êng M«n cã thÓ dïng)"},
	[5]  = {0,3,2501,"§ao ¢n s­","S­ ¢n §ao (tôc gia thiÕu l©m cã thÓ dïng)"},
	[6]  = {0,8,2501,"Tr­îng ¢n s­","S­ ¢n Tr­îng (ThiÕu L©m ThiÒu T¨ng cã thÓ sö dông)"},
	[7]  = {0,10,2501,"S­ ¢n CÇm ","S­ ¢n CÇm (Nga Mi Tôc Gia (cã thÓ sö dông)"},
	[8]  = {0,9,2501,"S­ ¢n Bót","S­ ¢n Bót (Vâ §ang Tôc Gia cã thÓ sö dông)"},
	[9]  = {0,6,2501,"S­ ¢n Th­¬ng","S­ ¢n Th­¬ng (D­¬ng M«n Th­¬ng Kþ cã thÓ sö dông)"},
	[10]  = {0,4,2501,"S­ ¢n Cung ","S­ ¢n Cung (D­¬ng M«n Cung Kþ cã thÓ sö dông)"},
	[11]  = {0,7,2501,"S­ ¢n NhÉn","S­ ¢n NhÉn (Ngò §éc Tµ HiÖp cã thÓ sö dông)"},
	[12]  = {0,11,2501,"S­ ¢n Tr¶o ","S­ ¢n Tr¶o (Ngò §éc Cç S­ cã thÓ sö dông)"},
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
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
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
	Say("B¹n muèn më <color=yellow>"..g_szPacketName.."<color> kh«ng? H·y lùa chän vò khÝ b¹n cÇn theo m«n ph¸i",getn(selTab),selTab);
end

function get_item_list(nItemIdx)
	local tSelTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(tSelTab,format(g_tbItem[i][5].."/#add_item(%d,%d)",i,nItemIdx));
	end;
	return tSelTab;
end;

function add_item(nIdx,nItemIdx)
	local selTab = {
				format("§ång ý/#add_item_confirm(%d,%d)",nIdx,nItemIdx),
				"nghÜ l¹i xem/nothing",
				}
	Say("B¹n muèn chän <color=yellow>"..g_tbItem[nIdx][4].."<color> vò khÝ nµy kh«ng?",getn(selTab),selTab);
end;

function add_item_confirm(nIdx,nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Hµnh trang vµ søc lùc kh«ng ®ñ, ®iÒu chØnh l¹i hµnh trang råi më"..g_szPacketName.."!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		give_equip(nIdx);
		WriteLog("["..g_szPacketName.."]:"..GetName().."Më 1 tói ");
	end;
end;

function give_equip(nIdx)
	local nBody = GetBody();
	local nRetCode = 0;
	nRetCode = AddItem(0,103,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 S­ ¢n M·o");
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn S­ ¢n M¹o bÞ lçi, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,100,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 S­ ¢n Y");
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn ®­îc S­ ¢n Y XuÊt Th¸c, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,101,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 S­ ¢n Trang ");
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn ®­îc S­ ¢n Trang XuÊt Th¸c, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],1,1,-1,-1,-1,-1,-1,-1)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc "..g_tbItem[nIdx][4]);
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn ®­îc"..g_tbItem[nIdx][4].."cã lçi, nRetCode:"..nRetCode)
	end;
end;