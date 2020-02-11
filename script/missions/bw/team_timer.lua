Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;
nReadyState = 0;

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(TEAM_GAME_STATE);
	nTimeState = GetMissionV(TEAM_NEWS_STATE) + 1;
	SetMissionV(TEAM_NEWS_STATE,nTimeState);

	--×¼±¸½×¶Î
	if nMapState == 1 then
		ReportReadyState(nTimeState);
	--±ÈÈüÖĞ
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--±ÈÈü½áÊø
	elseif nMapState == 3 then 
		Msg2MSAll(TEAM_MISSION_ID,"Thi ®Êu kÕt thóc!");
		--StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID1);
	end
end

--×¼±¸½×¶ÎĞÅÏ¢´¦Àí
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nTeamNum = GetGameTeamNum();

	if GetMissionV(READY_STATE) == 1 then
		SetMissionV(READY_STATE,0);
		SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--É¾È¥ÍË³öNpc			 
		SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
		return
	end

	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	--×¼±¸Ê±¼äµ½´ï3·ÖÖÓÒÔºóÅĞ¶Ï³¡ÄÚµ±Ç°Çé¿ö
	if nTimeState >= TEAM_READY_TIME then 
		
		--±ÈÈü¿ªÊ¼Ê±±ÈÈü¶ÓÎéÊıÉÙµÈÓÚ1¶Ó
		if nTeamNum <= 1 then
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				for i=1,gf_GetTeamSize() do
					if gf_GetTeamMember(i) > 0 then					
						PlayerIndex = gf_GetTeamMember(i)
						Say("Do sè ®éi trong L«i ®µi İt h¬n <color=yellow>2 ®éi<color>, thi ®Êu bŞ hñy bá, phİ b¸o danh sÏ ®­îc tr¶ l¹i cho ®éi tr­ëng. Xin ®îi gi©y l¸t! §Êu sÜ sÏ ®­îc chuyÓn ra!",0);
					end
				end
			end
			PlayerIndex = OldPlayer
			news_str = "Do sè ®éi trong trËn ®Şa kh«ng ®ñ, thi ®Êu bŞ hñy bá!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			SetMissionV(READY_STATE,1);
			return
		end
		
		--±ÈÈü¿ªÊ¼´¦Àí
		
		OldPlayer = PlayerIndex
		
		for i=1,nTeamNum do	
			nCaptainIndex = GetMissionV(CAPTAIN_ID+i-1);
			if nCaptainIndex > 0 then
				PlayerIndex = nCaptainIndex;
				for j=1,gf_GetTeamSize() do
					if gf_GetTeamMember(j) > 0 then
						PlayerIndex = gf_GetTeamMember(j);
						Talk(1,"","Thi ®Êu chİnh thøc b¾t ®Çu, sè ®éi trong trËn hiÖn lµ <color=yellow>"..nTeamNum.."<color> ®éi!")
					end
				end
			end
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi ®Êu chİnh thøc b¾t ®Çu!";
		Msg2MSAll(TEAM_MISSION_ID,news_str);             
		RunMission(TEAM_MISSION_ID);
		return
	end
	
	--±ÈÈüÉĞÎ´¿ªÊ¼Ç°µÄĞÅÏ¢´¦Àí
	
	nMin = floor((TEAM_READY_TIME - nTimeState) / 3);
	nSec = mod((TEAM_READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:"..nMin.." phót, sè ®éi trong trËn hiÖn lµ "..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	elseif (nMin == 0) then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:" ..nSec.. " gi©y, sè ®éi trong trËn hiÖn lµ"..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	end
	
end


--¿ªÕ½½×¶ÎÕ½¿ö±¨¸æ
function ReportBattleState(nTimeState)

local news_str = "";
local i=0;
local j=0;
local nMin = 0; 
local nSec = 0;
local nWinCaptianName = "";
local nKillNum = 0;
local nDeadNum = 0;
local nPlayerMSIndex = 0;
local nTeamNum = 0;
local nTeamNumLife = 0;
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nCaptainName = "";
local nPlayerName = "";
local TeamMember = {};

	--Èô¶ÓÎé±»È«ÃğÔò´«ËÍ³öÈü³¡
	OldPlayer = PlayerIndex;
	for i=1,10 do
		nDeadNum = 0;
		PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
		if PlayerIndex > 0 then
			for j=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(j);
				if PlayerIndex > 0 then
					if IsPlayerDeath() ~= 0 then
						nDeadNum = nDeadNum + 1;
					end
				end 
			end
			if nDeadNum == gf_GetTeamSize() then
--				for j=1,gf_GetTeamSize() do
--					PlayerIndex = gf_GetTeamMember(j);
--					if PlayerIndex > 0 then
--						tinsert(TeamMember,PlayerIndex);
--					end
--				end
--				for j=1,getn(TeamMember) do
--					PlayerIndex = TeamMember[j];
					PlayerIndex = gf_GetTeamMember(0);
					--Msg2Player("ÓÉÓÚÄãËùÔÚµÄ¶ÓÎéÈ«Ãğ£¬ÏÖ°ÑÄãÃÇ¶ÓÎé´«³öÈü³¡¡£");
					DelMSPlayer(TEAM_MISSION_ID,0);
				--end
			end
		end	
	end
	PlayerIndex = OldPlayer
	
	--ÑÓÊ±ÍË³ö
	if GetMissionV(DELAY_STATE) == 1 then
		SetMissionV(DELAY_STATE,0);
		SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
		return
	end
	
	nTeamNumLife = GetGameTeamNumByLife();

	--µ±Ç°³¡µØÖ»Ê£ÏÂÒ»¸ö¶ÓÎé
	if nTeamNumLife <= 1 then
	
		if GetMissionV(DELAY_STATE) == 0 then
		
			OldPlayer = PlayerIndex;
			
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					nWinCaptianName = GetName();
					for j=1,gf_GetTeamSize() do
						if gf_GetTeamMember(j) > 0 then
							PlayerIndex = gf_GetTeamMember(j);
							news_str = "Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do <color=yellow>"..nWinCaptianName.."<color> dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
							Say(news_str,0);
						end
					end
					break;
				end
			end
					
			PlayerIndex = OldPlayer; 	
			
			SetMissionV(DELAY_STATE,1);
			
			news_str = "Thi ®Êu kÕt thóc, ng­êi chiÕn th¾ng thuéc ®éi ngò "..nWinCaptianName.." dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			return
		end
		
	end
	
	--Õ½¶·½áÊø
	
 	if nTimeState >= TEAM_GAME_TIME then
 		
 		if GetMissionV(DELAY_STATE) == 0 then
 			
 			--±ÈÈü½áÊøÈ¥³ı½ÇÉ«ÉíÉÏËùÓĞ×´Ì¬ºÍÍ£Ö¹Õ½¶·
 			nPlayerMSIndex = 0;
 			OldPlayer = PlayerIndex;
 			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do
 				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
 				if PlayerIndex > 0 then
 					SetFightState(0);
 					RemvoeTempEffect();
 				end
 			end
 			PlayerIndex = OldPlayer;
 		
 			if nTeamNumLife <= 1 then
 			
 				for i=1,10 do
					if GetMissionV(CAPTAIN_ID+i-1) > 0 then
						PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
						--if IsPlayerDeath() == 0 then
							nWinCaptianName = GetName();
							for j=1,gf_GetTeamSize() do
								if gf_GetTeamMember(j) > 0 then
									PlayerIndex = gf_GetTeamMember(j);
									news_str = "Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do <color=yellow>"..nWinCaptianName.."<color> dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
									Say(news_str,0);
									news_str = "Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do"..nWinCaptianName.."dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!"
									Msg2MSAll(TEAM_MISSION_ID,news_str);
								end
							end
						--end
						break;
					end
				end
 				SetMissionV(DELAY_STATE,1);
 				return
 			end
			
			WinnerTab = GetMurderCaptainIDTab(nTeamNumLife);--»ñµÃ¶ÓÎéÉ±ÈËÊıÄ¿ÓÉ´óµ½Ğ¡ÅÅĞòµÄ¶Ó³¤indexµÄlist
			
			for i=1,getn(WinnerTab[1]) do
				nKillNum = 0;
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				nWinCaptianName = GetName();
				for j=1,gf_GetTeamSize() do
					if gf_GetTeamMember(j) > 0 then
						PlayerIndex = gf_GetTeamMember(j);
						nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
					end
				end
				tinsert(Winner_info,nWinCaptianName);
				tinsert(Winner_info,nKillNum);
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {};
			end
			
			news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng trËn nµy lµ do"
			
			for i=1,getn(Winner_News) do
				if i == getn(Winner_News) then
					nPlayerName = nPlayerName..Winner_News[i][1].."."
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."dÉn d¾t, <color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].."<color> ng­êi. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
					nCaptainName = nCaptainName..Winner_News[i][1];
				else
					nPlayerName = nPlayerName..Winner_News[i][1]..","
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."dÉn d¾t, <color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].."<color> ng­êi; "
					nCaptainName = nCaptainName..Winner_News[i][1]..",";
				end
			end
			
			--Ïò³¡ÄÚËùÓĞ½ÇÉ«·¢ËÍ±ÈÈü½á¹û
			OldPlayer = PlayerIndex
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then
					nPlayerName = nPlayerName..GetName();
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					for j=1,gf_GetTeamSize() do
						if gf_GetTeamMember(j) > 0 then
							PlayerIndex = gf_GetTeamMember(j);
							Say(news_str,0);
						end
					end
				end
			end
			PlayerIndex = OldPlayer;
			SetMissionV(DELAY_STATE,1);
			news_str = "Thi ®Êu kÕt thóc, ng­êi chiÕn th¾ng thuéc ®éi ngò:"..nCaptainName.." dÉn d¾t. Xin ®îi gi©y l¸t, c¸c anh hïng sÏ ®­îc chuyÓn ra!"
			Msg2MSAll(TEAM_MISSION_ID, news_str);    	
 			return
 		end 		
 	end
 	
	nMin = floor((TEAM_GAME_TIME - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME - nTimeState),3) * 20;
	
	nTeamNum = GetGameTeamNum();
	
	if (nMin == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai ®o¹n thi ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong L«i ®µi hiÖn cã"..nTeamNum.." ®éi, thêi gian thi ®Êu cßn l¹i "..nSec.." gi©y.");
	elseif (nSec == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai ®o¹n thi ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong L«i ®µi hiÖn cã"..nTeamNum.." ®éi, thêi gian thi ®Êu cßn l¹i "..nMin.." phót.");
	end
	
end