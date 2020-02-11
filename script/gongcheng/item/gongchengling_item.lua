--create date:07-04-16
--author:yanjun
--describe:¹¥³ÇÏÈ·æÁîÎïÆ·½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","ChØ ë trong khu vùc C«ng thµnh chiÕn míi cã thÓ sö dông C«ng thµnh Tiªn phong lÖnh.");
		return 0;
	end;
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","ChØ trong giai ®o¹n c«ng thµnh m«n míi cã thÓ sö dông C«ng thµnh Tiªn phong lÖnh");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","Thµnh m«n ®· bÞ sôp ®æ hoµn toµn, kh«ng thÓ tiÕp tôc sö dông ");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nDoorIdx ~= 0 then
		Talk(1,"","B¹n ®· lµ Thñ vÖ cña "..tDoorName[nDoorIdx].."!");
		return 0;
	end;
	local selTab = {
				format("Khiªu chiÕn"..tDoorName[1].."Thñ vÖ/#use(%d,%d)",nItemIdx,1),
				format("Khiªu chiÕn"..tDoorName[2].."Thñ vÖ/#use(%d,%d)",nItemIdx,2),
				format("Khiªu chiÕn"..tDoorName[3].."Thñ vÖ/#use(%d,%d)",nItemIdx,3),
				"Hñy bá/nothing",
				}
	local nEnemyCamp = GONGSHOU_ID - GCZ_GetPlayerCamp();
	local szGEGuardName,szGSGuardName,szGWGuardName = GCZ_GetGuardName(GONG_ID,0);
	local szSEGuardName,szSSGuardName,szSWGuardName = GCZ_GetGuardName(SHOU_ID,0);
	Say("             "..gf_FormatStringLength("Phe c«ng",20)..gf_FormatStringLength("Phe thñ_",20).."<enter>"..gf_FormatStringLength(tDoorName[1],12,0)..":"..gf_FormatStringLength(szGEGuardName,20)..gf_FormatStringLength(szSEGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[2],12,0)..":"..gf_FormatStringLength(szGSGuardName,20)..gf_FormatStringLength(szSSGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[3],12,0)..":"..gf_FormatStringLength(szGWGuardName,20)..gf_FormatStringLength(szSWGuardName,20).."\n\nTrªn ®©y lµ t×nh h×nh thñ vÖ c¸c thµnh thÞ, c¸c h¹ muèn khiªu chiÕn Thñ vÖ thµnh m«n nµo?",getn(selTab),selTab);
end;

function use(nItemIdx,nDoorIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","Chá trong giai ®o¹n c«ng thµnh m«n míi cã thÓ sö dông C«ng thµnh Tiªn phong lÖnh");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","Thµnh m«n ®· bÞ sôp ®æ hoµn toµn, kh«ng cÇn sö dông n÷a");
		return 0;
	end;
	if GetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1) == 1  then
		Talk(1,"","Thµnh nµy ®· bÞ sôp ®æ");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GONGSHOU_ID - nPlayerCamp;
	local szFriendName = GCZ_GetGuardName(nPlayerCamp,nDoorIdx);	--±¾·½ÊØÎÀÃû×Ö
	local szEnemyName = GCZ_GetGuardName(nEnemyCamp,nDoorIdx);		--µÐ·½ÊØÎÀÃû×Ö
	if szFriendName ~= "Ch­a" and szEnemyName ~= "Ch­a" then	--Ë«·½¶¼ÅÉÈËÁË
		Talk(1,"","HiÖn Thñ vÖ thµnh m«n nµy ®ang khiªu chiÕn ®¬n ®Êu víi ng­êi kh¸c nªn kh«ng thÓ khiªu chiÕn Thñ vÖ thµnh m«n nµy");
		return 0;
	end;	 
	if szFriendName ~= "Ch­a" and szEnemyName == "Ch­a" then	--Ä¿Ç°³ÇÃÅ±»ÎÒ·½Õ¼Áì
		Talk(1,"","Phe ta ®· ph¸i ng­êi trÊn gi÷ thµnh m«n nµy, kh«ng thÓ xin phÐp khiªu chiÕn");
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	local nEnemyIdx = GCZ_GetGuardPlayerIndex(nEnemyCamp,nDoorIdx);
	if nEnemyIdx > 0 then
		PlayerIndex = nEnemyIdx;
		if GetTaskTemp(TEMP_LOCK) ~= 0 then	--Ä¿±êÊØÎÀ±»Ëø¶¨
			Talk2SomeOne(nOldPlayerIdx,1,"","Phe ta ®· cã ng­êi göi th­ khiªu chiÕn ®¬n ®Êu víi Thñ vÖ thµnh m«n nµy");
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		if szFriendName == "Ch­a" and szEnemyName == "Ch­a" then	--Ä¿Ç°³ÇÃÅÃ»ÈËÕ¼Áì
			Talk(1,"","HiÖn thµnh nµy ch­a cã thñ vÖ, b¹n trùc tiÕp trë thµnh Thñ vÖ cña thµnh m«n nµy!");
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
			if nPlayerCamp == SHOU_ID then
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
			else
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,ALL_ID);
			end;
			SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
			Msg2MSAll(MISSION_ID,tDoorName[nDoorIdx].." kh«ng ng­êi trÊn thñ, bÞ "..GetName().."("..tCampNameZ[nPlayerCamp]..") chiÕm lÜnh dÔ dµng");
			return 0;
		end
		if szFriendName == "Ch­a" and szEnemyName ~= "Ch­a" then	--Ä¿Ç°³ÇÃÅ±»µÐ·½Õ¼Áì
			PlayerIndex = nEnemyIdx;
			SetTaskTemp(TEMP_LOCK,1);	--Ëø¶¨ÊØÎÀ
			Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).." khiªu chiÕn víi b¹n. §Õm ng­îc cßn %d gi©y", 15, "\\script\\gongcheng\\item\\gongchengling_item.lua")
			PlayerIndex = nOldPlayerIdx; 
			Msg2Player("Xin phÐp khiªu chiÕn ®¬n ®Êu ®· göi ®i. Xin chê ®îi håi ©m");
		end;
	end;
end;

function OnAccept(nProposerIdx, nType)
	local nGuardIdx = PlayerIndex;
	SetTaskTemp(TEMP_LOCK,0);	--ÊØÎÀ½âËø
	if nProposerIdx <= 0 then
		Talk(1,"","§èi ph­¬ng ®· rêi khái chiÕn tr­êng");
		Msg2Player("§èi ph­¬ng ®· rêi khái chiÕn tr­êng");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nType == 0 then	--Ñ¡ÔñÈ¡Ïû»ò²Ù×÷³¬Ê±
		PlayerIndex = nProposerIdx;
		local nPlayerCamp = GCZ_GetPlayerCamp();
		SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
		Talk(1,"","Thñ vÖ thµnh m«n nµy ®· bá trèn, b¹n ®· trë thµnh T©n thñ vÖ. Xin h·y cè g¾ng gi÷ thµnh!");
		Msg2Player("Thñ vÖ thµnh m«n nµy ®· bá trèn, b¹n ®· trë thµnh T©n thñ vÖ. Xin h·y cè g¾ng gi÷ thµnh!");
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
		local nEnemyCamp = GCZ_GetEnemyCamp();
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1,0);
		GCZ_Msg2Camp(GetName().."Sö dông C«ng thµnh Tiªn phong lÖnh trë thµnh "..tDoorName[nDoorIdx].."Thñ vÖ",nPlayerCamp);		
		PlayerIndex = nGuardIdx;
		nPlayerCamp = GCZ_GetPlayerCamp();
		Msg2Player("Thµnh m«n do b¹n thñ vÖ ®· bÞ ng­êi kh¸c chiÕm");
		Talk(1,"","Thµnh m«n do b¹n thñ vÖ ®· bÞ ng­êi kh¸c chiÕm")
		SetTaskTemp(TEMP_GURAD_ID,0);
		GCZ_Msg2Camp(tDoorName[nDoorIdx].." ®· bÞ ®Þch chiÕm",nPlayerCamp);
		return 0;
	end;
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nProposerIdx;
	SetTaskTemp(TEMP_CHALLENGER,1);	--ÉèÎªÌôÕ½Õß
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nGuardIdx;
	Msg2MSAll(MISSION_ID,"§¹i hiÖp"..GetName(nProposerIdx).." ph¸t khiªu chiÕn ®¬n ®Êu tíi "..tDoorName[nDoorIdx].."Thñ vÖ"..GetName(nGuardIdx)..".");
end;

function set_fight_state(nCamp,nDoorIdx)
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--Ô­µØÖØÉú
	end;
	if GetTaskTemp(TEMP_AUDIENCE) ~= 0 then	--Èç¹ûÕýÔÚ×ö¹ÛÖÚ
		DesaltPlayer(0);
		UseSkillEnable(1);--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
		SetTaskTemp(TEMP_AUDIENCE,0);
	end;	
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--Çå³ýËùÓÐÁÙÊ±×´Ì¬
	ClearColdDown();	--ÇåÒ©CD
	CastState("imme_clear_skill_interval",-1,0);	--Ïû³ýËùÓÐ¼¼ÄÜµÄÀäÈ´Ê±¼ä
	Say("§¬n ®Êu sau <color=yellow>30 gi©y<color> sÏ b¾t ®Çu!",0);
	Msg2Player("§¬n ®Êu sau 30 gi©y sÏ b¾t ®Çu, ®«i bªn h·y chuÈn bÞ!");
	SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
	SetTaskTemp(TEMP_ARENA_FIGHTING,nCamp);
	SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_READY);
	SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,PlayerIndex);
	SetPos(tFightingPos[nDoorIdx][1],tFightingPos[nDoorIdx][2]);
end;