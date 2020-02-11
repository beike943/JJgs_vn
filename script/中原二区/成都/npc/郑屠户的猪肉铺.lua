function main()
	UWorld1508 = GetTask(1508)
	if  UWorld1508 == 15   then
		Say("ThŞt heo 50 ®ång mét c©n, ng­¬i mua bao nhiªu?",2,"Mua 1 c©n thŞt heo!/yes1508","Kh«ng mua!/no1508")
	else
		Talk(1,"","TrŞnh mç ta mæ heo ®· 20 n¨m, ®­îc mäi ng­êi phong cho biÖt hiÖu lµ TrÊn Quan T©y coi nh­ còng kh«ng uæng kiÕp nµy! Nh­ng b©y giê cã chuyÖn x¶y ra, e r»ng ®Õn ta còng kh«ng b¸n ®­îc thŞt heo.")
	end
end;

function yes1508 ()
		i=GetCash()
		if i >= 50 then 
			AddItem(1,3,3,1)	
			Talk(1,"","§©y mét c©n thŞt heo! C¶m ¬n kh¸ch quan.")
			SetTask(1508,20)
			Msg2Player("B¹n nhËn ®­îc thŞt heo!")
			AddNote("§em thŞt heo ®­a cho §«ng Muéi lµm b¸nh bao thŞt")
			
		else
			Talk(1,"","Bæn tiÖm kh«ng b¸n thiÕu, kh¸ch quan cã tiÒn th× h·y ®Õn.")
		end
end;

function no1508 ()
	Talk(1,"","Khµ khµ! Ng­¬i t­ëng lµ 10 n¨m tr­íc? HiÖn giê ngoµi thµnh ma quû léng hµnh, c¶ Thµnh §« chØ cã tiÖm nµy b¸n thŞt heo, xem ng­¬i ®i ®©u t×m ®©y!")
end;
