--Ã¿¸ö°üµÄ¹Ì¶¨½±ÀøÈçÏÂ
--4±¾ÊµÕ½ĞÄµÃ
--20µãÊ¦ÃÅ¹±Ï×¶È
--1¸ö±¦Ê¯°ü¹ü
--Ã¿¸ö°üµÄËæ»ú½±ÀøÈçÏÂ
--1¸öÏû½ÙÉ¢¡ª¡ª10%£¨Ã¿¿ª5¸ö°ü±ØµÃ£©
--1¸öÅÍÁúèµ¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
--1¿ÅËæ»ú6¼¶ÁéÊ¯¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
--1ÕÅ7¼¶ÁéÊ¯Åä·½¡ª¡ª10%£¨Ã¿¿ª10¸ö°ü±ØµÃ£©
--1¿ÅËæ»ú7¼¶ÁéÊ¯¡ª¡ªÃ¿¿ª10¸ö°ü±ØµÃ
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
function OnUse(nItemIdx)
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(6,50,"") == 1 then
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
	if mod(nUseTime,10) == 0 then	--1¿ÅËæ»ú7¼¶ÁéÊ¯¡ª¡ªÃ¿¿ª10¸ö°ü±ØµÃ
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("NhËn ®­îc 1 Linh th¹ch cÊp 7, ®· bá vµo Tô Linh ®Ønh");
	end;
	Msg2Player("§©y lµ lÇn thø "..nUseTime.." lÇn dïng Tói vinh dù §¹i héi tû vâ");
	WriteLog("[Tói vinh dù §¹i héi tû vâ]:"..GetName().."thø"..nUseTime.." lÇn dïng Tói vinh dù §¹i héi tû vâ");
end;

function nothing()

end;