--ÈÎÎñ
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅ¹ØÈÎÎñ½áµã5
--²ß»®£º·®ÍòËÉ  2004.03.

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 30  )  then
		Talk(1,"say1401_5","§¹i Tèng ®¹i lo¹n, Quèc gia h­ng vong, thÊt phu h÷u tr¸ch. TiÓu nh©n còng xin ®Õn b¸o danh ®Çu qu©n giÕt giÆc!")

			elseif ( UWorld1401  == 35 and GetItemCount(2,2,16) >= 1 ) then
						    Talk(6,"","Khµ khµ…Qu¶ nhiªn lµ nh©n tµi! Ng­¬i ®· lµ qu©n binh §¹i Tèng! Mong ng­¬i tËn t©m tËn lùc b¶o vÖ §¹i Tèng. Thiªn Tö sÏ kh«ng quªn c«ng tr¹ng cña ng­¬i!","Tèt l¾m! T¹i h¹ sÏ ®Õn <color=red>Nh¹n M«n quan<color> b¸o danh ngay!","Ng­¬i ®Õn <color=red>Nh¹n M«n quan<color> lµm g×? H·y mau ®Õn qu©n doanh <color=red>L­¬ng S¬n B¹c<color> b¸o tin!","Kh«ng! Nh­ng ta muèn ®Õn Nh¹n M«n quan chèng tr¶ Liªu qu©n!","Nh­ng ta kh«ng cã quyÒn! ChØ cã <color=red>Xa Th¸i Qu©n ë Thiªn Ba D­¬ng Phñ<color> míi cã quyÒn quyÕt ®Þnh chuyÖn cña D­¬ng Gia qu©n.","§a t¹ ®· chØ gi¸o! T¹i h¹ ®i ngay ®©y!")
						    if  DelItem(2,2,16,1) == 1 then
										 SetTask(1401,40)
										 ----AddItem(0,0,0)
										 --Earn(10000)
										 ModifyExp(10000)
										 AddNote("§Õn Thiªn Ba D­¬ng Phñ t×m Xa Th¸i Qu©n xin vµo tiÒn tuyÕn Nh¹n M«n quan!")
										 Msg2Player("§Õn Thiªn Ba D­¬ng Phñ t×m Xa Th¸i Qu©n xin vµo tiÒn tuyÕn Nh¹n M«n quan!")

								else
										 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
								end

					elseif ( UWorld1401  == 35 and GetItemCount(2,2,16) < 1 ) then
						Talk(1,"","§Ó kh¶o nghiÖm n¨ng lùc cña ng­¬i, h·y ®Õn ch©n nói <color=red>ThiÕu L©m tù<color> ®¸nh <color=red>Hæ d÷<color> lÊy vÒ <color=red>1 tÊm Da hæ<color>!")
					elseif ( UWorld1401  == 40 ) then
						Talk(1,"","Cã viÖc g× h·y ®Õn <color=red>Thiªn Ba D­¬ng Phñ<color> gÆp <color=red>Xa Th¸i Qu©n<color> mµ hái! Hái ta còng v« Ých!")
							else
									Talk(1,"","D¹o nµy nhiÒu nh©n sÜ h¨ng h¸i ®Õn b¸o danh ®Çu qu©n! ThËt ®¸ng mõng!")
	end
end;

function  say1401_5()
		Say("H¨ng h¸i ®Çu qu©n, ta rÊt hoan nghªnh nh­ng ng­¬i cÇn mang ®Õn <color=red>1 tÊm Da hæ<color> ®Ó chøng tá thùc lùc cña ng­¬i!",2,"Cã thÓ/yes1401_5","Kh«ng thÓ/no1401_5")
end;

function  yes1401_5()
		Talk(1,"","X¸ g× 1 tÊm Da hæ! Ta ®i ngay ®©y!")
		Talk(1,"","§Ó kh¶o nghiÖm n¨ng lùc cña ng­¬i, h·y ®Õn ch©n nói <color=red>ThiÕu L©m tù<color> ®¸nh <color=red>Hæ d÷<color> lÊy vÒ <color=red>1 tÊm Da hæ<color>!")
		SetTask(1401,35)
		AddNote("§i thu thËp 1 tÊm Da hæ míi cã thÓ ®Çu qu©n!")
		Msg2Player("§i thu thËp 1 tÊm Da hæ míi cã thÓ ®Çu qu©n!")
end;

function  no1401_5()
	Talk(1,"","§¸nh hæ d÷ µ? Th«i ®i! Ta sî l¾m!")
end;
