--½Å±¾Ãû³Æ£º2007Äê´º½Ú»î¶¯-»ªÉ½¾º¼¼PKÄ£Ê½ĞŞ¸Ä½Å±¾
--½Å±¾¹¦ÄÜ£ºĞŞ¸ÄÎªPKÓĞ³Í·£×´Ì¬
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-01-27
--ĞŞ¸Ä¼ÇÂ¼£º
--============================¹«¹²±äÁ¿¶¨ÒåÇø===============================
--ÕÔ¹ó´º¹«¹²ÎÄ¼ş
Include("\\script\\online\\zgc_public_fun.lua")
--================================Ö÷Âß¼­===================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	if GetPlayerRoute() == 0 then 
		NewWorld(100,1420,2989)
		Msg2Player("Ch­a vµo m«n ph¸i kh«ng thÓ tham gia Héi Hoa S¬n!")
	end 
	SetDeathPunish(1)
	Msg2Player("B¹n ®· chuyÓn sang tr¹ng th¸i PK vµ tö vong")
end
