--±¦Ê¯°ü¹ü½Å±¾
--by vivi
--08/21/2007
--ÐÞ¸ÄÓÚ2008/03/07

Include("\\script\\lib\\lingshi_head.lua")

function OnUse()
	Say("Dïng B¶o th¹ch Bao cã thÓ nhËn ®­îc 1 Linh th¹ch, b¹n muèn dïng kh«ng? Thu thËp 1000 m¶nh Linh th¹ch cã thÓ dïng [Hoan Linh Sa] chuyÓn thµnh 1 Linh th¹ch cÊp 6 bÊt kú\nM¶nh Linh th¹ch (khãa) 100%\nLinh th¹ch cÊp 1-4: 93.9%\nLinh th¹ch cÊp 5: 5%\nLinh th¹ch cÊp 6: 1%\nLinh th¹ch cÊp 7: 0.1%",
		2,
		"§ång ý/confirm_get",
		"Kh«ng sö dông/nothing")
end

function confirm_get()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end 
	if DelItem(2,1,2642,1) == 1 then
		local nRand = random(1,1000);
		if nRand <= 249 then
			lspf_AddLingShiInBottle(1,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch CÊp 1, nã trong Tô linh ®Ønh.");
		elseif nRand <= 479 then
			lspf_AddLingShiInBottle(2,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 2, ®· nhËp vµo Tô linh ®Ønh.");		
		elseif nRand <= 709 then
			lspf_AddLingShiInBottle(3,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc1 Linh Th¹ch cÊp 3, ®· nhËp vµo Tô linh ®Ønh.");		
		elseif nRand <= 939 then
			lspf_AddLingShiInBottle(4,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 4, ®· nhËp vµo Tô linh ®Ønh.");		
		elseif nRand <= 989 then
			lspf_AddLingShiInBottle(5,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 5, ®· nhËp vµo Tô linh ®Ønh.");		
		elseif nRand <= 999 then
			lspf_AddLingShiInBottle(6,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 6, ®· nhËp vµo Tô linh ®Ønh.");
			Msg2Global("Ng­êi ch¬i"..GetName().."Më bao B¶o th¹ch nhËn ®­îc 1 Linh Th¹ch cÊp 6");
			WriteLog("Bao B¶o th¹ch: ng­êi ch¬i "..GetName().."Më bao B¶o th¹ch nhËn ®­îc 1 Linh Th¹ch cÊp 6");		
		else
			lspf_AddLingShiInBottle(7,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 7, ®· nhËp vµo Tô linh ®Ønh.");		
			Msg2Global("Ng­êi ch¬i"..GetName().."Më bao B¶o th¹ch nhËn ®­îc 1 Linh Th¹ch cÊp 7");
			WriteLog("Bao B¶o th¹ch: ng­êi ch¬i "..GetName().."Më bao B¶o th¹ch nhËn ®­îc 1 Linh Th¹ch cÊp 7");
		end
		AddItem(2,1,2646,1,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch tan r·");
	end
end

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end	

function nothing()

end