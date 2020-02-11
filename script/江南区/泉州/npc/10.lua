--ÈÎÎñ
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅ¹ØÈÎÎñ½áµã9
--²ß»®£º·®ÍòËÉ  2004.03.

function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 60  )  then
		Talk(2,"","C­ d©n cña H¹nh Hoa th«n ®· ®i ®©u hÕt råi? <color=red>Hµn Trİ Nh­îng<color> l·o nh©n ë ®©u?","Tr­íc tiªn h·y ®¸nh <color=red>Quan sø<color> lÊy <color=red>20 bé Quan phôc<color> råi ®Õn gÆp ta!")
		SetTask(1401,65)
    AddNote("T×m 20 bé Quan phôc cho Tr­¬ng V©n.")
    Msg2Player("T×m 20 bé Quan phôc cho Tr­¬ng V©n.")
						    		
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) >= 20 ) then
				if  DelItem(2,1,34,20) == 1 then
						    Talk(2,"","Qu¶ nhiªn lµ h¶o h¸n! Hµn Trİ Nh­îng v× muèn tr¸nh lo¹n l¹c ®· Èn tr¸nh ë <color=red>§«ng BiÖn Kinh Phñ<color>. Tù m×nh ®i t×m «ng ta ®i!.","§a t¹ ®· chØ gi¸o!")
						    SetTask(1401,70)
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)
						    AddNote("Hµn Trİ Nh­îng ®ang ë T©y BiÖn Kinh (189.174), mau ®Õn ®ã gÆp!")
						    Msg2Player("Hµn Trİ Nh­îng ®ang ë T©y BiÖn Kinh (189.174), mau ®Õn ®ã gÆp!")
				else
						 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
				end
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) < 20 ) then
			Talk(1,"","Tr­íc tiªn h·y ®¸nh <color=red>Quan sø<color> lÊy <color=red>20 bé Quan phôc<color> ®· råi ®Õn gÆp ta!")
elseif ( UWorld1401  == 70 ) then
			Talk(1,"","C­ d©n cña H¹nh Hoa th«n ®· ®Õn <color=red>BiÖn Kinh phñ t©y<color> l¸nh n¹n, ng­¬i mau ®Õn ®ã ®i.")	
else
			Talk(1,"","Bän Quan sø nµy ta quyÕt kh«ng tha cho chóng!")
	end
end;
