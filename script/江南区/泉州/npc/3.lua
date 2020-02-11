--ÈÎÎñ
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅ¹ØÈÎÎñ½áµã3
--²ß»®£º·®ÍòËÉ  2004.03.

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 15  )  then
		Talk(1,"say1401_3","Huynh ®µi t­íng m¹o uy nghiªm, ¾t ph¶i lµ Bang chñ. D¸m hái huynh ®µi vÒ lai lŞch cña tÊm <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color>?")
	elseif ( UWorld1401  == 20 and GetItemCount(2,1,34) >= 20 )then
				if  DelItem(2,1,34,20) == 1 then
						    Talk(3,"","Ha ha…§· ®Õn lóc ®¹i ca nµy ®Õn cøu c¸c huynh ®Ö ra khái chèn lao tï!!!","§¹i ca ®õng n«n nãng! H·y nãi cho t¹i h¹ biÕt <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> lµ vËt g×?","<color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> trong truyÒn thuyÕt lµ thÇn vËt cã søc m¹nh thÇn phôc thiªn h¹. KÎ lµm quan cã ®­îc sÏ ®­îc lµm hoµng ®Õ, ng­êi luyÖn vâ cã ®­îc cã thÓ thèng nhÊt giang hå! ChØ Thiªn Tö míi cã ®­îc thÇn vËt nµy! Ch¼ng hiÓu v× sao gÇn ®©y truyÒn r»ng thÇn vËt xuÊt hiÖn ë <color=red>Nh¹n M«n quan<color>. Muèn biÕt râ h·y ®Õn ®ã xem thö!")
						    SetTask(1401,25)
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)
						    AddNote("BiÕt ®­îc t¸c dông cña B¶n ®å S¬n Hµ X· T¾c nh­ng cÇn ®Õn Nh¹n M«n quan ®iÒu tra thªm!")
						    Msg2Player("BiÕt ®­îc t¸c dông cña B¶n ®å S¬n Hµ X· T¾c nh­ng cÇn ®Õn Nh¹n M«n quan ®iÒu tra thªm!")
				else
						 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
				end
	elseif ( UWorld1401  == 20 and GetItemCount(2,1,34) < 20 ) then
				Talk(1,"","<color=red>H¹nh Hoa th«n<color> cã nhiÒu tªn <color=red>Quan sø<color> tham lam. H·y ®o¹t <color=red>20 bé quan phôc<color> cña chóng vÒ!")
	elseif ( UWorld1401  == 25 ) then
				Talk(1,"","H·y ®Õn <color=red>Nh¹n M«n quan<color> ®iÒu tra râ ngän nguån!")
	else
				Talk(1,"","Bän quan phñ canh phßng thiªn lao qu¸ nghiªm ngÆt! ThËt lµ ®¸ng ghĞt!")
	end
end;

function  say1401_3()
		Say("Ta muèn ®ét nhËp vµo thiªn lao, giê cÇn <color=red>20 bé quan phôc<color> cña <color=red>Quan sø<color> ë <color=red>H¹nh Hoa th«n<color>. Ng­¬i ®õng hái t¹i sao, chØ cÇn nãi cã gióp hay kh«ng?",2,"§ång ı/yes1401_3","Kh«ng gióp/no1401_3")
end;

function  yes1401_3()
		Talk(2,"","Bang chñ ®· nhê, nhÊt ®Şnh ph¶i gióp!","Tèt l¾m! H·y ®Õn ®ã lÊy quan phôc vÒ!")
		SetTask(1401,20)
		AddNote("Gióp Tµo §¹i Lùc thu thËp 20 bé quan phôc, cã thÓ dä th¸m thªm chót tin tøc!")
		Msg2Player("Gióp Tµo §¹i Lùc thu thËp 20 bé quan phôc, cã thÓ dä th¸m thªm chót tin tøc!")
end;

function  no1401_3()
	Talk(1,"","T¹i h¹ kh«ng muèn ®¾c téi víi quan phñ! Xin nhê ng­êi kh¸c!")
end;
