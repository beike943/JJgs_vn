Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(TEAM_GAME_STATE);
	nTimeState = GetMissionV(TEAM_NEWS_STATE) + 1;
	SetMissionV(TEAM_NEWS_STATE,nTimeState);

	--×¼±¸½×¶Î
	if nMapState == 1 then
		ReportReadyState(nTimeState);
	--±ÈÈüÖÐ
	elseif nMapState >= 2 then 
		ReportBattleState(nTimeState);
	--±ÈÈü½áÊø
	--elseif nMapState == 3 then 
		--Msg2MSAll(SINGLE_TEAM_MISSION_ID,"±ÈÈü½áÊø!");
		--StopMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID);
	end
end

--×¼±¸½×¶ÎÐÅÏ¢´¦Àí
function ReportReadyState(nTimeState)

local i = 0;
local j = 0;
local nMin = 0; 
local nSec = 0;
local nPlayerMSIndex = 0;
local news_str = "";

	if GetMissionV(READY_STATE) == 1 or GetMissionV(CAPTAIN_STATE) == 1 then
		--SetMissionV(READY_STATE,0);
		--SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--É¾È¥ÍË³öNpc
		CloseMission(SINGLE_TEAM_MISSION_ID);
		return
	end

	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	--×¼±¸Ê±¼äµ½´ï3·ÖÖÓÒÔºóÅÐ¶Ï³¡ÄÚµ±Ç°Çé¿ö
	if nTimeState >= TEAM_READY_TIME then  
		--±ÈÈü¿ªÊ¼Ê±±ÈÈü¶ÓÎéÊýÉÙµÈÓÚ1¶Ó
		if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) <= 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) <= 0 then				
			if GetMissionV(READY_STATE) == 0 then
				OldPlayer = PlayerIndex;
				if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) <= 0 then
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
				else
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
				end
				
				if PlayerIndex > 0 then
					for i=1,gf_GetTeamSize() do
						PlayerIndex = gf_GetTeamMember(i);
						if PlayerIndex > 0 then
							Talk(1,"","Do sè ®éi trong L«i ®µi Ýt h¬n <color=yellow>2 ®éi<color>, thi ®Êu bÞ hñy bá. Xin ®îi gi©y l¸t! §Êu sÜ sÏ ®­îc chuyÓn ra!");
						end
					end
				end
				PlayerIndex = OldPlayer;
				
				news_str = "Do sè ®éi trong trËn ®Þa kh«ng ®ñ, thi ®Êu bÞ hñy bá!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
				--SetMissionV(TEAM_GAME_STATE,3);
				SetMissionV(READY_STATE,1);
				return
			end
		end

		news_str = "Thi ®Êu chÝnh thøc b¾t ®Çu!";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);             
		RunMission(SINGLE_TEAM_MISSION_ID);
		return
		
	end
	
	--±ÈÈüÉÐÎ´¿ªÊ¼Ç°µÄÐÅÏ¢´¦Àí
	
	nMin = floor((TEAM_READY_TIME - nTimeState) / 3);
	nSec = mod((TEAM_READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:"..nMin.." phót.";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
	elseif nMin == 0 then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:" ..nSec.. " gi©y.";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
	end
	
end


--¿ªÕ½½×¶ÎÕ½¿ö±¨¸æ
function ReportBattleState(nTimeState)

local i=0;
local j=0;
local nMin = 0; 
local nSec = 0;
local nPlayerMSIndex = 0;
local news_str = "";
local TeamMemberTab = {};

	--ÑÓÊ±ÍË³ö
	if GetMissionV(DELAY_STATE) == 1 then
		SetMissionV(DELAY_STATE,0);
		CloseMission(SINGLE_TEAM_MISSION_ID);
		return
	end

	--Á½Ö§¶ÓÎé¶¼¹ÒÁË
	if GetTeamState(1) == 0 and GetTeamState(2) == 0 then
		if GetMissionV(DELAY_STATE) == 0 then
			OldPlayer = PlayerIndex;
			for i=1,2 do
				nPlayerMSIndex = 0;
				for j=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,i) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,i);
					if PlayerIndex > 0 then
						tinsert(TeamMemberTab,PlayerIndex);
					end
				end
				for j=1,getn(TeamMemberTab) do
					PlayerIndex = TeamMemberTab[j];
					Talk(1,"","Thi ®Êu kÕt thóc, hai bªn hßa nhau!");
					DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
				end
			end
			PlayerIndex = OldPlayer;
			news_str = "Thi ®Êu kÕt thóc, hai bªn hßa nhau! Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
			Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			SetMissionV(TEAM_GAME_STATE,3);			
			SetMissionV(DELAY_STATE,1);
			return
		end
	end
	
	--µ±Ç°³¡µØÖ»Ê£ÏÂÒ»¸ö¶ÓÎé
	if GetTeamState(1) == 0 or GetTeamState(2) == 0 then
		if GetMissionV(DELAY_STATE) == 0 then
			OldPlayer = PlayerIndex;			
			if GetTeamState(1) == 0 then
--				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
					if PlayerIndex > 0 then
						PlayerIndex = gf_GetTeamMember(0);
						if PlayerIndex > 0 then
--						tinsert(TeamMemberTab,PlayerIndex);
--					end
--				end
--				for i=1,getn(TeamMemberTab) do
--					PlayerIndex = TeamMemberTab[i];
							DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
						end
					end
				nPlayerMSIndex = 0;
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
					if PlayerIndex > 0 then
						Talk(1,"","Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do <color=yellow>"..gf_GetCaptainName().."<color> dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!");
					end
				end
				SetMissionV(MS_WIN_CAMP,2);
				news_str = "Thi ®Êu kÕt thóc, ng­êi chiÕn th¾ng thuéc ®éi ngò "..gf_GetCaptainName().." dÉn d¾t!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			else
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
					if PlayerIndex > 0 then
						--tinsert(TeamMemberTab,PlayerIndex);
						PlayerIndex = gf_GetTeamMember(0);
						if PlayerIndex > 0 then
							DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
						end
					end
				end
--				for i=1,getn(TeamMemberTab) do
--					PlayerIndex = TeamMemberTab[i];
--					DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
--				end
				nPlayerMSIndex = 0;
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
					if PlayerIndex > 0 then
						Talk(1,"","Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do <color=yellow>"..gf_GetCaptainName().."<color> dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!");
					end
				end
				SetMissionV(MS_WIN_CAMP,1);
				news_str = "Thi ®Êu kÕt thóc, ng­êi chiÕn th¾ng thuéc ®éi ngò "..gf_GetCaptainName().." dÉn d¾t!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			end		
			PlayerIndex = OldPlayer;
			SetMissionV(TEAM_GAME_STATE,3);
			SetMissionV(DELAY_STATE,1);
			return
		end
	end
	
	--Õ½¶·½áÊø
 	if nTimeState == TEAM_GAME_TIME then
 	
		OldPlayer = PlayerIndex; 	

 		--Çå³ýÕ½¶·Ë«·½ÉíÉÏµÄ×´Ì¬²¢½ûÖ¹Æä¼ÌÐøÕ½¶·
 		for i=1,2 do
 			nPlayerMSIndex = 0;
 			for j=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,i) do
 				nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,i);
 				if PlayerIndex > 0 then
 					RemvoeTempEffect();
 					SetFightState(0);
 				end
 			end
 		end
 		
 		--Ïò³¡ÄÚËùÓÐ½ÇÉ«·¢ËÍ±ÈÈü½á¹û
		nPlayerMSIndex = 0;
 		
 		for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) do
 			nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,0);
 			if PlayerIndex > 0 then
 				Talk(1,"","Thi ®Êu kÕt thóc, hai bªn tham chiÕn ®Êu hßa. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!");
 			end
 		end
 		
 		PlayerIndex = OldPlayer;
 		
		news_str = "Thi ®Êu kÕt thóc, hai phe hßa nhau!"
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, news_str);
		SetMissionV(TEAM_GAME_STATE,3);
 		SetMissionV(DELAY_STATE,1);
 		return
 	end
 	
	nMin = floor((TEAM_GAME_TIME - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME - nTimeState),3) * 20;
	
	if nMin == 0 then
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, "Giai ®o¹n thi ®Êu: Thi ®Êu ®ang tiÕn hµnh, thêi gian thi ®Êu cßn"..nSec.." gi©y.");
	elseif nSec == 0 then
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, "Giai ®o¹n thi ®Êu: Thi ®Êu ®ang tiÕn hµnh, thêi gian thi ®Êu cßn"..nMin.." phót.");
	end
	
end