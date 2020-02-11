Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\mainbattle_head.lua");

SZ_BF_CHEAT_OP_SCRIPT = "\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

--µ•Ãı¥´ÀÕ∏≈¬ ¥´ÀÕ∏≈¬ 
--°°
--		 ø±¯	–£Œæ	∂ºÕ≥	œ»∑Ê	¥ÛΩ´	‘™Àß	
-- ø±¯	0		0		0		0		0		0
--–£Œæ	0		0		0		0		0		0
--∂ºÕ≥	0		0		10		7		4		1	
--œ»∑Ê	0		0		7		10		7		4	
--¥ÛΩ´	0		0		4		7		10		7	
--‘™Àß	0		0		1		4		7		10	

--Note:À¿Õˆ◊¥Ã¨œ¬µ•ÃÙ…Í«Î“≤≤ªƒ‹¥Ô≥…£ª≤ªπ˝ø…“‘ µœ÷À¿Õˆ◊¥Ã¨œ¬µƒ…Í«Î

tFIGHTPROBABILITY =
{
	{000,000, 000, 000, 000, 000},
	{000,000, 000, 000, 000, 000},
	{000,000, 010, 007, 004, 001},
	{000,000, 007, 010, 007, 004},
	{000,000, 004, 007, 010, 007},
	{000,000, 001, 004, 007, 010},
}

function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	local nDeathIndex = PlayerIndex;
	local sDeathName = GetName();
	local nDeathCamp = BT_GetCamp();
	local nKillerCamp = 0;
	local sKillerName = "KŒ thÔ";
	if nKillerIndex > 0 then
		PlayerIndex = nKillerIndex;
		sKillerName = GetName();
		nKillerCamp = BT_GetCamp();
	end;
	PlayerIndex = nDeathIndex;
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nDanTiaoIdx1 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2);
	local nDanTiaoIdx2 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2+1);
	local tPlayer = {nDanTiaoIdx1,nDanTiaoIdx2};
	local nDeathRank = abs(BT_GetData(PT_CURRANK));
	if nDeathRank == 0 then
		nDeathRank = 1;
	end;
	local nKillPoint = tKillPlayerPoint[nDeathRank];
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_MAIN_DEATH);
	--=====================================================================¥¶¿Ì÷ÿ…˙µ„
	local nCampPlace = nDeathCamp;
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--…Ë÷√÷ÿ…˙µ„
	--======================================================================¥¶¿Ìƒ—√Ò
	local nRefugeeModel = {"Nπn d©n TËng","Nπn d©n Li™u"};
	local nRefugeeName = {"Nπn d©n TËng","Nπn d©n Li™u"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nDeathCamp],nRefugeeName[nDeathCamp],GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle\\refugee_talk_npc.lua");
	end;
	KillFollower()	--ƒ—√ÒµÙ¬‰
	BT_SetTempData(PTT_FOLLOWER,0);	--π“¡À÷Æ∫Û«ÂµÙæÕ∂‘¿≤
	--======================================================================
	if Launcher == -1 then
		return 0;	--±ªcaststate∏„À¿µƒ
	end;
	if nKillerIndex == 0 then	--±ªNPC…±À¿µƒ
		return 0;
	end;
	if nKillerCamp == nDeathCamp then	--±ª◊‘º∫»À…±À¿µƒ
		return 0;
	end;
	--======================================================================
	local nBattleState = GetMissionV(MV_BATTLE_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--∑«ø™’Ω◊¥Ã¨À¿µƒ
		return 0;
	end;
	--======================================================================¥¶¿Ìµ•ÃÙ
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE then	--µ•ÃÙ ±±ª…±À¿
		local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);
		for i=1,2 do
			PlayerIndex = tPlayer[i];
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--«Â≥˝µ•ÃÙ–≈œ¢
			BT_SetTempData(PTT_ROOMINDEX,0);
			local nPlayerCamp = BT_GetCamp();
			nCampPlace = nPlayerCamp;
			if GetGlbValue(RANDOM_PLACE) == 1 then
				nCampPlace = 3 - nCampPlace;
			end;
			RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
			SetFightState(0);
			Restore();
			RestoreNeili();
--			ClearColdDown();	--«Â≥˝À˘”–“©CD
			CastState("imme_clear_skill_interval",7,0);	--œ˚≥˝À˘”–ººƒ‹µƒ¿‰»¥ ±º‰			
			BT_SetTempData(PTT_LOCK,0);	--Ω‚À¯
			if PlayerIndex ~= nDeathIndex then	--»Áπ˚≤ª «À¿À¿ƒ«∏ˆ
				BT_SetData(PT_SINGLE_WIN,BT_GetData(PT_SINGLE_WIN)+1);
				SetRankPoint(RANK_SINGLE_FIGHT,BATTLE_OFFSET+PT_SINGLE_WIN,0);
				BT_EmperorAward(3);	--µ•ÃÙ §’ﬂ”–£≥£•µƒª˙ª·ªÒµ√ª µ€ºŒΩ±
				BT_AddPersonalPoint(2*nKillPoint);	--∏¯”Ë…± ÷“ª∂®µƒÀ´±∂∏ˆ»Àª˝∑÷
				--BT_AddMissionPoint(BT_GetCamp(),2*nKillPoint);		--∏¯”Ë…± ÷∑Ω“ª∂®µƒπ´π≤ª˝∑÷
				Msg2MSAll(MISSION_ID,GetName().." c≠Ïi ng˘a gi’t Æﬁch "..sDeathName.." lÀp Æ≠Óc c´ng lÌn, th≠Îng Æi”m t›ch lÚy"..(2*nKillPoint).." Æi”m");
				Say("Bπn Æ∑ giµnh thæng lÓi trong ÆÓt Æ¨n Æ u nµy!",0);
			else
				BT_SetData(PT_SINGLE_LOSE,BT_GetData(PT_SINGLE_LOSE)+1);
				BT_DecPersonalPoint(2*ceil(nKillPoint/3))	--ø€µÙ±ª…±À¿∑Ω2/3µƒœ‡”¶∏ˆ»Àª˝∑÷
				Say("Bπn Æ∑ thua trong l«n Æ¨n Æ u nµy, cË gæng h¨n nh–!",0);
			end;
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
			Msg2Player("Tı chi’n tr≠Íng Æ¨n Æ u quay v“ hÀu doanh!");
		end;
		PlayerIndex = nDeathIndex;
		return 1;
	end;
	
	local bInTaskArea = BT_GetTempData(PTT_IN_TASK_AREA)
	if 1 == bInTaskArea then --‘⁄∑¿◊˜±◊«¯±ª…±¡À
		local szName = GetName()
		PlayerIndex = nKillerIndex; --≥Õ∑£…± ÷
		--local nPunish = 1
		--BT_DecPersonalPoint(nPunish)
		Msg2Player(format("Ng≠¨i Æ∑ ti™u di÷t nh©n vi™n d˘ bﬁ cÒa ÆËi ph≠¨ng[%s], kh´ng Æ≠Óc nhÀn th≠Îng chi’n tr≠Íng", szName))
		PlayerIndex = nDeathIndex;
		return 0
	end
		
	--====================================================¥¶¿Ì¡¨’∂°¢µ•≥°À¿Õˆ ˝°¢µ•≥°…±»À ˝µ»
	PlayerIndex = nKillerIndex;
	
	--‘⁄∑¿◊˜±◊«¯…±»À¡À£¨“≤µ√≤ªµΩΩ±¿¯
	if 1 == BT_GetTempData(PTT_IN_TASK_AREA) then
		PlayerIndex = nDeathIndex;
		return 0
	end
	
	BT_AddBattleActivity(BA_MAIN_KILL_PLAYER);
	BT_SetData(PTNC_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL)+1);
	BT_SetData(PTNC_KILL,BT_GetData(PTNC_KILL)+1);
	local nSeriesKillPoint = floor(BT_GetData(PTNC_SERIES_KILL)/2);	--√ø∂‡…±£≤∏ˆ£¨¡¨’∂∑÷æÕº”£±
	if BT_GetData(PTNC_SERIES_KILL) > BT_GetData(PT_BEST_SERIES_KILL) then	--◊Ó¥Û¡¨’∂ ˝£ø
		BT_SetData(PT_BEST_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL));
	end;
	if BT_GetData(PTNC_KILL) > BT_GetData(PT_MAX_KILL) then	--◊Ó¥Û…±»À ˝£ø
		BT_SetData(PT_MAX_KILL,BT_GetData(PTNC_KILL));
	end;
	PlayerIndex = nDeathIndex;
	BT_SetData(PTNC_SERIES_KILL,0);
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);
	if BT_GetData(PTNC_DEATH) > BT_GetData(PT_MAX_DEATH) then
		BT_SetData(PT_MAX_DEATH,BT_GetData(PTNC_DEATH));
	end;
	if SERIES_KILL_OPEN ~= 1 then	--»Áπ˚¡¨’∂√ªø™æÕ∞—nSeriesKillPoint«Â0
		nSeriesKillPoint = 0;
	end;
	--======================================================================¥¶¿Ìª˝∑÷
	PlayerIndex = nKillerIndex;
	
	--…±»À¡À
	local szScript = format("pcd_on_kill()")
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	
	BT_EmperorAward(tKillPlayerEAP[nDeathRank]);	--∏¯”Ë…± ÷“ª∂®∏≈¬ µƒª µ€ºŒ…Õ
	BT_AddPersonalPoint(nKillPoint+nSeriesKillPoint);	--∏¯”Ë…± ÷“ª∂®µƒ∏ˆ»Àª˝∑÷
	BT_AddMissionPoint(BT_GetCamp(),nKillPoint+nSeriesKillPoint);		--∏¯”Ë…± ÷∑Ω“ª∂®µƒπ´π≤ª˝∑÷
	BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
	if nDeathCamp == SONG_ID then
		Msg2Player("Bπn Æ∑ Æ∏nh bπi "..sDeathName.." phe TËng, sË Æﬁch gi’t Æ≠Óc: "..BT_GetData(PTNC_KILL)..", gi’t li™n tÙc Æ≠Óc:"..BT_GetData(PTNC_SERIES_KILL));
	else
		Msg2Player("Bπn Æ∑ Æ∏nh bπi "..sDeathName.." phe TËng, sË Æﬁch gi’t Æ≠Óc: "..BT_GetData(PTNC_KILL)..", gi’t li™n tÙc Æ≠Óc:"..BT_GetData(PTNC_SERIES_KILL));
	end;
	
	PlayerIndex = nDeathIndex;
	
	--±ª…±¡À
	local szScript = format("pcd_on_death()")
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	
	BT_DecPersonalPoint(ceil(nKillPoint/3))	--ø€µÙ±ª…±À¿∑Ω∏ˆ»Àª˝∑÷
	--Msg2MSAll(MISSION_ID,tCampNameZ[nKillerCamp].."∑Ω"..sKillerName.."…±À¿¡À"..tCampNameZ[nDeathCamp].."∑Ω"..sDeathName);
	BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
	if BT_GetTempData(PTT_LOCK) == 1 then	--»Áπ˚À¿’ﬂ“—±ª∂≥Ω·
		return 0;
	end;
	--======================================================================≤È—Ø «∑Ò”–∂‡”‡µƒµ•ÃÙ∑øº‰
	local nRoomIndex = check_room()
	if nRoomIndex == 0 then
		return 0;	--√ª”–ø’∑øº‰
	end;
	--======================================================================¥¶¿Ì £”‡µ•ÃÙÃıº˛
	PlayerIndex = nKillerIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--»Áπ˚…± ÷“—±ª∂≥Ω·
		PlayerIndex = nDeathIndex;
		return 0;
	end;
	
	--=======================================================================================
	PlayerIndex = nKillerIndex
	local nKillerRank = abs(BT_GetData(PT_CURRANK));
	if nKillerRank == 0 then
		nKillerRank = 1;
	end;
	local nTransmitProbability = tFIGHTPROBABILITY[nKillerRank][nDeathRank];
	if random(1,100) <= nTransmitProbability then	--∑˚∫œ¥´ÀÕ∏≈¬ 
		PlayerIndex = nDeathIndex;
		SetFightState(0);
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
		BT_SetTempData(PTT_LOCK,1);	--À¯∂®À¿’ﬂ
		WantTo1v1(nKillerIndex, "Bπn bﬁ "..sKillerName.." gi’t ch’t, muËn tr∂ thÔ kh´ng? ß’m ng≠Óc %d gi©y", OPERATE_TIME, "\\settings\\static_script\\kf_newbattles\\mainbattle\\playerdeath.lua")
		PlayerIndex = nKillerIndex;
		Msg2Player("Bπn Æ∑ gi’t"..sDeathName..", ÆËi ph≠¨ng c„ th” trong"..Get_Time_String(OPERATE_TIME).."Ph∏t lÍi khi™u chi’n vÌi bπn, xin chÛ ˝!");
		PlayerIndex = nDeathIndex;
		return 1;	--¡¢º¥∏¥ªÓ
	end;
	PlayerIndex = nDeathIndex;
	return 0;	
end
--∑¢ÀÕµ•ÃÙ…Í«Î
function OnWant(nKillerIndex, nType)
	local nOldPlayerIndex = PlayerIndex;
	BT_SetTempData(PTT_LOCK,0);	--À¿’ﬂΩ‚∂≥
	if nKillerIndex <= 0 then
		Talk(1,"","Khi™u chi’n kh´ng Æ≠Óc ch p nhÀn, c„ th” ÆËi ph≠¨ng rÍi mπng ho∆c rÍi kh·i chi’n tr≠Íng.");
		return 0;
	end
	if nType == 0 then	--—°‘Ò»°œ˚ªÚ≤Ÿ◊˜≥¨ ±
		PlayerIndex = nKillerIndex;
		Msg2Player("ßËi ph≠¨ng qu∏ giÍ ho∆c hÒy c¨ hÈi khi™u chi’n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Hi÷n kh´ng Æ≠Óc ph∏t tin t¯c khi™u chi’n!");
		return 0;
	end;
	local nDeathIndex = PlayerIndex;
	local sDeathName = GetName();
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		Talk(1,"","Xin lÁi! Khu v˘c Æ¨n Æ u kh´ng ÆÒ");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--√ª”–ø’∑øº‰
	end;
	PlayerIndex = nKillerIndex;
	if IsPlayerDeath() ~= 0 then	--…± ÷ «À¿Õˆ◊¥Ã¨°£’‚∏ˆ≈–∂œø…“‘»•µÙ°£
		PlayerIndex = nDeathIndex;
		Talk(1,"","ßËi ph≠¨ng Î trπng th∏i tˆ vong, kh´ng th” ph∏t lÍi mÍi khi™u chi’n.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	local sKillerName = GetName();
	if BT_GetTempData(PTT_LOCK) == 1 then	--»Áπ˚ƒø±ÍÕÊº“±ªÀ¯∂®
		PlayerIndex = nDeathIndex;
		Talk(1,"","ßËi ph≠¨ng kh´ng th” nhÀn lÍi mÍi khi™u chi’n cÒa bπn.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nDeathIndex;
		Talk(1,"","Kh´ng th” ph∏t lÍi mÍi khi™u chi’n Æ’n ÆËi ph≠¨ng, c„ th” do Æ∑ rÍi kh·i chi’n tr≠Íng.")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex
	BT_SetTempData(PTT_LOCK,1);	--À¯∂®…± ÷£¨µ•ÃÙÕÍ±œ∫Û”¶«Â0
	SetPlayerScript("\\settings\\static_script\\kf_newbattles\\mainbattle\\playerdeath.lua");
	Accept1v1(nDeathIndex, sDeathName.."khi™u chi’n vÌi bπn, ÆÂng ˝ kh´ng? N’u tı chËi sœ bﬁ trı 1 ›t Æi”m t›ch lÚy. ß’m ng≠Óc %d gi©y", OPERATE_TIME, "\\settings\\static_script\\kf_newbattles\\mainbattle\\playerdeath.lua")
	PlayerIndex = nOldPlayerIndex;
end;
--Ω” ‹µ•ÃÙ
function OnAccept(nDeathIndex,nType)
	BT_SetTempData(PTT_LOCK,0);	--…± ÷Ω‚∂≥
	if nDeathIndex <= 0 then
		Talk(1,"","Kh´ng th” tr∂ lÍi do ÆËi ph≠¨ng Æ∑ rÍi mπng ho∆c rÍi kh·i chi’n tr≠Íng.");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nRank = abs(BT_GetData(PT_CURRANK));
	if nRank == 0 then
		nRank = 1;
	end;
	local nPoint = tKillPlayerPoint[nRank];
	if nType == 0 then	--—°‘Ò»°œ˚ªÚ≤Ÿ◊˜≥¨ ±
		ignore();	--µ±◊˜Ã”±¯¥¶¿Ì
		PlayerIndex = nDeathIndex;
		BT_SetTempData(PTT_LOCK,0);	--À¿’ﬂΩ‚∂≥
		Talk(1,"","ßËi ph≠¨ng qu∏ giÍ ho∆c ch‰n hÒy b·!");
		BT_AddPersonalPoint(2*nPoint);	--À¿’ﬂº”∏ˆ»Àª˝∑÷
		PlayerIndex = nOldPlayerIndex;
		BT_SetTempData(PTT_LOCK,0);	--…± ÷Ω‚∂≥
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Hi÷n kh´ng cho ph–p nhÀn lÍi mÍi khi™u chi’n!");
		return 0;
	end;
	local nKillerIndex = PlayerIndex;
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		PlayerIndex = nDeathIndex;
		Talk(1,"","Xin lÁi! Khu v˘c Æ¨n Æ u kh´ng ÆÒ");
		PlayerIndex = nKillerIndex;
		Talk(1,"","Xin lÁi! Khu v˘c Æ¨n Æ u kh´ng ÆÒ");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--√ª”–ø’∑øº‰
	end;
	PlayerIndex = nDeathIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--»Áπ˚ƒø±ÍÕÊº“±ªÀ¯∂®
		PlayerIndex = nKillerIndex;
		Talk(1,"","ßËi ph≠¨ng kh´ng th” nhÀn lÍi mÍi khi™u chi’n cÒa bπn.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if IsPlayerDeath() ~= 0 then	--À¿’ﬂ «À¿Õˆ◊¥Ã¨°£’‚∏ˆ≈–∂œø…“‘»•µÙ°£
		PlayerIndex = nKillerIndex;
		Talk(1,"","ßËi ph≠¨ng Î trπng th∏i tˆ vong, kh´ng th” tr∂ lÍi.");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nKillerIndex;
		Talk(1,"","Kh´ng th” tr∂ lÍi do ÆËi ph≠¨ng Æ∑ rÍi kh·i chi’n tr≠Íng.")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,1);
	PlayerIndex = nDeathIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,2);
	SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_READY);	--µ•ÃÙΩ· ¯∫Û«Â0
	PlayerIndex = nOldPlayerIndex;
end;
--ºÏ≤È «∑Ò”–ø’µƒµ•ÃÙ∑øº‰
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
	local nRank = abs(BT_GetData(PT_CURRANK));
	if nRank == 0 then
		nRank = 1;
	end;
	local nDecPoint = tKillPlayerPoint[nRank];
	local nCamp = BT_GetCamp();
	BT_DecPersonalPoint(2*ceil(nDecPoint/3))
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"TËng t≠Ìng s‹"..GetName().."Ch≠a chi’n Æ∑ rÛt lui bﬁ trı mÈt ›t Æi”m t›ch lÚy c∏ nh©n"..(2*ceil(nDecPoint/3)).." Æi”m");
	else
		Msg2MSAll(MISSION_ID,"Li™u t≠Ìng s‹"..GetName().."Ch≠a chi’n Æ∑ rÛt lui bﬁ trı mÈt ›t Æi”m t›ch lÚy c∏ nh©n"..(2*ceil(nDecPoint/3)).." Æi”m");
	end;
	BT_SetTempData(PTT_LOCK,0);
end;

function set_fight_camp(nCamp,nRoomIndex,nPosIndex)
	local nRefugeeModel = {"Nπn d©n TËng","Nπn d©n Li™u"};
	local nRefugeeName = {"Nπn d©n TËng","Nπn d©n Li™u"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],nRefugeeName[nCamp],GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle\\refugee_talk_npc.lua");
	end;
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--‘≠µÿ÷ÿ…˙
	end;
	KillFollower()	--ƒ—√ÒµÙ¬‰
	BT_SetTempData(PTT_FOLLOWER,0);	--Ω¯»Îµ•ÃÙ ±«ÂµÙæÕ∂‘¿≤
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_READY);
	SetFightState(0);
	BT_SetTempData(PTT_LOCK,1);
	BT_SetTempData(PTT_ROOMINDEX,nRoomIndex);
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--«Â≥˝À˘”–¡Ÿ ±◊¥Ã¨
--	ClearColdDown();	--«Â≥˝À˘”–“©CD
	CastState("imme_clear_skill_interval",7,0);	--œ˚≥˝À˘”–ººƒ‹µƒ¿‰»¥ ±º‰
	local nOffset = (nRoomIndex-1)*2+nCamp-1;
	SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,PlayerIndex);
	Say("ß¨n Æ u sau <color=yellow>30 gi©y<color> sœ bæt Æ«u!",0);
	Msg2Player("ß¨n Æ u sau 30 gi©y sœ bæt Æ«u, Æ´i b™n h∑y chu»n bﬁ!");
	BT_SetTempData(PTT_LOCK,1);	--…± ÷À¯∂®
	SetPos(tFightRoom[nRoomIndex][nPosIndex][1],tFightRoom[nRoomIndex][nPosIndex][2]);
end;
