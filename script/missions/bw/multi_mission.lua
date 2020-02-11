Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i,0);
	end;
	
	for i = 1, 100 do 
		SetMissionS(i, "")
	end;
	
	SetMissionV(MULTIMAP_STATE, 1);
	
	nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	SetMissionV(START_TIME,nTime)
	WriteLog("[QuÇn hïng chiÕn]Thµnh c«ng ban ®Çu! Thêi gian lµ"..nTime);

end;

function RunMission()

local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local i = 0;
local PlayerMSIndex = 0;

	WriteLog("[QuÇn hïng chiÕn]Thi ®Êu b¾t ®Çu, sè ng­êi tham chiÕn lµ:"..nTotalFigtherNum.." ng­êi, tæng phÝ vµo trËn lµ:"..GetMissionV(MULTIMAP_BONUS))

	OldPlayer = PlayerIndex;
	
	for i=1,nTotalFigtherNum do	
		PlayerMSIndex,PlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,1);
		if PlayerIndex > 0 then
	  	SetPlayerState(2,1);--ÉèÖÃ¿ªÕ½Ê±Ñ¡ÊÖ×´Ì¬
	  else
	  	WriteLog("[QuÇn hïng chiÕn]Khi RunMission, h­íng dÉn tr¹ng th¸i chuyÓn ®æi nh©n vËt b¸o lçi lµ"..PlayerIndex);
	  end
	end

	PlayerIndex = OldPlayer;
	--É¾È¥ÍË³öNpc
	SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)
 	SetMissionV(MULTIMAP_STATE, 2);
end;

function EndMission()

local i = 0;
local nPlayerIndex = 0;
local nPlayerMSIndex = 0;
local PlayerIdxTab = {};
local nTotalNum = GetMSPlayerCount(MULIT_MISSION_ID,0)

	OldPlayer = PlayerIndex
	
	for i=1, nTotalNum do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerIdxTab,nPlayerIndex);
		end
	end
	
	if nTotalNum ~= getn(PlayerIdxTab) then
		WriteLog("[QuÇn hïng chiÕn]Khi thi ®Êu b¾t ®Çu, nhËn PlayerIndex kh«ng phï hîp víi sè l­îng trËn h×nh!");
	end
	
	for i=1,getn(PlayerIdxTab) do
		PlayerIndex = PlayerIdxTab[i];
		SetTaskTemp(PLAYER_CAMP,0);
		SetTaskTemp(TOTAL_KILL_NUM,0);
		DelMSPlayer(MULIT_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer
	
	nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	SetMissionV(OVER_TIME,nTime);
	WriteLog("[QuÇn hïng chiÕn]KÕt thóc!!! Thêi gian më trËn ®Þa lµ:"..GetMissionV(START_TIME).."Thêi gian kÕt thóc lµ :"..nTime);

	SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--É¾È¥ÍË³öNpc

	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;

	StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1);
	StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2);
	
end;

function OnLeave(RoleIndex)

	PlayerIndex = RoleIndex
	
	SetTaskTemp(PLAYER_CAMP,0);
	SetTaskTemp(TOTAL_KILL_NUM,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--±êÖ¾½ÇÉ«Àë¿ª¶àÈËÀÞÌ¨
	
	SetPlayerState(3);
	
  NewWorld(GetLeavePos());
  
  --µ±½ÇÉ«Îª×îºóÀë¿ªmissionµÄ½ÇÉ«Ê±¹Ø±Õmission
	if GetMSPlayerCount(MULIT_MISSION_ID,0) <= 0 and GetMissionV(GAME_TYPE) == 0 then
		SetMissionV(MULTIMAP_STATE, 3);
		CloseMission(MULIT_MISSION_ID);
	end

end;