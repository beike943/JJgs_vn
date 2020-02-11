--Ã¿¸ö°üµÄ¹Ì¶¨½±ÀøÈçÏÂ
--4±¾ÊµÕ½ĞÄµÃ
--20µãÊ¦ÃÅ¹±Ï×¶È
--1¸ö±¦Ê¯°ü¹ü
--Ã¿¸ö°üµÄËæ»ú½±ÀøÈçÏÂ
--1¸öÏû½ÙÉ¢¡ª¡ª10%£¨Ã¿¿ª5¸ö°ü±ØµÃ£©
--1¸öÅÍÁúèµ¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
--1¿ÅËæ»ú6¼¶ÁéÊ¯¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
--1ÕÅ7¼¶ÁéÊ¯Åä·½¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
--50¸öÌ«Ò×»ìÔª¹¦Í¼¼ø£¨2,0,1082£©¡ª¡ª99¼¶Ã¿¿ª20¸ö°ü±ØµÃ
--3±¾Ê¦ÃÅ¸ß¼¶ÃØ¼®¡ª¡ªÃ¿¿ª40¸ö°ü±ØµÃ
--1¸öÑ×»ÆÌú»ê¡ª¡ªÃ¿¿ª100¸ö°ü±ØµÃ
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
TSK_USE_GLORY_BAG_TIME = 593;

function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","Ng­êi kh«ng m«n ph¸i kh«ng thÓ dïng Tói vinh dù §¹i héi tû vâ.");
		return 0;
	end;
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(11,150,"") == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			get_item();
			get_random_item(nUseTime+1);
			SetTask(TSK_USE_GLORY_BAG_TIME,nUseTime+1);
		end;
	end;
end;

function get_item()
	AddItem(2,1,1101,4);--4±¾ÊµÕ½ĞÄµÃ
	Msg2Player("NhËn ®­îc 4 quyÓn Thùc ChiÕn T©m §¾c");
	SetTask(336,GetTask(336)+20);--20µãÊ¦ÃÅ¹±Ï×¶È
	Msg2Player("NhËn ®­îc 20 ®iÓm cèng hiÕn s­ m«n");
	AddItem(2,1,2642,1);--1¸ö±¦Ê¯°ü¹ü
	Msg2Player("NhËn ®­îc 1 Tói b¶o th¹ch");
end;

function get_random_item(nUseTime)
	local nLevel = GetLevel();
	local nRand = random(1,100);
	if nRand <= 10 then	--1¸öÏû½ÙÉ¢¡ª¡ª10%£¨Ã¿¿ª5¸ö°ü±ØµÃ£©
		AddItem(2,0,141,1);
		Msg2Player("NhËn ®­îc 1 Tiªu KiÕp T¸n");
	end;
	if mod(nUseTime,5) == 0 then
		AddItem(2,0,141,1);
		Msg2Player("NhËn ®­îc 1 Tiªu KiÕp T¸n");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1¸öÅÍÁúèµ¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
		AddItem(2,1,1000,1);
		Msg2Player("B¹n nhËn ®­îc 1 Bµn Long Bİch");
	end;
	if mod(nUseTime,10) == 0 then
		AddItem(2,1,1000,1);
		Msg2Player("B¹n nhËn ®­îc 1 Bµn Long Bİch");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1¿ÅËæ»ú6¼¶ÁéÊ¯¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("NhËn ®­îc 1 Linh th¹ch cÊp 6, ®· bá vµo Tô Linh ®Ønh");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("NhËn ®­îc 1 Linh th¹ch cÊp 6, ®· bá vµo Tô Linh ®Ønh");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1ÕÅ7¼¶ÁéÊ¯Åä·½¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("NhËn ®­îc 1 Linh th¹ch phèi chÕ cÊp 7, ®· bá vµo Tô Linh ®Ønh");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("NhËn ®­îc 1 Linh th¹ch phèi chÕ cÊp 7, ®· bá vµo Tô Linh ®Ønh");
	end;
	--================================================================
	if mod(nUseTime,20) == 0 and nLevel == 99 then	--50¸öÌ«Ò×»ìÔª¹¦Í¼¼ø£¨2,0,1082£©
		AddItem(2,0,1082,50);
		Msg2Player("NhËn ®­îc 50 Th¸i DŞch Hçn Nguyªn C«ng §å");
	end;
	--================================================================
	if mod(nUseTime,40) == 0 then	--3±¾Ê¦ÃÅ¸ß¼¶ÃØ¼®¡ª¡ªÃ¿¿ª40¸ö°ü±ØµÃ
		give_book(3);
	end;
	--================================================================
	if mod(nUseTime,100) == 0 then	--1¸öÑ×»ÆÌú»ê¡ª¡ªÃ¿¿ª100¸ö°ü±ØµÃ
		AddItem(2,1,1146,1);
		Msg2Player("NhËn ®­îc 1 Viªm Hoµng ThiÕt Hån");
	end;
	Msg2Player("§©y lµ lÇn thø "..nUseTime.." lÇn dïng Tói vinh dù §¹i héi tû vâ");
	WriteLog("[Tói vinh dù §¹i héi tû vâ lÇn 2]:"..GetName().."thø"..nUseTime.." lÇn dïng Tói vinh dù §¹i héi tû vâ");
end;

g_tbBook = 
{
	[2] = {"Kim Cang B¸t Nh· Kinh",0,107,166},	--ÉÙÁÖË×¼Ò
	[4] = {"TiÒm Long TŞch DiÖt Kinh",0,107,167}, --ÉÙÁÖÎäÉ®
	[3] = {"V« TrÇn Bå §Ò Kinh",0,107,168}, --ÉÙÁÖìøÉ®
	[6] = {"Thiªn La Liªn Ch©u Lôc",0,107,169}, --ÌÆÃÅ
	[8] = {"Nh­ ı Kim §Ønh MËt TŞch",0,107,170}, --¶ëáÒ·ğ¼Ò
	[9] = {"Bİch H¶i TuyÖt ¢m Phæ ",0,107,171}, --¶ëáÒË×¼Ò
	[11] = {"Hçn §én TrÊn Nh¹c MËt TŞch",0,107,172}, --Ø¤°ï¾»ÒÂ
	[12] = {"Quü Thiªn Du Long MËt TŞch",0,107,173}, --Ø¤°ïÎÛÒÂ
	[14] = {"HuyÔn ¶nh Mª Tung MËt TŞch",0,107,174}, --Îäµ±µÀ¼Ò
	[15] = {"Qu©n Tö TiÖt Phong MËt TŞch",0,107,175}, --Îäµ±Ë×¼Ò
	[17] = {"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176}, --ÑîÃÅÇ¹Æï
	[18] = {"Xuyªn V©n L¹c Hång MËt TŞch",0,107,177}, --ÑîÃÅ¹­Æï
	[20] = {"U Minh Phong Ma Lôc",0,107,178}, --Îå¶¾Ğ°ÏÀ
	[21] = {"Linh Cæ HuyÔn Tµ Lôc",0,107,179}, --Îå¶¾¹ÆÊ¦
	[23] = {"Cöu Thiªn Phong L«i QuyÕt",0,107,198},	
	[29] = {"Hång TrÇn Tóy Méng Phæ",0,107,202},
	[30] = {"Phong Hoa Thiªn DiÖp Phæ",0,107,203},	
}

function give_book(nNum)
	local nRoute = GetPlayerRoute();
	local tbBook = g_tbBook[nRoute];
	if not tbBook then
		return 0;
	end;
	local nID1,nID2,nID3 = tbBook[2],tbBook[3],tbBook[4];
	local szName = tbBook[1];
	AddItem(nID1,nID2,nID3,nNum,4);
	Msg2Player(format("NhËn ®­îc %d quyÓn %s",nNum,szName));
end;

function nothing()

end;