Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local MapID,MapX,MapY = GetWorldPos();
	local RoomState = GetMissionV(MV_ROOMSTATE);
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	if RoomState == MS_STATE_STARTED or RoomState == MS_STATE_WAITCOMPLETE then	
		if nGenre == 0 and nDetail == 0 and nParticular == 0 then
			Msg2Player("Tr­íc tiªn cÇn ph¶i lªn thuyÒn míi cã thÓ b¾t ®Çu trËn ®Êu.");
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);
			return 0;
		end;
		if GetTask(POSITION) == TRAPCOUNT then
			Msg2Player("B¹n ®· hoµn thµnh ®­êng ®ua, h·y vµo khu nghØ mÖt ®Ó ®îi trËn ®Êu kÕt thóc.");
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);
			return 0;
		end;
		if GetTask(POSITION) ~= 0 then
			NewWorld(MapID,2019,3291);
			InteractiveEnable(0);
			Msg2Player("Trong khi thi ®Êu, h·y cè g¾ng ®i ®óng ®­êng ®ua!");
			return 0;
		end;
		if GetMapTaskTemp(MapID,1) == 0 then
			Create_Box(BOXCOUNT);
			SetMapTaskTemp(MapID,1,1);
		end;
		if nParticular >= 26 and nParticular <= 31 then	--Èç¹û²»ÊÇÆÕÍ¨ÁúÖÛ
			LearnSkill(nParticular+828);
			SetLRSkill(nParticular+828,0);	--ÉèÎªÊó±êÓÒ¼ü¼¼ÄÜ
		end;
		SetFightState(1);	--ÉèÖÃÎªÕ½¶·×´Ì¬
		ForbidChangePK(0)
		SetPKFlag(2,0);	--ÉèÖÃÎªÍÀÉ±×´Ì¬
		ForbidChangePK(1);	--½ûÖ¹¸Ä±äPK×´Ì¬
	elseif RoomState == MS_STATE_WAITSIGNUP or RoomState == MS_STATE_WAITSTART then
		if nGenre == 0 and nDetail == 0 and nParticular == 0 then
			Msg2Player("Tr­íc khi trËn ®Êu b¾t ®Çu h·y lªn thuyÒn chuÈn bÞ.");
		end;
		NewWorld(MapID,2038,3268);
		InteractiveEnable(0);
		Msg2Player("TrËn ®Êu ch­a b¾t ®Çu, cè gi÷ yªn lÆng!");
	end;
end;