--IBÎïÆ·£ºÀÅß§¸£µØÃÜÏ» Ê¹ÓÃ¶ÔÓ¦½Å±¾
--¹¦ÄÜÃèÊö£ºÈÃÆäÊ¹ÓÃ±¾ÎïÆ·Ñ¡Ôñ²¢¶Ò»»¶ÔÓ¦µÄÊ¦ÃÅÃØ¼®
--´úÂë±àÐ´ÈË£ºÕÔ¹ó´º
--´úÂë±àÐ´Ê±¼ä£º2007Äê1ÔÂ17ÈÕ
--²ß»®ÈË£ºÁõÌì
Include("\\script\\online\\zgc_public_fun.lua")

MAX_SEL_PER_PAGE = 5;

way_book ={
	{"DÞch C©n Kinh (ThiÕu L©m tôc gia)",0,107,101},
	{"Nh­ Lai Kinh (ThiÕu L©m vâ t¨ng)",0,107,102},
	{"TÈy Tñy Kinh (ThiÕu L©m thiÒn t¨ng)",0,107,103},
	{"HÊp tinh mËt tÞch (§­êng M«n)",0,107,104},
	{"V¹n T­îng mËt tÞch (Nga My phËt gia)",0,107,105},
	{"Thiªn ¢m ChÊn Hån phæ (Nga My tôc gia)",0,107,106},
	{"Gi¸ng Long Ch­ëng phæ (C¸i Bang TÜnh y)",0,107,107},
	{"§¶ CÈu TrËn phæ (C¸i Bang « y)",0,107,108},
	{"Th¸i Cùc KiÕm Kinh (Vâ §ang ®¹o gia)",0,107,109},
	{"Th¸i Cùc T©m Kinh (Vâ §ang tôc gia)",0,107,110},
	{"Toµn Long th­¬ng phæ (D­¬ng M«n th­¬ng kþ)",0,107,111},
	{"B¸ V­¬ng tiÔn phæ (D­¬ng M«n cung kþ)",0,107,112},
	{"Thi V­¬ng mËt tÞch (HiÖp §éc)",0,107,113},
	{"Tµ Cæ mËt tÞch (Ngò §éc Cæ S­)",0,107,114}
}
--**********************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êý************************************
function OnUse(goods_index)
	show_page(1,getn(way_book));
end

function show_page(nPageNum,nRecordCount)
	local selTab = {};
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
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,way_book[i][1].."/#book_add_dtm("..i..")");
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,"\n Trang tr­íc/#show_page("..(nPageNum-1)..","..nRecordCount..")");
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,"\n Trang sau/#show_page("..(nPageNum+1)..","..nRecordCount..")");	
	end;
	tinsert(selTab,"\n §ãng");
	Say("Xin chän MËt tÞch trÊn ph¸i cÇn ®æi!",getn(selTab),selTab);
end

--********************************ÎïÆ·Ê¹ÓÃ¾ö¶¨************************************
function book_add_dtm(book_seq)
	Say("B¹n ®· chän"..way_book[book_seq][1]..",muèn ®æi kh«ng?",
	2,
	"§ång ý/#book_add("..book_seq..")",
	"§Ó ta suy nghÜ l¹i/end_dialog")
end
--***********************************ÃØ¼®Ôö¼Ó**************************************
function book_add(book_seq)
	if GetItemCount(2,1,1010) == 0 then
		Talk(1,"end_dialog","Xin x¸c nhËn hµnh trang cã <color=red>Lang Hoµn Phóc §Þa MËt H¹p<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	if DelItem(2,1,1010,1) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn hµnh trang cã <color=red>Lang Hoµn Phóc §Þa MËt H¹p<color>!")
		return
	end
	local add_flag = AddItem(way_book[book_seq][2],way_book[book_seq][3],way_book[book_seq][4],1)
	if add_flag == 1 then
		Msg2Player("Chóc mõng B¹n nhËn ®­îc 1 MËt tÞch trÊn ph¸i!")
	else
		WriteLog(GetName()..":§æi MËt tÞch trÊn ph¸i:"..way_book[book_seq][1].." thÊt b¹i, ký hiÖu:"..add_flag)
	end
end