Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i,0);
	end;
	
	for i = 1, 100 do 
		SetMissionS(i, "")
	end;
	
	SetMissionV(TEAM_GAME_STATE,1);
	
	--nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	--SetMissionV(START_TIME,nTime)
	--WriteLog("[¶àÈËÀŞÌ¨] ³õÊ¼»¯³É¹¦!Ê±¼äÎª"..nTime);

end;

function RunMission()

local i=0;
local j=0;

	--WriteLog("[¶àÈËÀŞÌ¨] ±ÈÈü¿ªÊ¼£¬²ÎÈüÈËÊıÎª:"..nTotalFigtherNum.."ÈË£¬Èë³¡·Ñ×ÜÊıÎª£º"..GetMissionV(MULTIMAP_BONUS))

	OldPlayer = PlayerIndex;
	
	for i=1,10 do	
		if GetMissionV(CAPTAIN_ID+i-1) > 0 then
			PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
			for j=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(j);
				if PlayerIndex > 0 then
	  			SetPlayerState(2,1);--ÉèÖÃ¿ªÕ½Ê±Ñ¡ÊÖ×´Ì¬
	  		--else
	  		--WriteLog("[¶àÈËÀŞÌ¨] RunMissionÊ±×ª»»½ÇÉ«×´Ì¬Ë÷Òı³ö´í£¬³ö´íË÷ÒıÎª"..PlayerIndex);
	  		end
	  	end
	  end
	end

	PlayerIndex = OldPlayer;
	--É¾È¥ÍË³öNpc
	SetNpcLifeTime(GetMissionV(NPC_INDEX),0)
 	SetMissionV(TEAM_GAME_STATE,2);
end;

function EndMission()

local i = 0;
local nPlayerIndex = 0;
local nPlayerMSIndex = 0;
local PlayerIdxTab = {};
local nTotalNum = GetMSPlayerCount(TEAM_MISSION_ID,0)

	OldPlayer = PlayerIndex
	
	for i=1,nTotalNum do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerIdxTab,nPlayerIndex);
		end
	end
	
	--if nTotalNum ~= getn(PlayerIdxTab) then
		--WriteLog("[¶àÈËÀŞÌ¨] ±ÈÈü¿ªÊ¼Ê±»ñÈ¡PlayerIndexÊ±ÓëÕóĞÍÊıÁ¿²»·û£¡");
	--end
	
	for i=1,getn(PlayerIdxTab) do
		PlayerIndex = PlayerIdxTab[i];
		SetTaskTemp(PLAYER_CAMP,0);
		SetTaskTemp(TOTAL_KILL_NUM,0);
		DelMSPlayer(TEAM_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer;
	
	--nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	--SetMissionV(OVER_TIME,nTime);
	--WriteLog("[¶àÈËÀŞÌ¨] ½áÊø!!!³¡µØ¿ª·ÅÊ±¼äÎª:"..GetMissionV(START_TIME).."½áÊøÊ±¼äÎª:"..nTime);

	SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--É¾È¥ÍË³öNpc

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i,"");
	end

	StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID1);
	StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2);
	
end

function OnLeave(RoleIndex)

local i = 0;
local j = 0;
local nOldPlayer = 0;
local nDeaNum = 0;
local nCamptainState = 0;
local TeamMemberTab = {};

	PlayerIndex = RoleIndex
	
	if GetMissionV(TEAM_GAME_STATE) < 3 then	
		for i=1,10 do
			nDeaNum = 0;
			nCamptainState = 0;
			if PlayerIndex == GetMissionV(CAPTAIN_ID+i-1) then
				nOldPlayer = PlayerIndex;
				SetMissionS(i,"");
				SetMissionV(CAPTAIN_ID+i-1,0);
				for j=1,gf_GetTeamSize() do
					PlayerIndex = gf_GetTeamMember(j)
					if PlayerIndex > 0 then
						if IsPlayerDeath() ~= 0 then
							nDeaNum = nDeaNum + 1;
						end
						tinsert(TeamMemberTab,gf_GetTeamMember(j))
					end
				end
				
				if nDeaNum == gf_GetTeamSize() then
					nCamptainState = 1;
				end
				
				for j=1,getn(TeamMemberTab) do
					OldPlayer = PlayerIndex;
					PlayerIndex = TeamMemberTab[j];
					if PlayerIndex > 0 then
						if GetMissionV(GAME_TYPE) == 3 and GetMissionV(TEAM_GAME_STATE) >= 2 then
							PayAward(3);
						end
						if PlayerIndex ~= nOldPlayer then						
							if nCamptainState ~= 1 then
								Msg2Player("Do ®éi tr­ëng rêi khái trËn ®Şa, tÊt c¶ ®éi viªn sÏ bŞ chuyÓn ra khái ®Êu tr­êng!");
							else
								Msg2Player("§éi cña b¹n bŞ tiªu diÖt s¹ch, hiÖn chuyÓn ®éi ngò cña b¹n ra khái trËn ®Şa!");
							end
							DelMSPlayer(TEAM_MISSION_ID,0);
						end
					end
					PlayerIndex = OldPlayer;
				end
				PlayerIndex = nOldPlayer;
				if nCamptainState ~= 1 then
					Msg2Player("Do ®éi tr­ëng rêi khái trËn ®Şa, tÊt c¶ ®éi viªn sÏ bŞ chuyÓn ra khái ®Êu tr­êng!");
				else
					Msg2Player("§éi cña b¹n bŞ tiªu diÖt s¹ch, hiÖn chuyÓn ®éi ngò cña b¹n ra khái trËn ®Şa!");
				end
			end
		end	
	end
	
	SetTaskTemp(PLAYER_CAMP,0);
	SetTaskTemp(TOTAL_KILL_NUM,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--±êÖ¾½ÇÉ«Àë¿ª¶àÈËÀŞÌ¨
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end
	
	SetPlayerState(3,1,1);
	
  NewWorld(GetLeavePos());
  
  --µ±½ÇÉ«Îª×îºóÀë¿ªmissionµÄ½ÇÉ«Ê±¹Ø±Õmission
	if GetMSPlayerCount(TEAM_MISSION_ID,0) <= 0 and GetMissionV(GAME_TYPE) == 0 then
		--SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
	end

end