
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 8
dabaoyuntiejingshi_id = 3356
--**********************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êý************************************
function OnUse(goods_index)
	Say("B¹n cã muèn dïng Thiªn Th¹ch Tinh Th¹ch bao §æi Thiªn Th¹ch Tinh Th¹ch"..goods_num.."?",
	2,
	"§æi/use_determine",
	"§Ó suy nghÜ/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiejingshi_id) == 0 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cã <color=red> Thiªn Th¹ch Tinh Th¹ch bao<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiejingshi_id,1) ~= 1 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cã <color=red> Thiªn Th¹ch Tinh Th¹ch bao<color>!")
		return
	end
	local add_flag = AddItem(2,1,1009,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n ®· dïng Thiªn Th¹ch Tinh Th¹ch bao ®Ó ®æi"..goods_num.." Thiªn Th¹ch tinh th¹ch!")
	else
		WriteLog(GetName()..":Dïng Thiªn Th¹ch Tinh Th¹ch bao §æi Thiªn Th¹ch Tinh Th¹ch thÊt b¹i, vÞ trÝ thÊt b¹i :"..add_flag)
	end
end
