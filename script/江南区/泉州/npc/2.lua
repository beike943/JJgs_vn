--ÈÎÎñ
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅ¹ØÈÎÎñ½áµã2
--²ß»®£º·®ÍòËÉ  2004.03.

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 5  )  then
		Talk(1,"say1401_2","GÇn ®©y, BiÖn Kinh cã nhiÒu Nh©n sÜ giang hå qua l¹i, d¸m hái cã chuyÖn g× s¾p x¶y ra?")

	elseif ( UWorld1401  == 10 and GetItemCount(2,1,19) >= 20 ) then
			
		if  DelItem(2,1,19,20) == 1 then
						    Talk(3,"","Nghe nãi <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> truyÒn thuyÕt ®· xuÊt hiÖn ë <color=red>Nh¹n M«n quan<color>. Thiªn h¹ ®Òu ®æ ®Õn n¬i nµy!","D¸m hái tÊm <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> rèt cuéc lµ b¶o vËt g×?","Ta kh«ng râ! Nh­ng bang chñ cña ta ¾t sÏ biÕt chuyÖn nµy! H·y ®Õn töu lÇu t×m <color=red>Tµo §¹i Lùc<color> Kim Ng­u bang bang chñ hái th¨m cí sù!")
						    SetTask(1401,15)
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)
						    AddNote("BiÕt ®­îc tin tøc B¶n ®å S¬n Hµ X· T¾c nh­ng cÇn ph¶i ®iÒu tra kü l­ìng!")
						    Msg2Player("BiÕt ®­îc tin tøc B¶n ®å S¬n Hµ X· T¾c nh­ng cÇn ph¶i ®iÒu tra kü l­ìng!")
		else
							 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
		end

	elseif ( UWorld1401  == 10 and GetItemCount(2,1,19) < 20 ) then
				Talk(1,"","H·y ®Õn ch©n nói ë <color=red>ThiÕu L©m tù<color> giÕt <color=red>Hæ d÷<color>. Ta cÇn <color=red>20 c¸i ®u«i hæ<color> ®Ó ng©m r­îu!")
	elseif ( UWorld1401  == 15  ) then
				Talk(1,"","§Õn töu lÇu t×m <color=red>Tµo §¹i Lùc<color> Kim Ng­u bang bang chñ hái th¨m!")
	else
				Talk(1,"","Sao ngµy nµo còng cã nhiÒu ng­êi ®Õn t×m ta thÕ nµy!? PhiÒn chÕt ®i ®­îc!")
	end
end;

function  say1401_2()
		Say("§­îc! Ta sÏ cho ng­¬i biÕt! Nh­ng…¸i da! Ta l¹i thÌm nhÊm Hæ VÜ Töu n÷a råi! H·y gióp ta lÊy vÒ <color=red>20 c¸i ®u«i hæ<color> ®Ó ng©m r­îu!",2,"§ång ı/yes1401_2","Kh«ng gióp/no1401_2")
end;

function  yes1401_2()
		Talk(2,"","Chót viÖc män h·y ®Ó t¹i h¹ ra tay! Ch¼ng phiÒn ®¹i ca ph¶i ®İch th©n ®éng thñ!","Ra T©y m«n BiÖn Kinh phñ lµ <color=red>ThiÕu L©m tù<color>. Cã nhiÒu <color=red>Hæ d÷<color>. H·y cÈn thËn!")
		SetTask(1401,10)
		AddNote("Gióp Nh©n sÜ giang hå thu thËp 20 c¸i ®u«i hæ ®Ó biÕt thªm tin tøc!")
		Msg2Player("Gióp Nh©n sÜ giang hå thu thËp 20 c¸i ®u«i hæ ®Ó biÕt thªm tin tøc!")
end;

function  no1401_2()
	Talk(1,"","Ta cã chót chuyÖn! Xin ®¹i ca h·y nhê ng­êi kh¸c!")
end;
