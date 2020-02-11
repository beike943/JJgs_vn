Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i, "");
	end
	
	SetMissionV(TEAM_GAME_STATE,1);
	StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);
	
end

function RunMission()

local i = 0;
local nPlayerMSIndex = 0;

	OldPlayer = PlayerIndex;

	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
		if PlayerIndex > 0 then
		  SetFightState(1);
		end
	end

	nPlayerMSIndex = 0;
	
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
		if PlayerIndex > 0 then
		  SetFightState(1);
		end
	end

	PlayerIndex = OldPlayer;
	
 	--É¾È¥ÍË³öNpc
	SetNpcLifeTime(GetMissionV(NPC_INDEX),0);
 	SetMissionV(TEAM_GAME_STATE,2);
 	
end

function EndMission()

local i = 0;
local nPlayerIndex = 0;
local nPlayerMSIndex = 0;
local PlayerTab = {}; 

	OldPlayer = PlayerIndex;
	
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerTab,nPlayerIndex);
		end
	end
	
	for i=1,getn(PlayerTab) do
		PlayerIndex = PlayerTab[i];
		
		--ÍË³ömissionµÄÊ±ºò´¦ÀíÑº½ð½±Àø·µ»¹
		if GetMissionV(MS_YAJING_NUM) > 0 and PlayerIndex == gf_GetTeamMember(0) then
			local pWin = GetMissionV(MS_WIN_CAMP);
			local pCamp = GetTaskTemp(PLAYER_CAMP);
			if pCamp == 1 or pCamp == 2 then
				--Èç¹ûÊÇÊ¤ÀûÕß
				if pWin == pCamp then
					yajin_leitai_pay(GetMissionV(MS_YAJING_NUM) * 2);
					Talk(1,"",format("<color=green>Chñ l«i ®µi<color>: chóc mõng b¹n ®· giµnh chiÕn th¾ng, ®o¹t ®­îc vµng ®Æt c­îc <color=green>%d*2<color> vµng.", GetMissionV(MS_YAJING_NUM)));
					gf_Msg2Team(format("Chñ l«i ®µi chóc mõng b¹n ®· giµnh chiÕn th¾ng, %s nhËn ®­îc vµng c­îc %d*2 vµng", GetName(), GetMissionV(MS_YAJING_NUM)), 1);
				end
				--Èç¹ûÊÇÆ½ÊÖ
				if pWin == 0 then
					yajin_leitai_pay(GetMissionV(MS_YAJING_NUM));
					if GetMissionV(READY_STATE) == 1 or GetMissionV(CAPTAIN_STATE) == 1 then
						Talk(1,"",format("<color=green>Chñ l«i ®µi<color>: trËn ®Êu kÕt thóc bÊt th­êng, tr¶ l¹i vµng c­îc l«i ®µi<color=green>%d<color> vµng.",GetMissionV(MS_YAJING_NUM)));
					else
						Talk(1,"",format("<color=green>Chñ l«i ®µi<color>: trËn ®Êu 2 bªn hßa nhau, tr¶ l¹i vµng c­îc l«i ®µi <color=green>%d<color> vµng.",GetMissionV(MS_YAJING_NUM)));
					end
				end
			end
		end
		
		SetTaskTemp(PLAYER_CAMP,0);
		DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer;

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i,"");
	end
	
	--SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--É¾È¥ÍË³öNpc
	StopMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID);

end

function OnLeave(RoleIndex)

	local i=0;
	local j=0;
	local nPlayerMSIndex = 0;
	local nPlayerIndex = 0;
	local nDeaNum = 0;
	local nOldPlayer = 0;
	local CaptainIdTab = {};
	local TeamMemberTab = {};
	local str_news = "";

	PlayerIndex = RoleIndex;

	if PlayerIndex == gf_GetTeamMember(0) then
		if PlayerIndex == GetMissionV(CAPTAIN_ID) and GetMissionV(TEAM_GAME_STATE) == 1 then
			SetMissionV(CAPTAIN_STATE,1);
			Msg2MSAll(SINGLE_TEAM_MISSION_ID,"Do ®éi ®¨ng ký thi ®Êu rêi khái trËn ®Þa nªn thi ®Êu bÞ hñy bá! Xin ®îi gi©y l¸t! §Êu sÜ sÏ ®­îc chuyÓn ra!")
		end
		nOldPlayer = PlayerIndex;

		if IsPlayerDeath() ~= 0 then
			nDeaNum = 1;
		end
		for i=1,gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 and PlayerIndex ~= gf_GetTeamMember(0) then
				if IsPlayerDeath() ~= 0 then
					nDeaNum = nDeaNum + 1;
				end
				tinsert(TeamMemberTab,PlayerIndex);
			end
		end
		
		if nDeaNum == gf_GetTeamSize() then
			str_news = "Do ®éi ngò hiÖn t¹i bÞ ®èi ph­¬ng diÖt s¹ch, thi ®Êu thÊt b¹i, lËp tøc chuyÓn ra khái ®Êu tr­êng!";
		elseif GetMissionV(TEAM_GAME_STATE) == 3 then
			str_news = "";
		else
			str_news = "Do ®éi tr­ëng rêi khái trËn ®Þa, tÊt c¶ ®éi viªn sÏ bÞ chuyÓn ra khái ®Êu tr­êng!";
		end
		
		PlayerIndex = nOldPlayer;
		Msg2Player(str_news);
		nOldPlayer = PlayerIndex;
		
		for i=1,getn(TeamMemberTab) do
			PlayerIndex = TeamMemberTab[i];
			if PlayerIndex > 0 then
				Msg2Player(str_news);
				DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
			end
		end
		PlayerIndex = nOldPlayer;
	end

	str_news = GetName().."Rêi trËn ®Þa.";
	Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
	
	SetTaskTemp(PLAYER_CAMP,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--±êÖ¾½ÇÉ«Àë¿ª¶àÈËÀÞÌ¨
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end
	
	SetPlayerState(3,1,1);
	
	--ÇåÁãÁÙÊ±ÈÎÎñ±äÁ¿
	SetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI, 0);
	
	SetCreateTeam(0); --´ò¿ª×é¶Ó¹¦ÄÜ
	
  NewWorld(GetLeavePos());
  
  --µ±½ÇÉ«Îª×îºóÀë¿ªmissionµÄ½ÇÉ«Ê±¹Ø±Õmission
	if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) <= 0 then
		CloseMission(SINGLE_TEAM_MISSION_ID);
	end
    
end