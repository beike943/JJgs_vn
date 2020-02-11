--IBÎïÆ·£º´ò°üµÄÔÉÌú¾«Ê¯
--¹¦ÄÜÃèÊö£ºÈÃÆäÊ¹ÓÃ±¾ÎïÆ·Ñ¡Ôñ²¢¶Ò»»¶ÔÓ¦µÄÊ¦ÃÅÃØ¼®
--´úÂë±àĞ´ÈË£ºÕÔ¹ó´º
--´úÂë±àĞ´Ê±¼ä£º2007Äê1ÔÂ23ÈÕ
--²ß»®ÈË£ºÁõÌì
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 100
dabaoyuntiejingshi_id = 1051
--**********************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êı************************************
function OnUse(goods_index)
	Say("B¹n muèn ®æi Thiªn Th¹ch tinh th¹ch ®ãng gãi lÊy Thiªn Th¹ch tinh th¹ch?"..goods_num.."?",
	2,
	"§æi/use_determine",
	"§Ó suy nghÜ/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiejingshi_id) == 0 then
		Talk(1,"end_dialog","Xin x¸c nhËn hµnh trang cã <color=red>Thiªn Th¹ch tinh th¹ch ®ãng gãi<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiejingshi_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn hµnh trang cã <color=red>Thiªn Th¹ch tinh th¹ch ®ãng gãi<color>!")
		return
	end
	local add_flag = AddItem(2,1,1009,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n dïng Thiªn Th¹ch tinh th¹ch ®ãng gãi ®æi"..goods_num.." Thiªn Th¹ch tinh th¹ch!")
	else
		WriteLog(GetName()..":Dïng Thiªn Th¹ch tinh th¹ch ®ãng gãi ®æi Thiªn Th¹ch tinh th¹ch thÊt b¹i, kı hiÖu:"..add_flag)
	end
end
