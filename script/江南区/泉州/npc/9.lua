--ÈÎÎñ
--µØµã£ºÑãÃÅ¹Ø  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã8
--²ß»®£º·®ÍòËÉ  2004.03.


function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 55 )  then
	Talk(6,"","D¸m hái <color=red>Hµn Trİ Nh­îng<color> l·o nh©n cßn c­ tró n¬i nµy?","Ng­¬i lµ……?","T¹i h¹ lµ hä hµng xa cña ng­êi nµy, ®­îc nhê ®Õn vÊn an l·o nh©n!","Tèt l¾m! Xem nh­ ng­¬i cã lßng! MÊy n¨m nay Hµn Trİ Nh­îng l·o nh©n chŞu rÊt nhiÒu khæ së! §Ó tuæi giµ ®­îc yªn b×nh, l·o ®· chuyÓn ®Õn sèng ë <color=red>H¹nh Hoa th«n<color>!","§a t¹ lßng tèt cña ng­êi! T¹i h¹ ®i ngay ®©y!","§õng quªn nh¾n gióp ta, l·o cßn nî ta <color=yellow>mét nh¸t ®ao<color>! Khµ khµ!...")
    SetTask(1401,60)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("§Õn H¹nh Hoa th«n hái th¨m Tr­¬ng V©n vÒ Hµn l·o!")
    Msg2Player("§Õn H¹nh Hoa th«n hái th¨m Tr­¬ng V©n vÒ Hµn l·o!")

elseif ( UWorld1401  == 60  ) then
	Talk(1,"","§Ó tuæi giµ ®­îc yªn b×nh, mÊy n¨m tr­íc Hµn Trİ Nh­îng l·o nh©n ®· chuyÓn ®Õn sèng ë <color=red>H¹nh Hoa th«n<color>! H·y ®Õn ®ã t×m «ng ta!")
	
elseif ( UWorld1401  > 60  ) then
	Talk(1,"","Sao? Hµn Trİ Nh­îng hiÖn sèng ra sao?")
else
	Talk(1,"","GiÆc KhiÕt §an ®Õn khi nµo míi lui qu©n? Cßn bãng giÆc, d©n chóng ®Òu c¶m thÊy bÊt an!")
end
end;
