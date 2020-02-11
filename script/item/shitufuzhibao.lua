--½Å±¾Ãû³Æ£ºÒ»°üÔ§Ñì½ÚÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃ´ËÎïÆ·¸øÍæ¼ÒÔö¼ÓÒ»¶¨ÊıÁ¿µÄÔ§Ñì½Ú
--²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-09
--½Å±¾ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı

goods_num = 10
function OnUse(bag_index)
	--ÎïÆ·Ê¹ÓÃÅĞ¶Ï
	local goods_id = GetItemParticular(bag_index)
	if goods_id ~= 598 then
		return
	end
	--Ê¹ÓÃÈ·ÈÏÌáÊ¾
	Say("<color=green>Gîi ı <color>: Sö dông <color=yellow>Tói S­ §å phï chØ<color>Cã thÓ ®æi lÊy <color=yellow>"..goods_num.."<color> <color=yellow>S­ §å phï chØ<color>, b¹n x¸c nhËn sö dông chø?",
	2,
	"§æi/goods_add",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--ÎïÆ·Ôö¼Ó
function goods_add()
	--ÎïÆ·¼ì²â
	if GetItemCount(2,1,598) == 0 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>Tói S­ §å phï chØ<color>!")
		return
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItem(2,1,598,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>Tói S­ §å phï chØ<color>!")
		return
	end
	--ÎïÆ·Ôö¼ÓÒÔ¼°Ïà¹Ølog
	local add_flag = AddItem(2,1,588,goods_num)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n ®· ®æi ®­îc råi."..goods_num.." S­ §å phï chØ!")
	else
		WriteLog("§æi S­ §å phï chØ: Ng­êi ch¬i ["..GetName().."] §æi S­ §å phï chØ thÊt b¹i, kı hiÖu thÊt b¹i: "..add_flag)
	end
end
