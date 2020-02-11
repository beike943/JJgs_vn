--ÈÎÎñ
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅ¹ØÈÎÎñ½áµã7
--²ß»®£º·®ÍòËÉ  2004.03.

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 45  )  then
		Talk(5,"","Ng­¬i lµ ai? Sao tù tiÖn vµo ®©y?","L·o bµ sai t¹i h¹ ®Õn ®©y nh¾n víi l·o t­íng qu©n mét c©u ®ã lµ: TiÓu nh©n ®­¬ng ®¹o, ThiÕt m¹c tr×nh c­êng","Phu nh©n thËt lµ chu ®¸o. §· x«ng pha chiÕn trËn ta nhÊt ®Şnh ph¶i chiÕn th¾ng míi trë vÒ!","H·y ®Õn gÇn qu©n doanh <color=red>Nh¹n M«n quan<color> trõng trŞ vµi tªn <color=red>Kiªu binh<color> ®o¹t vÒ <color=red>20 tÊm MËu Méc Bµi<color>!","T¹i h¹ sÏ ®i ngay!")
		SetTask(1401,50)
	elseif ( UWorld1401  == 50 and GetItemCount(2,1,64) >= 20 ) then
				if  DelItem(2,1,64,20) == 1 then
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)							    
								AddNote("NhiÖm vô trõng trŞ Kiªu binh hoµn thµnh.")
						    Msg2Player("NhiÖm vô trõng trŞ Kiªu binh hoµn thµnh.")
		    
								Talk(6,"","Qu¶ lµ kh«ng tÖ! Cã chót <color=red>phÇn th­ëng<color> xin nhËn cho!","B»ng h÷u míi ®Õn ®©y bän nªn chóng ch­a nhËn ra! PhiÒn gióp ta ®Õn Liªu quèc th¨m dß mét chuyÕn!","Nh­ng ta lµ ng­êi H¸n lµm sao tiÕp cËn ®­îc víi ng­êi KhiÕt §an?","Nghe nãi <color=red>BiÖn Kinh phñ<color> cã mét ng­êi H¸n tªn lµ <color=red>Hµn Trİ Nh­îng<color> kÕt h«n cïng víi mét thiÕu n÷ ng­êi KhiÕt §an.","§Õn t×m <color=red>Hµn Trİ Nh­îng<color>, nãi ng­¬i lµ th«ng gia cña «ng Êy, ch¾c ch¾n sÏ ®­îc hËu ®·i. Tranh thñ thu thËp tin tøc!","§­îc! T¹i h¹ sÏ ®Õn <color=red>BiÖn Kinh phñ <color> t×m <color=red>Hµn Trİ Nh­îng l·o nh©n<color>.")
								SetTask(1401,55)
			else
							 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
			end
		elseif ( UWorld1401  == 50 and GetItemCount(2,1,19) < 20 ) then
						Talk(1,"","H·y ®Õn gÇn qu©n doanh <color=red>Nh¹n M«n quan<color> trõng trŞ vµi tªn <color=red>Kiªu binh<color> ®o¹t vÒ <color=red>20 tÊm MËu Méc Bµi<color>!")
		elseif ( UWorld1401  == 55  ) then
						Talk(1,"","Mau ®Õn <color=red>BiÖn Kinh phñ<color> t×m <color=red>Hµn Trİ Nh­îng<color> l·o nh©n.")
--ÒÔÏÂÊÇÑîËÄÀÉÈÎÎñ---------------------------------------------
		elseif ( UWorld1401  == 105 ) then
						Talk(5,"","BÈm b¸o t­íng qu©n! T¹i h¹ võa ®­îc tin KhiÕt §an ®· chuÈn bŞ 10 v¹n tinh binh, bµy Thiªn M«n trËn s¾p tÊn c«ng Nh¹n M«n quan!","Cã thËt kh«ng? Ng­¬i nghe tõ ®©u vËy?","T¹i h¹ võa tõ chç <color=red>D­¬ng Diªn Huy<color> trë vÒ.","CÇu trêi phï hé cho Nhi tö! Ng­¬i mau quay l¹i b¸o cho <color=red>Diªn Huy<color> ®Ó thiÕu gia yªn t©m! Mäi viÖc ®· cã ta lo liÖu, nÕu cã thêi gian th× vÒ th¨m phô mÉu!","T¹i h¹ sÏ lËp tøc ®Õn <color=red>Bé L¹c V­¬ng Kú<color> b¸o cho <color=red>D­¬ng ®¹i nh©n <color>!")
							----AddItem(0,0,0)
						  --Earn(10000)
						  ModifyExp(10000)
							SetTask(1401,110)	    
							AddNote("Quay l¹i Bé L¹c V­¬ng Kú håi b¸o phß m· Môc NghÜa")
							Msg2Player("Quay l¹i Bé L¹c V­¬ng Kú håi b¸o phß m· Môc NghÜa")
		elseif ( UWorld1401  == 110 ) then
							Talk(1,"","PhiÒn b»ng h÷u håi b¸o l¹i cho nhi tö <color=red>D­¬ng Diªn Huy<color>.")
							
--ÒÔÏÂÊÇÑãÃÅ¹ØÈÎÎñµÄ´ó½á¾Ö---------------------------------------
		elseif ( UWorld1401  == 130 ) then
				Talk(3,"","BÈm b¸o T­íng qu©n, t¹i h¹ võa tõ chç <color=red>Tiªu Thiªn Hùu<color> biÕt ®­îc <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> hiÖn ë Thiªn M«n trËn. V× quyÕt ®o¹t ®­îc nã, KhiÕt §an ®· chuÈn bŞ 10 v¹n tinh binh.","<color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> l¹i xuÊt hiÖn råi, nghiÖp ch­íng ®©y! Nhê ng­¬i mau ®Õn <color=red>Thiªn M«n trËn<color> ®o¹t tÊm <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> ®ã!","T¹i h¹ vµo <color=red>Thiªn M«n trËn<color> nhÊt ®Şnh sÏ ®o¹t ®­îc tÊm <color=yellow>B¶n §å S¬n Hµ X· T¾c<color>")
		    SetTask(1401,135)
		    ----AddItem(0,0,0)
		    --Earn(10000)
		    ModifyExp(10000)
		    AddNote("Víi danh nghÜa t­íng lÜnh qu©n Tèng vµo Thiªn M«n trËn ®o¹t tÊm B¶n ®å S¬n Hµ X· T¾c. (sau nµy cã thÓ ®æi l¹i)")
		    Msg2Player("Víi danh nghÜa t­íng lÜnh qu©n Tèng vµo Thiªn M«n trËn ®o¹t tÊm B¶n ®å S¬n Hµ X· T¾c. (sau nµy cã thÓ ®æi l¹i)")
		
		elseif ( UWorld1401  == 125 or UWorld1401  == 135 ) then
				Talk(1,"","Sao råi? Cã tin tøc g× cña qu©n Liªu kh«ng?")
		
		else
								Talk(1,"","Chç So¸i Tr­íng kh«ng ®­îc tïy tiÖn!")
	end
end;
