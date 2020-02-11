--ÈÎÎñ
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.


function main()
UWorld1402 = GetTask(1402)

--------------ÒÔÏÂÊÇ´ò¿ª¹í³ÇÈÎÎñµÄµÚ¶ş²½-----------------------------
if ( UWorld1402 == 35 )  then
		Talk(3,"","KÎ nµo ®· më cöa ®éng Phong Ma? Nãi mau!","Kh«ng ph¶i ta lµm! ThËt sù kh«ng ph¶i ta lµm mµ! Ta ®Õn <color=red>Phong §« Quû Thµnh<color> xem thö. GÇn ®©y L·o ®¹i chóng t«i ®ét nhiªn xuÊt hiÖn ë nh©n gian, nhÊt ®Şnh lµ L·o ®¹i th¶ chóng t«i ra!","§­îc! T¹m tha m¹ng cho mi ®ã!")
		SetTask(1402,40)
		--AddItem(1,1,1,1)
		--Earn(1)
		--ModifyExp(1)
		--AddNote("µÃÖª·á¶¼¹í³Ç³öÏÖµÄÏûÏ¢£¬¸Ï¿ì»ØÑôÔÂÊ¦Ì«´¦Í¨±¨¡£")
		TaskTip("BiÕt ®­îc tin tøc Phong §« Quû Thµnh xuÊt hiÖn, quay vÒ b¸o cho D­¬ng NguyÖt S­ Th¸i biÕt.")
		
else
		Talk(1,"","Kh«ng ph¶i ta lµm! ThËt sù kh«ng ph¶i ta lµm! KiÕp tr­íc ta bŞ chÕt oan ®ã!")
end
end;
