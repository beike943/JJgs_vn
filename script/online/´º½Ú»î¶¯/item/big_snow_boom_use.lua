--½Å±¾Ãû³Æ£ºÕ¨µ¯´óÑ©ÇòÌ×°üÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃÕ¨µ¯´óÑ©ÇòÌ×°ü£¬»ñµÃ20¸öÕ¨µ¯´óÑ©Çò
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-01-31
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")
--================================¹«¹²±äÁ¿¶¨ÒåÇø===========================
change_boom_big_snow_num = 20				--¶Ò»»µÄÕ¨µ¯´óÑ©ÇòÊıÁ¿
--=================================½Å±¾Ö÷Âß¼­Çø============================
--***********************ÎïÆ·Ê¹ÓÃÖ÷º¯Êı***********************
function OnUse(goods_index)
	Say("Dïng <color=green>tói ®¹n §¹i TuyÕt CÇu<color> cã thÓ ®æi"..change_boom_big_snow_num.." <color=green>®¹n §¹i TuyÕt CÇu<color>, ®ång ı chø?",
		2,
		"Ta cÇn vËt phÈm nµy/bag_use_determine",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
end
--***********************ÎïÆ·È·ÈÏÊ¹ÓÃº¯Êı*********************
function bag_use_determine()
	if GetItemCount(2,0,672) == 0 then					--ÎïÆ·´æÔÚ¼ì²â
		Talk(1,"","X¸c nhËn trong hµnh trang cña b¹n cã <color=red>tói ®¹n §¹i TuyÕt CÇu<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then			--Íæ¼Ò°ü¹ü¿Õ¼ä/¸ºÖØ¼ì²â
		return
	end
	if DelItem(2,0,672,1) ~= 1 then						--ÎïÆ·É¾³ı¼ì²â
		Talk(1,"","X¸c nhËn trong hµnh trang cña b¹n cã <color=red>tói ®¹n §¹i TuyÕt CÇu<color>!")
		return
	end
	local add_flag = AddItem(2,3,218,20)
	if add_flag == 1 then
		Msg2Player("B¹n ®æi thµnh c«ng"..change_boom_big_snow_num.." §¹i TuyÕt CÇu!")
	else
		WriteLog("Th«n tr­ëng_Ho¹t ®éng t©n niªn_ Ng­êi ch¬i:"..GetNpcName().."Sö dông tói ®¹n §¹i TuyÕt CÇu ®æi phÇn th­ëng thÊt b¹i,"..add_flag)
	end
end
