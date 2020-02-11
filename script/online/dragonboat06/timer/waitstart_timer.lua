--File name:waitstart_timer.lua
--Describe:±¨Ãû½áÊøºóµ¹¼ÆÊ±½Å±¾
--Create Date:2006-4-19
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		if timeleft == 0 then
			RunMission(MISSION_ID);
		else
			StopMissionTimer(MISSION_ID,WAITSTART_TIMER_ID);
			StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			timeleft = timeleft*WAITSTART_TIME/18;
			Msg2MSAll(MISSION_ID,"TrËn ®Êu cßn"..timeleft.." Gi©y ");
		end;
	else
		Msg2MSAll(MISSION_ID,"Do sè ng­êi tham gia d­íi"..LEASTPLAYER.." ng­êi, cuéc ®ua kh«ng thÓ tiÕn hµnh!");
		CloseMission(MISSION_ID);
	end;
end;