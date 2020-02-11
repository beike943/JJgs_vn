--08ĞÂÄêÊ¥µ®ÀñÆ·°ü½Å±¾
--by vivi
--2007/12/07

function OnUse()
	Say("<color=green>tói lÔ vËt gi¸ng sinh<color>: kİch ho¹t tói ®ã sÏ nhËn ®­îc 1 c©y th«ng tuyÖt ®Ñp, b¹n x¸c nhËn?",
		2,
		"§ång ı/huo_chrims_tree",
		"Kh«ng cÇn/nothing")
end

function huo_chrims_tree()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,1,1192,1) == 1 then
		AddItem(2,0,574,1);
	end
end

function nothing()

end

--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end	