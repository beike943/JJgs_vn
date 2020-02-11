Include("\\script\\missions\\bw\\bwhead.lua");
--Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
function OnDeath(Launcher)
	--curcamp = GetCurCamp();
	curcamp = 0;
	if (GetName() == GetMissionS(1)) then
	    curcamp = 1;
	elseif (GetName() == GetMissionS(2)) then
	    curcamp = 2;
	end;
	--发放51奖励
	if Is51PartyTime() == 1 and Is2PlayerLevelOK() == 1 then
		Award2Player();
	end
	--师徒任务
	process_master_task()
	
	DelMSPlayer(MISSIONID,	curcamp);
	--SetLogoutRV(1);

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder凶手
	OrgPlayer  = PlayerIndex; --死者
	DeathName = GetName();

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).."Chi課 u n u l玦 i k誸 th骳, "..LaunName.." Trong thi u  nh b筰 "..DeathName..", gi祅h th緉g l頸 chung cu閏!"
		Msg2MSAll(MISSIONID, str);
    	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
    	    AddGlobalNews(str);
    	end;
		Talk2Fighters(str)

		if GetMissionS(1) == LaunName then
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    if (index1 > 0 and index2 > 0) then
			    RecordBWCount_Win(index1, index2)
		    end
--			WinBonus(1) --该函数由外部填加，用于奖励玩家
		else
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    if (index1 > 0 and index2 > 0) then
			    RecordBWCount_Win(index2, index1)
		    end
--			WinBonus(2)
		end;
		--branchTask_GainBW1()
		PlayerIndex = OrgPlayer;
	end;
	
	RestorePKCamp();
	
	--NewWorld(GetLeavePos());

	--CloseMission(MISSIONID);
	
	if (GetName() == GetMissionS(1)) then
		SetMissionV(MS_PLAYER1ID, 0);
	end;
	if (GetName() == GetMissionS(2)) then
		SetMissionV(MS_PLAYER2ID, 0);
	end;
	
	return 1
	
end;

