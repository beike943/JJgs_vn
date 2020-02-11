--½Å±¾Ãû³Æ£º×ÊÔ´±¦ÏäÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÍæ¼ÒÊ¹ÓÃ×ÊÔ´±¦Ïä£¬»ñµÃÀïÃæµÄ×ÊÔ´
--²ß»®ÈË£ººî¶Ü
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-03
--´úÂëÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êý
Include("\\script\\lib\\globalfunctions.lua");

	Tb_box_prize_money = {			--½ðÇ®½±Àø¸ÅÂÊ¡¢½ð¶î¡¢ËµÃ÷
		{80,300000,"30 vµng"},
		{19,500000,"50 vµng"},
		{1,5000000,"500 l­îng"}
	}
	Tb_prize_cloth = {
		{				--¾üÊ¦Íâ×°
			{0,109,304},
			{0,109,305},
			{0,109,306},
			{0,109,307},
			24,
			"Qu©n S­ bµo (ngo¹i trang, 7 ngµy sö dông)"
		},
		{				--ÌáÏ½Ì××°
			{
				{0,108,300},
				{0,109,308},
				{0,110,300}
			},
			{
				{0,108,301},
				{0,109,309},
				{0,110,301}
			},
			{
				{0,108,302},
				{0,109,310},
				{0,110,302}
			},
			{
				{0,108,303},
				{0,109,311},
				{0,110,303}
			},
			16,
			"Bé Danh Bé (Ngo¹i trang, h¹n sö dông 7 ngµy)"
		}
	}
	Tb_unappraisal_cloth_num = {3,5}
	Tb_unappraisal_cloth_info = {
		{0,103,17},
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72},
		{0,100,17},
		{0,100,18},
		{0,100,35},
		{0,100,36},
		{0,100,53},
		{0,100,54},
		{0,100,71},
		{0,100,72},
		{0,100,17},
		{0,100,18},
		{0,100,35},
		{0,100,36},
		{0,100,53},
		{0,100,54},
		{0,100,71},
		{0,100,72},
	}
	Tb_baoshi_info = {
		{80,2642,1,"Tói B¶o Th¹ch"},
		{98,2640,1,"Vtói phèi ph­¬ng V¹n B¶o C¸c"},
		{100,2643,1,"V¹n B¶o C¸c V¹n B¶o ®å"}
	}
	Suit_be_date_num = 7
	tb_box_award = {
		[1] = {"Bµn Long BÝch", 90, {2, 1, 1000,1,1},30*24*60*60},
		[2] = {"Hßa ThÞ BÝch", 250, {2, 1, 1001,1,1}, 30*24*60*60},				
		[3] = {"Bao M¶nh Thiªn Th¹ch", 250, {2, 1, 1049,1,1}, 30*24*60*60},
		[4] = {"Bao Thiªn Th¹ch", 250, {2, 1, 1050,1,1}, 30*24*60*60},			
		[5] = {"Huy Ch­¬ng ChiÕn C«ng (Huy Hoµng)", 100, {2, 1, 9977,1,1}, 30*24*60*60},		
		[6] = {"Tói Thiªn Th¹ch Tinh Th¹ch", 50, {2, 1, 3356,1,1}, 0},		
		[7] = {"ThÇn Tµi B¶o R­¬ng", 10, {2,1,30344,1,1}, 0},		
	}
	
function OnUse(box_index)
	--ÎïÆ·¾ÀÕýÅÐ¶Ï
	local goods_id = GetItemParticular(box_index)
	if goods_id ~= 1210 then
		return
	end
	Say("Më r­¬ng tµi nguyªn sÏ ngÉu nhiªn nhËn ®­îc c¸c vËt phÈm gi¸ trÞ. Më b©y giê chø?",
	2,
	"Ta muèn më ngay/open_dtm",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--****************************È·ÈÏ¿ªÆô±¦Ïä*************************
function open_dtm()
	--Ð¯´ø¼ì²â
	if GetItemCount(2,1,1210) == 0 then
		Talk(1,"","<color=green>Chó ý<color>: Xin x¸c nhËn cã mang theo <color=yellow>B¶o r­¬ng tµi nguyªn<color>!")
		return
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(8,200) ~= 1 then
		return
	end
	--É¾³ý¼ì²â
	if DelItem(2,1,1210,1) ~= 1 then
		Talk(1,"","<color=green>Chó ý<color>: Xin x¸c nhËn cã mang theo <color=yellow>B¶o r­¬ng tµi nguyªn<color>!")
		return
	end
	--½±ÀøÔö¼Ó
		--¼ÓÇ®
	local rand_num = gf_GetRandItemByTable(tb_box_award,1000,2)
	local nRet, nItemIdx = gf_AddItemEx(tb_box_award[rand_num][3], tb_box_award[rand_num][1])
	if nRet ==1 then
		if tb_box_award[rand_num][4] > 0 then
			SetItemExpireTime(nItemIdx, tb_box_award[rand_num][4])
		end
	end
	Msg2Global("Ng­êi ch¬i: "..GetName().." më b¶o r­¬ng tµi nguyªn nhËn ®­îc "..tb_box_award[rand_num][1])
	WriteLogEx("Cong Thanh Chien","më r­¬ng tµi nguyªn",1,tb_box_award[rand_num][1] )
end
