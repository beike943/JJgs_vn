--File name:ready_timer.lua
--Describe:±¨Ãû½×¶Î¼ÆÊ±Æ÷½Å±¾
--		¡¡ ±¨Ãû½ØÖ¹ºóÖ´ÐÐÕâ¸ö½Å±¾
--Create Date:2006-4-19
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	local timeleft = GetMissionV(MV_TIMELEFT);
	if timeleft == 0 then
		if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) < LEASTPLAYER then
			Msg2MSAll(MISSION_ID,"Do sè ng­êi tham gia d­íi"..LEASTPLAYER.." ng­êi, cuéc ®ua kh«ng thÓ tiÕn hµnh!");
			CloseMission(MISSION_ID);
			return 0;
		end;
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSTART);
		SetMissionV(MV_TIMELEFT,WAITSTART_TIMER_LOOP);	--³õÊ¼»¯±¨Ê±´ÎÊý
		Msg2MSAll(MISSION_ID,"Thêi gian b¸o danh ®· kÕt thóc, mêi c¸c tuyÓn thñ chuÈn bÞ lªn thuyÒn, sau 30 gi©y cuéc ®ua sÏ chÝnh thøc b¾t ®Çu.");
	else
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,READY_TIMER_ID,READY_TIME);
		SetMissionV(MV_TIMELEFT,timeleft-1);
		timeleft = timeleft*READY_TIME/18;
		Msg2MSAll(MISSION_ID,"TrËn ®Êu sÏ sau"..timeleft.." gi©y kÕt thóc b¸o danh");		
	end;
end;