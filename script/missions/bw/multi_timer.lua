Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;
nReadyState = 0;

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(MULTIMAP_STATE);
	nTimeState = GetMissionV(MULTIMAP_NEWS_STATE) + 1;
	SetMissionV(MULTIMAP_NEWS_STATE,nTimeState);

	--×¼±¸½×¶Î
	if nMapState == 1 then 
		ReportReadyState(nTimeState);
	--±ÈÈüÖĞ
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--±ÈÈü½áÊø
	elseif nMapState == 3 then 
		Msg2MSAll(MULIT_MISSION_ID, "Thi ®Êu kÕt thóc!");
		StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1);
	end;
end;

--×¼±¸½×¶ÎĞÅÏ¢´¦Àí
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nTotalFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP)
local PlayerMSIndex = 0;
local nPlayerIndex = 0;
local PlayerIndexTab = {};

	if nReadyState == 1 then
		nReadyState = 0;
		SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--É¾È¥ÍË³öNpc			 
		SetMissionV(MULTIMAP_STATE,3);
		CloseMission(MULIT_MISSION_ID);
		return
	end

	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	--×¼±¸Ê±¼äµ½´ï3·ÖÖÓÒÔºóÅĞ¶Ï³¡ÄÚµ±Ç°Çé¿ö
	if nTimeState >= READY_TIME then 
		
		--±ÈÈü¿ªÊ¼Ê±±ÈÈüÈËÊıÉÙµÈÓÚ1ÈË
		if nTotalFighterNum <= 1 then
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
				if nPlayerIndex > 0 then					
					PlayerIndex = nPlayerIndex
					Say("V× sè ng­êi trong trËn ®Şa İt h¬n <color=yellow>2 ng­êi<color> nªn hñy bá thi ®Êu! Vui lßng ®îi gi©y l¸t! HÖ thèng sÏ tù ®éng chuyÓn ®Êu thñ ra khái chiÕn tr­êng!",0);
				end
			end
			PlayerIndex = OldPlayer
			news_str = "Sè ng­êi trong chiÕn ®Şa kh«ng ®ñ, thi ®Êu bŞ hñy bá!";
			Msg2MSAll(MULIT_MISSION_ID,news_str);
			nReadyState = 1;
			return
		end
		
		--±ÈÈü¿ªÊ¼´¦Àí
		
		OldPlayer = PlayerIndex
		
		for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do	
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
			Talk(1,"","Thi ®Êu chİnh thøc b¾t ®Çu, sè ng­êi trong trËn hiÖn lµ <color=yellow>"..nTotalFighterNum.."<color> ng­êi!")
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi ®Êu chİnh thøc b¾t ®Çu!";
		Msg2MSAll(MULIT_MISSION_ID,news_str);             
		RunMission(MULIT_MISSION_ID);
		return
	end
	
	--±ÈÈüÉĞÎ´¿ªÊ¼Ç°µÄĞÅÏ¢´¦Àí
	
	nMin = floor((READY_TIME - nTimeState) / 3);
	nSec = mod((READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "C¸ch giê khai chiÕn l«i ®µi cßn:"..nMin.." phót, sè ng­êi trong trËn hiÖn lµ "..nTotalFighterNum.." ng­êi!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
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
local nMin = 0; 
local nSec = 0;
local nPlayerIndex = 0;
local nPlayerName = "";
local nKillNum = 0;
local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
	
	--µ±Ç°³¡µØÖ»Ê£ÏÂÒ»ÃûÑ¡ÊÖ
	if nTotalFigtherNum <= 1 then
		if nDelayState == 0 then
			nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
			if	nPlayerIndex > 0 then
				OldPlayer = PlayerIndex;
				PlayerIndex = nPlayerIndex;
				nPlayerName = GetName();
				nKillNum = GetTaskTemp(TOTAL_KILL_NUM);
				--Say("¹§Ï²Äã³ÉÎª±¾´ÎÀŞÌ¨ÈüµÄÓÅÊ¤Õß£¬Äã±¾´ÎÕ½¼¨Îª£º³É¹¦É±ËÀ"..nKillNum.."ÈË£¡ÉÔºó½«»á°ÑÄã´«ËÍ³öÈü³¡£¬ÇëÄÍĞÄµÈ´ı¡£")
				PlayerIndex = OldPlayer;
			end
			
			--Ïò³¡ÄÚËùÓĞ½ÇÉ«·¢ËÍ±ÈÈü½á¹û£¨°üÀ¨¹ÛÖÚ£©
			nMSPlayerIndex = 0
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng thi ®Êu trËn nµy lµ <color=yellow>"..nPlayerName.."<color>, tæng sè ng­êi ®¸nh b¹i lµ:"..nKillNum.."  ng­êi. Xin ®îi gi©y l¸t, c¸c ®Êu thñ sÏ ®­îc chuyÓn ra!";
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer; 	
			nDelayState = nDelayState + 1;
			news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng lµ"..nPlayerName;
			Msg2MSAll(MULIT_MISSION_ID, news_str);
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
 	if nTimeState >= GAME_TIME then
 		
 		if nDelayState == 0 then
			
			WinnerTab = GetMurderIndexTab(nTotalFigtherNum);--»ñµÃÉ±ÈËÊıÄ¿ÓÉ´óµ½Ğ¡ÅÅĞòµÄlist
				
			for i=1,getn(WinnerTab[1]) do
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i]
				tinsert(Winner_info,GetName());
				tinsert(Winner_info,GetTaskTemp(TOTAL_KILL_NUM));
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {}
			end
			
			news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng trËn nµy lµ"
			
			for i=1,getn(Winner_News) do
				if i == getn(Winner_News) then
					nPlayerName = nPlayerName..Winner_News[i][1].."."
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].."<color> ng­êi."
				else
					nPlayerName = nPlayerName..Winner_News[i][1]..","
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ®¸nh b¹i: <color=yellow>"..Winner_News[i][2].."<color> ng­êi; "
				end
			end
			
			--Ïò³¡ÄÚËùÓĞ½ÇÉ«·¢ËÍ±ÈÈü½á¹û£¨°üÀ¨¹ÛÖÚ£©
			nMSPlayerIndex = 0
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex
					SetFightState(0);
					RemvoeTempEffect();
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			nDelayState = nDelayState + 1;
			news_str = "Thi ®Êu kÕt thóc, ®Êu thñ chiÕn th¾ng lµ:"..nPlayerName
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
 	
	nMin = floor((GAME_TIME - nTimeState) / 3);
	nSec = mod((GAME_TIME - nTimeState),3) * 20;
	
	if (nMin == 0) then
		Msg2MSAll(MULIT_MISSION_ID, "Giai ®o¹n chiÕn ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong trËn hiÖn cã"..nTotalFigtherNum.." ®Êu thñ, thêi gian thi ®Êu cßn"..nSec.." gi©y.");
	elseif (nSec == 0) then
		Msg2MSAll(MULIT_MISSION_ID, "Giai ®o¹n chiÕn ®Êu: Thi ®Êu ®ang tiÕn hµnh, trong trËn hiÖn cã"..nTotalFigtherNum.." ®Êu thñ, thêi gian thi ®Êu cßn"..nMin.." phót.");
	--else
		--Msg2MSAll(MULIT_MISSION_ID, "Õ½¶·½×¶Î£º±ÈÈü½øĞĞÖĞ£¬³¡µØÉÏÉĞÓĞ"..nTotalFigtherNum.."Ãû½ÇÉ«£¬Àë±ÈÈü½áÊø»¹ÓĞ"..nMin.."·Ö"..nSec.."Ãë¡£");
	end;
	
end;
