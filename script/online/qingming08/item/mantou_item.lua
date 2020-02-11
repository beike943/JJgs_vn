--File name:mantou_item.lua
--Describe:¼À°İÆ·µÀ¾ß½Å±¾
--Create Date:2006-3-24
--Author:yanjun
--ĞŞ¸Ä¼ÇÂ¼£º´å³¤2007-03-13Ôö¼Ó2007ÄêÇåÃ÷½Ú»î¶¯Ïà¹Ø´úÂë
Include("\\script\\online\\zgc_public_fun.lua")					--´å³¤µÄ¹«¹²º¯Êı
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_goods_use_diff = 1859
function OnUse()
	local MapID,MapX,MapY = GetWorldPos()
	if MapID ~= 818 and MapID ~= 819 and MapID ~= 820 then		--È·±£ÔÚÄÇÈıÕÅµØÍ¼ÉÏ
		Talk(1,"","VËt phÈm nµy chØ sö dông khi cóng tæ tiªn.")
		return
	end
	local selTab = {
				"§­îc! Ta muèn sö dông./use",
				"Th«i ®Ó sau nµy h·y dïng./end_dialog",
				};
	Say("Ng­¬i x¸c nhËn cã muèn dïng Mµn thÇu cóng tÕ kh«ng? Dïng vËt phÈm nµy cã thÓ t¨ng <color=yellow>10 lÇn<color> kinh nghiÖm!",2,selTab)
end
--****************************¼ÀÆ·ÂøÍ·µÄÊ¹ÓÃ***************************
function use()
	--Ê±¼äÏŞÖÆ
	local kotow_date_seq = GetTask(tomb_sweep_2008_date_seq)
	if kotow_date_seq >= zgc_pub_day_turn(1) then				
		Talk(1,"","H«m nay ng­¬i ®· cóng 1 lÇn, kh«ng thÓ dïng <color=yellow>Mµn thÇu cóng tÕ<color>, ngµy mai <color=yellow>dïng<color> tr­íc khi cóng, dïng vËt phÈm nµy cã thÓ t¨ng 10 lÇn ®iÓm søc kháe thµnh kinh nghiÖm. ")
		return
	end
	--´ÎÊıÏŞÖÆ
	local kotow_goods_diff = GetTask(tomb_sweep_2008_goods_use_diff)
	if kotow_goods_diff == 2 or kotow_goods_diff == 5 or kotow_goods_diff == 8 or kotow_goods_diff == 11 then
		Talk(1,"","<color=yellow>Mµn thÇu cóng tÕ<color> mçi ngµy chØ cã thÓ dïng 1 lÇn!")
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItem(2,0,387,1) ~= 1 then
		Talk(1,"","X¸c nhËn ng­¬i cã mang theo <color=yellow>Mµn thÇu cóng tÕ<color>!")
		return
	end
	--Ê¹ÓÃÍê³É²Ù×÷
	if kotow_goods_diff == 0 or kotow_goods_diff == nil then
		SetTask(tomb_sweep_2008_goods_use_diff,2)
	else
		SetTask(tomb_sweep_2008_goods_use_diff,(kotow_goods_diff + 2))
	end
	Talk(1,"","Ng­¬i ®· dïng <color=yellow>Mµn thÇu cóng tÕ<color>, h«m nay cóng x¸c suÊt nhËn ®­îc kinh nghiÖm giang hå t¨ng.")
end
