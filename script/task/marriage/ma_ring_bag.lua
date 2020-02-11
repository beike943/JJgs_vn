--½Å±¾Ãû³Æ£º×ê½äÀñºĞ
--½Å±¾¹¦ÄÜ£º¿¿×ê½äÀñºĞ¸ø×ê½ä
--²ß»®ÈË£ºÌúÑò
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007Äê6ÔÂ20ÈÕ
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Tb_ma_ring = {104,105}
function OnUse()
	Say("<color=green>Gîi ı<color>: Sö dông <color=yellow>hép nhÉn<color> cã thÓ cã nhÉn kim c­¬ng t­¬ng øng tİnh c¸ch<color=yellow>nhÉn kim c­¬ng<color> phï hîp tİnh c¸ch. Sao h¶?",
	2,
	"§æi/ma_ring_bag_use",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function ma_ring_bag_use()
	--Àñ°üĞ¯´ø¼ì²â
	if GetItemCount(2,1,586) == 0 then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n cã mang <color=yellow>hép nhÉn kim c­¬ng<color>!")
		return
	end
	--¸ºÖØ¿Õ¼ä¼ì²â
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--Àñ°üÉ¾³ı¼ì²â
	if DelItem(2,1,586,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n cã mang <color=yellow>hép nhÉn kim c­¬ng<color>!")
		return
	end
	--Ôö¼Ó½±Àø
	AddItem(0,102,Tb_ma_ring[GetSex()],1)
end
