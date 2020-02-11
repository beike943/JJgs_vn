-- file:rescue.lua
-- by:Xsjcs
-- CreateDate: 2005-4-22
--  GetWorldTempTask(0)  ¼ÇÂ¼Ê±¼ähour
--  GetWorldTempTask(1)  ¼ÇÂ¼³ÇÊĞÁìÈ¡´ÎÊı  (Õâ¸ö·şÎñÆ÷)
--  GetTask(250)    ¼ÇÂ¼µ±Ç°ÈËÎï1Ğ¡Ê±ÄÚÊÇ·ñÓĞÁì¹ı¾È¼ÃÆ·
--  êâ¼ÃĞÂÊÖ£ºÇÕ²î´ó³¼Ã¿1Ğ¡Ê±³öÏÖÔÚÈı´ó³ÇÊĞ£¬Ã¿´ÎÒ»¹²·¢100¸ö¾È¼ÃÆ·¡£Ã¿¸ö20¼¶ÒÔÏÂµÄĞÂÊÖÃ¿´ÎÖ»ÄÜÁìÈ¡Ò»¸ö¡£Ã¿¸ö´ó³¼´¦ÁìÈ¡Ã»ÓĞÏŞÖÆ¡£


function newplayer_help()
	if (GetLevel() >= 20) then 
		Say("Ta phông mÖnh Hoµng th­îng, ph¸t l­¬ng thùc vµ tiÒn b¹c cøu tÕ n¹n d©n! Ai tõ cÊp 20 trë lªn ®Òu cã thÓ ®Õn nhËn",0)
	else 
		Say("Ta chØ ®­îc phĞp cøu tÕ cho nh÷ng t©n thñ ®¹t cÊp 20 mµ th«i! Ng­¬i ®· ®ñ t­ c¸ch, cã muèn nhËn kh«ng?",3,"Hay qu¸! Ta ®ang khèn khæ ®©y! Hoµng th­îng anh minh!/present","Xin chØ gi¸o, lµm sao ®Ó ®­îc nhËn cøu tÕ?!/abouthelpgoods","Ta ®©y mµ ph¶i ®i nhËn cøu tÕ µ!?/no")
	end;
end;

function abouthelpgoods()
	Say("Ta phông mÖnh Hoµng th­îng, mçi ngµy ®i ph¸t cøu tÕ cho c¸c t©n thñ cÊp 20 ë Thµnh §«, BiÖn Kinh, TuyÒn Ch©u. Cø c¸ch mçi giê ph¸t 1 lÇn. Mçi ngµy chØ cã 100 phÇn, ai nhanh ch©n th× ®­îc!",0)
end;



function present()

	local nNowTime = GetWorldTempTask(0)	--·şÎñÆ÷È«¾Ö±äÁ¿
	local nQuantity = GetWorldTempTask(1) 	--·şÎñÆ÷È«¾Ö±äÁ¿
	local Utask250 = GetTask(250)	
	local nHour = tonumber( date( "%m%d%H" ) )	--µ±Ç°Ê±¼ä¼ÇÂ¼

	if ( nNowTime ~= nHour ) then
		SetWorldTempTask(0,nHour)	--¿ªÆôÊ±¼ä¼ÇÂ¼
		SetWorldTempTask(1,0)		--¿ÉÁìÈ¡ÊıÁ¿ÇåÁã
		AddLocalNews("* * *Kh©m Sai ®¹i thÇn ®ang ph¸t cøu tÕ, c¸c t©n thñ ®¹t cÊp 20 h·y nhanh ch©n ®Õn Thµnh §«, BiÖn Kinh, TuyÒn Ch©u ®Ó nhËn!* * *")
	end
	nNowTime = GetWorldTempTask(0)
	nQuantity = GetWorldTempTask(1)
	if ( Utask250 ~= nNowTime and nQuantity < 100 ) then
		onTake()
		SetWorldTempTask(1,nQuantity+1)
		SetTask(250,nNowTime)
--		Msg2Player("AddItem 1,total = " ..nQuantity + 1)
	elseif ( Utask250 == nNowTime ) then
		Say("Ng­¬i ®· nhËn phÇn cña m×nh råi! H·y nh­êng cho ng­êi kh¸c nhĞ!",0)
	else
		Say("¤i! Ng­êi nghÌo ë ®©u mµ nhiÒu thÕ! Ng­¬i ®Õn chËm ch©n råi! Mét giê sau h·y quay l¹i nhĞ!",0)
	end		

end

function onTake()

  	i = random(1,54)
	if ( i == 1 ) then
		Earn(10)
		Msg2Player("B¹n nhËn ®­îc 10 §ång xu cøu tÕ!")
	elseif ( i == 2 ) then
		Earn(50)
		Msg2Player("B¹n nhËn ®­îc 50 §ång xu cøu tÕ!")
	elseif ( i == 3 ) then
		Earn(100)
		Msg2Player("B¹n nhËn ®­îc 1 l­îng b¹c cøu tÕ!")
	elseif ( i == 4 ) then
		Earn(200)
		Msg2Player("B¹n nhËn ®­îc 2 l­îng b¹c cøu tÕ!")
	elseif ( i == 5 ) then
		AddItem(1,2,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 Tµng Hång hoa")
	elseif ( i == 6 ) then
		AddItem(1,2,2,2)
		Msg2Player("B¹n nhËn ®­îc 2 C¸t c¸nh")
	elseif ( i == 7 ) then
		AddItem(1,2,3,2)
		Msg2Player("B¹n nhËn ®­îc 2 Hoµng liªn")
	elseif ( i == 8 ) then
		AddItem(1,2,8,2)
		Msg2Player("B¹n nhËn ®­îc 2 Ba ®Ëu!")
	elseif ( i == 9 ) then
		AddItem(1,2,9,2)
		Msg2Player("B¹n nhËn ®­îc 2 X¸c ve")
	elseif ( i == 10 ) then
		AddItem(2,2,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 Tinh thiÕt")
	elseif ( i == 11 ) then
		AddItem(2,2,2,2)
		Msg2Player("B¹n nhËn ®­îc 2 B¸ch luyÖn cang")
	elseif ( i == 12 ) then
		AddItem(1,2,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 Tµng Hång hoa")
	elseif ( i == 13 ) then
		AddItem(2,2,9,2)
		Msg2Player("B¹n nhËn ®­îc 2 Trïng Méc!")
	elseif ( i == 14 ) then
		AddItem(2,2,10,2)
		Msg2Player("B¹n nhËn ®­îc 2 ThiÕt Ch­¬ng Méc")
	elseif ( i == 15 ) then
		AddItem(2,2,15,2)
		Msg2Player("B¹n nhËn ®­îc 2 Da sãi")
	elseif ( i == 16 ) then
		AddItem(2,2,16,2)
		Msg2Player("B¹n nhËn ®­îc 2 Da hæ")
	elseif ( i == 17 ) then
		AddItem(2,2,21,2)
		Msg2Player("B¹n nhËn ®­îc 2 H¾c cÈm")
	elseif ( i == 18 ) then
		AddItem(2,2,22,2)
		Msg2Player("B¹n nhËn ®­îc 2 Chøc cÈm")
	elseif ( i == 19 ) then
		AddItem(1,3,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 ThŞt thá")
	elseif ( i == 20 ) then
		AddItem(1,3,2,2)
		Msg2Player("B¹n nhËn ®­îc 2 ThŞt gµ")
	elseif ( i == 21 ) then
		AddItem(1,3,9,2)
		Msg2Player("B¹n nhËn ®­îc 2 Quang Th«ng ma")
	elseif ( i == 22 ) then
		AddItem(1,3,10,2)
		Msg2Player("B¹n nhËn ®­îc 2 ®Ëu Khuynh")
	elseif ( i == 23 ) then
		AddItem(1,0,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 cuén b¨ng")
	elseif ( i == 24 ) then
		AddItem(1,0,2,2)
		Msg2Player("B¹n nhËn ®­îc 2 Kim S¸ng t¸n")
	elseif ( i == 25 ) then
		AddItem(1,0,3,2)
		Msg2Player("B¹n nhËn ®­îc 2 ChØ HuyÕt t¸n")
	elseif ( i == 26 ) then
		AddItem(1,0,7,2)
		Msg2Player("B¹n nhËn ®­îc 2 TiÓu Hoµn ®¬n")
	elseif ( i == 27 ) then
		AddItem(1,0,12,2)
		Msg2Player("B¹n nhËn ®­îc 2 Thanh T©m t¸n")
	elseif ( i == 28 ) then
		AddItem(1,1,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 B¸nh ng«")
	elseif ( i == 29 ) then
		AddItem(1,1,2,2)
		Msg2Player("B¹n nhËn ®­îc 2 C¬m n¾m")
	elseif ( i == 30 ) then
		AddItem(2,5,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 Gi¸m ®Şnh phï!")
	elseif ( i == 31 ) then
		AddItem(2,5,2,2)
		Msg2Player("B¹n nhËn ®­îc 2 Gi¸m ®Şnh phï!")
	elseif ( i == 32 ) then
		AddItem(2,4,1,1)
		Msg2Player("B¹n nhËn ®­îc 1 ¢m Hµo Th¹ch!")
	elseif ( i == 33 ) then
		AddItem(2,4,8,1)
		Msg2Player("B¹n nhËn ®­îc 1 D­¬ng Hµo Th¹ch!")
	elseif ( i == 34 ) then
		AddItem(1,5,1,2)
		Msg2Player("B¹n nhËn ®­îc 2 Håi phï BiÖn Kinh")
	elseif ( i == 35 ) then
		AddItem(1,5,2,2)
		Msg2Player("B¹n nhËn ®­îc 2 Håi phï Thµnh §«")
	elseif ( i == 36 ) then
		AddItem(0,107,31,1)
		Msg2Player("B¹n nhËn ®­îc 1 Tr­êng QuyÒn Phæ!")
	elseif ( i == 37 ) then
		AddItem(0,2,14,1)
		Msg2Player("B¹n nhËn ®­îc 1 HiÖp ThiÕu KiÕm!")
	elseif ( i == 38 ) then
		AddItem(0,2,15,1)
		Msg2Player("B¹n nhËn ®­îc 1 Tïng V¨n KiÕm!")
	elseif ( i == 39 ) then
		AddItem(0,5,27,1)
		Msg2Player("B¹n nhËn ®­îc 1 HiÖp ThiÕu C«n!")
	elseif ( i == 40 ) then
		AddItem(0,5,28,1)
		Msg2Player("B¹n nhËn ®­îc 1 TÒ Mi C«n!")
	elseif ( i == 41 ) then
		AddItem(0,1,40,1)
		Msg2Player("B¹n nhËn ®­îc 1 HiÖp ThiÕu ¸m khİ!")
	elseif ( i == 42 ) then
		AddItem(0,1,41,1)
		Msg2Player("B¹n nhËn ®­îc 1 Ngò Quang th¹ch!")
	elseif ( i == 43 ) then
		AddItem(0,3,53,1)
		Msg2Player("B¹n nhËn ®­îc 1 Giíi §ao!")
	elseif ( i == 44 ) then
		AddItem(0,10,64,1)
		Msg2Player("B¹n nhËn ®­îc 1 Ngäc VËn CÇm")
	elseif ( i == 45 ) then
		AddItem(0,9,75,1)
		Msg2Player("B¹n nhËn ®­îc 1 Ph¸n Quan bót")
	elseif ( i == 46 ) then
		AddItem(0,8,86,1)
		Msg2Player("B¹n nhËn ®­îc 1 Tİch tr­îng")
	elseif ( i == 47 ) then
		AddItem(0,100,1,1)
		Msg2Player("B¹n nhËn ®­îc 1 HiÖpThiÕu Bè y!")
	elseif ( i == 48 ) then
		AddItem(0,100,2,1)
		Msg2Player("B¹n nhËn ®­îc 1 H¾c CÈm Bè Y")
	elseif ( i == 49 ) then
		AddItem(0,100,19,1)
		Msg2Player("B¹n nhËn ®­îc 1 HiÖpThiÕu Y!")
	elseif ( i == 50 ) then
		AddItem(0,100,20,1)
		Msg2Player("B¹n nhËn ®­îc 1 ThiÕt Hé UyÓn")
	elseif ( i == 51 ) then
		AddItem(0,100,37,1)
		Msg2Player("B¹n nhËn ®­îc 1 Th¸i Th­êng")
	elseif ( i == 52 ) then
		AddItem(0,100,38,1)
		Msg2Player("B¹n nhËn ®­îc 1 Tö L¨ng Th­êng")
	elseif ( i == 53 ) then
		AddItem(0,100,55,1)
		Msg2Player("B¹n nhËn ®­îc 1 Vò Th­êng")
	else 
		AddItem(0,100,56,1)
		Msg2Player("B¹n nhËn ®­îc 1 Hång V©n Th­êng")
	end
end

function no()
	Say("ThÊy ng­¬i cã chİ khİ nh­ vËy, bæn quan v« cïng kh©m phôc!",0)
end
