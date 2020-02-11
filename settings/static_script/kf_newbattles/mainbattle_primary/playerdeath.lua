Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");

--µ¥Ìõ´«ËÍ¸ÅÂÊ´«ËÍ¸ÅÂÊ
--¡¡
--		Ê¿±ø	Ğ£Î¾	¶¼Í³	ÏÈ·æ	´ó½«	ÔªË§	
--Ê¿±ø	0		0		0		0		0		0
--Ğ£Î¾	0		0		0		0		0		0
--¶¼Í³	0		0		10		7		4		1	
--ÏÈ·æ	0		0		7		10		7		4	
--´ó½«	0		0		4		7		10		7	
--ÔªË§	0		0		1		4		7		10	

--Note:ËÀÍö×´Ì¬ÏÂµ¥ÌôÉêÇëÒ²²»ÄÜ´ï³É£»²»¹ı¿ÉÒÔÊµÏÖËÀÍö×´Ì¬ÏÂµÄÉêÇë

tFIGHTPROBABILITY =
{
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
	{005,005, 005, 005, 005, 005},
}

function OnDeath(Launcher)
	ClearColdDown();	--Çå³ıÒ©CD
	local nBattleState = GetMissionV(MV_BATTLE_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--·Ç¿ªÕ½×´Ì¬ËÀµÄ
		return 0;
	end;
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	local nDeathIndex = PlayerIndex;
	local sDeathName = GetName();
	local nDeathCamp = BT_GetCamp();
	local nKillerCamp = 0;
	local sKillerName = "KÎ thï";
	if nKillerIndex > 0 then
		PlayerIndex = nKillerIndex;
		sKillerName = GetName();
		nKillerCamp = BT_GetCamp();
	end;
	PlayerIndex = nDeathIndex;
	BT_SetData(PTNC_SERIES_KILL,0);	--Ê²Ã´Çé¿öÏÂËÀµÄÁ¬É±Êı¶¼ÒªÇå0
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);
	if BT_GetData(PTNC_DEATH) > BT_GetData(PT_MAX_DEATH) then
		BT_SetData(PT_MAX_DEATH,BT_GetData(PTNC_DEATH));
	end;
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nDanTiaoIdx1 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2);
	local nDanTiaoIdx2 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2+1);
	local tPlayer = {nDanTiaoIdx1,nDanTiaoIdx2};
	local nDeathRank,bEver = BT_GetCurRank();
	if nDeathRank == 0 then
		nDeathRank = 1;
	end;
	local nKillPoint = tKillPlayerPoint[nDeathRank];
	if bEver == 1 then
		nKillPoint = 5;	--Èç¹ûÊÇÓÀ¾Ã¾üÏÎ£¬Í³Ò»Îª5·Ö
	end;
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_MAIN_DEATH);
	--=====================================================================´¦ÀíÖØÉúµã
	local nCampPlace = nDeathCamp;
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--ÉèÖÃÖØÉúµã
	--======================================================================´¦ÀíÄÑÃñ
	local nRefugeeModel = {"N¹n d©n Tèng","N¹n d©n Liªu"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nDeathCamp],tCampNameZ[nDeathCamp].." _n¹n d©n",GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
	KillFollower()	--ÄÑÃñµôÂä
	BT_SetTempData(PTT_FOLLOWER,0);	--¹ÒÁËÖ®ºóÇåµô¾Í¶ÔÀ²
	--======================================================================
	if Launcher == -1 then
		return 0;	--±»caststate¸ãËÀµÄ
	end;
	if nKillerIndex == 0 then	--±»NPCÉ±ËÀµÄ
		return 0;
	end;
	if nKillerCamp == nDeathCamp then	--±»×Ô¼ºÈËÉ±ËÀµÄ
		return 0;
	end;
	--======================================================================´¦Àíµ¥Ìô
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE then	--µ¥ÌôÊ±±»É±ËÀ
		local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);
		for i=1,2 do
			PlayerIndex = tPlayer[i];
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--Çå³ıµ¥ÌôĞÅÏ¢
			BT_SetTempData(PTT_ROOMINDEX,0);
			local nPlayerCamp = BT_GetCamp();
			local nGotPoint = 0;
			nCampPlace = nPlayerCamp;
			RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
			SetFightState(0);
			Restore();
			RestoreNeili();
			ClearColdDown();	--Çå³ıËùÓĞÒ©CD
			CastState("imme_clear_skill_interval",-1,0);	--Ïû³ıËùÓĞ¼¼ÄÜµÄÀäÈ´Ê±¼ä			
			BT_SetTempData(PTT_LOCK,0);	--½âËø
			if PlayerIndex ~= nDeathIndex then	--Èç¹û²»ÊÇËÀËÀÄÇ¸ö
				BT_EmperorAward(3,1);	--µ¥ÌôÊ¤ÕßÓĞ£³£¥µÄ»ú»á»ñµÃ»ÊµÛ¼Î½±
				nGotPoint = BT_AddPersonalPoint(2*nKillPoint,0,1);	--¸øÓèÉ±ÊÖÒ»¶¨µÄË«±¶¸öÈË»ı·Ö
				BT_DecMissionPoint(nPlayerCamp,nGotPoint);	--°Ñ¹«¹²»ı·Ö¿Û»ØÈ¥
				Msg2MSAll(MISSION_ID,GetName().." c­ìi ngùa giÕt ®Şch "..sDeathName.." lËp ®­îc c«ng lín, th­ëng ®iÓm tİch lòy"..(2*nKillPoint).." ®iÓm");
				Say("B¹n ®· giµnh th¾ng lîi trong ®ît ®¬n ®Êu nµy!",0);
			else
				BT_SetData(PTNC_SINGLE_LOSE,BT_GetData(PTNC_SINGLE_LOSE)+1);
				BT_DecPersonalPoint(2*ceil(nKillPoint/3),1)	--¿Ûµô±»É±ËÀ·½2/3µÄÏàÓ¦¸öÈË»ı·Ö
				Say("B¹n ®· thua trong lÇn ®¬n ®Êu nµy, cè g¾ng h¬n nhĞ!",0);
			end;
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
			Msg2Player("Tõ chiÕn tr­êng ®¬n ®Êu quay vÒ hËu doanh!");
		end;
		PlayerIndex = nDeathIndex;
		return 1;
	end;
	--====================================================´¦ÀíÁ¬Õ¶¡¢µ¥³¡ËÀÍöÊı¡¢µ¥³¡É±ÈËÊıµÈ
	PlayerIndex = nKillerIndex;
	BT_AddBattleActivity(BA_MAIN_KILL_PLAYER);
	BT_SetData(PTNC_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL)+1);
	BT_SetData(PTNC_KILL,BT_GetData(PTNC_KILL)+1);
	local nSeriesKillPoint = floor(BT_GetData(PTNC_SERIES_KILL)/2);	--Ã¿¶àÉ±£²¸ö£¬Á¬Õ¶·Ö¾Í¼Ó£±
	if BT_GetData(PTNC_SERIES_KILL) > BT_GetData(PT_BEST_SERIES_KILL) then	--×î´óÁ¬Õ¶Êı£¿
		BT_SetData(PT_BEST_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL));
	end;
	if BT_GetData(PTNC_KILL) > BT_GetData(PT_MAX_KILL) then	--×î´óÉ±ÈËÊı£¿
		BT_SetData(PT_MAX_KILL,BT_GetData(PTNC_KILL));
	end;
	PlayerIndex = nDeathIndex;
	if SERIES_KILL_OPEN ~= 1 then	--Èç¹ûÁ¬Õ¶Ã»¿ª¾Í°ÑnSeriesKillPointÇå0
		nSeriesKillPoint = 0;
	end;
	nSeriesKillPoint = min(nSeriesKillPoint,2);	--Á¬Õ¶·Ö×î¶àÖ»ÄÜµ½2
	--======================================================================´¦Àí»ı·Ö
	PlayerIndex = nKillerIndex;
	BT_EmperorAward(tKillPlayerEAP[nDeathRank],1);	--¸øÓèÉ±ÊÖÒ»¶¨¸ÅÂÊµÄ»ÊµÛ¼ÎÉÍ
	BT_AddPersonalPoint(nKillPoint+nSeriesKillPoint,0,1);	--¸øÓèÉ±ÊÖÒ»¶¨µÄ¸öÈË»ı·Ö
	BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
	Msg2Player("B¹n ®· giÕt"..tCampNameZ[nDeathCamp].."Ph­¬ng "..sDeathName.." phe Tèng, sè ®Şch giÕt ®­îc: "..BT_GetData(PTNC_KILL)..", giÕt liªn tôc ®­îc:"..BT_GetData(PTNC_SERIES_KILL));
	PlayerIndex = nDeathIndex;
	Msg2Player("B¹n bŞ "..sKillerName.." ®· tiªu diÖt:"..BT_GetData(PTNC_DEATH));
	BT_DecPersonalPoint(ceil(nKillPoint/3),1)	--¿Ûµô±»É±ËÀ·½¸öÈË»ı·Ö
	--Msg2MSAll(MISSION_ID,tCampNameZ[nKillerCamp].."·½"..sKillerName.."É±ËÀÁË"..tCampNameZ[nDeathCamp].."·½"..sDeathName);
	BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
	if BT_GetTempData(PTT_LOCK) == 1 then	--Èç¹ûËÀÕßÒÑ±»¶³½á
		return 0;
	end;
	--======================================================================²éÑ¯ÊÇ·ñÓĞ¶àÓàµÄµ¥Ìô·¿¼ä
	local nRoomIndex = check_room()
	if nRoomIndex == 0 then
		return 0;	--Ã»ÓĞ¿Õ·¿¼ä
	end;
	--======================================================================´¦ÀíÊ£Óàµ¥ÌôÌõ¼ş
	PlayerIndex = nKillerIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--Èç¹ûÉ±ÊÖÒÑ±»¶³½á
		PlayerIndex = nDeathIndex;
		return 0;
	end;
	--=======================================================================================
	PlayerIndex = nKillerIndex
	local nKillerRank = BT_GetCurRank();
	if nKillerRank == 0 then
		nKillerRank = 1;
	end;
	local nTransmitProbability = tFIGHTPROBABILITY[nKillerRank][nDeathRank];
	if random(1,100) <= nTransmitProbability then	--·ûºÏ´«ËÍ¸ÅÂÊ
		PlayerIndex = nDeathIndex;
		SetFightState(0);
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
		BT_SetTempData(PTT_LOCK,1);	--Ëø¶¨ËÀÕß
		WantTo1v1(nKillerIndex, "B¹n bŞ "..sKillerName.." giÕt chÕt, muèn tr¶ thï kh«ng? §Õm ng­îc %d gi©y", OPERATE_TIME, "\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\playerdeath.lua")
		PlayerIndex = nKillerIndex;
		Msg2Player("B¹n ®· giÕt"..sDeathName..", ®èi ph­¬ng cã thÓ trong"..Get_Time_String(OPERATE_TIME).."Ph¸t lêi khiªu chiÕn víi b¹n, xin chó ı!");
		PlayerIndex = nDeathIndex;
		return 1;	--Á¢¼´¸´»î
	end;
	PlayerIndex = nDeathIndex;
	return 0;	
end
--·¢ËÍµ¥ÌôÉêÇë
function OnWant(nKillerIndex, nType)
	local nOldPlayerIndex = PlayerIndex;
	BT_SetTempData(PTT_LOCK,0);	--ËÀÕß½â¶³
	if BT_GetData(PTNC_SINGLE_LOSE) >= MAX_SINGLE_LOSE then
		Talk(1,"","Sè lÇn thÊt b¹i trong chiÕn tr­êng ®¬n ®Êu: <color=yellow>"..MAX_SINGLE_LOSE.."<color> trËn, ®Ó duy tr× hµo khİ binh sÜ, chñ so¸i ra lÖnh hñy quyÒn ®¬n ®Êu cña b¹n. ");
		return 0;
	end;
	local sDeathName = GetName();
	PlayerIndex = nKillerIndex;
	if BT_GetData(PTNC_SINGLE_LOSE) >= MAX_SINGLE_LOSE then
		Talk2SomeOne(nOldPlayerIndex,1,"","®èi ph­¬ng -<color=yellow>"..GetName().."<color> chuÈn bŞ ph¸t ®i khiªu chiÕn th­…");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nOldPlayerIndex;
	if nKillerIndex <= 0 then
		Talk(1,"","Khiªu chiÕn kh«ng ®­îc chÊp nhËn, cã thÓ ®èi ph­¬ng rêi m¹ng hoÆc rêi khái chiÕn tr­êng.");
		return 0;
	end
	if nType == 0 then	--Ñ¡ÔñÈ¡Ïû»ò²Ù×÷³¬Ê±
		PlayerIndex = nKillerIndex;
		Msg2Player("§èi ph­¬ng qu¸ giê hoÆc hñy c¬ héi khiªu chiÕn.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","HiÖn kh«ng ®­îc ph¸t tin tøc khiªu chiÕn!");
		return 0;
	end;
	local nDeathIndex = PlayerIndex;
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		Talk(1,"","Xin lçi! Khu vùc ®¬n ®Êu kh«ng ®ñ");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--Ã»ÓĞ¿Õ·¿¼ä
	end;
	PlayerIndex = nKillerIndex;
	if IsPlayerDeath() ~= 0 then	--É±ÊÖÊÇËÀÍö×´Ì¬¡£Õâ¸öÅĞ¶Ï¿ÉÒÔÈ¥µô¡£
		PlayerIndex = nDeathIndex;
		Talk(1,"","§èi ph­¬ng ë tr¹ng th¸i tö vong, kh«ng thÓ ph¸t lêi mêi khiªu chiÕn.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	local sKillerName = GetName();
	if BT_GetTempData(PTT_LOCK) == 1 then	--Èç¹ûÄ¿±êÍæ¼Ò±»Ëø¶¨
		PlayerIndex = nDeathIndex;
		Talk(1,"","§èi ph­¬ng kh«ng thÓ nhËn lêi mêi khiªu chiÕn cña b¹n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nDeathIndex;
		Talk(1,"","Kh«ng thÓ ph¸t lêi mêi khiªu chiÕn ®Õn ®èi ph­¬ng, cã thÓ do ®· rêi khái chiÕn tr­êng.")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex
	BT_SetTempData(PTT_LOCK,1);	--Ëø¶¨É±ÊÖ£¬µ¥ÌôÍê±ÏºóÓ¦Çå0
	SetPlayerScript("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\playerdeath.lua");
	Accept1v1(nDeathIndex, sDeathName.."khiªu chiÕn víi b¹n, ®ång ı kh«ng? NÕu tõ chèi sÏ bŞ trõ 1 İt ®iÓm tİch lòy. §Õm ng­îc %d gi©y", 10, "\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\playerdeath.lua")
	PlayerIndex = nOldPlayerIndex;
end;
--½ÓÊÜµ¥Ìô
function OnAccept(nDeathIndex,nType)
	BT_SetTempData(PTT_LOCK,0);	--É±ÊÖ½â¶³
	if nDeathIndex <= 0 then
		Talk(1,"","Kh«ng thÓ tr¶ lêi do ®èi ph­¬ng ®· rêi m¹ng hoÆc rêi khái chiÕn tr­êng.");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nRank = BT_GetCurRank();
	if nRank == 0 then
		nRank = 1;
	end;
	local nPoint = tKillPlayerPoint[nRank];
	if nType == 0 then	--Ñ¡ÔñÈ¡Ïû»ò²Ù×÷³¬Ê±
		ignore();	--µ±×÷ÌÓ±ø´¦Àí
		PlayerIndex = nDeathIndex;
		BT_SetTempData(PTT_LOCK,0);	--ËÀÕß½â¶³
		Talk(1,"","§èi ph­¬ng qu¸ giê hoÆc chän hñy bá!");
		BT_AddPersonalPoint(2*nPoint,0,1);	--ËÀÕß¼Ó¸öÈË»ı·Ö
		PlayerIndex = nOldPlayerIndex;
		BT_SetTempData(PTT_LOCK,0);	--É±ÊÖ½â¶³
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","HiÖn kh«ng cho phĞp nhËn lêi mêi khiªu chiÕn!");
		return 0;
	end;
	local nKillerIndex = PlayerIndex;
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		PlayerIndex = nDeathIndex;
		Talk(1,"","Xin lçi! Khu vùc ®¬n ®Êu kh«ng ®ñ");
		PlayerIndex = nKillerIndex;
		Talk(1,"","Xin lçi! Khu vùc ®¬n ®Êu kh«ng ®ñ");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--Ã»ÓĞ¿Õ·¿¼ä
	end;
	PlayerIndex = nDeathIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--Èç¹ûÄ¿±êÍæ¼Ò±»Ëø¶¨
		PlayerIndex = nKillerIndex;
		Talk(1,"","§èi ph­¬ng kh«ng thÓ nhËn lêi mêi khiªu chiÕn cña b¹n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if IsPlayerDeath() ~= 0 then	--ËÀÕßÊÇËÀÍö×´Ì¬¡£Õâ¸öÅĞ¶Ï¿ÉÒÔÈ¥µô¡£
		PlayerIndex = nKillerIndex;
		Talk(1,"","§èi ph­¬ng ë tr¹ng th¸i tö vong, kh«ng thÓ tr¶ lêi.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nKillerIndex;
		Talk(1,"","Kh«ng thÓ tr¶ lêi do ®èi ph­¬ng ®· rêi khái chiÕn tr­êng.")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,1);
	PlayerIndex = nDeathIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,2);
	SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_READY);	--µ¥Ìô½áÊøºóÇå0
	PlayerIndex = nOldPlayerIndex;
end;
--¼ì²éÊÇ·ñÓĞ¿ÕµÄµ¥Ìô·¿¼ä
function check_room()
	for i=1,4 do
		if GetMissionV(MV_FIGHTING_ROOM1+i-1) == ROOM_STATE_IDLE then
			return i;
		end;
	end;
	return 0;
end;

function ignore()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local tbDecPoint = {1,10,10,15,20,30};	--¸÷¾üÏÎ¶ÔÓ¦µÄ¿Û³ıµÄ¾ü¹¦
	local nRank = BT_GetCurRank();
	if nRank == 0 then
		nRank = 1;
	end;
	local nDecPoint = tbDecPoint[nRank];
	if nRank == 3 and BT_GetData(PT_WEEK_RANK) <= 100 then
		nDecPoint = 12;	--¸ß¼¶¶¼Í³ÊÇ12·Ö
	end;
	local nCamp = BT_GetCamp();
	BT_DecPersonalPoint(nDecPoint,1);
	BT_SetData(PTNC_SINGLE_LOSE,BT_GetData(PTNC_SINGLE_LOSE)+1);
	BT_SetTempData(PTT_LOCK,0);
	Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."_T­íng sÜ"..GetName().."Ch­a chiÕn ®· rót lui bŞ trõ mét İt ®iÓm tİch lòy c¸ nh©n"..nDecPoint.." ®iÓm");
end;

function set_fight_camp(nCamp,nRoomIndex,nPosIndex)
	local nRefugeeModel = {"N¹n d©n Tèng","N¹n d©n Liªu"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],tCampNameZ[nCamp].." _n¹n d©n",GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--Ô­µØÖØÉú
	end;
	KillFollower()	--ÄÑÃñµôÂä
	BT_SetTempData(PTT_FOLLOWER,0);	--½øÈëµ¥ÌôÊ±Çåµô¾Í¶ÔÀ²
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_READY);
	SetFightState(0);
	BT_SetTempData(PTT_LOCK,1);
	BT_SetTempData(PTT_ROOMINDEX,nRoomIndex);
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--Çå³ıËùÓĞÁÙÊ±×´Ì¬
	ClearColdDown();	--Çå³ıËùÓĞÒ©CD
	CastState("imme_clear_skill_interval",-1,0);	--Ïû³ıËùÓĞ¼¼ÄÜµÄÀäÈ´Ê±¼ä
	local nOffset = (nRoomIndex-1)*2+nCamp-1;
	SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,PlayerIndex);
	Say("§¬n ®Êu sau <color=yellow>30 gi©y<color> sÏ b¾t ®Çu!",0);
	Msg2Player("§¬n ®Êu sau 30 gi©y sÏ b¾t ®Çu, ®«i bªn h·y chuÈn bŞ!");
	BT_SetTempData(PTT_LOCK,1);	--É±ÊÖËø¶¨
	SetPos(tFightRoom[nRoomIndex][nPosIndex][1],tFightRoom[nRoomIndex][nPosIndex][2]);
end;
