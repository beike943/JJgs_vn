--ÈÎÎñ
--µØµã£ºãê¾©¸®  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã6
--²ß»®£º·®ÍòËÉ  2004.03.


function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 40 )  then
	Talk(6,"","T¹i h¹ vÊn an Xa L·o Th¸i Qu©n!","Khµ! Khµ! §a t¹! Xin hái anh hïng cã g× chØ gi¸o!","Tõ nhá t¹i h¹ vèn sïng kİnh D­¬ng t­íng qu©n, nay muèn b¸o danh gia nhËp D­¬ng Gia qu©n giÕt giÆc KhiÕt §an. Nµo ngê bŞ biÖt ph¸i ®Õn L­¬ng S¬n B¹c, xin L·o Th¸i Qu©n ph¸i t¹i h¹ ®Õn Nh¹n M«n quan tiÒn tuyÕn!","Hõ! ChuyÖn nµy dÔ th«i! ChuyÖn cña D­¬ng Gia qu©n, l·o ®©y cã thÓ tù quyÕt! Cø nãi lµ ta ph¸i ng­¬i ®i sÏ dÔ dµng ®Çu qu©n!","TiÖn thÓ ng­¬i chuyÓn lêi cho phu qu©n <color=red>D­¬ng NghiÖp<color> cña ta ë <color=red>Nh¹n M«n quan<color> r»ng: TiÓu nh©n léng quyÒn, hµ tÊt ph¶i ph« tµi.","§a t¹ L·o Th¸i Qu©n chiÕu cè! TiÓu nh©n nhÊt ®Şnh chuyÓn lêi!")
    SetTask(1401,45)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("§Õn Nh¹n M«n quan t×m D­¬ng NghiÖp chuyÓn lêi cña Xa Th¸i Qu©n, ®ång thêi hái th¨m tin tøc vÒ B¶n ®å S¬n Hµ X· T¾c!")
    Msg2Player("§Õn Nh¹n M«n quan t×m D­¬ng NghiÖp chuyÓn lêi cña Xa Th¸i Qu©n, ®ång thêi hái th¨m tin tøc vÒ B¶n ®å S¬n Hµ X· T¾c!")
	
elseif ( UWorld1401  == 45  ) then
		Talk(1,"","Gióp ta chuyÓn lêi cho phu qu©n <color=red>D­¬ng NghiÖp<color> ë <color=red>Nh¹n M«n quan<color>!")	
elseif ( UWorld1401  > 45  ) then
	Talk(1,"","§a t¹ b»ng h÷u!")
else
	Talk(1,"","GiÆc KhiÕt §an tù cao tù ®¹i nh­ng kh«ng dÔ x©m ph¹m c­¬ng thæ §¹i Tèng ta!")
end
end;
