--ÈÎÎñ
--µØµã£ºãê¾©¸®  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã11
--²ß»®£º·®ÍòËÉ  2004.03.


function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 75 )  then
		Talk(9,"","§¹i ca kháe kh«ng?","<color=green>Nhiªu L©n<color>:…","Xin hái ®¹i ca cã biÕt <color=red>Tiªu YÕn YÕn<color> vµ <color=red>Hµn §øc Nh­îng<color> ë ®©u kh«ng?","Ta biÕt, nh­ng <color=red>hä Tiªu vµ hä Hµn ®ã ®Òu thuéc dßng dâi quı téc<color> mét ng­êi H¸n nh­ ng­¬i sao cã thÓ quen biÕt hä?","Ta ®­îc sù ñy th¸c cña mét ng­êi ®Õn vÊn an hä.","Th× ra lµ vËy! Tªn hä Hµn ®ã cã lÏ vèn còng lµ ng­êi H¸n. MÊy h«m tr­íc nghe §¹i V­¬ng nãi l·nh ®Şa Tèng TriÒu s¾p thuéc vÒ tay chóng ta råi.","Nãi vËy lµ c¸c ng­¬i s¾p xuÊt binh råi ­? LÏ nµo <color=yellow>tÊm b¶n ®å S¬n Hµ X· T¾c<color> c¸c ng­¬i ®· ®o¹t ®­îc råi?","GÇn ®©y nhiÒu ng­êi nh¾c ®Õn <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color>? ThËt sù ta còng kh«ng râ l¾m! Ng­¬i ®Õn<color=red>V­¬ng Kú Bé L¹c<color> ë phİa B¾c xem sao.","§a t¹ ®¹i ca!")
    SetTask(1401,80)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("§Õn bé l¹c V­¬ng Kú hái th¨m Tiªu YÕn YÕn vµ Hµn Trİ Nh­îng.")
    Msg2Player("§Õn bé l¹c V­¬ng Kú hái th¨m Tiªu YÕn YÕn vµ Hµn Trİ Nh­îng.")
    
elseif ( UWorld1401  == 85 ) then
		Talk(3,"","Nhiªu L©n ®¹i ca, vÖ binh cña Bé L¹c V­¬ng Kú kh«ng cho vµo, lµm c¸ch nµo ®©y?","Ta ®ang phô tr¸ch vËn chuyÓn l­¬ng thùc vµo Bé L¹c V­¬ng Kú, nh©n c¬ héi nµy cã thÓ trµ trén ®Ó vµo. Ng­¬i mau ®Õn <color=red>Kim Quang ®éng<color> vµ <color=red>Long Hæ ®éng<color> lÊy ®ñ <color=red>20 xÊp GÊm<color>, <color=red>20 Môc L«i V¨n §ao<color>, <color=red>5 ChØ Nam Ng­<color> vÒ ®©y!","T¹i h¹ sÏ ®i ngay sau ®ã ®İch th©n vËn chuyÓn vµo <color=red>Bé L¹c V­¬ng Kú<color> giao tËn tay cho phß m· <color=red>Môc NghÜa<color>, ng­êi yªn t©m!")
    SetTask(1401,90)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("Thu thËp 20 xÊp GÊm, 20 Môc L«i V¨n §ao, 5 ChØ Nam Ng­ chuyÓn cho phß m· Môc NghÜa!")
    Msg2Player("Thu thËp 20 xÊp GÊm, 20 Môc L«i V¨n §ao, 5 ChØ Nam Ng­ chuyÓn cho phß m· Môc NghÜa!")

elseif ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) < 20 or GetItemCount(2,1,75) < 20 or GetItemCount(2,1,96) < 5 )  then
				Talk(1,"","H·y ®Õn <color=red>Kim Quang ®éng<color> t×m <color=yellow>20 xÊp GÊm<color>; <color=red>L­¬ng S¬n B¹c<color> t×m <color=yellow>20 Môc L«i V¨n §ao<color>; <color=red>Long Hæ ®éng<color> t×m <color=yellow>5 ChØ Nam Ng­<color> chuyÓn cho Môc NghÜa!")
		else
				Talk(1,"","ChuÈn bŞ vËt phÈm xong ch­a? Mau ®Õn <color=red>Bé L¹c V­¬ng Kú<color> giao cho <color=red> phß m· Môc NghÜa<color>.")
		end
	
elseif ( UWorld1401  == 80  ) then
		Talk(1,"","Ng­¬i ®Õn <color=red>Bé L¹c V­¬ng Kú<color> hái xem may ra cã chót manh mèi.")	
elseif ( UWorld1401  > 90  ) then
	Talk(1,"","Sao råi? T×m ®­îc hä kh«ng?")
else
	Talk(1,"","Bé L¹c V­¬ng Kú ®ang cÇn ta chuyÓn l­¬ng thùc ®Õn ®ã gÊp!")
end
end;
