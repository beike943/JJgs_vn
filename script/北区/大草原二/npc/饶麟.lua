--ÈÎÎñ
--µØµã£ºãê¾©¸®  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã11
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");

function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 75 )  then
		Talk(9,"","§¹i ca kháe kh«ng?","<color=green>Nhiªu L©n<color>:…","Xin hái ®¹i ca cã biÕt <color=red>Tiªu YÕn YÕn<color> vµ <color=red>Hµn §øc Nh­îng<color> ë ®©u kh«ng?","Ta biÕt, nh­ng <color=red>hä Tiªu vµ hä Hµn ®ã ®Òu thuéc dßng dâi quı téc<color> mét ng­êi H¸n nh­ ng­¬i sao cã thÓ quen biÕt hä?","Ta ®­îc sù ñy th¸c cña mét ng­êi ®Õn vÊn an hä.","Th× ra lµ vËy! Tªn hä Hµn ®ã cã lÏ vèn còng lµ ng­êi H¸n. MÊy h«m tr­íc nghe §¹i V­¬ng nãi l·nh ®Şa Tèng TriÒu s¾p thuéc vÒ tay chóng ta råi.","Nãi vËy lµ c¸c ng­¬i s¾p xuÊt binh råi ­? LÏ nµo <color=yellow>tÊm b¶n ®å S¬n Hµ X· T¾c<color> c¸c ng­¬i ®· ®o¹t ®­îc råi?","Sao cø nh¾c ®Õn <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> hoµi vËy? Ng­¬i ®Õn <color=red>Bé L¹c V­¬ng Kú<color> t×m phß m· <color=red>Môc NghÜa<color> hái ®i nhĞ!","§a t¹ ®¹i ca!")
    SetTask(1401,80)
    GivePlayerExp(SkeyTianmenzhen,"dacaoyuan")
    Earn(1000)
    ModifyReputation(15,0)
    --AddNote("×Ô´ËÏò±±È¥ÍõÆì²¿ÂäÕÒæâÂíÄÂÒå²ÅÓĞ¿ÉÄÜ´òÌıµ½ÏôÑàÑàÓëº«µÂÈÃµÄÏÂÂä¡£")
    TaskTip("§Õn Bé L¹c V­¬ng Kú t×m phß m· Môc NghÜa hái th¨m tin tøc cña Tiªu YÕn YÕn vµ Hµn §øc Nh­îng.")
    
elseif ( UWorld1401  == 85 ) then
		Talk(3,"","Nhiªu L©n ®¹i ca, vÖ binh cña Bé L¹c V­¬ng Kú kh«ng cho vµo, lµm c¸ch nµo ®©y?","Ta ®ang phô tr¸ch vËn chuyÓn l­¬ng thùc vµo Bé L¹c V­¬ng Kú, nh©n c¬ héi nµy cã thÓ trµ trén ®Ó vµo. Ng­¬i mau ®Õn <color=red>Kim Quang ®éng<color> vµ <color=red>Long Hæ ®éng<color> lÊy ®ñ <color=red>10 GÊm vµng<color>, <color=red>10 Môc L«i V¨n §ao<color>, <color=red>5 ChØ Nam Ng­<color> vÒ ®©y!","T¹i h¹ sÏ ®i ngay sau ®ã ®İch th©n vËn chuyÓn vµo <color=red>Bé L¹c V­¬ng Kú<color> giao tËn tay cho phß m· <color=red>Môc NghÜa<color>, ng­êi yªn t©m!")
    SetTask(1401,90)
    GivePlayerExp(SkeyTianmenzhen,"huifu")
    Earn(1000)
    ModifyReputation(10,0)
    TaskTip("T×m 10 GÊm vµng, 10 Môc L«i V¨n §ao, 5 ChØ Nam Ng­, giao cho Môc NghÜa ë V­¬ng Kú.")

elseif ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) < 10 or GetItemCount(2,1,75) < 10 or GetItemCount(2,1,96) < 5 )  then
				Talk(1,"","§Õn <color=red>Kim Quang ®éng<color> vµ <color=red>Long Hæ ®éng<color> lÊy <color=red>10 GÊm vµng<color>, <color=red>10 Môc L«i V¨n §ao<color>, <color=red>5 ChØ Nam Ng­<color> ®Õn Bé L¹c V­¬ng Kú giao cho <color=red>phß m· Môc NghÜa<color>")
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
