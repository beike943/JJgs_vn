Include("\\script\\missions\\bw\\bwhead.lua");

ContinueTime = 0;--ÑÓ³ÙÍË³ö

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--±¨Ãû½×¶Î
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --¿ªÕ½ÁË
		ReportBattle(V);
	elseif (timestate == 3) then  --Õ½¶·½áÊøÁË
		Msg2MSAll(MISSIONID, "ChiÕn ®Êu kÕt thóc!");
		StopMissionTimer(MISSIONID, TIME_NO1);
		StopMissionTimer(MISSIONID, TIME_NO2);
	end;
end;

function ReportMemberState(V)
	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	if (V == GO_TIME) then
	
		if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) and (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." cïng víi  "..GetMissionS(2).."Thêi gian ®¬n ®Êu l«i ®µi ®· ®Õn, hai phe thi ®Êu "..GetMissionS(1).." cïng víi  "..GetMissionS(2).." Kh«ng ®óng giê bÞ truÊt quyÒn thi ®Êu!";
			Msg2MSAll(MISSIONID,str1)
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
--			WinBonus(3);
			SetMissionV(MS_STATE,3);
			--Msg2Fighters(str1);
			CloseMission(MISSIONID);
			return
		end;

		if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." cïng víi  "..GetMissionS(2).."Thêi gian ®¬n ®Êu l«i ®µi ®· ®Õn,"..GetMissionS(1).."  kh«ng ®óng giê, "..GetMissionS(2).." ®­îc giµnh phÇn th¾ng!"
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    -- Ó®·½ÓÐ¾­Ñé
--		   	if index2 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index2
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("Äã»ñµÃÁË"..floor(nLevel * nLevel * 1.2).."µã¾­Ñé")
--		   		PlayerIndex = nOld
--		   	end
--		    if (index1 > 0 and index2 > 0) then
--			    RecordBWCount_Win(index2, index1)
--		    end
--			WinBonus(2);
			--Msg2Fighters(str1);
			CloseMission(MISSIONID);
			return
		end;
	
		if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." cïng víi  "..GetMissionS(2).."Thêi gian ®¬n ®Êu l«i ®µi ®· ®Õn,"..GetMissionS(2).."  kh«ng ®óng giê, "..GetMissionS(1).." ®­îc giµnh phÇn th¾ng!";
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    local index1 = GetMissionV(MS_PLAYER1ID)
		    local index2 = GetMissionV(MS_PLAYER2ID)
		     -- Ó®·½ÓÐ¾­Ñé
--		   	if index1 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index1
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("Äã»ñµÃÁË"..floor(nLevel * nLevel * 1.2).."µã¾­Ñé")
--		   		PlayerIndex = nOld
--		   	end
--		    if (index1 > 0 and index2 > 0) then
--			    RecordBWCount_Win(index1, index2);
--		    end
--			WinBonus(1);
            --Msg2Fighters(str1);
			CloseMission(MISSIONID);
			return
		end;
			
		str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3].."Tû vâ tr­êng "..GetMissionS(1).."("..GetMissionS(3)..")".." cïng víi  "..GetMissionS(2).."("..GetMissionS(4)..")".."  ng­ng cho vµo ®Êu tr­êng ®¬n ®Êu l«i ®µi, thi ®Êu chÝnh thøc b¾t ®Çu!";
		Msg2MSAll(MISSIONID, str);
    	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
    	    AddGlobalNews(str);
    	end;
        --Msg2Fighters(str);
        Talk2Fighters(str);
        
        --ÉèÖÃPK×´Ì¬
	    OldPlayer = PlayerIndex;
	    for i = 1, 2 do 
		    PlayerIndex = GetMissionV(MS_PLAYER1ID + i -1);
            SetFightState(1);
            if (i == 1) then
                ExercisePK(1,GetMissionV(MS_PLAYER1ID + i));
            end;
            if (i == 2) then
                ExercisePK(1,GetMissionV(MS_PLAYER1ID + i -2));
            end;
	    end;
	    PlayerIndex = OldPlayer;
        
		RunMission(MISSIONID);
		return
	end;
		RestMin = floor((GO_TIME - V) / 3);
		RestSec = mod((GO_TIME - V),3) * 20;

		--Msg2Fighters("ReportMemberState "..GetMSPlayerCount(MISSIONID, 0).." "..GetMSPlayerCount(MISSIONID, 1).." "..GetMSPlayerCount(MISSIONID, 2));
		
		if (RestMin > 0) and (RestSec == 0) then
--			str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." Óë "..GetMissionS(2).."µ¥ÌôÀÞÌ¨ÈüÈë³¡Ê£ÓàÊ±¼ä£º"..RestMin.."·ÖÖÓ£¬ÏÖÔÚÍâÎ§Íæ¼ÒµÄ¶Ä×¢ÊÇ"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
			str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).."("..GetMissionS(3)..")".." cïng víi  "..GetMissionS(2).."("..GetMissionS(4)..")".."Thêi gian vµo ®Êu tr­êng ®¬n ®Êu l«i ®µi cßn:"..RestMin.." phót."
			Msg2MSAll(MISSIONID, str1);
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
			--if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) or (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then
			    --Msg2Fighters(str1);
			--end;
			if ((GO_TIME - V) == 3) then 
--				str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." Óë "..GetMissionS(2).."µ¥ÌôÀÞÌ¨ÈüÈë³¡Ê±¼äÊ£ÏÂ×îºó1·ÖÖÓ£¬ÇëÎ´Èë³¡Õß¾¡¿ìÈë³¡£¬ÏÖÔÚÍâÎ§Íæ¼ÒµÄ¶Ä×¢ÊÇ" .. GetMissionV(BW_MONEY1) .. ":" .. GetMissionV(BW_MONEY2);
				str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).."("..GetMissionS(3)..")".." cïng víi  "..GetMissionS(2).."("..GetMissionS(4)..")".."Thêi gian vµo ®Êu tr­êng ®¬n ®Êu l«i ®µi chØ cßn 1 phót cuèi! C¸c ®Êu sÜ h·y nhanh ch©n!"
            	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
            	    AddGlobalNews(str1);
            	end;
--			elseif ((GO_TIME - V) == 15) then 
--				str1 = GetMissionS(CITYID)..GetMissionS(1).." Óë "..GetMissionS(2).."µ¥ÌôÀÞÌ¨ÈüÈë³¡Ê±¼ä»¹Ê£ÏÂ5·ÖÖÓ£¬ÇëÎ´Èë³¡Õß¾¡¿ìÈë³¡£¬ÏÖÔÚÍâÎ§Íæ¼ÒµÄ¶Ä×¢ÊÇ".. GetMissionV(BW_MONEY1) ..":".. GetMissionV(BW_MONEY2);
--				AddGlobalNews(str1)
			end
		elseif (RestMin == 0) then
--			str1 = GetMissionS(CITYID)..GetMissionS(1).." Óë "..GetMissionS(2).."µ¥ÌôÀÞÌ¨ÈüÈë³¡Ê£ÓàÊ±¼ä£º" ..RestSec.. "Ãë£¬ÏÖÔÚÍâÎ§Íæ¼ÒµÄ¶Ä×¢ÊÇ"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
			str1 = GetMissionS(CITYID)..GetMissionS(1).."("..GetMissionS(3)..")".." cïng víi  "..GetMissionS(2).."("..GetMissionS(4)..")".."Thêi gian vµo ®Êu tr­êng ®¬n ®Êu l«i ®µi cßn:" ..RestSec.. " gi©y."
			Msg2MSAll(MISSIONID, str1);
			--Msg2Fighters(str1);
		end;
end;

function ReportBattle(V)
--Õ½¶·½øÐÐ¹ý³ÌÖÐ£¬ÏµÍ³¶¨ÆÚÍ¨Öª¸÷·½µÄÕóÍöÇé¿ö
	    Msg2Player("ContinueTime "..ContinueTime)
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) and (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
	    if (ContinueTime == 0) then
		    str1 = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." cïng víi  "..GetMissionS(2).."Hai phe tham gia ®¬n ®Êu cïng rêi trËn,"..GetMissionS(1).." cïng víi  "..GetMissionS(2).." §­îc xö hßa!";
        	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
        	    AddGlobalNews(str1);
        	end;
		    Msg2MSAll(MISSIONID, str1);
		    --Talk2Fighters(str1);
    --		WinBonus(3);
		    ContinueTime = ContinueTime+1;
		    return
		elseif (ContinueTime == 1) then
		    SetMissionV(MS_STATE,3);
		    CloseMission(MISSIONID);
		    ContinueTime = 0;
		    return
		else
		    ContinueTime = ContinueTime+1;
		    return
		end
	end;

	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
	    if (ContinueTime == 0) then
		    --str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." Óë "..GetMissionS(2).."µ¥ÌôÀÞÌ¨ÈüÕ½¶·½áÊø£¬"..GetMissionS(2).." ÔÚ±ÈÈüÖÐ»÷°ÜÁË "..GetMissionS(1).."£¬È¡µÃÁË×îÖÕµÄÊ¤Àû£¡"
		    --AddGlobalNews(str1);
	        --Msg2MSAll(MISSIONID, str1);
	        --Talk2Fighters(str1);
		    --RecordBWCount_Win(GetMissionV(MS_PLAYER1ID+1), GetMissionV(MS_PLAYER1ID))
    --		WinBonus(2);
		    ContinueTime = ContinueTime+1;
		    local index2 = GetMissionV(MS_PLAYER2ID)
		    -- Ó®·½ÓÐ¾­Ñé
--		   	if index2 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index2
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("Äã»ñµÃÁË"..floor(nLevel * nLevel * 1.2).."µã¾­Ñé")
--		   		PlayerIndex = nOld
--		   	end
		    
		    return
		elseif (ContinueTime == 1) then
		    SetMissionV(MS_STATE,3);
		    CloseMission(MISSIONID);
		    ContinueTime = 0;
		    return
		else
		    ContinueTime = ContinueTime+1;
		    return
		end
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
	    if (ContinueTime == 0) then
		    --str1 = GetMissionS(CITYID)..MapTab[GetMissionV(MS_ROOMINDEX)][3]..GetMissionS(1).." Óë "..GetMissionS(2).."µ¥ÌôÀÞÌ¨ÈüÕ½¶·½áÊø£¬"..GetMissionS(1).." ÔÚ±ÈÈüÖÐ»÷°ÜÁË "..GetMissionS(2).."£¬È¡µÃÁË×îÖÕµÄÊ¤Àû£¡"
		    --AddGlobalNews(str1);
	        --Msg2MSAll(MISSIONID, str1);
	        --Talk2Fighters(str1);
		    --RecordBWCount_Win(GetMissionV(MS_PLAYER1ID), GetMissionV(MS_PLAYER1ID+1))
    --		WinBonus(1);
		    ContinueTime = ContinueTime+1;
			local index1 = GetMissionV(MS_PLAYER1ID)
		    -- Ó®·½ÓÐ¾­Ñé
--		   	if index1 > 0 then
--		   		local nOld = PlayerIndex
--		   		PlayerIndex = index1
--		   		local nLevel = GetLevel()
--		   		ModifyExp(floor(nLevel * nLevel * 1.2))
--		   		Msg2Player("Äã»ñµÃÁË"..floor(nLevel * nLevel * 1.2).."µã¾­Ñé")
--		   		PlayerIndex = nOld
--		   	end
		    return
		elseif (ContinueTime == 1) then
		    SetMissionV(MS_STATE,3);
		    CloseMission(MISSIONID);
		    ContinueTime = 0;
		    return
		else
		    ContinueTime = ContinueTime+1;
		    return
		end
	end;
		
	gametime = (floor(GetMSRestTime(MISSIONID,TIME_NO2)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(MISSIONID, "Giai ®o¹n chiÕn ®Êu: Hai phe hiÖn ®ang thi ®Êu. Thêi gian cßn l¹i lµ:"..RestSec.." gi©y.");
	elseif (RestSec == 0) then
		Msg2MSAll(MISSIONID, "Giai ®o¹n chiÕn ®Êu: Hai phe hiÖn ®ang thi ®Êu. Thêi gian cßn l¹i lµ:"..RestMin.." phót.");
	else
		Msg2MSAll(MISSIONID, "Giai ®o¹n chiÕn ®Êu: Hai phe hiÖn ®ang thi ®Êu. Thêi gian cßn l¹i lµ:"..RestMin.." Phót "..RestSec.." gi©y.");
	end;
end;
