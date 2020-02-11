--Ìì»ú±¦Â¼½Å±¾£¨Íò±¦¸óÍò±¦Í¼£©
--by vivi
--08/21/2007
--ÐÞ¸ÄÓÚ2008/03/07

Include("\\script\\lib\\lingshi_head.lua")

function OnUse()
	Say("Sö dông V¹n B¶o C¸c V¹n B¶o §å cã thÓ nhËn ®­îc 1 Linh Th¹ch phèi ph­¬ng nh­ sau, b¹n muèn sö dông kh«ng?\n 50% Linh Th¹ch phèi ph­¬ng cÊp 4\n25% Linh Th¹ch phèi ph­¬ng cÊp 5\n20% Linh Th¹ch phèi ph­¬ng cÊp 6\n5% Linh Th¹ch phèi ph­¬ng cÊp 7",
		2,
		"§ång ý/confirm_get",
		"Kh«ng sö dông/nothing")
end

function confirm_get()	
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end 	
	if DelItem(2,1,2643,1) == 1 then
		local nRand = random(1,100);
		if nRand <= 50 then
			lspf_AddPeiFangInBottle(4,1)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc1 Linh Th¹ch phèi ph­¬ng cÊp 4, ®· nhËp vµo Tô linh ®Ønh.");
		elseif nRand <= 75 then
			lspf_AddPeiFangInBottle(5,1)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch phèi ph­¬ng cÊp 5, ®· nhËp vµo Tô linh ®Ønh.");		
		elseif nRand <= 95 then
			lspf_AddPeiFangInBottle(6,1)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch phèi ph­¬ng cÊp 6, ®· nhËp vµo Tô linh ®Ønh.");
			Msg2Global("Ng­êi ch¬i"..GetName().."Më V¹n B¶o C¸c V¹n B¶o §å nhËn ®uîc 1 Linh Th¹ch phèi ph­¬ng cÊp 6"); 	
			WriteLog("V¹n B¶o C¸c V¹n B¶o §å: ng­êi ch¬i "..GetName().."Më V¹n B¶o C¸c V¹n B¶o §å nhËn ®uîc 1 Linh Th¹ch phèi ph­¬ng cÊp 6");
		else
			lspf_AddPeiFangInBottle(7,1)
			Msg2Player("Chóc mõng b¹n ®· ®¹t ®­îc 1 linh th¹ch phèi ph­¬ng cÊp 7 ®· cho vµo Tô Linh §Ønh. ");
			Msg2Global("Ng­êi ch¬i"..GetName().."Më V¹n B¶o C¸c V¹n B¶o ®å nhËn ®­îc nhËn ®­îc 1 Linh th¹ch phèi ph­¬ng cÊp 7.");	
			WriteLog("V¹n B¶o C¸c V¹n B¶o §å: ng­êi ch¬i "..GetName().."Më V¹n B¶o C¸c V¹n B¶o ®å nhËn ®­îc nhËn ®­îc 1 Linh th¹ch phèi ph­¬ng cÊp 7.");		
		end
		AddItem(2,1,2641,1,1);
		Msg2Player("Chóc mõng b¹n ®¹t ®­îc 1 Linh th¹ch phèi ph­¬ng r¸ch");	
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