Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()

    State = GetMissionV(MS_STATE) ;
    if (State == 0) then
	    return
    end;

    Msg2MSAll(MISSIONID, "Th阨 gian n u l玦 i  n,"..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).." hai phe u h遖!");
    str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3].."Th阨 gian n u l玦 i  n,"..GetMissionS(1).." c飊g v韎  "..GetMissionS(2).." hai phe u h遖!";
    --51活动发奖
		if Is51PartyTime() == 1 and Is2PlayerLevelOK() == 1 then
			Award2Player();
		end
    --师徒任务
    process_master_task()
	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
	    AddGlobalNews(str);
	end;
    --WinBonus(3);
    SetMissionV(MS_STATE,3);
    CloseMission(MISSIONID);
end;
