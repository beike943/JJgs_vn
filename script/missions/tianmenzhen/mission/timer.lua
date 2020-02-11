Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

function OnTimer()
	SetMissionV(MV_TMZ_GAME_LOOP,GetGameLoop());
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_PEACE then
		Process_Peace_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Peace_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);
	if nLoop == 0 then
		if nPlayerOne < PLAYER_NEED_NUM or nPlayerTwo < PLAYER_NEED_NUM then
			GLB_TMZ_NoOpen();
			_stat_on_misson_none_start()
		end 
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,3) == 0 then --15Ãë²¥·ÅÒ»´Î
			Msg2MSAll(MISSION_ID,"TiÕn ®é thêi gian: ["..(PEACE_TIMER_LOOP-nLoop+1)..":"..(PEACE_TIMER_LOOP+1).."]");
			Msg2MSAll(MISSION_ID,"Tû lÖ sè ng­êi 2 phe:"..CampOne_Name.."["..nPlayerOne.."]:["..nPlayerTwo.."]"..CameTwo_Name..". Khi c¶ 2 phe ®Òu ®¹t "..PLAYER_NEED_NUM.."Ng­êi, chiÕn tr­êng Thiªn M«n TrËn sÏ b¾t ®Çu");
		end
		if nPlayerOne >= PLAYER_NEED_NUM and nPlayerTwo >= PLAYER_NEED_NUM then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIME);
			SetMissionV(MV_TIMER_LOOP,READY_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_READY);
			Msg2MSAll(MISSION_ID,"ChiÕn tr­êng Thiªn M«n TrËn sÏ b¾t ®Çu sau 1 phót, c¸c anh hïng h·y chuÈn bÞ.");
		end
	end
end

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	if nLoop == 0 then
		--ÅÐ¶ÏÏÂÈËÊý
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		_stat_on_misson_start(MISSION_ID)
		WriteLog("[chiÕn tr­êng Thiªn M«n TrËn b¾t ®Çu]: thêi gian lµ"..GetMissionV(MV_TMZ_LOG_TIME).."Thiªn M«n TrËn ®· b¾t ®Çu, sè ng­êi tham gia lµ: ["..nPlayerOne.."]:["..nPlayerTwo.."], tæng sè ng­êi lµ: "..(nPlayerOne+nPlayerTwo));
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,6) == 0 then	--30Ãë²¥·ÅÒ»´Î
			Msg2MSAll(MISSION_ID," cßn "..Get_Time_String(READY_TIME/18*nLoop)..", chiÕn tr­êng Thiªn M«n TrËn chÝnh thøc b¾t ®Çu, sè ng­êi tham gia hiÖn lµ:"..CampOne_Name.."["..nPlayerOne.."]:["..nPlayerTwo.."]"..CameTwo_Name);
		end
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	local nEyeOne = GetMissionV(MV_TMZ_CAMPONE_EYE);
	local nEyeTwo = GetMissionV(MV_TMZ_CAMPTWO_EYE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TMZ_WINNER_CAMP,ALL_ID);
		Msg2MSAll(MISSION_ID,format("%s vµ %s ®¹i chiÕn 40 phót bÊt ph©n th¾ng b¹i.",CampOne_Name,CameTwo_Name));
		TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
		
		_stat_on_misson_end(MISSION_ID, 0)
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		--Ã¿¹ý15Ãë¾Í¼ì²éË«·½µÄÕóÑÛ
		SetMissionV(MV_TMZ_CAMPONE_POINT,GetMissionV(MV_TMZ_CAMPONE_POINT)+nEyeOne*5);
		SetMissionV(MV_TMZ_CAMPTWO_POINT,GetMissionV(MV_TMZ_CAMPTWO_POINT)+nEyeTwo*5);
		local nPointOne = GetMissionV(MV_TMZ_CAMPONE_POINT);
		local nPointTwo = GetMissionV(MV_TMZ_CAMPTWO_POINT);				
		TMZ_Set_ShowData_Msg();	
		--¼ì²é±È·Ö
		if nPointOne >= OVER_GAME_POINT and nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,ALL_ID);
			Msg2MSAll(MISSION_ID,format("%s vµ %s ®iÓm sè 2 bªn chiÕm trËn ®¹t ®Õn %d, trËn chiÕn bÊt ph©n th¾ng b¹i.",CampOne_Name,CameTwo_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			
			_stat_on_misson_end(MISSION_ID, 0)
			return 0;								
		end		
		if nPointOne >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,CampOne_ID);
			Msg2MSAll(MISSION_ID,format("Phe %s chiÕm trËn ®¹t tû sè %d, ®· giµnh chiÕn th¾ng.",CampOne_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			_stat_on_misson_end(MISSION_ID, 1)
			return 0;			
		end
		if nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,CampTwo_ID);
			Msg2MSAll(MISSION_ID,format("Phe %s chiÕm trËn ®¹t tû sè %d, ®· giµnh chiÕn th¾ng.",CameTwo_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			_stat_on_misson_end(MISSION_ID, 2)		
			return 0;
		end		
		if (nPointOne >= APPEAR_FLAG_POINT or nPointTwo >= APPEAR_FLAG_POINT) and GetMissionV(MV_TMZ_APPEAR_FLAG) == 0 then
			SetMissionV(MV_TMZ_APPEAR_FLAG,1);
			--´´½¨Õ½Æì
			local nMapId = gf_GetCurMapID();
			local nNpcIdx = CreateNpc(tPositionNpcFlag[1][1][1],tPositionNpcFlag[1][1][2],nMapId,tPositionNpcFlag[1][1][3],tPositionNpcFlag[1][1][4]);
			SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
			SetCampToNpc(nNpcIdx,CampOne_Type);
			nNpcIdx = CreateNpc(tPositionNpcFlag[2][1][1],tPositionNpcFlag[2][1][2],nMapId,tPositionNpcFlag[2][1][3],tPositionNpcFlag[2][1][4]);
			SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
			SetCampToNpc(nNpcIdx,CampTwo_Type);
			Msg2MSAll(MISSION_ID,"C¸c vÞ anh hïng chó ý, ChiÕn Kú ®· xuÊt hiÖn t¹i hËu ph­¬ng trËn doanh cña ®ich, chØ cÇn nhæ ®­îc ChiÕn Kú cña phe ®èi ®Þch lµ cã thÓ ®Èy nhanh tiÕn tr×nh ph¸ trËn."); 
		end
		if mod(nLoop,4) == 0 then
			Msg2MSAll(MISSION_ID,"TiÕn ®é thêi gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
			Msg2MSAll(MISSION_ID,"§iÓm sè 2 bªn hiÖn t¹i lµ:"..CampOne_Name.."["..nPointOne.."]:["..nPointTwo.."]"..CameTwo_Name)
			TMZ_OperateAllPlayer(TMZ_KickSleep,{},ALL_ID); --Ë¯ÃßµÄÇ¿ÐÐÌß³öÕ½³¡
		end		
		if mod(nLoop,10) == 0 then
			Msg2MSAll(MISSION_ID,format("Sè ng­êi 2 bªn hiÖn t¹i lµ: %s[%d]: [%d]%s",CampOne_Name,nPlayerOne,nPlayerTwo,CameTwo_Name));
		end;
		TMZ_OperateAllPlayer(TMZ_KickDeather,{},ALL_ID); --ËÀÍöµÄÇ¿ÐÐÌß³öÕ½³¡
		TMZ_DrivePlayerOutOfShelter();	--ºóÓªµÄÇ¿ÐÐ´«µ½Ç°Óª
		TMZ_CureAllPlayer();						--ÖÎÁÆËùÓÐºÍÆ½×´Ì¬µÄÍæ¼Ò
	end;
end;

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)		
		if GLB_TMZ_RealmCheck() == 1 then --¿ç·þ°ï»áÌìÃÅÕó´¦Àí
			GLB_TMZ_BattleOver();
		end 	
--		Msg2MSAll(MISSION_ID,"»¹ÓÐ"..(COMPLETE_TIME/18*nLoop).."ÃëÍË³ö±¾´ÎÌìÃÅÕóÕ½³¡");
	end;
end;
