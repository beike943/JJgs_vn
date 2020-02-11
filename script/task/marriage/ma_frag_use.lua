--½Å±¾Ãû³Æ£ºËéÆ¬Ê¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºËéÆ¬Ê¹ÓÃµÖÓÃ½Å±¾
--²ß»®ÈË£ºÌúÑò
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-04-26
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--============================¹«¹²±äÁ¿¶¨ÒåÇø=======================
goods_id_tasktempID = 167
Tb_frag = {}
Tb_frag[568] = "Gi¸p Méc d­¬ng"
Tb_frag[569] = "Êt Méc ©m"
Tb_frag[570] = "Bİnh háa d­¬ng"
Tb_frag[571] = "§inh Háa ©m"
--============================½Å±¾Âß¼­Çø==============================
function OnUse(goods_index)
	--ÅĞ¶ÏÊÇ·ñ½á»é
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Chó ı<color>: Ch­a kÕt h«n ch­a thÓ sö dông vËt phÈm nµy!")
		return
	end
	--¶Ô»°
	local goods_ID = GetItemParticular(goods_index)
	SetTaskTemp(goods_id_tasktempID,goods_ID)
	Say("<color=green>Gîi ı<color>: <color=yellow>"..Tb_frag[goods_ID].."<color> cã thÓ dung hßa nguyªn tè kh¸c trong <color=yellow>Khiªn V©n Phi Tinh Phæ<color> thµnh <color=yellow>VËt phÈm Phu thª<color>, còng cã thÓ tù chuyÓn hãa thµnh <color=yellow>Uyªn ¦¬ng KÕt<color>. <color=yellow>Uyªn ¦¬ng KÕt<color> lµ <color=yellow>vËt cÇn thiÕt<color> ®Ó sö dông kü n¨ng <color=yellow>H«n Nh©n<color>. B¹n muèn cho vµo <color=yellow>Khiªn V©n Phi Tinh Phæ<color> hay chuyÓn hãa thµnh <color=yellow>Uyªn ¦¬ng KÕt<color>?",
	3,
	"Cho vµo Khiªn V©n Phi Tinh Phæ/#put_in_num("..goods_ID..")",
	"ChuyÓn hãa thµnh Uyªn ¦¬ng KÕt/frag_change_dtm",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--**************************ÅúÁ¿´¦Àí****************************
function put_in_num(goods_ID)
	local goods_num = GetItemCount(2,1,goods_ID)
	if goods_num == 0 then
		return
	end
	AskClientForNumber("put_in",1,goods_num,"Xin nhËp sè l­îng cho vµo")
end
--**************************ÔªËØ·ÅÈë****************************
function put_in(goods_num)
	--Èç¹ûÊäÈë0ÔòÖ±½Ó·µ»Ø
	if goods_num == 0 then
		return
	end
	local goods_ID = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	if GetItemCount(2,1,goods_ID) < goods_num then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n mang <color=yellow>®ñ<color> <color=yellow>"..Tb_frag[goods_ID].."<color>!")
		return
	end
	if DelItem(2,1,goods_ID,goods_num) ~= 1 then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n mang <color=yellow>®ñ<color> <color=yellow>"..Tb_frag[goods_ID].."<color>!")
		return
	end
	SetTask((goods_ID+653),(GetTask(goods_ID+653)+goods_num))
	Talk(1,"","<color=green>Gîi ı<color>: <color=yellow>"..goods_num.."<color> <color=yellow>"..Tb_frag[goods_ID].." <color> ®· thµnh c«ng cho vµo <color=yellow>Khiªn V©n Phi Tinh Phæ<color>, muèn dung hßa <color=yellow>VËt phÈm Phu thª<color> chän chuét ph¶i ngay <color=yellow>Khiªn V©n Phi Tinh Phæ<color>.!")
end
--*************************½»»»Ô§Ñì½á¶Ô»°***********************
function frag_change_dtm()
	local goods_name = Tb_frag[GetTaskTemp(goods_id_tasktempID)]
	Say("<color=green>Gîi ı<color>: <color=yellow>Uyªn ¦¬ng KÕt<color> t­îng tr­ng cho t×nh c¶m vî chång, <color=yellow>kü n¨ng Phu thª<color> cÇn ph¶i cã <color=yellow>Uyªn ¦¬ng KÕt<color> míi ho¹t ®éng ®­îc. Mçi mét <color=yellow>"..goods_name.." <color> ®Òu cã thÓ chuyÓn hãa thµnh 1 <color=yellow>Uyªn ¦¬ng KÕt<color>. B¹n muèn dïng <color=yellow>"..goods_name.."<color>chuyÓn hãa thµnh <color=yellow>Uyªn ¦¬ng KÕt<color>?",
	2,
	"Ta x¸c nhËn/change_num_put_in",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--************************Ô§Ñì½á×ª»»ÊıÁ¿ÊäÈë********************
function change_num_put_in()
	local goos_id = GetTaskTemp(goods_id_tasktempID)
	AskClientForNumber("frag_change",1,GetItemCount(2,1,goos_id),"Xin nhËp sè l­îng chuyÓn ®æi")
end
--***********************½»»»Ô§Ñì½áÈ·ÈÏ*************************
function frag_change(goods_num)
	local goods_id = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	--¿Õ¼äºÍ¸ºÖØÅĞ¶Ï
	if Zgc_pub_goods_add_chk(goods_num,goods_num) ~= 1 then
		return
	end
	--Ğ¯´ø¼ì²â
	if GetItemCount(2,1,goods_id) < goods_num then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n mang ®ñ "..Tb_frag[goods_ID].."!")
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItem(2,1,goods_id,goods_num) ~= 1 then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n mang ®ñ "..Tb_frag[goods_ID].."!")
		return
	end
	--Ôö¼ÓÔ§Ñì½á
	if AddItem(2,1,572,goods_num) == 1 then
		Msg2Player("Chóc mõng b¹n ®· chuyÓn ®æi"..goods_num.." 'Uyªn ¦¬ng KÕt'!")
	end
end
