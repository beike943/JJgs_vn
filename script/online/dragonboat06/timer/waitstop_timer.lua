--File name:waitstop_timer.lua
--Describe:¾ö³öµÚÒ»Ãûºóµ¹¼ÆÊ±½Å±¾£¬ÔÚ¾ö³öµÚÒ»ÃûµÄÍ¬Ê±Æô¶¯Õâ¸ö¼ÆÊ±Æ÷
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		if timeleft == 0 then
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			Msg2MSAll(MISSION_ID,"Thi ®Êu kÕt thóc, cßn vµi ng­êi ch¬i vÉn ch­a vÒ ®Ých. C«ng bè thø h¹ng hiÖn t¹i, sau 30 gi©y sÏ tù ®éng tho¸t ra khái b¶n ®å.");
			StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
			Report_Result(Get_Rank());
			Give_Award();
		else
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			StartMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID,WAITSTOP_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			timeleft = timeleft*WAITSTOP_TIME/18;
			Msg2MSAll(MISSION_ID," cßn "..timeleft.." gi©y trËn ®Êu kÕt thóc.");		
		end;
	else
		StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
		Msg2MSAll(MISSION_ID,"Do sè ng­êi tham gia d­íi"..LEASTPLAYER.." ng­êi, cuéc ®ua kh«ng thÓ tiÕn hµnh! Sau 30 gi©y sÏ tù ®éng tho¸t ra khái b¶n ®å.");
		StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--µÈ´ý´«ËÍÍæ¼ÒÀë³¡
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
		Report_Result(Get_Rank());
		Give_Award();
	end;
end;
