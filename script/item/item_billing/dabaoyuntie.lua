--IBÎïÆ·£º´ò°üµÄÔÉÌú
--¹¦ÄÜÃèÊö£ºÈÃÆäÊ¹ÓÃ±¾ÎïÆ·Ñ¡Ôñ²¢¶Ò»»¶ÔÓ¦µÄÊ¦ÃÅÃØ¼®
--´úÂë±àĞ´ÈË£ºÕÔ¹ó´º
--´úÂë±àĞ´Ê±¼ä£º2007Äê1ÔÂ23ÈÕ
--²ß»®ÈË£ºÁõÌì
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 100
dabaoyuntie_id = 1050
--**********************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êı************************************
function OnUse(goods_index)
	Say("B¹n muèn dïng tói Thiªn Th¹ch ®æi"..goods_num.."?",
	2,
	"§æi/use_determine",
	"§Ó suy nghÜ/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntie_id) == 0 then
		Talk(1,"end_dialog","Xin x¸c nhËn hµnh trang cã <color=red>tói Thiªn Th¹ch<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntie_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn hµnh trang cã <color=red>tói Thiªn Th¹ch<color>!")
		return
	end
	local add_flag = AddItem(2,2,8,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n dïng tói Thiªn Th¹ch ®æi"..goods_num.." Thiªn Th¹ch!")
	else
		WriteLog(GetName()..":Dïng tói Thiªn Th¹ch ®æi Thiªn Th¹ch thÊt b¹i, kı hiÖu:"..add_flag)
	end
end
