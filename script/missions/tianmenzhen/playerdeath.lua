--ÌìÃÅÕóÕ½³¡ËÀÍö½Å±¾
--by vivi
--2009\07\18

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
--×·»Ø´ó×ÖÌû´ó×÷Õ½
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

function OnDeath(Launcher)
	ClearColdDown();	--Çå³ıÒ©CD
	local nBattleState = GetMissionV(MV_TMZ_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--·Ç¿ªÕ½×´Ì¬ËÀµÄ
		return 0;
	end;	
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	local nDeathIndex = PlayerIndex;
	local nDeathName = GetName();
	local nDeathCamp = GetTask(TASKID_TMZ_PLAY_CAMP);
	local nKillerName = "";
	local nDeathKillNums = GetTask(TASKID_TMZ_KILL_NUMS);
	if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then
		PlayerIndex = nKillerIndex;
		nKillerName = GetName();
		local nSex = GetSex();
		local tSexName = {"Tha","Ng­êi ch¬i"};
		local nCamp = GetTask(TASKID_TMZ_PLAY_CAMP);
		SetTask(TASKID_TMZ_KILL_PLAYER,GetTask(TASKID_TMZ_KILL_PLAYER)+1);
		SetTask(TASKID_TMZ_KILL_NUMS,GetTask(TASKID_TMZ_KILL_NUMS)+1);
		Msg2Player(format("C¸c h¹ ®· tiªu diÖt %s, sè ng­êi hiÖn t¹i diÖt ®­îc: %d, sè ng­êi liªn tiÕp tiªu diÖt: %d",nDeathName,GetTask(TASKID_TMZ_KILL_PLAYER),GetTask(TASKID_TMZ_KILL_NUMS)));
		local nKillPlayers = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKillNums = GetTask(TASKID_TMZ_KILL_NUMS);
		
		_stat_when_kill_player()
		
		if nDeathKillNums >= 10 and nDeathKillNums <= 29 then
			Msg2MSAll(MISSION_ID,format("%s ®· ®¸nh b¹i %s! V« ®èi h¶? Hái qua ta ch­a!",nKillerName,nDeathName));
		elseif nDeathKillNums >= 30 then
			Msg2MSAll(MISSION_ID,format("%s ®· ®¸nh b¹i %s! §óng vËy, ta chİnh lµ mét vŞ anh hïng!",nKillerName,nDeathName));
		end		
		
		if nKillNums == 4 then
			Msg2MSAll(MISSION_ID,format("%s, %s ®· liªn tôc ®¸nh b¹i %d ng­êi, qu¶ thËt lµ mét cao thñ!",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums == 5 then
			Msg2MSAll(MISSION_ID,format("%s, %s vâ nghÖ cao c­êng, ®· liªn tôc ®¸nh b¹i %d ng­êi !",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 5 and nKillNums <= 7 then
			Msg2MSAll(MISSION_ID,format("%s, %s ®· liªn tôc ®¸nh b¹i %d ng­êi, qu¶ lµ vâ nghÖ siªu quÇn",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 7 and nKillNums <= 9 then
			Msg2MSAll(MISSION_ID,format("%s, %s liªn tôc ®¸nh b¹i %d ng­êi, søc m¹nh nh­ mét vŞ thÇn!",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 9 and nKillNums <= 29 then
			Msg2MSAll(MISSION_ID,format("%s, %s liªn tôc ®¸nh b¹i %d ng­êi, ch¼ng lÏ kh«ng ai cã thÓ ®¸nh b¹i d­îc %s sao?",tCampName[nCamp],nKillerName,nKillNums,tSexName[nSex]));
		elseif nKillNums >= 30 then
			Msg2MSAll(MISSION_ID,format("%s, %s ®· liªn tôc ®¸nh b¹i %d ng­êi, chØ cã mét vŞ thÇn thø 2 míi cã thÓ ®¸nh b¹i ®­îc %s!",tCampName[nCamp],nKillerName,nKillNums,tSexName[nSex]));
		end
		
		if nKillPlayers == 20 then
			Msg2MSAll(MISSION_ID,format("%s, %s ®· tiªu diÖt hÕt %d ng­êi!",tCampName[nCamp],nKillerName,nKillPlayers));
		elseif nKillPlayers == 30 then
			Msg2MSAll(MISSION_ID,format("%s, %s ®· tiªu diÖt tæng céng %d ng­êi, thÕ kh«ng thÓ ®ì!",tCampName[nCamp],nKillerName,nKillPlayers));
		elseif nKillPlayers == 40 then
			Msg2MSAll(MISSION_ID,format("%s, %s ®· tiªu diÖt tæng céng %d ng­êi, c¸i thÕ v« song!",tCampName[nCamp],nKillerName,nKillPlayers));
		end
		
		--Ğ´ÈëÏÔÊ¾Êı¾İ
		local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
		local nKillNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKillNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
		local nKillNum3 = GetTask(TASKID_TMZ_KILL_EYE);	
		TMZ_Write_TableData(nCurN,nCamp,nKillNum1,nKillNum2,nKillNum3);	
	end
	
	PlayerIndex = nDeathIndex;
	SetTaskTemp(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetTaskTemp(TASK_TEMP_DIE_TIME,GetTime());
	SetTask(TASKID_TMZ_PLAYER_KILLED,GetTask(TASKID_TMZ_PLAYER_KILLED)+1);
	SetTask(TASKID_TMZ_KILL_NUMS,0);	
	Msg2Player("B¹n bŞ "..nKillerName.."C«ng kİch träng th­¬ng");
	
	_stat_when_death()
	
	--Ğ´ÈëÏÔÊ¾Êı¾İ	
	local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	local nKilledNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
	local nKilledNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
	local nKilledNum3 = GetTask(TASKID_TMZ_KILL_EYE);	
	TMZ_Write_TableData(nCurN,nDeathCamp,nKilledNum1,nKilledNum2,nKilledNum3);	
	--============´¦ÀíÖØÉúµã==============================
	local nMapId = GetMissionV(MV_TMZ_MAP_ID);
	local nCampPlace = TMZ_GetCamp();
	SetTempRevPos(nMapId,tPositionCamp[nCampPlace][1][1]*32,tPositionCamp[nCampPlace][1][2]*32);	--ÉèÖÃÖØÉúµã	
	
	local oldPlayerIndex = PlayerIndex;
	if nKillerIndex > 0 and nKillerIndex ~= PlayerIndex then
		--×·»Ø´ó×ÖÌû
		PlayerIndex = nKillerIndex;
		dzt_tmz_kill_player();
		PlayerIndex = oldPlayerIndex;
	end
end