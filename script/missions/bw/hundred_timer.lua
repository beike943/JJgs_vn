Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(MULTIMAP_STATE);
	nTimeState = GetMissionV(MULTIMAP_NEWS_STATE) + 1;
	SetMissionV(MULTIMAP_NEWS_STATE,nTimeState);

	--×¼±¸½×¶Î
	if nMapState == 1 then 
		ReportReadyState(nTimeState);
	--±ÈÈüÖÐ
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--±ÈÈü½áÊø
	elseif nMapState == 3 then  
		Msg2MSAll(MULIT_MISSION_ID, "ChiÕn ®Êu kÕt thóc!");
		StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2);		
	end;
end;

--×¼±¸½×¶ÎÐÅÏ¢´¦Àí
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nReportTime = 0
local nTotalFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP)
local nTotalNum = GetMSPlayerCount(MULIT_MISSION_ID,0)
local PlayerMSIndex = 0;
local nPlayerIndex = 0;
local PlayerIndexTab = {};

	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	--×¼±¸Ê±¼äµ½´ï15·ÖÖÓÒÔºóÅÐ¶Ï³¡ÄÚµ±Ç°Çé¿ö
	if nTimeState >= HUNDRED_READY_TIME then 
	
		--±ÈÈü¿ªÊ¼Ê±±ÈÈüÈËÊýÉÙµÈÓÚ1ÈË
		if nTotalFighterNum <= 1 then
				--·µ»¹Èë³¡·Ñ¸øÍæ¼Ò
			if GetMissionV(GAME_TYPE) == 2 then
				PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,0,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					OldPlayer = PlayerIndex
					PlayerIndex = nPlayerIndex
					Earn(20000);
					Say("V× sè ng­êi tham gia QuÇn hïng chiÕn lÇn nµy kh«ng ®ñ 2 ng­êi, kh«ng thÓ tæ chøc ®­îc! Nay tr¶ l¹i cho ng­¬i <color=yellow>2 tiÒn vµng<color> phÝ vµo trËn!",0);
					PlayerIndex = OldPlayer
				end
			end
			news_str = "Sè ng­êi tham chiÕn kh«ng ®ñ, hñy bá thi ®Êu!";
			Msg2MSAll(MULIT_MISSION_ID,news_str);	
			--ÓÉÓÚÉæ¼°Èë³¡·ÑÒò´Ë²»×÷ÑÓÊ±´¦Àí£¬ÅÂÍæ¼ÒÔÚÑÓÊ±½×¶Î½øÀ´¶øÊ¹ÊÕÈ¡Èë³¡·Ñ²»ÄÜÍË»¹				
			SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--É¾È¥ÍË³öNpc			 
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
		
		--±ÈÈü¿ªÊ¼´¦Àí
		
		OldPlayer = PlayerIndex
		
		for i=1,nTotalNum do	
			PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
			if nPlayerIndex > 0 then
				tinsert(PlayerIndexTab,nPlayerIndex);
			end
		end
		
		if nTotalFighterNum ~= getn(PlayerIndexTab) then
			WriteLog("[QuÇn hïng chiÕn]Khi thi ®Êu b¾t ®Çu, nhËn PlayerIndex kh«ng phï hîp víi sè l­îng trËn h×nh!");
		end
			
		for i=1,getn(PlayerIndexTab) do
			PlayerIndex = PlayerIndexTab[i]
			Talk(1,"","QuÇn hïng chiÕn ®ang chÝnh thøc b¾t ®Çu, trong trËn hiÖn lµ <color=yellow>"..nTotalFighterNum.."<color> ng­êi!")
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi ®Êu QuÇn hïng chiÕn chÝnh thøc b¾t ®Çu!";
		Msg2MSAll(MULIT_MISSION_ID,news_str);             
		RunMission(MULIT_MISSION_ID);
		return
	end
	
	--ÆäËûÐÅÏ¢´¦Àí
	
	nMin = floor((HUNDRED_READY_TIME - nTimeState) / 3);
	nReportTime = mod(floor((HUNDRED_READY_TIME - nTimeState) / 3),3);
	nSec = mod((HUNDRED_READY_TIME - nTimeState),3) * 20;
	
	--Ã¿¸öÈý·ÖÖÓÒ»¸öÐÅÏ¢
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:"..nMin.." phót, sè ng­êi trong trËn hiÖn lµ "..nTotalFighterNum.." ng­êi!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
		Msg2SubWorld("§¹i ChÝ C­êng thay mÆt chñ nh©n tæ chøc QuÇn hïng chiÕn t¹i l«i ®µi Thµnh §«! Hoan nghªnh c¸c anh hïng h¶o h¸n ®Õn b¸o danh! Thêi gian chuÈn bÞ cßn"..nMin.." phót, sè ng­êi tham chiÕn hiÖn lµ "..nTotalFighterNum.." ng­êi.");
	elseif (nMin == 0) then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:" ..nSec.. " gi©y, sè ng­êi trong trËn hiÖn lµ"..nTotalFighterNum.." ng­êi!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
	end
	
end


--¿ªÕ½½×¶ÎÕ½¿ö±¨¸æ
function ReportBattleState(nTimeState)

local news_str = "";
local nMSPlayerIndex = 0;
local nPlayerIndexTab = {};
local i=0;
local j=0;
local nMin = 0; 
local nSec = 0;
local nPlayerIndex = 0;
local nWinState = 0;
local nPlayerName = "";
local nKillNum = 0;
local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nBonus = 0;
local Bonus_str = "";
	
	--Ö»Ê£ÏÂÒ»ÃûÑ¡ÊÖ
	if nTotalFigtherNum == 1 then
		if nDelayState == 0 then
			nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
			if nPlayerIndex > 0 then
				OldPlayer = PlayerIndex;
				PlayerIndex = nPlayerIndex;
				nPlayerName = GetName();
				nKillNum = GetTaskTemp(TOTAL_KILL_NUM);
				if GetMissionV(GAME_TYPE) == 1 then
					PayAward(2);
				end
				if GetMissionV(GAME_TYPE) == 2 then
					nBonus = floor(GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)
					Bonus_str = TurnMoneyFormat(nBonus);
				--Say("<color=green>´úÖ¾Ç¿<color>£ºÄãÒÑ¾­Ê¤³ö¸Ã³¡°ÙÈËÓ¢ÐÛ´óÀÞ±ÈÈü£¬°´ÕÕ¹æÔò½«»ñµÃ"..Bonus_str.."×÷Îª½±Àø£¡",0);
					Earn(nBonus);
				end
				WriteLog("[QuÇn hïng chiÕn] Ng­êi ch¬i "..GetName().." Th¾ng trËn"..GetMissionV(START_TIME).."nhËn ®­îc phÇn th­ëng:"..nBonus.." Tæng phÝ vµo trËn lµ:"..GetMissionV(MULTIMAP_BONUS).." Tµi kho¶n: "..GetAccount());
				PlayerIndex = OldPlayer;
			end
			
			--Ïò³¡ÄÚËùÓÐ½ÇÉ«·¢ËÍ±ÈÈü½á¹û£¨°üÀ¨¹ÛÖÚ£©
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(GAME_TYPE) == 2 then 
						news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng thi ®Êu trËn nµy lµ <color=yellow>"..nPlayerName.."<color>, tæng sè ng­êi ®¸nh b¹i lµ:"..nKillNum.."  ng­êi, theo lÖ sÏ nhËn ®­îc phÇn th­ëng"..Bonus_str.."! Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
					else
						news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng thi ®Êu trËn nµy lµ <color=yellow>"..nPlayerName.."<color>, tæng sè ng­êi ®¸nh b¹i lµ:"..nKillNum.."  ng­êi. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
					end
					Talk(1,"",news_str);
				end
			end
			PlayerIndex = OldPlayer ;
			nDelayState = 1;
			news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng lµ"..nPlayerName;
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			Msg2SubWorld(nPlayerName.."Tr­íc khi giê ®Êu kÕt thóc, ai ®¸nh b¹i ®èi ph­¬ng sÏ giµnh th¾ng lîi!");
			AddGlobalNews(nPlayerName.."Tr­íc khi giê ®Êu kÕt thóc, ai ®¸nh b¹i ®èi ph­¬ng sÏ giµnh th¾ng lîi!");
			return
		end
		--ÑÓÊ±ÍË³ö
		if nDelayState == 1 then
			nDelayState = 0;
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
	end
	
	--Õ½¶·½áÊø
 	if nTimeState >= HUNDRED_GAME_TIME then
 		
 		if nDelayState == 0 then
			
			WinnerTab = GetMurderIndexTab(nTotalFigtherNum);--»ñµÃÉ±ÈËÊýÄ¿ÓÉ´óµ½Ð¡ÅÅÐòµÄlist
			
			if GetMissionV(GAME_TYPE) == 2 then
				nBonus = floor((GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)/getn(WinnerTab[1]));
				Bonus_str = TurnMoneyFormat(nBonus);
			end
			
			for i=1,getn(WinnerTab[1]) do
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 2 then
					Earn(nBonus);
				end
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 1 then
					PayAward(2)
				end
				tinsert(Winner_info,GetName());
				tinsert(Winner_info,GetTaskTemp(TOTAL_KILL_NUM));
				tinsert(Winner_News,Winner_info);
				WriteLog("[QuÇn hïng chiÕn] Ng­êi ch¬i "..GetName().." Th¾ng trËn"..GetMissionV(START_TIME).."nhËn ®­îc phÇn th­ëng:"..nBonus.." Tæng phÝ vµo trËn lµ:"..GetMissionV(MULTIMAP_BONUS).." Tµi kho¶n: "..GetAccount());
				PlayerIndex = OldPlayer
				Winner_info = {}
			end
			
			--ÏòÊ§°ÜÕß·¢½±
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP) do	
				nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(DECEDEND_NUM) == 0 then
						PayAward(1);
					else 
						for j=1,getn(WinnerTab[1]) do	
							if PlayerIndex == WinnerTab[1][j] then
								nWinState = 1;
								break;
							end
						end
						if nWinState ~= 1 then
							PayAward(1);
						end
						nWinState = 0;
					end
				end
			end
			PlayerIndex = OldPlayer;
	
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi ®Êu trËn nµy kh«ng cã ng­êi th­¬ng vong, trËn ®Êu ®­îc xö hßa! Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!"
			else
				news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng trËn nµy lµ"
				for i=1,getn(Winner_News) do
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].." <color> ng­êi."
						if GetMissionV(GAME_TYPE) == 2 then
							news_str = news_str.."Theo quy t¾c sÏ nhËn ®­îc phÇn th­ëng"..Bonus_str.."!";
						end
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].."<color> ng­êi; "
					end
				end
			end
			
			--Ïò³¡ÄÚËùÓÐ½ÇÉ«·¢ËÍ±ÈÈü½á¹û£¨°üÀ¨¹ÛÖÚ£©
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					SetFightState(0);
					RemvoeTempEffect();
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			nDelayState = nDelayState + 1;
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi ®Êu kÕt thóc, trËn nµy xö hßa.";
			else
				news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng lµ:"..nPlayerName;
			end
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			return
		end
 		
 		--ÑÓ³ÙÍË³ö
 		if nDelayState == 1 then
 			nDelayState = 0;
 			SetMissionV(MULTIMAP_STATE,3);
 			CloseMission(MULIT_MISSION_ID);
 			return
 		end
 		
 	end
 	
	nMin = floor((HUNDRED_GAME_TIME - nTimeState) / 3);
	nSec = mod((HUNDRED_GAME_TIME - nTimeState),3) * 20;
	
	if nMin == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "Giai ®o¹n chiÕn ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong trËn hiÖn cã"..nTotalFigtherNum.." ®Êu thñ, thêi gian thi ®Êu cßn"..nSec.." gi©y.");
	elseif nSec == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "Giai ®o¹n chiÕn ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong trËn hiÖn cã"..nTotalFigtherNum.." ®Êu thñ, thêi gian thi ®Êu cßn"..nMin.." phót.");
	end
	
end;
