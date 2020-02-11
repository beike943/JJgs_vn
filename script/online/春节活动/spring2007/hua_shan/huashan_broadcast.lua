--½Å±¾Ãû³Æ£º2007Äê´º½Ú»î¶¯-»ªÉ½¾º¼¼-»î¶¯×¼±¸½Å±¾
--½Å±¾¹¦ÄÜ£º»ªÉ½¾º¼¼»î¶¯µÄ¹ã²¥
--´úÂë±àÐ´ÈË£º´å³¤
--´úÂë±àÐ´Ê±¼ä£º2007-01-29
--´úÂëÐÞ¸Ä¼ÇÂ¼£º
--============================¹«¹²±äÁ¿¶¨ÒåÇø===============================
--ÕÔ¹ó´º¹«¹²ÎÄ¼þ
Include("\\script\\online\\zgc_public_fun.lua")
--================================Ö÷Âß¼­===================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	local time_minuet_dis = floor((66600 - Zgc_pub_today_sec_num_rtn())/60)
	if time_minuet_dis > 0 then
		Msg2SubWorld("Héi Hoa S¬n"..time_minuet_dis.." phót n÷a sÏ b¾t ®Çu, c¸c anh hïng h·y nhanh chãng tham gia!")
	else
		Msg2SubWorld("Héi Hoa S¬n ®· b¾t ®Çu")
	end
end
