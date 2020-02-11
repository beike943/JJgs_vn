--File name:match_timer.lua
--Describe:±ÈÈü¹ý³Ì¼ÆÊ±Æ÷½Å±¾
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		local RankTab = {};
		if timeleft == 0 then
			StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
			Msg2MSAll(MISSION_ID,"Do trong thêi gian quy ®Þnh kh«ng cã ng­êi ch¬i nµo vÒ ®Õn ®Ých, v× thÕ trËn ®Êu kÕt thóc.");
			StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--µÈ´ý´«ËÍÍæ¼ÒÀë³¡
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
		else
			StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
			StartMissionTimer(MISSION_ID,MATCH_TIMER_ID,MATCH_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			if mod(timeleft,2) == 0 then
				Msg2MSAll(MISSION_ID,"Thêi gian thi ®Êu cßn"..(timeleft/2).." phót ");
			else
				Msg2MSAll(MISSION_ID,"Thêi gian thi ®Êu cßn"..floor(timeleft/2).." phót 30 gi©y.");
			end;
		end;
		RankTab = Get_Rank();
		if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) ~= getn(RankTab) then
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","do khi th«ng b¸o thø h¹ng, sè l­îng tuyÓn thñ thi ®Êu trong mission kh«ng gièng víi sè l­îng mµ RankTab nhËn ®­îc.");
		end;
		Msg2MSAll(MISSION_ID,"HiÖn t¹i xÕp h¹ng:");
		for i=1,getn(RankTab) do
			PlayerIndex = RankTab[i];
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,"thø"..NumTab[i]..":"..GetName());
			end;
		end;
	else
		Msg2MSAll(MISSION_ID,"Do sè ng­êi tham gia Ýt h¬n 2, v× thÕ trËn ®Êu kh«ng thÓ tiÕn hµnh. Sau 30 gi©y sÏ ®­a b¹n ra khái b¶n ®å thi ®Êu.");
		StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
		StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--µÈ´ý´«ËÍÍæ¼ÒÀë³¡
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);	
	end;
end;
