--½Å±¾Ãû³Æ£º2007Äê´º½Ú»ªÉ½ÉñĞĞ·ûÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃ±¾ÎïÆ·¿ÉÒÔ¿ìËÙµ½´ï»ªÉ½¾º¼¼³¡
--´úÂë±àĞ´ÈË£º´å³¤
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´Ê±¼ä£º2007-01-29
--ĞŞ¸Ä¼ÇÂ¼£º
--=============================¹«¹²±äÁ¿¶¨ÒåÇø=========================
goto_huashan_fu_id = 671
--==============================º¯ÊıÖ÷Âß¼­Çø==========================
function OnUse()
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>Nh¾c nhì<color>: Ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ho¹t ®éng Hoa S¬n C¶nh Kü!")
		return
	end
	Say("Dïng Hoa S¬n ThÇn phï cã thÓ nhanh chãng vµo Héi Hoa S¬n, nh­ng h¹n chÕ 10 phót míi sö dông mét lÇn. Ng­¬i cã muèn sö dông kh«ng?",
	2,
	"Ta muèn ®Õn Héi Hoa S¬n/goto_huashan_fast",
	"§Ó ta suy nghÜ l¹i/end_dialog")
end
--**********************************goto»ªÉ½***************************
function goto_huashan_fast()
	if GetItemCount(2,0,goto_huashan_fu_id) == 0 then
		Talk(1,"","X¸c nhËn trong hµnh trang cña b¹n cã <color=red>Hoa S¬n ThÇn phï<color>!")
		return
	end
	if DelItem(2,0,goto_huashan_fu_id,1) ~= 1 then
		Talk(1,"","X¸c nhËn trong hµnh trang cña b¹n cã <color=red>Hoa S¬n ThÇn phï<color>!")
		return
	end
	local goto_huashan_att = {
		{1564,2912},
		{1552,2899},
		{1562,2935},
		{1581,2924},
		{1595,2901},
		{1579,2896},
		{1566,2902}	
	}
	local att_seq = random(1,getn(goto_huashan_att))
	NewWorld(969,goto_huashan_att[att_seq][1],goto_huashan_att[att_seq][2])
	SetFightState(1)
	SetDeathPunish(0)
	Msg2Player("B¹n ®· ®æi sang tr¹ng th¸i PK!")
end
--*********************************¿Õº¯Êı******************************
function end_dialog()
end
