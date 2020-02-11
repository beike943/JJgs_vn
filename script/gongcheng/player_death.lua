--create date:07-04-16
--author:yanjun
--describe:À¿ÕˆΩ≈±æ
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnDeath(nNpcIdx)
	local nDeathIdx = PlayerIndex;
	local nOldPlayerIdx = PlayerIndex;
	local nRealKillerIdx = NpcIdx2PIdx(nNpcIdx);
	local szDeathName = GetName(nDeathIdx);
	local szKillerName = GetName(nRealKillerIdx);
	local nDeathCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	SetTask(TNC_KILL,GetTask(TNC_KILL,nRealKillerIdx)+1, 0, nRealKillerIdx);
	SetMissionV(MV_DEATH_GONG+nDeathCamp-1,GetMissionV(MV_DEATH_GONG+nDeathCamp-1)+1);
	local nCurMapID = GetWorldPos();
	ClearColdDown();	--«Â“©CD
	SetTempRevPos(nCurMapID,tEntrancePos[nDeathCamp][1]*32,tEntrancePos[nDeathCamp][2]*32);	--…Ë÷√÷ÿ…˙µ„
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--»Áπ˚‘⁄ «µ•ÃÙ ±À¿µƒ
		local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
		local nKillerIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1);
		if nKillerIdx == 0 then
			WriteLog("[C´ng thµnh chi’n bﬁ lÁi]: file script tˆ vong chÿ ra link S∏t thÒ bﬁ lÁi");
		end;
		local tPlayer = {nDeathIdx,nKillerIdx};
		if nDeathCamp == SHOU_ID and nDoorIdx ~= 0 then	--»Áπ˚ « ÿ≥«∑Ω√≈Œ¿À¿¡À
			SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--«Îø’œ‡”¶µƒ ÿ≥«’ﬂ±‰¡ø
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),nKillerIdx);	--…Ë÷√œ‡”¶µƒπ•≥«’ﬂ±‰¡ø
			SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,ALL_ID);
		elseif nDeathCamp == GONG_ID and nDoorIdx ~= 0 then	--»Áπ˚ «π•≥«∑Ω√≈Œ¿À¿¡À
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--«Îø’œ‡”¶µƒπ•≥«’ﬂ±‰¡ø
			SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),nKillerIdx);	--…Ë÷√œ‡”¶µƒ ÿ≥«’ﬂ±‰¡ø		
			SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
		end;
		for i=1,2 do
			PlayerIndex = tPlayer[i];
			local nCamp = GCZ_GetPlayerCamp();
			RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
			SetFightState(0);
			Restore();
			RestoreNeili();
			if PlayerIndex == nKillerIdx then
				PlaySound("\\sound\\µ•ÃÙ §¿˚.wav");
				Say("Bπn Æ∑ giµnh thæng lÓi trong ÆÓt Æ¨n Æ u nµy!",0);
			else
				PlaySound("\\sound\\µ•ÃÙ ß∞‹.wav");
				Say("Bπn Æ∑ thua trong l«n Æ¨n Æ u nµy, cË gæng h¨n nh–!",0);
				SetTaskTemp(TEMP_GURAD_ID,0);
			end;
			SetTaskTemp(TEMP_FIGHT_STATE,0);
			SetTaskTemp(TEMP_ARENA_FIGHTING,0);
			SetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1,0);	--¡¨–¯∆Ωæ÷º«¬º«Â0
			SetPos(tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);
			Msg2Player("Tı chi’n tr≠Íng Æ¨n Æ u quay v“ hÀu doanh!");
		end;
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--ÃÙ’Ω’ﬂªÒ § 
			Msg2MSAll(MISSION_ID,"ßπi hi÷p"..GetName(nKillerIdx).."("..tCampNameZ[nEnemyCamp]..") khi™u chi’n Æ¨n Æ u Æ∑ thæng "..GetName(nDeathIdx).."("..tCampNameZ[nDeathCamp].."), c≠Ìp Æ≠Óc "..tDoorName[nDoorIdx]);
		else
			Msg2MSAll(MISSION_ID,"ßπi hi÷p"..GetName(nKillerIdx).."("..tCampNameZ[nEnemyCamp]..") khi™u chi’n Æ¨n Æ u Æ∑ thæng "..GetName(nDeathIdx).."("..tCampNameZ[nDeathCamp].."), gi˜ Æ≠Óc "..tDoorName[nDoorIdx]);
		end;
		SetTaskTemp(TEMP_CHALLENGER,0);
		PlayerIndex = nOldPlayerIdx;
		return 1;
	end;--µ•ÃÙif
	Msg2SomeOne(nRealKillerIdx,"Bπn Æ∑ gi’t"..szDeathName);
	Msg2Player("Bπn bﬁ "..szKillerName.." Æ∑ gi’t ");
	return 0;
end;