--½Å±¾Ãû³Æ£ºÒ»°üÔ§Ñì½ÚÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃ´ËÎïÆ·¸øÍæ¼ÒÔö¼ÓÒ»¶¨ÊıÁ¿µÄÔ§Ñì½Ú
--²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-09
--½Å±¾ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı

goods_num = 30
function OnUse(bag_index)
	--ÎïÆ·Ê¹ÓÃÅĞ¶Ï
	local goods_id = GetItemParticular(bag_index)
	if goods_id ~= 1158 then
		return
	end
	--Ê¹ÓÃÈ·ÈÏÌáÊ¾
	Say("<color=green>Gîi ı <color>: Sö dông <color=yellow>1 tói Uyªn ¦¬ng KÕt<color> cã thÓ ®æi lÊy <color=yellow>"..goods_num.."<color><color=yellow>Uyªn ¦¬ng KÕt<color>, b¹n x¸c nhËn sö dông chø? ",
	2,
	"Sö dông /goods_add",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--ÎïÆ·Ôö¼Ó
function goods_add()
	--ÎïÆ·¼ì²â
	if GetItemCount(2,1,1158) == 0 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>1 Tói Uyªn ¦¬ng KÕt <color>!")
		return
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItem(2,1,1158,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>1 Tói Uyªn ¦¬ng KÕt <color>!")
		return
	end
	--ÎïÆ·Ôö¼ÓÒÔ¼°Ïà¹Ølog
	local add_flag = AddItem(2,1,572,goods_num)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n ®· ®æi ®­îc råi."..goods_num.." Uyªn ¦¬ng KÕt!")
	else
		WriteLog("§æi Uyªn ¦¬ng KÕt: Ng­êi ch¬i ["..GetName().."] §æi Uyªn ¦¬ng KÕt thÊt b¹i, kı hiÖu thÊt b¹i: "..add_flag)
	end
end
