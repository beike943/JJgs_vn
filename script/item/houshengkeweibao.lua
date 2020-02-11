Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");

--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--Ò»Ò³×î´óÏÔÊ¾ÊýÁ¿
g_szPacketName = " tói HËu Sinh Kh¶ óy";	--°üµÄÃû×Ö
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
g_tbItem = 
{		--	ID1,ID2,ID3,Ãû×Ö,Ñ¡ÏîÃèÊö
	[1]  = {0,2,2500,"Thanh §éc KiÕm ","Thanh §éc KiÕm (Ch­a nhËp L­u Ph¸i, Nga Mi PhËt Gia , Vâ §ang §¹o gia cã thÓ sö dông)"},
	[2]  = {0,5,2500,"Thanh §éc C«n ","Thanh §éc C«n (Ch­a nhËp L­u Ph¸i, ThiÕu L©m Tôc Gia, C¸i Bang ¤ Y cã thÓ sö dông)"},
	[3]  = {0,0,2500,"Thanh §éc Thñ ","Thanh §éc Thñ (Ch­a nhËp L­u Ph¸i, ThiÕu L©m Vâ T¨ng, C¸i Bang TÞnh Y cã thÓ sö dông)"},
	[4]  = {0,1,2500,"Thanh §éc Kim","Thanh §éc Ch©m (Ch­a nhËp L­u Ph¸i, §­êng M«n cã thÓ sö dông)"},
	[5]  = {0,3,2500,"Thanh §éc §ao","Thanh §éc §ao (ThiÕu L©m Tôc Gia cã thÓ sö dông)"},
	[6]  = {0,8,2500,"Thanh §éc Tr­îng ","Thanh §éc Tr­îng (ThiÕu L©m ThiÒn T¨ng cã thÓ sö dông)"},
	[7]  = {0,10,2500,"Thanh §éc CÇm ","Thanh §éc CÇm (Nga Mi Tôc Gia cã thÓ sö dông)"},
	[8]  = {0,9,2500,"Thanh §éc Bót ","Thanh §éc Bót (Vâ §ang Tôc Gia cã thÓ sö dông)"},
	[9]  = {0,6,2500,"Thanh §éc Th­¬ng ","Thanh §éc Th­¬ng (D­¬ng M«n Th­¬ng Kþ cã thÓ sö dông)"},
	[10]  = {0,4,2500,"Thanh §éc Cung","Thanh §éc Cung (D­¬ng M«n Cung Kþ cã thÓ sö dông)"},
	[11]  = {0,7,2500,"Thanh §éc NhÉn","Thanh §éc NhÉn (HiÖp §éccã thÓ sö dông)"},
	[12]  = {0,11,2500,"Thanh §éc Tr¶o","Thanh §éc Tr¶o (Ngò ®éc cæ s­ cã thÓ sö dông)"},
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
	nRetCode = AddItem(0,103,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc mét Thanh §éc M¹o");
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn Thanh §éc M¹o cã lçi, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,100,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc Thanh §éc Y");
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn Thanh §éc Y cã lçi, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,101,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc Thanh §éc Trang");
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn ®­îc Thanh §éc Trang cã lçi, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],1,1,-1,-1,-1,-1,-1,-1,0,6)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc "..g_tbItem[nIdx][4]);
	else
		WriteLog("["..g_szPacketName.."Lçi]:"..GetName().."NhËn ®­îc"..g_tbItem[nIdx][4].."cã lçi, nRetCode:"..nRetCode)
	end;
end;