Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

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
		--StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2);		
	end
end

--×¼±¸½×¶ÎĞÅÏ¢´¦Àí
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nReportTime = 0;
local nTeamNum = GetGameTeamNum();
local i = 0;

	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	--×¼±¸Ê±¼äµ½´ï15·ÖÖÓÒÔºóÅĞ¶Ï³¡ÄÚµ±Ç°Çé¿ö
	if nTimeState >= TEAM_READY_TIME_AWARD then 
	
		--±ÈÈü¿ªÊ¼Ê±±ÈÈüÈËÊıÉÙµÈÓÚ1ÈË
		if nTeamNum <= 1 then			
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				if GetMissionV(GAME_TYPE) == 4 then
					--·µ»¹Èë³¡·Ñ¸ø¶Ó³¤
					Earn(TEAM_GAME_MONEY);
					for i=1,gf_GetTeamSize() do
						if gf_GetTeamMember(i) > 0 then					
							PlayerIndex = gf_GetTeamMember(i)
							Say("Do sè ®éi trong L«i ®µi İt h¬n <color=yellow>2<color>, thi ®Êu bŞ hñy bá, phİ b¸o danh sÏ ®­îc tr¶ l¹i cho ®éi tr­ëng. Xin ®îi gi©y l¸t! §Êu sÜ sÏ ®­îc chuyÓn ra!",0);
						end
					end
				end
			end
			PlayerIndex = OldPlayer
			
			news_str = "Do sè ®éi trong trËn ®Şa kh«ng ®ñ, thi ®Êu bŞ hñy bá! Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);	
			--ÓÉÓÚÉæ¼°Èë³¡·ÑÒò´Ë²»×÷ÑÓÊ±´¦Àí£¬ÅÂÍæ¼ÒÔÚÑÓÊ±½×¶Î½øÀ´¶øÊ¹ÊÕÈ¡Èë³¡·Ñ²»ÄÜÍË»¹				
			SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--É¾È¥ÍË³öNpc			 
			SetMissionV(TEAM_GAME_STATE,3);
			CloseMission(TEAM_MISSION_ID);
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
	
	--ÆäËûĞÅÏ¢´¦Àí
	
	nMin = floor((TEAM_READY_TIME_AWARD - nTimeState) / 3);
	nReportTime = mod(floor((TEAM_READY_TIME_AWARD - nTimeState) / 3),3);
	nSec = mod((TEAM_READY_TIME_AWARD - nTimeState),3) * 20;
	
	--Ã¿¸öÈı·ÖÖÓÒ»¸öĞÅÏ¢
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:"..nMin.." phót, sè ®éi trong trËn hiÖn lµ "..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID, news_str);
		Msg2SubWorld("§¹i Chİ C­êng thay mÆt chñ nh©n tæ chøc §éi chiÕn t¹i l«i ®µi Thµnh §«! Hoan nghªnh c¸c anh hïng h¶o h¸n ®Õn b¸o danh! C¸ch giê khai chiÕn cßn "..nMin.." phót, ®éi ngò tham chiÕn hiÖn t¹i lµ "..nTeamNum..". ");
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
local k=0;
local nMin = 0; 
local nSec = 0;
local nWinCaptianName = "";
local nKillNum = 0;
local nDeadNum = 0;
local nPlayerMSIndex = 0;
local nDate = 0;
local nCaptainState = 0;
local nTeamNum = 0;
local nTeamNumLife = 0;
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nCaptainName = "";
local nBonus = 0;
local Bonus_str = "";
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
--						if GetMissionV(GAME_TYPE) == 3 then
--							PayAward(3);
--						end
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
	
	--ÑÓ³ÙÍË³ö
 	if GetMissionV(DELAY_STATE) == 1 then
 		SetMissionV(DELAY_STATE,0);
 		SetMissionV(TEAM_GAME_STATE,3);
 		CloseMission(TEAM_MISSION_ID);
 		return
 	end
 	
 	nTeamNumLife = GetGameTeamNumByLife();
	
	--Ö»Ê£ÏÂÒ»¸ö¶ÓÎé
	if nTeamNumLife <= 1 then
		if GetMissionV(DELAY_STATE) == 0 then		
			OldPlayer = PlayerIndex;
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then				
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					if GetMissionV(GAME_TYPE) == 4 then
						nBonus = floor(GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)
						Bonus_str = TurnMoneyFormat(nBonus);
						Earn(nBonus);
					end
					nWinCaptianName = GetName();
					--¶ÔÊ¤Àû¶ÓÎé·¢·Å³£¹æ½±Àø
					for j=1,gf_GetTeamSize() do
						PlayerIndex = gf_GetTeamMember(j);
						if PlayerIndex > 0 then
							if GetMissionV(GAME_TYPE) == 3 then
								PayAward(4);
								news_str = "Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do <color=yellow>"..nWinCaptianName.."<color> dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
							elseif GetMissionV(GAME_TYPE) == 4 then
								news_str = "Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do <color=yellow>"..nWinCaptianName.."<color> dÉn d¾t, Theo quy t¾c sÏ nhËn ®­îc phÇn th­ëng"..Bonus_str..". Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
							else
								news_str = "Thi ®Êu kÕt thóc, trËn nµy ®éi ngò chiÕn th¾ng do <color=yellow>"..nWinCaptianName.."<color> dÉn d¾t. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
							end
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
			Msg2SubWorld(nWinCaptianName.." §éi nµo tiªu diÖt toµn bé ®èi ph­¬ng bªn kia tr­íc khi kÕt thóc thi ®Êu, sÏ lËp tøc giµnh th¾ng lîi!");
			AddGlobalNews(nWinCaptianName.." §éi nµo tiªu diÖt toµn bé ®èi ph­¬ng bªn kia tr­íc khi kÕt thóc thi ®Êu, sÏ lËp tøc giµnh th¾ng lîi!");
			return
		end
	end
	
	--Õ½¶·½áÊø
 	if nTimeState >= TEAM_GAME_TIME_AWARD then
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
							break;
						--end
					end
				end
 				SetMissionV(DELAY_STATE,1);
 				return
 			end
			
			WinnerTab = GetMurderCaptainIDTab(nTeamNumLife);--»ñµÃ¶ÓÎéÉ±ÈËÊıÄ¿ÓÉ´óµ½Ğ¡ÅÅĞòµÄ¶Ó³¤indexµÄlist
			
			nBonus = floor((GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)/getn(WinnerTab[1]));
			Bonus_str = TurnMoneyFormat(nBonus);

			for i=1,getn(WinnerTab[1]) do
				nKillNum = 0;
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				nWinCaptianName = GetName();
				if GetMissionV(GAME_TYPE) == 4 then
					Earn(nBonus);
				end
				for j=1,gf_GetTeamSize() do
					PlayerIndex = gf_GetTeamMember(j);
					if PlayerIndex > 0 then
						nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
					end
				end
				tinsert(Winner_info,nWinCaptianName);
				tinsert(Winner_info,nKillNum);
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {};
			end
			
			--ËùÓĞ¶ÓÎéÉ±ÈËÊıÄ¿¾ùÎª0£¬±ÈÈüÅĞÎªºÍ¾Ö
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Do mçi ®éi thi ®Êu trËn nµy ®Òu kh«ng cã th­¬ng vong, thi ®Êu ®­îc xö hßa! Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
			else
				news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng trËn nµy lµ do"
				for i=1,getn(Winner_News) do			
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."dÉn d¾t, <color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].."<color> ng­êi.";
						if GetMissionV(GAME_TYPE) == 4 then 
							news_str = news_str.."§éi chiÕn th¾ng sÏ nhËn ®­îc phÇn th­ëng"..Bonus_str..". Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
						end
						nCaptainName = nCaptainName..Winner_News[i][1];
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."dÉn d¾t, <color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].."<color> ng­êi; "
						nCaptainName = nCaptainName..Winner_News[i][1]..",";
					end
				end
			end
			
			--Ïò³¡ÄÚËùÓĞ½ÇÉ«·¢ËÍ±ÈÈü½á¹û
			OldPlayer = PlayerIndex;
			nPlayerMSIndex = 0;
			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do	
				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
				if PlayerIndex > 0 then
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			
			--ÏòÊ¤Àû¶ÓÎé·¢³£¹æ½±Àø
			if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex;
				for i=1,getn(WinnerTab[1]) do
					PlayerIndex = WinnerTab[1][i];
					if PlayerIndex > 0 then
						for j=1,gf_GetTeamSize() do
							PlayerIndex = gf_GetTeamMember(i);
							if PlayerIndex > 0 then
								PayAward(4);
							end
						end
					end
				end
				PlayerIndex = OldPlayer;
			end

			--ÏòÊ§°Ü¶ÓÎé·¢·Å³£¹æ½±Àø
			if GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex
				for i=1,10 do
					nPlayerMSIndex = 0;
					for j=1,GetMSPlayerCount(TEAM_MISSION_ID,i) do
						nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,i);
						if PlayerIndex > 0 then
							--Èç¹ûÃ»ÓĞÊ¤ÕßÔòËùÓĞÈË¾ùÄÜµÃ½±Àø
							if GetMissionV(DECEDEND_NUM) == 0 then
								PayAward(3);
							else
								for k=1,getn(WinnerTab[1]) do
									if gf_GetTeamMember(0) == WinnerTab[1][k] then
										nCaptainState = 1;
										break
									end
								end
								--Èç¹ûÎªÊ¤Àû¶ÓÎéÔò²»·¢½±Àø
								if nCaptainState ~= 1 then
									PayAward(3);
								end
								nCaptainState = 0;
							end
						end
					end
				end			
				PlayerIndex = OldPlayer;
			end
			
			SetMissionV(DELAY_STATE,1);
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi ®Êu kÕt thóc, hai ®éi hßa nhau!"
			else 
				news_str = "Thi ®Êu kÕt thóc, ng­êi chiÕn th¾ng thuéc ®éi ngò:"..nCaptainName.." dÉn d¾t."
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			return
		end
 		
 	end
 	
	nMin = floor((TEAM_GAME_TIME_AWARD - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME_AWARD - nTimeState),3) * 20;
	
	nTeamNum = GetGameTeamNum();
	
	if (nMin == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai ®o¹n thi ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong L«i ®µi hiÖn cã"..nTeamNum.." ®éi, thêi gian thi ®Êu cßn l¹i "..nSec.." gi©y.");
	elseif (nSec == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai ®o¹n thi ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong L«i ®µi hiÖn cã"..nTeamNum.." ®éi, thêi gian thi ®Êu cßn l¹i "..nMin.." phót.");
	end
	
end
