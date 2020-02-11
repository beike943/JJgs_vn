Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local nOldPlayerIndex = PlayerIndex;
	local nDeathCamp = BT_GetCamp();
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	local nCampPlace = nDeathCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_EMPL_DEATH);
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--ÉèÖÃÖØÉúµã
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);	--ËÀÍö´ÎÊý¼Ó1,²»¹ÜÊÇ±»Ê²Ã´¸ãËÀµÄ
	if Launcher == -1 then
		return 0;	--±»caststate¸ãËÀµÄ
	end;
	if KillerIndex == 0 then
		--±»NPCÉ±ËÀ
	elseif KillerIndex > 0 then
		--±»Íæ¼ÒÉ±ËÀ
		local sPlayerName = GetName();
		local nJunXian = abs(BT_GetData(PT_CURRANK));
		if nJunXian == 0 then
			nJunXian = 1;
		end;
		PlayerIndex = KillerIndex;
		local nKillerCamp = BT_GetCamp();
		if nKillerCamp == nDeathCamp then	--±»×Ô¼ºÈËÉ±ËÀ
			return 0;
		end;
		BT_SetData(PTNC_KILL,BT_GetData(PTNC_KILL)+1);
		BT_AddBattleActivity(BA_EMPL_KILL_PLAYER);
		local sKillerName = GetName();
		BT_EmperorAward(0.1);
		Msg2Player("HiÖn b¹n tiªu diÖt ®­îc:"..BT_GetData(PTNC_KILL));
		local nEvenID = tKillPlayerBonus[nJunXian];
		local nPoint = BT_GetBattleEvenPoint(nEvenID);
		BT_AddBattleEvenPoint(nEvenID);
		BT_AddMissionPoint(nKillerCamp,nPoint);
		BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
		PlayerIndex = nOldPlayerIndex;
		BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
		BT_DecPersonalPoint(ceil(nPoint/3));
		if nKillerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"Tèng"..sKillerName.." ®· h¹ gôc phe Liªu_"..sPlayerName);
		else
			Msg2MSAll(MISSION_ID,"Liªu"..sKillerName.." ®· h¹ gôc phe Tèng_"..sPlayerName);
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;