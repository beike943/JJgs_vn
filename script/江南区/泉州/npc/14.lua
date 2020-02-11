--ÈÎÎñ
--µØµã£ºãê¾©¸®  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã13
--²ß»®£º·®ÍòËÉ  2004.03.


function main()
UWorld1401 = GetTask(1401) 
--ÒÔÏÂÊÇ°ïÈÄ÷ëÔËËÍÎï×Ê¶ø²úÉúµÄÇé½Ú------------------------------------
if ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) >= 20 or GetItemCount(2,1,75) >= 20 or GetItemCount(2,1,96) >5 )  then
				if ( DelItem(2,1,54,20) == 1 and DelItem(2,1,75,20) == 1 and DelItem(2,1,96,5) == 1 ) then
Talk(6,"","Xin hái ®¹i nh©n ®©y cã ph¶i lµ Môc NghÜa?","Lµ ta ®©y! Cã viÖc g× kh«ng?","T¹i h¹ vËn chuyÓn l­¬ng thùc ®Õn.","Ch¼ng ph¶i viÖc nµy lµ do Nhiªu L©n phô tr¸ch sao?","Nhiªu L©n l©m bÖnh nªn nhê t¹i h¹ chuyÓn thay!","VËy còng tèt, ng­¬i ®Ó l­¬ng thùc l¹i ®©y.")
					 SetTask(1401,95)
					 ----AddItem(0,0,0)
					 --Earn(10000)
					 ModifyExp(10000)
					 AddNote("§· chuyÓn l­¬ng thùc ®Õn cho phß m· Môc NghÜa nh­ng ch­a lÊy ®­îc tin tøc.")
					 Msg2Player("§· chuyÓn l­¬ng thùc ®Õn cho phß m· Môc NghÜa nh­ng ch­a lÊy ®­îc tin tøc.")
				else
				 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
				end
		else
				Talk(1,"","B»ng c¸ch nµo ng­¬i l¹i x©m nhËp ®­îc vµo Bé L¹c V­¬ng Kú ta?")
		end
elseif ( UWorld1401  == 95  ) then
		Talk(2,"say1401_13","T¹i h¹ cã chuyÖn nµy muèn b¸o cho ®¹i nh©n.","Ng­¬i nãi nhanh ®i.")	
--ÒÔÏÂÊÇÖ±½Ó»ßÂ¸ÊØÎÀ¶øÒı·¢µÄÇé½Ú---------------------------
elseif ( UWorld1401  == 100  ) then
	Talk(2,"say1401_13","Xin hái ®¹i nh©n ®©y cã ph¶i lµ Môc NghÜa?","Ng­¬i lµ ai?")
--ÒÔÏÂÊÇ´òÌıÍêÄÂÒåÉíÊÀÒÔºóµÄÇé½Ú---------------------------
elseif ( UWorld1401  == 105 ) then
		Talk(1,"","TiÓu anh hïng, ng­¬i mau ®Õn <color=red>Nh¹n M«n quan<color> b¸o cho phô th©n ta lµ <color=red>D­¬ng NghiÖp<color> r»ng KhiÕt §an ®· chuÈn bŞ 10 v¹n binh m· s¾p tÊn c«ng Nh¹n M«n quan, cßn bµy Thiªn M«n trËn. Ta ë ®©y mäi viÖc b×nh yªn kh«ng ph¶i lo l¾ng g× c¶.")


--ÒÔÏÂÊÇ°ïÖúËÄÀÉÌ½Ä¸µÄÈÎÎñ----------------------------------		
elseif ( UWorld1401  == 110 ) then
		Talk(7,"","T¹i h¹ ®· bÈm b¸o l¹i sù viÖc cho D­¬ng l·o t­íng qu©n, hiÖn giê ®ang chuÈn bŞ øng chiÕn.","VËy th× tèt qu¸, phô th©n ta cã nãi g× n÷a kh«ng?","D­¬ng l·o t­íng qu©n rÊt vui, nhê t¹i h¹ nh¾n l¹i nÕu ®¹i nh©n cã r¶nh th× vÒ th¨m.","Ta rÊt muèn vÒ th¨m phô th©n, nh­ng bËn rén thÕ nµy sao ®i ®­îc ®©y?","T¹i h¹ cã ı nµy, hay lµ ®¹i nh©n thay trang phôc th­êng d©n, nh­ vËy ®i ®­êng sÏ tiÖn h¬n.","H¶o kÕ! Nh­ng cÇn ph¶i cã <color=red>LÖnh bµi<color> vµ thay ®æi trang phôc cña <color=red>qu©n Tèng<color> gi¶ lµm ng­êi KhiÕt §an míi ®­îc qua ¶i.","<color=red>Liªu Th«ng lÖnh<color> cã thÓ t×m ë <color=red>Ngo¹i téc s¸t thñ<color>, <color=red>qu©n phôc Tèng binh<color> cã thÓ ®Õn <color=red>Nh¹n M«n quan<color> ®¸nh <color=red>Tèng §ao binh<color> ®Ó lÊy!")
		SetTask(1401,115)			
			 AddNote("T×m Liªu Th«ng lÖnh, qu©n phôc Tèng binh, gióp Tø Lang vÒ th¨m phô mÉu.")
			 Msg2Player("T×m Liªu Th«ng lÖnh, qu©n phôc Tèng binh, gióp Tø Lang vÒ th¨m phô mÉu.")	
elseif ( UWorld1401  == 115 and GetItemCount(2,0,3) >= 1  and GetItemCount(2,0,4) >= 1 ) then
		if  (DelItem(2,0,3,1) == 1 and DelItem(2,0,4,1) == 1 ) then
			Talk(2,"","Mäi thø ®· s½n sµng! TiÓu anh hïng! D­¬ng Diªn Huy ta m·i kh«ng quªn ¬n ®øc cña ng­êi! Ta muèn håi quèc th¨m mÉu th©n tõ l©u nh­ng lóc nµy h·y ®Õn <color=red>Tiªu Thiªn Hùu<color> dä th¸m thªm chót tin tøc vÒ <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color>.","§¹i nh©n nhí b¶o träng.")

			 SetTask(1401,120)
			 ----AddItem(0,0,0)
			 --Earn(10000)
			 ModifyExp(10000)
			 AddNote("§Õn gÆp Thiªn Hùu cã thÓ t×m ra chót manh mèi.")
			 Msg2Player("§Õn gÆp Thiªn Hùu cã thÓ t×m ra chót manh mèi.")
			
		else
			 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
		end
		
elseif (( GetItemCount(2,1,203) == 0  or  GetItemCount(2,1,204) == 0 )and UWorld1401  == 115 ) then
		Talk(1,"","Ch¼ng ph¶i ng­¬i nãi dÔ dµng lÊy ®­îc <color=red>Liªu Th«ng lÖnh<color> vµ <color=red>Tèng Binh qu©n phôc<color> vÒ sao? Ta ®ang mong tin tèt cña ng­¬i!")

elseif ( UWorld1401  == 120 ) then
		Talk(1,"","Ng­¬i ®Õn gÆp <color=red>Tiªu Thiªn Hùu<color> cã thÓ t×m ra chót manh mèi.")
		

--ÒÔÉÏÊÇ°ïÖúËÄÀÉÌ½Ä¸µÄÈÎÎñ---------------------------------------	

else
	Talk(1,"","KhiÕt §an chuÈn bŞ 10 v¹n ®¹i qu©n, 10 v¹n ®¹i qu©n! Kh¸ l¾m!")
end
end;


function  say1401_13()
	Talk(7,"","Xin hái cã biÕt <color=red>Tiªu YÕn YÕn<color> vµ <color=red>Hµn §øc Nh­îng<color> ë ®©u?","Hai c¸i tªn nµy ng­¬i còng d¸m tïy tiÖn nãi ra sao? <color=red>YÕn YÕn lµ tªn cóm c¬m cña ®­¬ng triÒu Tiªu Th¸i HËu. Hµn §øc Nh­îng lµ tªn gèc H¸n cña ®­¬ng triÒu §¹i thõa t­íng Gia LuËt Long VËn, lÏ nµo ng­¬i kh«ng biÕt?<color>","T¹i h¹ ®­îc mét ng­êi th©n cña hä lµ <color=red>Hµn Trİ Nh­îng<color> ph¸i ®Õn ®©y.","LÇn sau cã viÖc g× cø b¸o víi ta lµ ®­îc råi, mµ ng­¬i còng lµ ng­êi H¸n µ?","TiÓu nh©n ®İch thùc lµ ng­êi H¸n.","Ng­¬i cã tin tøc g× vÒ <color=red>t×nh h×nh cña D­¬ng gia<color> kh«ng? Kh«ng giÊu g× ng­¬i, ta chİnh lµ <color=red>Tø Lang D­¬ng Diªn Huy<color>, v× sù an toµn nªn ®· ®æi tªn thµnh Môc NghÜa.","Kú thùc th× t¹i h¹ chİnh lµ thuéc h¹ cña D­¬ng NghiÖp l·o t­íng, lÇn nµy ®Õn ®©y ®Ó th¨m dß.","TiÓu anh hïng, ng­¬i mau ®Õn <color=red>Nh¹n M«n quan<color> b¸o cho phô th©n ta lµ <color=red>D­¬ng NghiÖp<color> r»ng KhiÕt §an ®· chuÈn bŞ 10 v¹n binh m· s¾p tÊn c«ng Nh¹n M«n quan, cßn bµy Thiªn M«n trËn. Ta ë ®©y mäi viÖc b×nh yªn kh«ng ph¶i lo l¾ng g× c¶.")
    SetTask(1401,105)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("Quay vÒ Nh¹n M«n quan b¸o tin tøc cña Tø Lang D­¬ng Diªn Huy vµ hµnh ®éng cña KhiÕt §an.")
    Msg2Player("Quay vÒ Nh¹n M«n quan b¸o tin tøc cña Tø Lang D­¬ng Diªn Huy vµ hµnh ®éng cña KhiÕt §an.")
end;
