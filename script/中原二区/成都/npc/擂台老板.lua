--function main()
--	Talk(1,"","<color=green>ÀŞÌ¨ÀÏ°å<color>£º¸÷Â·Ó¢ĞÛºÃºº£¬È÷¼ÒÔÚÕâÀï°Ú¸öÌ¨×Ó£¬»»µã¾ÆÇ®£¬ÊÇ»á¼Ò×ÓµÄ¾ÍÉÏÀ´Ë£Á½Â·£¬Åõ¸öÌ¨³¡£»²»»áµÄ¾ÍÔÚÏÂÃæ´ô×Å£¬Åõ¸öÈË³¡¡£")
--end;

Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--ÒıÓÃ×Ö·û´®´¦ÀíÖ§³Ö
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\missions\\bw\\siege\\siege_arena_mission.lua")

function main()
--	Talk(1,"","<color=green>ÀŞÌ¨ÀÏ°å<color>£ºÀŞÌ¨ÔİÊ±±»¹Ø±ÕÁË¡£");
--	return
    --ÉèÖÃ·µ»Øµã
    if IsFreeze() == 1 then  --Èç¹ûÓÃWG±»·â
        Talk(1,"","<color=yellow>Kh«ng thÓ vµo l«i ®µi! Tµi kho¶n nµy ®ang bŞ xö lı! <color>");
        return
    end;
	
	x,y,z = GetWorldPos();
	SetTask(MS_POS, x);
	SetTask(MS_POS+1, y);
	SetTask(MS_POS+2, z);
	
	if x == 150 then    --ÑïÖİ
	    Talk(1,"","TriÒu ®×nh ®ang tæ chøc vâ l©m ®¹i héi ë n¬i nµy! Anh hïng hµo kiÖt xin chí bá qua!");
	    return
	elseif x == 350 then    -- ÏåÑô
	    Talk(1,"","TriÒu ®×nh ®ang tæ chøc vâ l©m ®¹i héi ë n¬i nµy! Anh hïng hµo kiÖt xin chí bá qua!");
	    return
	end;
	
	if (GetTaskTemp(JOINROOMINDEX)>0) then
	    OnChanceRoom(GetTaskTemp(JOINROOMINDEX));
	    return
	end;
	
	--²éÑ¯ÓĞĞ§³¡µØ¶Ô»°
	SelectGameStyle()
	
end

function SelectGameStyle()

	local strSelect = {
		"§¬n ®Êu L«i ®µi/#SearchValidRoom(1)",
		"Tæ ®éi ®èi chiÕn L«i ®µi/#SearchValidRoom(2)",
		"Hçn chiÕn ®¬n ®Êu L«i ®µi/#SearchValidRoom(3)",
		"Tæ ®éi hçn chiÕn l«i ®µi/#SearchValidRoom(4)",
		"L«i ®µi ®Æt c­îc/#SearchValidRoom(5)",
		"NhËn ®­îc t­ c¸ch c«ng thµnh/talk_to_npc",
		"ThuyÕt minh quy t¾c/GameRuleTalk",
		"Rêi khái/OnCancel_Talk"
		};
		
	Say("<color=green>Chñ l«i ®µi<color>: L«i ®µi lµ n¬i c¸c anh hïng h¶o h¸n tû vâ, lo¹i h×nh thi ®Êu chia thµnh 4 lo¹i <color=yellow>§¬n ®Êu l«i ®µi<color>, <color=yellow>Tæ ®éi ®èi chiÕn<color>, <color=yellow>§¬n ®Êu hçn chiÕn<color> vµ <color=yellow>Tæ ®éi hçn chiÕn<color>. Xin h·y chän h×nh thøc thi ®Êu: ",
		getn(strSelect),
		strSelect
		);

end

function SearchValidRoom(nType)

local nMapId = GetWorldPos();

	--Ñ¡Ôñ ¸öÈËµ¥ÌôÀŞÌ¨ ³¡µØ
	if nType == 1 then
		local room_num = 0;
    local room_tab = {}
    local szSay = "";
    
    for index, value in MapTab do
        room_tab[index] = 0
        if nMapId == value[2] then
    	    idx = SubWorldID2Idx(value[1]);
    	    if (idx~=-1) then
                room_num = room_num+1;
                room_tab[index] = 1;
    	    end;
    	end;
    end;

    if room_num > 0 and room_num <= MAX_ROOM_COUNT then
        szSay = "Say("..format("%q","<color=green>Chñ l«i ®µi<color>: N¬i ®©y lµ ®Êu tr­êng ®¬n ®Êu l«i ®µi cho c¸c Nh©n sÜ giang hå tham gia ®¬n ®Êu tû thİ. HiÖn cã tæng céng: "..room_num.." trËn ®Şa. C¸c h¹ h·y chän trËn ®Şa muèn vµo!<color=yellow>");
        szSay = szSay..","..(room_num+1);   --ÎªÁË×îºó¼ÓÉÏµÄÍË³öÑ¡Ïî
        for index, value in room_tab do
            if value == 1 then
                szSay = szSay..","..format("%q", MapTab[index][3].."/#OnChanceRoom("..index..")");
            end;
        end;
        szSay = szSay..","..format("%q", "Rêi khái/OnCancel_Talk")..")";
        dostring(szSay);
    elseif room_num > MAX_ROOM_COUNT then
        ErrorMsg(12);
    else
        ErrorMsg(2);
    end
    return
   end

	--Ñ¡Ôñ ×é¶Óµ¥ÌôÀŞÌ¨ ³¡µØ
	if nType == 2 then
		local room_num = 0;
    local room_tab = {}
    local szSay = "";
    local nMapIdx = 0;
    local nMapState = 0;
    local nCaptainName_1 = "";
    local nCaptainName_2 = "";
    local nTeamSize_1 = 0;
    local nTeamSize_2 = 0;
    local nPlayerMSIndex = 0;
    local nCamp = 0;
    
    for i=1,getn(SingleTeamMapTab) do
      room_tab[i] = 0;
      if nMapId == SingleTeamMapTab[i][2] then
    	  nMapIdx = SubWorldID2Idx(SingleTeamMapTab[i][1]);
    	  if nMapIdx ~= -1 then
          room_num = room_num+1;
          room_tab[i] = 1;
    	  end
    	end
    end
    
    szSay = "Say("..format("%q","N¬i ®©y cã tæ ®éi ®èi chiÕn l«i ®µi gi÷a <color=yellow>2 ®éi ngò<color> thİ luyÖn tû vâ. ChØ cÇn ®éi ngò cã <color=yellow>2 ng­êi trë lªn<color> do <color=yellow>§éi tr­ëng b¸o danh<color> lµ cã thÓ tham gia. HiÖn t¹i më tæng céng <color=yellow>"..room_num.." trËn ®Şa<color> cho c¸c giang hå hiÖp kh¸ch tû thİ. C¸c h¹ h·y chän trËn ®Şa muèn vµo!");
    szSay = szSay..","..(room_num+1);   --ÎªÁË×îºó¼ÓÉÏµÄÍË³öÑ¡Ïî
    
    for i=1,getn(room_tab) do
   		if room_tab[i] == 1 then
   			OldWorld = SubWorld;
   			SubWorld = SubWorldID2Idx(SingleTeamMapTab[i][1]);
   			if SubWorld ~= -1 then
   				nMapState = GetMissionV(TEAM_GAME_STATE);
   				local strTemp = "[Gi¶i ®Æt c­îc]";
					if GetMissionV(MS_YAJING_NUM) <= 0 then
						strTemp = "";
					end
   				--³¡µØÃ»ÓĞÈË
   				if nMapState == 0 then
   					szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr¹ng th¸i: bá trèng)/#OpenSingleTeamRoomRequest("..i..")");
   				elseif nMapState == 1 then	
   					--ÒÑÓĞÁ½Ö§¶ÓÎé
   					if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
   						OldPlayer = PlayerIndex;				
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
   						if PlayerIndex > 0 then
   							nCaptainName_1 = gf_GetCaptainName();
   							nTeamSize_1 = gf_GetTeamSize();
   						end
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
   						if PlayerIndex > 0 then
   							nCaptainName_2 = gf_GetCaptainName();
   							nTeamSize_2 = gf_GetTeamSize();
   						end
   						PlayerIndex = OldPlayer;
   						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: §îi khai chiÕn, hai phe ®èi chiÕn lµ ®éi "..nCaptainName_1.." vµ ®éi "..nCaptainName_2.." )/#OpenSingleTeamRoom("..i..")");
   					--ÒÑÓĞÒ»Ö§¶ÓÎé£¬µÈ´ıÆäËû¶ÓÎé¼ÓÈë
   					elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
   						if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 then
   							nCamp = 1;
   						else
   							nCamp = 2;
   						end
   						OldPlayer = PlayerIndex;
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,nCamp);
   						if PlayerIndex > 0 then
   							nCaptainName_1 = gf_GetCaptainName();
   							nTeamSize_1 = gf_GetTeamSize();
   						end
   						PlayerIndex = OldPlayer;
   						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: §îi thi ®Êu, tin tøc ®éi ngò:"..nCaptainName_1..", cã "..nTeamSize_1.." ng­êi.)/#OpenSingleTeamRoom("..i..")");
   					end
   				--±ÈÈüÒÑ¾­¿ªÊ¼
   				elseif nMapState == 2 then
   					OldPlayer = PlayerIndex;
   					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
   					if PlayerIndex > 0 then
   						nCaptainName_1 = gf_GetCaptainName();
   						nTeamSize_1 = gf_GetTeamSize();
   					end
   					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
   					if PlayerIndex > 0 then
   						nCaptainName_2 = gf_GetCaptainName();
   						nTeamSize_2 = gf_GetTeamSize();
   					end
   					PlayerIndex = OldPlayer;
   					szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: §ang thi ®Êu, hai phe ®èi chiÕn lµ ®éi "..nCaptainName_1.." vµ ®éi "..nCaptainName_2.." )/#OpenSingleTeamRoom("..i..")");
   				elseif nMapState == 3 then
   					szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: Thi ®Êu kÕt thóc)/#GameOverTalk");
   				end
   			end   			
   			SubWorld = OldWorld;	   					
   		end 			
   	end
   	szSay = szSay..","..format("%q", "Rêi khái/OnCancel_Talk")..")";
   	dostring(szSay);
		return
	end
	
	--Ñ¡Ôñ ¸öÈË»ìÕ½ÀŞÌ¨ ³¡µØ
	if nType == 3 then
		local multi_room_num = 0;
    local multi_room_tab = {};--´æ·ÅÂú×ãµØÍ¼Ìõ¼şµÄMultiMapTabµÄindexµÄÎ»ÖÃ
    local i=0;
    local j=1;
    local nRandomNum = 0;
    local multiroom_book_tab = {};--´æ·ÅÂú×ãµØÍ¼ÊıÁ¿ºÍÔ¤¶¨Ìõ¼şµÄMultiMapTabµÄindexµÄÎ»ÖÃ
    local multiroom_nobook_tab = {};--´æÏĞÖÃµÄMultiMapTabµÄindexµÄÎ»ÖÃ
    local nMapBookState = 0;
    local nFighterNum = 0;
    local nAudienceNum = 0;
    local nMapState = 0;
    local lacknum = 0;
    local hundred_room_tab = {};
    local szSay = "";
    local room_num = 0;
    
    --»ñÈ¡¶àÈËÀŞÌ¨³¡µØÊıÁ¿
    for i=1,getn(MultiMapTab) do
    	if MultiMapTab[i][2] == nMapId then
    		multi_room_tab[j] = i
    		j=j+1
    		multi_room_num = multi_room_num + 1
    	end
    end
     
    --ÅĞ¶Ïµ±Ç°¶àÈËÀŞÌ¨³¡µØ×´Ì¬		
    for i=1,multi_room_num do
    	OldSubWorld = SubWorld;
    	SubWorld = SubWorldID2Idx(MultiMapTab[multi_room_tab[i]][1]);
    	
    	if SubWorld <= 0 then
				WriteLog("[QuÇn hïng chiÕn]T×nh h×nh ®Êu tr­êng hiÖn t¹i SubWorld b¸o lçi, b¸o lçi nMapIndex lµ"..MultiMapTab[multi_room_tab[i]][1]..", SubWorld lµ"..SubWorld..".");
				SubWorld = OldWorld;
				return 0
			end
    	
    	nMapBookState = GetMissionV(MULTIMAP_STATE)
    	
    	--¶ÔÒÑ¾­±»ÏĞÖÃµÄ³¡µØ½øĞĞ´¦Àí
    	if nMapBookState == 0 then
    		tinsert(multiroom_nobook_tab,multi_room_tab[i])
    	end
    	
    	--¶ÔÒÑ¾­±»Ô¤¶¨µÄ³¡µØ½øĞĞ´¦Àí
    	if nMapBookState >= 1 then
    		tinsert(multiroom_book_tab,multi_room_tab[i]);
    	end
    	
    	SubWorld = OldSubWorld;
    end
    
    if getn(multiroom_book_tab) > MAX_MULTIMAP_NUM then			--ÒÑ¾­Ô¤¶¨µÄ³¡µØÊı¶àÓÚÄ¿Ç°¿ª·Å¶àÈËÀŞÌ¨³¡µØÊı
    	Msg2Player("Sè trËn ®Şa ®Şnh tr­íc nhiÒu h¬n sè trËn ®Şa QuÇn hïng chiÕn hiÖn më.")
    else --ÒÑ¾­Ô¤¶¨µÄ³¡µØÊıÉÙÓÚµÈÓÚÄ¿Ç°¿ª·Å¶àÈËÀŞÌ¨³¡µØÊı
    	lacknum = MAX_MULTIMAP_NUM - getn(multiroom_book_tab);
    	for i=1,lacknum do
    		nRandomNum = random(1,getn(multiroom_nobook_tab));
    		tinsert(multiroom_book_tab,multiroom_nobook_tab[nRandomNum]);
    		tremove(multiroom_nobook_tab,nRandomNum);
    	end
    end
    
    --»ñÈ¡°ÙÈË´óÀŞ³¡µØÊıÁ¿
    if IsHundredBattleState() == 1 then
    	for i=1,getn(multiroom_book_tab) do
    		OldWorld = SubWorld;
    		SubWorld = SubWorldID2Idx(MultiMapTab[multi_room_tab[i]][1]);
    		
    		if SubWorld <= 0 then
					WriteLog("[QuÇn hïng chiÕn]T×nh h×nh ®Êu tr­êng hiÖn t¹i SubWorld b¸o lçi, b¸o lçi nMapIndex lµ"..MultiMapTab[multi_room_tab[i]][1]..", SubWorld lµ"..SubWorld..".");
					SubWorld = OldWorld;
					return 0
				end
    		
    		if GetMissionV(GAME_TYPE) == 1 or GetMissionV(GAME_TYPE) == 2 then 	
    			tinsert(hundred_room_tab,multi_room_tab[i])
    		end
    		SubWorld = OldWorld
    	end
    
    	--Èô±ÈÈüÉĞÎ´³õÊ¼»¯
    	if getn(hundred_room_tab) <= 0 then	
    		hundred_room_tab = multiroom_book_tab
    	end
    	
    	room_num = room_num + getn(hundred_room_tab);
    else
    	room_num = room_num + getn(multiroom_book_tab);
    end   

    szSay = "Say("..format("%q","<color=green>Chñ l«i ®µi<color>:GÇn ®©y, «ng chñ §¹i Chİ C­êng ë TuyÒn Ch©u ®Æc biÖt cã tæ chøc l«i ®µi c¸ nh©n hçn chiÕn, mong c¸c anh hïng hµo kiÖt thi thè vâ nghÖ.");
		szSay = szSay..","..2;--ÎªÁË×îºó¼ÓÉÏµÄÍË³öÑ¡Ïî                        
    --°ÙÈË´óÀŞ¶Ô»°Ñ¡Ïî¹¹½¨
    if IsHundredBattleState() == 1 then
    	for i=1,getn(hundred_room_tab) do
    		OldSubWorld = SubWorld;
    		SubWorld = SubWorldID2Idx(MultiMapTab[hundred_room_tab[i]][1]);
    		
    		if SubWorld <= 0 then
						WriteLog("[QuÇn hïng chiÕn]Khi ®èi tho¹i B¸ch nh©n ®¹i l«i, cöa sæ tïy chän SubWorld b¸o lçi, b¸o lçi nMapIndex lµ"..MultiMapTab[hundred_room_tab[i]][1]..", SubWorld lµ"..SubWorld..".");
						SubWorld = OldSubWorld;
						return 0
				end
    		
    		nFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
    		nAudienceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
    		nMapState = GetMissionV(MULTIMAP_STATE);
    		nGameType = GetMissionV(GAME_TYPE);
    		
    		if nMapState == 0 then
    			szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(Tr¹ng th¸i hiÖn t¹i: Ch­a thi ®Êu)/MapPreparingTalk");
    		elseif nMapState == 1 then
    			if nGameType == 1 or nGameType == 2 then 
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(Tr¹ng th¸i hiÖn t¹i: Ch­a khai trËn. Sè ng­¬i tham dù:"..nFighterNum.." :"..MAX_MULTIMAP_FIGTHER_NUM.." Sè kh¸n gi¶:"..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..hundred_room_tab[i]..")");
    			else
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][3].."(Tr¹ng th¸i hiÖn t¹i: Ch­a khai trËn. Sè ng­¬i tham dù:"..nFighterNum.." :"..MAX_MULTIMAP_FIGTHER_NUM.." Sè kh¸n gi¶:"..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..hundred_room_tab[i]..")");
    			end
    		elseif nMapState >= 2 then
    			if nGameType == 1 or nGameType == 2 then
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(Tr¹ng th¸i hiÖn t¹i: §ang tiÕn hµnh thi ®Êu)/#RequestGame("..hundred_room_tab[i]..")");
    			else
    				szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][3].."(Tr¹ng th¸i hiÖn t¹i: §ang tiÕn hµnh thi ®Êu)/#RequestGame("..hundred_room_tab[i]..")");
    			end
    		end
    		SubWorld = OldSubWorld 
    	end       		
    --Ò»°ã¶àÈËÀŞÌ¨¶Ô»°Ñ¡Ïî¹¹½¨
    else
    	for i=1,getn(multiroom_book_tab) do
    		OldSubWorld = SubWorld;
    		SubWorld = SubWorldID2Idx(MultiMapTab[multiroom_book_tab[i]][1]);
    		
    		if SubWorld <= 0 then
						WriteLog("[QuÇn hïng chiÕn]Th«ng th­êng, khi ®èi tho¹i QuÇn hïng chiÕn, cöa sæ tïy chän SubWorld b¸o lçi, b¸o lçi nMapIndex lµ"..MultiMapTab[multiroom_book_tab[i]][1]..", SubWorld lµ"..SubWorld..".");
						SubWorld = OldSubWorld;
						return 0
				end
    
    		nFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
    		nAudienceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
    		nMapState = GetMissionV(MULTIMAP_STATE);

    		if nMapState == 0 then
    			szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr¹ng th¸i hiÖn t¹i: Ch­a thi ®Êu)/#RequestGame("..multiroom_book_tab[i]..")");
    		elseif nMapState == 1 then
    			szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr¹ng th¸i hiÖn t¹i: Ch­a khai trËn. Sè ng­¬i tham dù:"..nFighterNum.." :"..MAX_MULTIMAP_FIGTHER_NUM.." Sè kh¸n gi¶:"..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..multiroom_book_tab[i]..")");
    		elseif nMapState >= 2 then
    			szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr¹ng th¸i hiÖn t¹i: §ang tiÕn hµnh thi ®Êu)/#RequestGame("..multiroom_book_tab[i]..")");
    		end
    		SubWorld = OldSubWorld 
    	end
    end
 
    szSay = szSay..","..format("%q", "Rêi khái/OnCancel_Talk")..")";
    dostring(szSay);
		return
	end
	
	--Ñ¡Ôñ ×é¶Ó»ìÕ½ÀŞÌ¨ ³¡µØ
	if nType == 4 then
		local nTeamNum = 0;
		local szSay = "Say("..format("%q","<color=green>Chñ l«i ®µi<color>: GÇn ®©y, «ng chñ §¹i Chİ C­êng ë TuyÒn Ch©u ®Æc biÖt cã tæ chøc l«i ®µi tæ ®éi hçn chiÕn, mong c¸c anh hïng hµo kiÖt thi thè vâ nghÖ.");
			szSay = szSay..","..2;--ÎªÁË×îºó¼ÓÉÏµÄÍË³öÑ¡Ïî  
		 	for i=1,getn(TeamMapTab) do
     		if GetWorldPos() == TeamMapTab[i][2] then
     			OldSubWorld = SubWorld;
     			SubWorld = SubWorldID2Idx(TeamMapTab[i][1]);
     			if SubWorld > 0 then
     				if GetMissionV(TEAM_GAME_STATE) == 0 then
     					if IsTeamAwardTime() == 1 then
     						szSay = szSay..","..format("%q","§éi chiÕn(Tr¹ng th¸i hiÖn t¹i: TrËn ®Şa ®ang chuÈn bŞ)/TeamGamePreparingTalk");
     					else
     						szSay = szSay..","..format("%q","TrËn ®Şa tæ ®éi hçn chiÕn (Tr¹ng th¸i hiÖn t¹i: Bá trèng)/#RequestTeamGame("..i..")");
     					end
     				elseif GetMissionV(TEAM_GAME_STATE) == 1 then
     					nTeamNum = GetGameTeamNum();
     					if IsTeamAwardTime() == 1 then
     						szSay = szSay..","..format("%q","TrËn ®Şa tæ ®éi hçn chiÕn (Tr¹ng th¸i hiÖn t¹i: Ch­a khai trËn. §éi ngò tham dù:"..nTeamNum.." :"..MAX_TEAM_NUM..")/#RequestTeamGame("..i..")");
     					else
     						szSay = szSay..","..format("%q","TrËn ®Şa tæ ®éi hçn chiÕn (Tr¹ng th¸i hiÖn t¹i: Ch­a khai trËn. §éi ngò tham dù:"..nTeamNum.." :"..MAX_TEAM_NUM..")/#RequestTeamGame("..i..")");
     					end
     				elseif GetMissionV(TEAM_GAME_STATE) > 1 then
     					if IsTeamAwardTime() == 1 then
     						szSay = szSay..","..format("%q","§éi chiÕn (Tr¹ng th¸i hiÖn t¹i: §ang tiÕn hµnh thi ®Êu)/#RequestTeamGame("..i..")");
     					else
     						szSay = szSay..","..format("%q","TrËn ®Şa tæ ®éi hçn chiÕn(Tr¹ng th¸i hiÖn t¹i: §ang tiÕn hµnh thi ®Êu)/#RequestTeamGame("..i..")");
     					end
     				end
     			end
     			SubWorld = OldSubWorld;
     		end
     	end	
     		
     	szSay = szSay..","..format("%q", "Rêi khái/OnCancel_Talk")..")";
     	dostring(szSay);
		return
	end
	
	--¹²ÏíÍÅ¶Ó¶ÔÕ½ÀŞÌ¨
	if nType == 5 then
		local room_num = 0;
		local room_tab = {}
		local szSay = "";
		local nMapIdx = 0;
		local nMapState = 0;
		local nCaptainName_1 = "";
		local nCaptainName_2 = "";
		local nTeamSize_1 = 0;
		local nTeamSize_2 = 0;
		local nPlayerMSIndex = 0;
		local nCamp = 0;

		for i=1,getn(SingleTeamMapTab) do
			room_tab[i] = 0;
			if nMapId == SingleTeamMapTab[i][2] then
				nMapIdx = SubWorldID2Idx(SingleTeamMapTab[i][1]);
				if nMapIdx ~= -1 then
					room_num = room_num+1;
					room_tab[i] = 1;
				end
			end
		end

		szSay = "Say("..format("%q","<color=green>Chñ l«i ®µi<color>: §©y lµ <color=red>L«i ®µi ®Æt c­îc<color> giµnh cho <color=yellow>tæ ®éi hoÆc 2 ng­êi ch¬i<color> so tµi víi nhau, hiÖn t¹i ®ang më tæng céng<color=yellow>"..room_num.." trËn ®Şa<color> cho c¸c giang hå hiÖp kh¸ch tû thİ. C¸c h¹ h·y chän trËn ®Şa muèn vµo!");
		szSay = szSay..","..(room_num+1);   --ÎªÁË×îºó¼ÓÉÏµÄÍË³öÑ¡Ïî
		
		for i=1,getn(room_tab) do
				if room_tab[i] == 1 then
					OldWorld = SubWorld;
					SubWorld = SubWorldID2Idx(SingleTeamMapTab[i][1]);
					if SubWorld ~= -1 then
						nMapState = GetMissionV(TEAM_GAME_STATE);
						local strTemp = "[Gi¶i ®Æt c­îc]";
						if GetMissionV(MS_YAJING_NUM) <= 0 then
							strTemp = "";
						end
						--³¡µØÃ»ÓĞÈË
						if nMapState == 0 then
							szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr¹ng th¸i: bá trèng)/#OpenSingleTeamRoomRequestYJ("..i..")");
						elseif nMapState == 1 then	
							--ÒÑÓĞÁ½Ö§¶ÓÎé
							if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
								OldPlayer = PlayerIndex;				
								nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
								if PlayerIndex > 0 then
									nCaptainName_1 = gf_GetCaptainName();
									nTeamSize_1 = gf_GetTeamSize();
								end
								nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
								if PlayerIndex > 0 then
									nCaptainName_2 = gf_GetCaptainName();
									nTeamSize_2 = gf_GetTeamSize;
								end
								PlayerIndex = OldPlayer;
								szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: §îi khai chiÕn, hai phe ®èi chiÕn lµ ®éi "..nCaptainName_1.." vµ ®éi "..nCaptainName_2.." )/#OpenSingleTeamRoomYJ("..i..")");
							--ÒÑÓĞÒ»Ö§¶ÓÎé£¬µÈ´ıÆäËû¶ÓÎé¼ÓÈë
							elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
								if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 then
									nCamp = 1;
								else
									nCamp = 2;
								end
								OldPlayer = PlayerIndex;
								nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,nCamp);
								if PlayerIndex > 0 then
									nCaptainName_1 = gf_GetCaptainName();
									nTeamSize_1 = gf_GetTeamSize();
								end
								PlayerIndex = OldPlayer;
								szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: §îi thi ®Êu, tin tøc ®éi ngò:"..nCaptainName_1..", cã "..nTeamSize_1.." ng­êi.)/#OpenSingleTeamRoomYJ("..i..")");
							end
						--±ÈÈüÒÑ¾­¿ªÊ¼
						elseif nMapState == 2 then
							OldPlayer = PlayerIndex;
							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
							if PlayerIndex > 0 then
								nCaptainName_1 = gf_GetCaptainName();
   								nTeamSize_1 = gf_GetTeamSize();
							end
							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
							if PlayerIndex > 0 then
								nCaptainName_2 = gf_GetCaptainName();
   								nTeamSize_2 = gf_GetTeamSize();
							end
							PlayerIndex = OldPlayer;
							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: §ang thi ®Êu, hai phe ®èi chiÕn lµ ®éi "..nCaptainName_1.." vµ ®éi "..nCaptainName_2.." )/#OpenSingleTeamRoomYJ("..i..")");
						elseif nMapState == 3 then
							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(Tr¹ng th¸i: Thi ®Êu kÕt thóc)/#GameOverTalk");
						end
					end   			
					SubWorld = OldWorld;	   					
				end 			
			end
			szSay = szSay..","..format("%q", "Rêi khái/OnCancel_Talk")..")";
			dostring(szSay);
				return
			end
end

function OnChanceRoom(index)
    if (GetTaskTemp(JOINROOMINDEX)>0 and GetTaskTemp(JOINROOMINDEX)~=index) then
        Say("Ng­¬i ®· ®Æt trËn ®Şa "..GetTaskTemp(JOINROOMINDEX)..", h·y chän vµo trËn ®Şa ®· ®Æt!",0);
    else
        SetTaskTemp(JOINROOMINDEX,index);
        OldSubWorld = SubWorld;
	    SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	    ms_state = GetMissionV(MS_STATE);
	    if (ms_state <= 0) then
		    Say("N¬i ®©y lµ ®Êu tr­êng ®¬n ®Êu l«i ®µi cho c¸c Nh©n sÜ giang hå tham gia ®¬n ®Êu tû thİ. HiÖn ch­a cã ®Êu thñ nµo ®¨ng kı thi ®Êu, c¸c h¹ cã høng thó kh«ng? <color=yellow>TrËn ®¬n ®Êu l«i ®µi hiÖn më miÔn phİ, h·y chíp lÊy thêi c¬!", 3, "§­îc/OnRegister", "Quy t¾c tû vâ lµ g×?/OnHelp", "§Ó ta chuÈn bŞ thªm/OnCancel");
	    elseif (ms_state == 1) then
		    OnReady();
	    elseif (ms_state == 2) then
		    OnFighting();
	    else
	        OldPlayer = PlayerIndex;
	        for i = 1, 2 do
		        PlayerIndex = gf_GetTeamMember(i);
			    SetTaskTemp(JOINROOMINDEX,0);
	        end;
	        PlayerIndex = OldPlayer;
		    ErrorMsg(2)
	    end;
    	
	    SubWorld = OldSubWorld;
    end;
end

function OnHelp()
    SetTaskTemp(JOINROOMINDEX,0);
	Talk(7, "",	"§¬n ®Êu l«i ®µi lµ n¬i c¸c ®¹i hiÖp cao thñ trªn giang hå tû thİ vâ nghÖ, ph©n tµi cao thÊp. L«i ®µi lµ trËn ®Şa thi ®Êu c«ng b»ng cho hai phe tham dù!",	"Muèn tiÕn hµnh trËn tû vâ l«i ®µi cÇn ®Õn ®¨ng kı thi ®Êu víi ta!",	"Sau khi hai phe tham dù tæ ®éi, ®éi tr­ëng ®Õn b¸o danh xin tham gia thi ®Êu!",	"Do trËn ®Şa h¹n hÑp, khi mét l«i ®µi nµo ®ã ®ang tiÕn hµnh thi ®Êu th× l«i ®µi kh«ng tiÕp nhËn b¸o danh!",	"B¸o danh thµnh c«ng, hai phe b¾t ®Çu chuÈn bŞ thi ®Êu. Thêi gian vµo trËn cña hai phe lµ 3 phót. Trong vßng 3 phót, c¸c ®Êu thñ ph¶i khÈn tr­¬ng vµo ®Êu tr­êng tiÕn hµnh thi ®Êu!" , 	"Thêi gian thi ®Êu lµ 10phót. Trong 10 phót, hai phe ch­a ph©n th¾ng b¹i sÏ ®­îc xö hßa!",	"Trong lóc thi ®Êu, bÊt kú bªn nµo bŞ rít m¹ng hoÆc vÒ thµnh sÏ bŞ xö b¹i!");
end;

function OnRegister()
--±¨Ãû
	if (gf_GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		SetTaskTemp(JOINROOMINDEX,0);
		return
	else
		if (PlayerIndex ~= gf_GetTeamMember(0)) then --GetName() == gf_GetCaptainName()
			ErrorMsg(5)
			SetTaskTemp(JOINROOMINDEX,0);
			return
		end;
	end;
	
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		CleanInteractive();
	    if (GetPlayerRoute() == 0) then
		    PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
	        PlayerIndex = OldPlayer;
			ErrorMsg(10);
	        return
	    end;
	    if (GetTaskTemp(JOINROOMINDEX) ~= 0 and PlayerIndex~=gf_GetTeamMember(0)) then
		    PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
	        PlayerIndex = OldPlayer;
			ErrorMsg(11);
	        return
	    end;
	end;
	PlayerIndex = OldPlayer;
	
--	AskClientForNumber("SignUpFinal", 100000, 99999999, "ÇëÊäÈë¶Ä×¢½ğ¶î:");
    SignUpFinal();
end;

function SignUpFinal(V)
	x = GetTask(MS_POS);
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	ms_state = GetMissionV(MS_STATE);
	SubWorld = OldSubWorld;

	if (ms_state > 0) then 
		ErrorMsg(8);
		SetTaskTemp(JOINROOMINDEX,0);
		return
	end;
	
	local ChoiceRoom = GetTaskTemp(JOINROOMINDEX);
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		SetMissionS(i, GetName());
		if (PlayerIndex ~= gf_GetTeamMember(0)) then
		    SetTaskTemp(JOINROOMINDEX,ChoiceRoom)
		end;
--		if (GetCash() < V) then 
--			PlayerIndex = OldPlayer
--			ErrorMsg(2)
--			return
--		end;
	end;
	PlayerIndex = OldPlayer;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	OpenMission(MISSIONID);

    SetMissionV(MS_ROOMINDEX,GetTaskTemp(JOINROOMINDEX));
    
	SetMissionV(BW_SIGN_MONEY,V);
	if x == 300 then
        SetMissionS(CITYID,"Thµnh §«")
	elseif x == 350 then
		SetMissionS(CITYID,"T­¬ng D­¬ng")
	elseif x == 150 then
		SetMissionS(CITYID,"D­¬ng Ch©u")
	elseif x == 100 then
	    SetMissionS(CITYID,"TuyÒn Ch©u")
	end;

	local nCountPlayerLevel = 0;
    OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = gf_GetTeamMember(i);
--		Pay(V);
        TaskTip("§éi ngò cña ng­¬i ®· b¸o danh tham gia trËn ®Şa"..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."thi ®Êu PK!");
		SetMissionV(MS_PLAYER1ID + i -1, PlayerIndex);
		SetMissionS(i, GetName());
		SetMissionS(i+2, GetPlayerInfo(PlayerIndex));
		
		------------------ÅĞ¶ÏÊÇ·ñ·¢ÓÎÏ·¹«¸æ----------------
		if GetLevel() >= 70 then
			nCountPlayerLevel = nCountPlayerLevel + 1
		end;
		--branchTask_BW1()
	end;
	PlayerIndex = OldPlayer;
	
--	if nCountPlayerLevel == 2 then	--Ë«·½¶¼¸ßÓÚ70¼¶
--		SetMissionV(GLOBAL_NEWS_SHOW, 1);
--	end;
	
	str = "HiÖn t¹i"..GetMissionS(CITYID).." - "..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."§¬n ®Êu tû vâ l«i ®µi b¾t ®Çu chuÈn bŞ vµo trËn, hai phe lµ "..GetMissionS(1).."("..GetMissionS(3)..")".." cïng víi  "..GetMissionS(2).."("..GetMissionS(4)..")"..", HiÖn ®¬n ®Êu l«i ®µi ®ang më miÔn phİ! Hoan nghªnh mäi ng­êi ®Õn xem thi ®Êu!";
	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
	    AddGlobalNews(str);
	end;
	SubWorld = OldSubWorld;
	--Msg2Team("ÄãÃÇÒÑ¾­¶©ÏÂÁË±ÈÈü£¬Çë¾¡¿ì½øĞĞ×¼±¸²¢Èë³¡£¬±ÈÈü½«ÔÚ1·ÖÖÓºóÕıÊ½¿ªÊ¼¡£");
	Say("C¸c ng­¬i ®· ®¨ng kı thi ®Êu, h·y mau chuÈn bŞ vµo ®Êu tr­êng, trËn ®Êu sÏ chİnh thøc b¾t ®Çu sau 1 phót n÷a.",0);
end;

function OnReady()
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);

	if (GetName() == GetMissionS(1)) or (GetName() == GetMissionS(2)) then 
	    if (GetName() == GetMissionS(1)) then
		    SetMissionV(MS_PLAYER1ID, PlayerIndex);
		end;
	    if (GetName() == GetMissionS(2)) then
		    SetMissionV(MS_PLAYER1ID+1, PlayerIndex);
		end;
		
		SubWorld = OldSubWorld
		OnJoin()
	else
		V = GetMissionV(BW_KEY);
		if GetTask(DUZHU+2) == V then
			str = "HiÖn t¹i "..GetMissionS(1).."("..GetMissionS(3)..")".." cïng víi  "..GetMissionS(2).."("..GetMissionS(4)..")".."  l«i ®µi tû vâ trong giai ®o¹n vµo tr­êng ®Êu, sè ng­êi xem trong tr­êng ®Êu lµ <color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>, sè ng­êi tèi ®a lµ 100 ng­êi, b¹n ®· b¸o danh xem thi ®Êu";
			SubWorld = OldSubWorld

			Say(str, 2, "Ta muèn vµo xem thi ®Êu!/OnLooking","Ta kh«ng muèn vµo n÷a!/OnCancel");
		else
			str = "HiÖn t¹i "..GetMissionS(1).."("..GetMissionS(3)..")".." cïng víi  "..GetMissionS(2).."("..GetMissionS(4)..")".."  l«i ®µi tû vâ trong giai ®o¹n vµo tr­êng ®Êu, sè ng­êi xem trong tr­êng ®Êu lµ <color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>, sè ng­êi tèi ®a lµ 100 ng­êi, b¹n cã thÓ <color=red>vµo tr­êng ®Êu xem miÔn phİ<color>, tû vâ s¾p b¾t ®Çu.";
			SubWorld = OldSubWorld
			Say(str, 2, "Ta muèn vµo xem thi ®Êu!/OnLook","Ta kh«ng cã høng thó!/OnCancel");
		end;
	end;
end;

function ErrorMsg(ErrorId)
    if (ErrorId == 1) then 
	    Say("Hai phe cÇn tæ ®éi tr­íc khi ®¨ng kı thi ®Êu!",0)
    elseif (ErrorId == 2) then 
	    Say("Xin lçi! TrËn ®Şa thi ®Êu kh«ng ®ñ. T¹m thêi kh«ng thÓ tham gia thi ®Êu!",0)
    elseif (ErrorId == 3) then 
	    Say("B¸o danh cã vÊn ®Ò! H·y liªn hÖ nhµ cung cÊp!",0);
    elseif (ErrorId == 4) then 
	    Say("Ng­¬i kh«ng ph¶i lµ ®Êu thñ tham gia thi ®Êu! Kh«ng thÓ vµo ®Êu tr­êng thi ®Êu, chØ ®­îc lµm kh¸n gi¶!", 0);
    elseif (ErrorId == 5) then 
	    Say("Ng­êi b¸o danh ph¶i lµ ®­¬ng kim §éi tr­ëng!",0);
    elseif (ErrorId == 6) then 
	    Say("Ng­¬i kh«ng mang ®ñ ng©n l­îng!",0);
    elseif (ErrorId == 7) then 
	    Say("Xin lçi! Ng­¬i ch­a b¸o danh vµo xem!",0);
    elseif (ErrorId == 8) then
	    Say("Xin lçi! TrËn ®Şa thi ®Êu ®· ®­îc ng­êi kh¸c thuª råi!",0);
    elseif (ErrorId == 9) then 
	    Say("Xin lçi! Thi ®Êu ®· b¾t ®Çu! Kh«ng thÓ ®¨ng kı n÷a!",0);
    elseif (ErrorId == 10) then 
	    Say("Xin lçi! Trong ®éi cã t©n thñ, kh«ng thÓ tham gia PK!",0);
    elseif (ErrorId == 11) then 
	    Say("Xin lçi! §éi viªn ng­¬i ®· tham gia thi ®Êu PK kh¸c!",0);
	elseif ErrorId == 12 then
	    --½ö½ö¿ª·¢µÄÊ±ºòÊ¹ÓÃ£¬´íÎó±¨¸æ
	    Say("Sè l­îng l«i ®µi cña server ®· v­ît møc tèi ®a!!!",0);
    else
    	
    end;
    return 
end;


function OnLook()

	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	str = GetMissionS(1).." cïng víi  "..GetMissionS(2).."  b¾t ®Çu thi ®Êu tû vâ l«i ®µi! Ng­¬i ®o¸n xem ai chiÕn th¾ng?";
	str1 = "Ta cho r»ng "..GetMissionS(1).."("..GetMissionS(3)..")".."  sÏ th¾ng!/OnCas1";
	str2 = "Ta cho r»ng "..GetMissionS(2).."("..GetMissionS(4)..")".."  sÏ th¾ng!/OnCas2";
	Say(str, 3, str1, str2, "Ta kh«ng biÕt! Ta kh«ng vµo ®©u!/OnCancel");

	SubWorld=OldSubWorld;
end;

function OnLooking()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	if (idx == -1) then 
		return
	end;

	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	--ÏŞÖÆ¹ÛÖÚÈËÊıÎª100ÈË
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","Xin lçi! Sè ng­êi xem trong tr­êng ®Êu ®· ®ñ <color=yellow>100 ng­êi<color>, xin h·y ®îi trËn thi ®Êu sau vËy");
		SubWorld=OldSubWorld;
		return
	end

	V = GetMissionV(BW_KEY);
	if GetTask(DUZHU+2) == V and V ~= 0 then
		JoinCamp(3);
	else
		ErrorMsg(7);
	end;

	SubWorld=OldSubWorld;
end;

function OnCas1()
    OnCas(0);
end;

function OnCas2()
    OnCas(1);
end;

function OnCas(nSel)
	SetTask(DUZHU,nSel + 1);
	SignUpFinalx(  )
--	AskClientForNumber("SignUpFinalx", 10000, 10000000, "ÇëÊäÈë¶Ä×¢½ğ¶î:");
end;


--Íæ¼ÒÊäÈëÍ¶±ê½ğºóµ½ÕâÀï
function SignUpFinalx( )
--	if (GetCash() < V) then 
--		ErrorMsg(6)
--		return
--	end;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	ms_state = GetMissionV(MS_STATE);
	if (ms_state ~= 1) then
		SubWorld = OldSubWorld
		ErrorMsg(9)
		return
	end

--	Pay(V);		--½»¶Ä×¢
--	nSel = GetTask(DUZHU) - 1;	--Ñ¡ÔñµÄÊÇÄÄ·½ÄØ£¿
--	V1 = GetMissionV(BW_MONEY1 + nSel) + V;		--¶Ä×¢¼Óµ½Ñ¡ÔñµÄÈËÉíÉÏ
--	SetMissionV(BW_MONEY1 + nSel, V1);		
--	SetTask(DUZHU+1,V);
	SetTask(DUZHU+2,GetMissionV(BW_KEY));		--±ê¼Ç£¬ÊÇ¹Û¿´±¾´Î±ÈÈü
	
	--ÏŞÖÆ¹ÛÖÚÈËÊıÎª100ÈË
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","Xin lçi! Sè ng­êi xem trong tr­êng ®Êu ®· ®ñ <color=yellow>100 ng­êi<color>, xin h·y ®îi trËn thi ®Êu sau vËy");
		SubWorld=OldSubWorld;
		return
	end
	
	JoinCamp(3);
	SubWorld = OldSubWorld;

end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;

	if (GetName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
	
end;

function OnFighting()
	str = "HiÖn t¹i "..GetMissionS(1).." cïng víi  "..GetMissionS(2).."  ®ang tiÕn hµnh thi ®Êu l«i ®µi!";
	Say(str, 2, "Ta muèn vµo xem thi ®Êu./OnLooking", "Ta kh«ng muèn vµo ®©u./OnCancel");
end;

function OnCancel()
    SetTaskTemp(JOINROOMINDEX,0);
end;

function OnCancel_Talk()

end;

------------------------------------------------¶àÈËÀŞÌ¨²¿·Öº¯Êı-------------------------------------

--Ñ¡Ôñ²ÎÈü»òÕß¹ÛÕ½»òÕß¿ª¾Ö
function RequestGame(nMapIndex)

local nMapState = 0;
local str = "";

	--ÒÑ¾­Ô¤¶©ÁËµ¥ÈËÀŞÌ¨µÄÍæ¼Ò¸øÓèÍ¨Öª²¢²»ÔÊĞí½øÈëÈü³¡	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ng­¬i ®· ®¨ng kı trËn ®Şa §¬n nh©n l«i ®µi, kh«ng thÓ vµo QuÇn hïng chiÕn.",0)
		return
	end

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[QuÇn hïng chiÕn]Khi RequestGame SubWorld b¸o lçi, b¸o lçi nMapIndex lµ"..nMapIndex..", SubWorld lµ"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	nGameType = GetMissionV(GAME_TYPE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		if IsHundredBattleState() == 0 then
			Say("L«i ®µi nµy ch­a cã ng­êi ®¨ng kı. Ng­¬i muèn ®¨ng kı trËn ®Şa kh«ng?",
					2,
					"§¨ng kı/#OpenMultiRoom("..nMapIndex..")",
					"Rêi khái/OnCancel_Talk"
			)
		else
			Say("Xin lçi, l«i ®µi lÇn nµy ®· kÕt thóc, h·y chän l¹i b¶n ®å lÇn n÷a.",0)
		end
		
	elseif nMapState == 1 then
		if nGameType == 1  then
			str = "TuyÓn thñ tham gia <color=yellow>trËn thø 1<color> QuÇn hïng chiÕn cã thÓ b¸o danh thi ®Êu miÔn phİ. Thi ®Êu kÕt thóc, ng­êi tham dù ®Òu nhËn ®­îc <color=yellow>®iÓm søc kháe vµ phÇn th­ëng kh¸c<color>. Ch¼ng hay c¸c h¹ cã muèn tham gia?";
		elseif nGameType == 2 then
			str = "TuyÓn thñ tham gia <color=yellow>trËn thø 2<color> QuÇn hïng chiÕn ph¶i nép <color=yellow>2 l­îng<color> phİ b¸o danh thi ®Êu. Sè ng­êi thi ®Êu tèi ®a lµ <color=yellow>100 ng­êi<color>. TuyÓn thñ chiÕn th¾ng cuèi cïng cã thÓ nhËn ®­îc phÇn th­ëng tiÒn phong phó. Ch¼ng hay c¸c h¹ cã muèn tham gia?";
		else
			str = "TrËn ®Şa thi ®Êu nµy ch­a b¾t ®Çu. Ng­¬i muèn vµo xem hay tham gia thi ®Êu?";
		end
		Say(str,
				3,
				"Tham gia tû vâ/#SelectMultiRoom("..nMapIndex..")",
				"Vµo xem thi ®Êu/#View_Game("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
		)
		
	elseif nMapState == 2 then
	
		Say("TrËn ®Şa thi ®Êu l«i ®µi nµy ®· b¾t ®Çu. Ng­¬i muèn vµo xem kh«ng?",
				2,
				"Vµo xem thi ®Êu/#View_Game("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
		)
	end

end

--¿ªÊ¼Ò»¸ö¶àÈËÀŞÌ¨±ÈÈü·¿¼ä
function OpenMultiRoom(nMapIndex)

local i = 0;
local BookedTab = {};
local nNpcIndex = 0;
local nMapState = 0;
local nMapID = GetWorldPos();
local str_news = "";

	--²é¿´µ±Ç°³¡µØÔ¤¶©Çé¿ö
	for i=1,getn(MultiMapTab) do
		if nMapID == MultiMapTab[i][2] and nMapIndex ~= i then
			OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(MultiMapTab[i][1]);
			if SubWorld <= 0 then
				WriteLog("[QuÇn hïng chiÕn]Khi OpenMultiRoom SubWorld b¸o lçi. B¸o lçi nMapIndex lµ"..nMapIndex..", SubWorld lµ"..SubWorld..".");
				SubWorld = OldSubWorld;
				return 0
			end			
			nMapState = GetMissionV(MULTIMAP_STATE);
			SubWorld = OldSubWorld
			if nMapState ~= 0 then
				tinsert(BookedTab,i)
			end
		end
	end
	
	--ÅĞ¶ÏÒÑ¾­Ô¤¶¨µÄ³¡µØÊÇ·ñ´ïµ½·¿¼ä×î´óÊıÁ¿
	if getn(BookedTab) > MAX_MULTIMAP_NUM then
		Say("Xin lçi! TrËn ®Şa nµy ®· ®­îc ng­êi kh¸c ®Æt tr­íc! Xin chän trËn ®Şa kh¸c!",0)
		return
	elseif	getn(BookedTab) == MAX_MULTIMAP_NUM then
		nMapIndex = BookedTab[random(1,getn(BookedTab))]
	end
	
	--ÅĞ¶ÏÊÇ·ñ·ûºÏ±ÈÈü×Ê¸ñ
	if JoinConditionCheck(1) == 0 then		
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[QuÇn hïng chiÕn]Khi OpenMultiRoom SubWorld b¸o lçi. B¸o lçi nMapIndex lµ"..nMapIndex..", SubWorld lµ"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1])
  	OpenMission(MULIT_MISSION_ID);--¿ªÆôÒ»¸ö³¡µØ
  	nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","§¹i Chİ C­êng",MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][6],MultiMapTab[nMapIndex][7]);--Ìí¼ÓÒ»¸ö´«ËÍ³ö³¡µØÓÃµÄNpc
  	SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\multimap_npc.lua")
  	SetMissionV(MULTIMAP_NPC_INDEX,nNpcIndex);
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--¼ÓÈëÕóĞÍ
		SetPlayerState(1,1);--ÉèÖÃ×¼±¸×´Ì¬
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
		SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
		StartMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1, MULTI_TIMER_1);
		str_news = GetPlayerInfo(PlayerIndex)..GetName().."®ang ë"..MultiMapTab[nMapIndex][9].."L«i ®µi s¾p xÕp QuÇn hïng chiÕn. Mêi c¸c anh hïng tham gia thİ luyÖn!",
		Msg2Global(str_news);
	
	elseif nMapState == 1 then
		Say("Xin lçi! TrËn ®Şa nµy ®· ®­îc ng­êi kh¸c ®Æt tr­íc! Ng­¬i muèn vµo xem hay tham gia thi ®Êu?",
				3,
				"Tham gia tû vâ/#SelectMultiRoom("..nMapIndex..")",
				"Vµo xem thi ®Êu/#View_Game("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
		)
		
	elseif nMapState == 2 then
		Say("L«i ®µi ®ang tiÕn hµnh thi ®Êu! Ng­¬i cã thÓ vµo xem!",
				2,
				"Vµo xem thi ®Êu/#View_Game("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
		)
	end
	
end

--Ñ¡Ôñ½øÈë¶àÈËÀŞÌ¨³¡µØ
function SelectMultiRoom(nMapIndex)

local nTotalFigtherNum = 0;
local nTotalAudicnceNum = 0;
local nGameType = 0;

	OldSubWorld = SubWorld;
  SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
  
  if SubWorld <= 0 then
		WriteLog("[QuÇn hïng chiÕn]Khi SelectMultiRoom SubWorld b¸o lçi. B¸o lçi nMapIndex lµ"..nMapIndex..", SubWorld lµ"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
  
  nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
  nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
  nGameType = GetMissionV(GAME_TYPE); 
  SubWorld = OldSubWorld
  
  --±ÈÈüÈËÔ±ÉĞÎ´ÂúÔ±
	if nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
			JoinMultiMap(nMapIndex)
	--¹ÛÕ½ÈËÔ±ÉĞÎ´ÂúÔ±
	elseif nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("Sè ng­êi tham gia thi ®Êu ®· ®¹t møc tèi ®a. Ng­¬i cã thÓ vµo xem thi ®Êu!",
		2,
		"Vµo xem thi ®Êu/#View_Game("..nMapIndex..")",
		"Rêi khái/OnCancel_Talk"
		)
	else
		Say("Xin lçi! Sè ng­êi trong trËn ®Şa ®· ®ñ! Sau nµy h·y tíi nhĞ!",0)
	end
	
end

--½øÈë¶àÈËÀŞÌ¨³¡µØ
function JoinMultiMap(nMapIndex)

local news_str = "";
local nMapState = 0;
local nTotalFigtherNum = 0;
local nTotalAudicnceNum = 0;
local nGameType = 0;

	OldSubWorld = SubWorld;
  SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
  
  if SubWorld <= 0 then
		WriteLog("[QuÇn hïng chiÕn]Khi JoinMultiMap SubWorld b¸o lçi. B¸o lçi nMapIndex lµ"..nMapIndex..", SubWorld lµ"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
  
  nMapState = GetMissionV(MULTIMAP_STATE);
  nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
  nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
  nGameType = GetMissionV(GAME_TYPE)
		
	if nMapState == 1 and nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
		--°ÙÈË´óÀŞÈë³¡·ÑÓÃÅĞ¶Ï
		if nGameType == 1 then
			--ÅĞ¶ÏÊÇ·ñ·ûºÏ±ÈÈü×Ê¸ñ
			if JoinConditionCheck(2) == 0 then		
				return
			end
		elseif nGameType == 2 then
			if Pay(HUNDRED_MONEY) ~= 1 then
				Say("Tham gia trËn thø 2 QuÇn hïng chiÕn cÇn nép <color=yellow>2 l­îng<color> phİ b¸o danh. Ng­¬i kh«ng mang ®ñ tiÒn!",0)
				return
			else
				SetMissionV(MULTIMAP_BONUS,GetMissionV(MULTIMAP_BONUS)+HUNDRED_MONEY)
				--WriteLog("[¶àÈËÀŞÌ¨] Íæ¼Ò "..GetName().." ½øÈë±ÈÈü£¬Ä¿Ç°Èë³¡·ÑÓÃÀÛ¼ÆÎª£º"..GetMissionV(MULTIMAP_BONUS).." ÕÊºÅÊÇ"..GetAccount());
			end
		--ÅĞ¶ÏÊÇ·ñ·ûºÏ±ÈÈü×Ê¸ñ
		elseif JoinConditionCheck(1) == 0 then		
			return
		end
		
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		SetPlayerState(1,1);--ÉèÖÃ×¼±¸×´Ì¬
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--¼ÓÈëÕóĞÍ
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
		SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
		news_str = GetPlayerInfo(PlayerIndex)..GetName().."§· vµo L«i ®µi. HiÖn sè ng­êi lµ"..GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP).." ng­êi."
		Msg2MSAll(MULIT_MISSION_ID,news_str);
	elseif nTotalFigtherNum >= MAX_MULTIMAP_FIGTHER_NUM and nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("Sè ng­êi tham gia thi ®Êu ®· ®¹t møc tèi ®a. Ng­¬i cã thÓ vµo xem thi ®Êu!",
		2,
		"Vµo xem thi ®Êu/#View_Game("..nMapIndex..")",
		"Rêi khái/OnCancel_Talk"
		)
	else
		Say("Xin lçi! Sè ng­êi trong trËn ®Şa ®· ®ñ! Sau nµy h·y tíi nhĞ!",0)
	end

	SubWorld = OldSubWorld
	
end

--°ÙÈË´óÀŞ±ÈÈü³¡µØ³ï±¸ÖĞ¶Ô»°
function MapPreparingTalk()

local nHour = GetLocalTime()

	if nHour >= 10 and nHour <= 12 then
		Say("Xin lçi! TrËn ®Şa ®ang chuÈn bŞ. <color=yellow>TrËn thø 1<color> QuÇn hïng chiÕn b¾t ®Çu b¸o danh vµo <color=yellow>11:00<color>; <color=yellow>TrËn thø 2<color> b¾t ®Çu b¸o danh vµo<color=yellow>11:30<color>.",0)
	elseif nHour >= 16 and nHour <= 18 then
		Say("Xin lçi! TrËn ®Şa ®ang chuÈn bŞ. <color=yellow>TrËn thø 1<color> QuÇn hïng chiÕn b¾t ®Çu b¸o danh vµo <color=yellow>17:00<color>; <color=yellow>TrËn thø 2<color> b¾t ®Çu b¸o danh vµo <color=yellow>17:30<color>.",0)
	elseif nHour >= 20 and nHour <= 22 then
		Say("Xin lçi! TrËn ®Şa ®ang chuÈn bŞ. <color=yellow>TrËn thø 1<color> QuÇn hïng chiÕn b¾t ®Çu b¸o danh vµo <color=yellow>21:00<color>; <color=yellow>TrËn thø 2<color> b¾t ®Çu b¸o danh vµo <color=yellow>21:30<color>.",0)
	end
end

--²Î¼Ó±ÈÈüÌõ¼şÅĞ¶Ï
--²ÎÊı£ºnType 1¡¢ÆÕÍ¨¶àÈËÀŞÌ¨£»2¡¢°ÙÈËÓ¢ĞÛ´óÀŞ£»3¡¢ÆÕÍ¨×é¶Ó»ìÕ½ÀŞÌ¨£»4¡¢ÍÅ¶Ó¼¤Õ½´óÀŞ

function JoinConditionCheck(nType)

	if nType == 1 then
		if GetLevel() <10 or GetPlayerRoute() == 0 then
			Say("§¼ng cÊp tham gia QuÇn hïng chiÕn th«ng th­êng ph¶i ®¹t <color=yellow>cÊp 10 trë lªn<color> vµ lµ nh©n vËt <color=yellow>®· gia nhËp m«n ph¸i<color>.",0);
			return 0 
		else
			return 1
		end
	end
	
	if nType == 2 then
		if GetLevel() <60 or GetPlayerRoute() == 0 then
			Say("§¼ng cÊp tham gia QuÇn hïng chiÕn th«ng th­êng ph¶i ®¹t <color=yellow>cÊp 60 trë lªn<color> vµ lµ nh©n vËt <color=yellow>®· gia nhËp m«n ph¸i<color>.",0);
			return 0
		else
			return 1
		end
	end
	
end

--±ÈÈü¹æÔòËµÃ÷Ñ¡Ïî
function GameRuleTalk()

	Say("H·y chän t×m hiÓu quy t¾c l«i ®µi t­¬ng quan!",
	5,
	"§¬n ®Êu L«i ®µi/#GameRule(1)",
	"Tæ ®éi ®èi chiÕn L«i ®µi/#GameRule(2)",
	"Hçn chiÕn ®¬n ®Êu L«i ®µi/#GameRule(3)",
	"Tæ ®éi hçn chiÕn l«i ®µi/#GameRule(4)",
	"Tho¸t/OnCancel_Talk"
	)
end

function GameRule(nType)

local strTalk = {};
	
	if nType == 1 then
		OnHelp();
	elseif nType == 2 then
		strTalk = {
			"L«i ®µi Tæ ®éi tû vâ lµ n¬i c¸c §¹i hiÖp cao thñ trong giang hå tæ ®éi thİ luyÖn vâ nghÖ, ph©n tµi cao thÊp víi nhau. L«i ®µi lµ trËn ®Şa c«ng b»ng cho hai phe thi ®Êu!",	
			"Muèn tiÕn hµnh tû vâ l«i ®µi, tr­íc tiªn cÇn ®¨ng kı víi ta. §iÒu kiÖn cÇn 2 ng­êi trë lªn ®· gia nhËp m«n ph¸i ®­îc §éi tr­ëng yªu cÇu!",	
			"Sau khi ®¨ng kı thµnh c«ng, phe ®¨ng kı vµo ®Êu tr­êng ®îi ®éi ngò kh¸c khiªu chiÕn!",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk)
	elseif nType == 3 then
		Rule_Multi();
	elseif nType == 4 then
		strTalk = {
			"Tæ ®éi hçn chiÕn l«i ®µi lµ trËn ®Şa tû vâ cña 2 ®éi ngò trë lªn. C¸c ®éi ®­îc tù m×nh lµm chñ. Tæ ®éi dòng c¶m chiÕn ®Êu ®Õn cïng lµ phe giµnh chiÕn th¾ng!",
			"L«i ®µi thİ luyÖn tû vâ lÇn nµy theo h×nh thøc tæ ®éi 1 ®èi 1. Ngoµi viÖc thÈm nghiÖm c«ng lùc b¶n th©n cßn cÇn n¾m b¾t thay ®æi cña trËn ®Şa, ®èi thñ m¹nh yÕu vµ s¸ch l­îc kh¸c nhau ®Ó giµnh th¾ng lîi chung cuéc. NÕu c¸c h¹ kh«ng t×m ®­îc ®èi thñ t­¬ng xøng, sao kh«ng thö tham gia QuÇn hïng chiÕn?",
			"QuÇn hïng chiÕn cho phĞp §éi ngò cã 2 ng­êi trë lªn ®¹t cÊp 10 trë lªn ®· gia nhËp m«n ph¸i tham gia miÔn phİ. §­¬ng nhiªn, ng­êi chiÕn th¾ng còng kh«ng ®­îc nhËn bÊt cø phÇn th­ëng nµo. Sau khi ®¨ng kı thµnh c«ng, thêi gian chuÈn bŞ lµ 3 phót. NÕu sè ®éi trong trËn ®Şa İt h¬n 2 ®éi, thi ®Êu sÏ bŞ hñy bá!",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk);
	end
end

function GameRule_1(nType)

local strTalk = {}; 

	if nType == 2 then
		strTalk = {
			"Phe ®¨ng kı ®· vµo ®Êu tr­êng mêi phe khiªu chiÕn tû vâ, thi ®Êu míi chİnh thøc b¾t ®Çu. Hai phe tham chiÕn cã thêi gian chuÈn bŞ thi ®Êu lµ 3 phót!",
			"Sau 3 phót, thi ®Êu sÏ b¾t ®Çu. Thêi gian thi ®Êu lµ 15 phót. Trong vßng 15 phót ch­a tiªu diÖt hÕt ®èi ph­¬ng, thi ®Êu sÏ ®­îc xö hßa.",	                                                      
			"Ngoµi ra, ®éi tr­ëng bŞ rít m¹ng hoÆc vÒ thµnh khi ®ang trong giai ®o¹n thi ®Êu, ®éi m×nh sÏ bŞ xö thua!",                                                     
			}
	elseif nType == 4 then
		strTalk = {
			"Mçi trËn, sè ®éi tham chiÕn tèi ®a lµ 10 ®éi, thêi gian thi ®Êu lµ 15 phót. NÕu thêi gian kÕt thóc, sè ®éi thi ®Êu cßn l¹i h¬n 1 ®éi sÏ lÊy sè tuyÓn thñ cña ®éi ngò bŞ tiªu diÖt İt nhiÒu ®Ó quyÕt ®Şnh phe chiÕn th¾ng!",
			"Ngoµi ra, ®éi tr­ëng bŞ rít m¹ng hoÆc vÒ thµnh khi ®ang trong giai ®o¹n thi ®Êu, ®éi m×nh sÏ bŞ xö thua!",
--			"ÀŞÌ¨ÀÏ°å£º³ıÁËÒ»°ãÊ±¶ÎÄÚ¿ªÉèµÄ×é¶Ó»ìÕ½ÀŞÌ¨³¡µØÍâ£¬{³É¶¼}»¹ÔÚÌØ¶¨µÄÊ±¼ä¾Ù°ì{ÍÅ¶Ó¼¤Õ½´óÀŞ}¡£Ê±¼ä·Ö±ğÎª {ÔçÉÏ12:00}¡¢{12:30}£¬{ÏÂÎç18:00}¡¢{18:30}ºÍ{ÍíÉÏ23:00}¡¢{23:30}¡£",
			}
	end
	
	TalkEx("#GameRule_2("..nType..")",strTalk);
end

function GameRule_2(nType)

local strTalk = {};

	if nType == 4 then
		strTalk = {
			"§éi chiÕn yªu cÇu ®éi ngò cã 2 ng­êi trë lªn ®¹t cÊp 60 trë lªn ®· gia nhËp m«n ph¸i. Mçi tuyÓn thñ tham gia trËn thi ®Êu thø 1 tïy ı trong 3 thêi ®iÓm ®Òu cã thÓ nhËn ®­îc phÇn th­ëng nhÊt ®Şnh (mçi ngµy chØ cã thÓ nhËn ®­îc 1 lÇn); §Õn trËn thi ®Êu thø 2, yªu cÇu §éi tr­ëng nép 10 l­îng phİ vµo trËn. §­¬ng nhiªn, ®éi ngò chiÕn th¾ng sÏ nhËn ®­îc phÇn th­ëng vµ tiÒn phong phó.",
			"Hy väng lÇn nµy ®­îc chøng kiÕn b¶n lÜnh cña ®¹i hiÖp!",
			}
		TalkEx("",strTalk);
	end
end

--¶àÈËÀŞÌ¨¹æÔòËµÃ÷
function Rule_Multi()

local strTalk = {
	"Hçn chiÕn ®¬n ®Êu L«i ®µi lµ trËn ®Şa thİ luyÖn tû vâ cña 2 hoÆc nhiÒu h¬n c¸c giang hå hiÖp kh¸ch. Mçi ®Êu thñ tham chiÕn sÏ tù m×nh lµm chñ. §Êu thñ m¹nh mÏ chiÕn ®Êu ®Õn cuèi cïng sÏ lµ ng­êi chiÕn th¾ng!",
	"Hçn chiÕn ®¬n ®Êu L«i ®µi lÇn nµy theo h×nh thøc tû vâ 1 ®èi 1. Ngoµi viÖc thÈm nghiÖm c«ng lùc b¶n th©n cßn cÇn n¾m b¾t thay ®æi cña trËn ®Şa, ®èi thñ m¹nh yÕu vµ s¸ch l­îc kh¸c nhau ®Ó giµnh th¾ng lîi chung cuéc. NÕu c¸c h¹ kh«ng t×m ®­îc ®èi thñ t­¬ng xøng, sao kh«ng thö tham gia vµo trËn QuÇn hïng chiÕn?",
	"Hçn chiÕn ®¬n ®Êu L«i ®µi cho phĞp hiÖp kh¸ch giang hå tõ cÊp 10 trë lªn ®· gia nhËp m«n ph¸i tham gia miÔn phİ. §­¬ng nhiªn, ng­êi chiÕn th¾ng còng kh«ng ®­îc nhËn bÊt cø phÇn th­ëng nµo. Sau khi ®¨ng kı thµnh c«ng, thêi gian chuÈn bŞ lµ 3 phót. NÕu sè ng­êi tham chiÕn trong trËn ®Şa İt h¬n 1 ng­êi, thi ®Êu sÏ bŞ hñy bá!",
	}

	TalkEx("Rule_Multi_1",strTalk)

end

function Rule_Multi_1()

local strTalk = {
	"Mçi trËn, sè ng­êi tham chiÕn tèi ®a lµ 100 ng­êi, thêi thi ®Êu lµ 15phót. Khi thêi gian kÕt thóc, ®Êu thñ tham chiÕn cßn l¹i İt h¬n 1 ng­êi sÏ lÊy tiªu chİ sè ng­êi tham chiÕn nhiÒu İt ®Ó quyÕt ®Şnh phe chiÕn th¾ng.",
--	"ÀŞÌ¨ÀÏ°å£º³ıÁËÒ»°ãÊ±¶ÎÄÚ¿ªÉèµÄÆÕÍ¨µ¥ÈË»ìÕ½ÀŞÌ¨ÈüÍâ£¬{³É¶¼}»¹ÔÚÌØ¶¨µÄÊ±¼ä¾Ù°ì{°ÙÈËÓ¢ĞÛ´óÀŞ}¡£Ê±¼ä·Ö±ğÎª {ÔçÉÏ11:00}¡¢{11:30}£¬{ÏÂÎç17:00}¡¢{17:30}ºÍ{ÍíÉÏ21:00}¡¢{21:30}¡£",
--	"ÀŞÌ¨ÀÏ°å£º{°ÙÈËÓ¢ĞÛ´óÀŞ}ÔòĞèÒªÂú{60¼¶¼°ÒÔÉÏÒÑÓĞÁ÷ÅÉ}µÄ½­ºşÏÀÊ¿²Î¼Ó£¬·²²Î¼Ó{Èı¸öÊ±¶ÎÄÚÈÎÒâµÚÒ»³¡±ÈÈü}µÄ¸÷Î»¾ù»á»ñµÃÒ»¶¨µÄ½±Àø£¨Ã¿ÌìÖ»ÄÜ»ñµÃÒ»´Î£©£»ÖÁÓÚµÚ¶ş³¡±ÈÈüĞèÒª½»ÄÉ{2½ğ}×÷ÎªÈë³¡·Ñ£¬µ±È»Ê¤³öÕß½«»á»ñµÃ¸ü¼Ó·áºñ½±½ğ¡£",
--	"ÀŞÌ¨ÀÏ°å£ºÏ£Íû½ìÊ±ÄÜÔÚÀŞÌ¨ÉÏÒ»¶Ã´óÏÀÄãµÄ·ç²É¡£",
	}

	TalkEx("",strTalk)
	
end

---------------¶àÈË×é¶Óµ¥ÌôÀŞÌ¨---------------------
function OpenSingleTeamRoomRequest(nMapIndex)

	Say("TrËn ®Şa nµy ch­a cã thi ®Êu. Ng­¬i cã muèn ®¨ng kı vµ xin chuyÓn vµo ®Êu tr­êng kh«ng?",
			2,
			"§¨ng kı/#OpenSingleTeamRoom("..nMapIndex..")",
			"Rêi khái/OnCancel_Talk"
			)

end

---------------µ¥Ìô»ò×é¶ÓÑº½ğÀŞÌ¨---------------------
function OpenSingleTeamRoomRequestYJ(nMapIndex)

	Say("<color=green>Chñ l«i ®µi<color>: vâ ®µi n÷a ch­a ®¨ng kı thi ®Êu, c¸c h¹ cã muèn ®Æt c­îc vµ chuyÓn vµo l«i ®µi?",
			2,
			"§Æt c­îc khiªu chiÕn (Gi¶i ®Æt c­îc)/#OpenSingleTeamRoomYJ("..nMapIndex..")",
			"Rêi khái/OnCancel_Talk"
			)

end

--¿ªÆôÒ»¸ö×é¶Óµ¥ÌôÀŞÌ¨·¿¼ä
function OpenSingleTeamRoom(nMapIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nMapState = 0;
	local nTeamSize = 0;
	local strSay = "";
	local nCaptainName = "";

	--ÒÑ¾­Ô¤¶©ÁËµ¥ÈËÀŞÌ¨µÄÍæ¼Ò¸øÓèÍ¨Öª²¢²»ÔÊĞí½øÈëÈü³¡	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ng­¬i ®· ®¨ng kı trËn ®Şa ®¬n nh©n l«i ®µi, kh«ng thÓ vµo l«i ®µi kh¸c!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);
		--ÅĞ¶ÏÊÇ²»ÊÇÑº½ğÀŞÌ¨£¬ÊÇµÄ¾Í²»ÈÃ½ø
		local nTag = GetMissionV(MS_YAJING_NUM);
		if nTag ~= 0 then
			Talk(1,"","<color=green>Chñ l«i ®µi<color>: §©y lµ l«i ®µi ®Æt c­îc kh«ng ®­îc phĞp vµo!");
			return
		end
		--ÉĞÎ´ÓĞ±ÈÈü
		if nMapState == 0 then
			--ÅĞ¶ÏÊÇ·ñ·ûºÏ±ÈÎä×Ê¸ñ
			if HaveSingleTemaGameTitle() == 1 then
				OpenMission(SINGLE_TEAM_MISSION_ID);
  			OldPlayer = PlayerIndex; 			
  			for i=1,gf_GetTeamSize() do
  				PlayerIndex = gf_GetTeamMember(i);
  				if PlayerIndex > 0 then
  					CleanInteractive();
  					x,y,z = GetWorldPos();
						SetTask(MS_POS,x);
						SetTask(MS_POS+1,y);
						SetTask(MS_POS+2,z);
  					NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
  					SCCheckOfflineExp(4)
						AddMSPlayer(SINGLE_TEAM_MISSION_ID,1);--¼ÓÈëÕóÓª
						SetPlayerState(1,1,2);--ÉèÖÃ×¼±¸×´Ì¬
						SetTaskTemp(PLAYER_CAMP,1);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
						SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
					end
  			end
  			PlayerIndex = OldPlayer;
  			--SetMissionV(TEAM_GAME_STATE,1); 			
  			SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
  			SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0)); 			
				--StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);		
			end
		--±ÈÈüÒÑ¾­¿ªÊ¼»òÁ½Ö§¶ÓÎéÒÑÔÚ×¼±¸ÖĞ	
		elseif nMapState == 2 or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0) then
			Say("TrËn ®Şa nµy ®· b¾t ®Çu thi ®Êu, ®éi ngò hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> vµ <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> dÉn d¾t. Cã muèn vµo trËn ®Şa nµy xem thi ®Êu?",
			2,
			"Xem thi ®Êu/#RequestViewSingleTeamGame("..nMapIndex..")",
			"Rêi khái/OnCancel_Talk"
			)
		--±ÈÈüÉĞÎ´¿ªÊ¼
		elseif nMapState == 1 and (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 ) or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 ) then
			OldPlayer = PlayerIndex;
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				nCaptainName = gf_GetCaptainName();
				nTeamSize = gf_GetTeamSize();
			end
			PlayerIndex = OldPlayer;
			Say("Cã ph¶i ng­¬i muèn chän <color=yellow>"..nCaptainName.."<color> dÉn d¾t (gåm cã"..nTeamSize.." ng­êi) mêi tû vâ hoÆc vµo ®Êu tr­êng xem thi ®Êu?",
				3,
				"Göi lêi khiªu chiÕn/#RequestGame2Captian("..nMapIndex..")",
				"Xem thi ®Êu/#RequestViewSingleTeamGame("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
				)
		elseif nMapState == 3 then
			GameOverTalk();
		end
	end
	
	SubWorld = OldWorld;
	
end

--¿ªÆôÒ»¸öµ¥Ìô»ò×é¶ÓµÄÑº½ğÀŞÌ¨·¿¼ä
function OpenSingleTeamRoomYJ(nMapIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nMapState = 0;
	local nTeamSize = 0;
	local strSay = "";
	local nCaptainName = "";
	
	--Ê¹ÓÃÁÙÊ±ÈÎÎñ±äÁ¿¼ÇÂ¼Ñ¡ÔñµÄ·¿¼ä
	SetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI, nMapIndex);
	
	--ÒÑ¾­Ô¤¶©ÁËµ¥ÈËÀŞÌ¨µÄÍæ¼Ò¸øÓèÍ¨Öª²¢²»ÔÊĞí½øÈëÈü³¡	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ng­¬i ®· ®¨ng kı trËn ®Şa ®¬n nh©n l«i ®µi, kh«ng thÓ vµo l«i ®µi kh¸c!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);
		--ÉĞÎ´ÓĞ±ÈÈü
		if nMapState == 0 then
			--ÅĞ¶ÏÊÇ·ñ·ûºÏ±ÈÎä×Ê¸ñ
			if HaveSingleTemaGameTitleYJ() == 1 then
					AskClientForNumber("AskSingleTeamYJNum",100,5000,"NhËp sè l­îng vµng c­îc","")
			end
		--±ÈÈüÒÑ¾­¿ªÊ¼»òÁ½Ö§¶ÓÎéÒÑÔÚ×¼±¸ÖĞ	
		elseif nMapState == 2 or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0) then
			Say("<color=green>Chñ l«i ®µi<color>: tû vâ trªn l«i ®µi nµy ®· b¾t ®Çu, thµnh viªn bao gåm <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> vµ <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color>, c¸c h¹ muèn vµo quan chiÕn?",
			2,
			"Quan chiÕn (gi¶i ®Æt c­îc)/#RequestViewSingleTeamGame("..nMapIndex..")",
			"Rêi khái/OnCancel_Talk"
			)
		--±ÈÈüÉĞÎ´¿ªÊ¼
		elseif nMapState == 1 and (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 ) or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 ) then
			local nTag = GetMissionV(MS_YAJING_NUM);
			if nTag <= 0 then
				Talk(1,"","<color=green>Chñ l«i ®µi<color>: §©y lµ l«i ®µi tæ ®éi, kh«ng thÓ th«ng qua l«i ®µi ®Æt c­îc mµ vµo.");
				return
			end
			if HaveSingleTemaGameTitleYJ() == 1 then
				OldPlayer = PlayerIndex;
				PlayerIndex = GetMissionV(CAPTAIN_ID);
				if PlayerIndex > 0 then
					nCaptainName = gf_GetCaptainName();
					nTeamSize = gf_GetTeamSize();
				end
				PlayerIndex = OldPlayer;
				Say("Cã ph¶i ng­¬i muèn chän <color=yellow>"..nCaptainName.."<color> dÉn d¾t (gåm cã"..nTeamSize.."ng­êi) ®¨ng kı khiªu chiÕn hoÆc vµo ®Êu tr­êng quan chiÕn? <color=red>Vµng c­îc khiªu chiÕn lµ:"..GetMissionV(MS_YAJING_NUM).."J<color>",
					3,
					"Khiªu chiÕn (Gi¶i ®Æt c­îc)/#RequestGame2CaptianYJ("..nMapIndex..")",
					"Quan chiÕn (gi¶i ®Æt c­îc)/#RequestViewSingleTeamGame("..nMapIndex..")",
					"Rêi khái/OnCancel_Talk"
					)
			end
		elseif nMapState == 3 then
			GameOverTalk();
		end
	end
	
	SubWorld = OldWorld;
	
end

--Ñº½ğÀŞÌ¨±¨Ãû
function AskSingleTeamYJNum(num)
		--Ñº½ğÊıÄ¿¼ì²â
		if num < 100 or num > 5000 then
			Talk(1,"","<color=green>Chñ l«i ®µi<color>: vµng ®Æt c­îc trong ph¹m vi 100-5000 vµng, v­ît qu¸ hoÆc İt h¬n ta kh«ng xö lı.");
			return 0;
		end
		
		local nMapIndex = GetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI);
		OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		
		--¶ş´ÎÅĞ¶Ï
		if GetMissionV(TEAM_GAME_STATE) ~= 0 or GetMissionV(MS_YAJING_NUM) > 0 then
			Talk(1,"","<color=green>Chñ l«i ®µi<color>: ®· cã ng­êi ®¨ng kı tr­íc råi, c¸c h¹ kh«ng thÓ khiªu chiÕn l«i ®µi nµy n÷a")
			return 0;
		end
		
		if Pay(num * 10000) == 1 then
			gf_WriteLogEx("L«i ®µi ®Æt c­îc","Chi tr¶ vµng c­îc",num," Kim ","",GetTongName(),"","","","");
			OpenMission(SINGLE_TEAM_MISSION_ID);
			local OldPlayer = PlayerIndex;
			for i=1, gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					CleanInteractive();
					x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
					NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
					SCCheckOfflineExp(4)
					AddMSPlayer(SINGLE_TEAM_MISSION_ID,1);--¼ÓÈëÕóÓª
					SetPlayerState(1,1,2);--ÉèÖÃ×¼±¸×´Ì¬
					SetTaskTemp(PLAYER_CAMP,1);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
					SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
					SetCreateTeam(1); --¹Ø±Õ×é¶Ó¹¦ÄÜ
				end
  			end
  			PlayerIndex = OldPlayer;
			--SetMissionV(TEAM_GAME_STATE,1); 			
			SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
			SetMissionV(CAPTAIN_ID, gf_GetTeamMember(0)); 			
			--StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);
			--ÉèÖÃÑº½ğÊıÄ¿
			SetMissionV(MS_YAJING_NUM, num);
		else
			Talk(1,"","<color=green>Chñ l«i ®µi<color>: vµng kh«ng ®ñ, ®Æt c­îc thÊt b¹i.")
		end
end

function RequestGame2Captian(nMapIndex)

local nMapState = 0;
local strSay = "";
local nTeamNum = 0;
local nCaptainName = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);		
		--ÉĞÎ´ÓĞ±ÈÈü
		if nMapState == 0 then
			Say("TrËn ®Şa nµy ch­a cã thi ®Êu. Ng­¬i cã muèn ®¨ng kı vµ xin chuyÓn vµo ®Êu tr­êng kh«ng?",
				2,
				"§¨ng kı/#OpenSingleTeamRoom("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
				)		
		--±ÈÈüÒÑ¾­¿ªÊ¼»òÁ½Ö§¶ÓÎéÒÑÔÚ×¼±¸ÖĞ		
		elseif nMapState >= 2 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			Say("TrËn ®Şa nµy ®· b¾t ®Çu thi ®Êu, ®éi ngò hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> vµ <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> dÉn d¾t. Cã muèn vµo trËn ®Şa nµy xem thi ®Êu?",
				2,
				"Xem thi ®Êu/#RequestViewSingleTeamGame("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
				)
		--±ÈÈüÉĞÎ´¿ªÊ¼
		elseif nMapState == 1 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			if HaveSingleTemaGameTitle() == 1 then
				--if GetMissionS(CAPTAIN_NAME) == "" then
					--nCaptainName = GetMissionS(CAPTAIN_NAME+1);
				--else
					nCaptainName = GetMissionS(CAPTAIN_NAME);
				--end
				Talk(1,"","B¹n ®· göi lêi thØnh cÇu tû vâ ®Õn ®éi"..nCaptainName..", h·y kiªn nhÉn chê ®îi ®èi ph­¬ng tr¶ lêi!");
				SendChallenge2Captain(nMapIndex,PlayerIndex,gf_GetTeamSize());
			end
		end 
	end

	SubWorld = OldWorld;

end

--Ñº½ğÀŞÌ¨
function RequestGame2CaptianYJ(nMapIndex)

	local nMapState = 0;
	local strSay = "";
	local nTeamNum = 0;
	local nCaptainName = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);	
		local nTag = GetMissionV(MS_YAJING_NUM);
		if nTag <= 0 then
			Talk(1,"","<color=green>Chñ l«i ®µi<color>: §©y lµ l«i ®µi tæ ®éi, kh«ng thÓ th«ng qua l«i ®µi ®Æt c­îc mµ vµo.");
			return
		end
		--ÉĞÎ´ÓĞ±ÈÈü
		if nMapState == 0 then
			Say("TrËn ®Şa nµy ch­a cã thi ®Êu. Ng­¬i cã muèn ®¨ng kı vµ xin chuyÓn vµo ®Êu tr­êng kh«ng?",
				2,
				"§Æt s©n thi ®Êu (Gi¶i ®Æt c­îc)/#OpenSingleTeamRoomYJ("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
				)		
		--±ÈÈüÒÑ¾­¿ªÊ¼»òÁ½Ö§¶ÓÎéÒÑÔÚ×¼±¸ÖĞ		
		elseif nMapState >= 2 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			Say("TrËn ®Şa nµy ®· b¾t ®Çu thi ®Êu, ®éi ngò hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> vµ <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> dÉn d¾t. Cã muèn vµo trËn ®Şa nµy xem thi ®Êu?",
				2,
				"Quan chiÕn (gi¶i ®Æt c­îc)/#RequestViewSingleTeamGame("..nMapIndex..")",
				"Rêi khái/OnCancel_Talk"
				)
		--±ÈÈüÉĞÎ´¿ªÊ¼
		elseif nMapState == 1 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			if HaveSingleTemaGameTitleYJ() == 1 then
				--if GetMissionS(CAPTAIN_NAME) == "" then
					--nCaptainName = GetMissionS(CAPTAIN_NAME+1);
				--else
					nCaptainName = GetMissionS(CAPTAIN_NAME);
				--end
				Talk(1,"","B¹n ®· göi lêi thØnh cÇu tû vâ ®Õn ®éi"..nCaptainName..", h·y kiªn nhÉn chê ®îi ®èi ph­¬ng tr¶ lêi!");
				SendChallenge2CaptainYJ(nMapIndex,PlayerIndex,gf_GetTeamSize());
			end
		end 
	end

	SubWorld = OldWorld;

end

--Ïò¶Ó³¤·¢±ÈÎäÉêÇë
function SendChallenge2Captain(nMapIndex,nChallengeIndex,nChallengeTeamSize)
	local nChallengeName = "";
	
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		nChallengeName = GetName();
	end
	PlayerIndex = OldPlayer;
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		OldPlayer = PlayerIndex;
		PlayerIndex = GetMissionV(CAPTAIN_ID);
		if PlayerIndex > 0 then
			for i=3,10 do
				if GetMissionS(i) == "" then
					SetPlayerScript("\\script\\ÖĞÔ­¶şÇø\\³É¶¼\\npc\\ÀŞÌ¨ÀÏ°å.lua");
					SetMissionS(i,nChallengeName);
					Say("Do <color=yellow>"..nChallengeName.."<color> dÉn d¾t (gåm: <color=yellow>"..nChallengeTeamSize.."<color> ng­êi) mêi ng­¬i tû vâ. Ng­¬i ®ång ı kh«ng?",
					2,
					"§ång ı/#AG("..nMapIndex..","..nChallengeIndex..","..i..")",
					"Cù tuyÖt/#RG("..nMapIndex..","..nChallengeIndex..","..i..")"
					)
					break
				end
			end
		end
		PlayerIndex = OldPlayer;
	end
	SubWorld = OldWorld;
end

--Ïò¶Ó³¤·¢±ÈÎäÉêÇëÑº½ğÀŞÌ¨
function SendChallenge2CaptainYJ(nMapIndex,nChallengeIndex,nChallengeTeamSize)
	local nChallengeName = "";
	
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		nChallengeName = GetName();
	end
	PlayerIndex = OldPlayer;
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		OldPlayer = PlayerIndex;
		PlayerIndex = GetMissionV(CAPTAIN_ID);
		if PlayerIndex > 0 then
			for i=3,10 do
				if GetMissionS(i) == "" then
					SetPlayerScript("\\script\\ÖĞÔ­¶şÇø\\³É¶¼\\npc\\ÀŞÌ¨ÀÏ°å.lua");
					SetMissionS(i,nChallengeName);
					Say("Do <color=yellow>"..nChallengeName.."<color> dÉn d¾t (gåm: <color=yellow>"..nChallengeTeamSize.."<color> ng­êi) mêi ng­¬i tû vâ. Ng­¬i ®ång ı kh«ng?",
					2,
					"§ång ı/#AGYJ("..nMapIndex..","..nChallengeIndex..","..i..")",
					"Cù tuyÖt/#RGYJ("..nMapIndex..","..nChallengeIndex..","..i..")"
					)
					break
				end
			end
		end
		PlayerIndex = OldPlayer;
	end
	SubWorld = OldWorld;
end

--Ë«·½Í¬Òâ±ÈÈü
--²ÎÊı nMapIndex£º±ÈÈü³¡µØÔÚSingleTeamMapTabÖĞµÄindex£»nChallengeIndex£ºÌôÕ½ÕßµÄPlayerIndex£»nChallengeNameIndex£ºÌôÕ½ÕßĞÕÃûÔÚMissionÖĞµÄindex¡£
function AG(nMapIndex,nChallengeIndex,nChallengeNameIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nCamp = 0;
	local str_news = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		--±£Ö¤³¡µØÄÚ»¹Î´ÓĞÆäËûÌôÕ½Õß½øÈëÇÒ±ÈÈüÉĞÎ´¿ªÊ¼
		if GetMissionV(TEAM_GAME_STATE) == 1 then
		
			if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 then
				nCamp = 2;
			elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
				nCamp = 1;
			end
			
			if nCamp == 1 or nCamp == 2 then			
				OldPlayer = PlayerIndex;
				PlayerIndex = nChallengeIndex;
				if PlayerIndex > 0 then
					if GetName() == GetMissionS(nChallengeNameIndex) then
						--ÉêÇëÕß²»ÔÚµ±Ç°ÀŞÌ¨µØÍ¼³ÇÊĞÔò·µ»Ø
						if GetWorldPos() ~= SingleTeamMapTab[nMapIndex][2] then
							return
						end
						SetMissionS(nChallengeNameIndex,"");--Çå¿ÕÉêÇëÈËĞÕÃû
						if HaveSingleTemaGameTitle() == 1 then
							SetMissionV(CAPTAIN_ID+1,gf_GetTeamMember(0));
							SetMissionS(CAPTAIN_NAME+1,gf_GetCaptainName());
							for i=1,gf_GetTeamSize() do
								PlayerIndex = gf_GetTeamMember(i);
	  						if PlayerIndex > 0 then
	  							x,y,z = GetWorldPos();
									SetTask(MS_POS,x);
									SetTask(MS_POS+1,y);
									SetTask(MS_POS+2,z);
	  							CleanInteractive();
	  							NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
	  							SCCheckOfflineExp(4)
									AddMSPlayer(SINGLE_TEAM_MISSION_ID,2);--¼ÓÈëÕóÓª
									SetPlayerState(1,1,3);--ÉèÖÃ×¼±¸×´Ì¬
									SetTaskTemp(PLAYER_CAMP,2);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
									SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
								end
	  					end
	  					str_news = "Do"..gf_GetCaptainName().."dÉn d¾t (gåm cã"..gf_GetTeamSize().." ng­êi) vµo trËn."
							Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
	  				end
	  			end
	  		end
				PlayerIndex = OldPlayer;
			end
		end
	end
	SubWorld = OldWorld;
end

--Ñº½ğÀŞÌ¨
--Ë«·½Í¬Òâ±ÈÈü
--²ÎÊı nMapIndex£º±ÈÈü³¡µØÔÚSingleTeamMapTabÖĞµÄindex£»nChallengeIndex£ºÌôÕ½ÕßµÄPlayerIndex£»nChallengeNameIndex£ºÌôÕ½ÕßĞÕÃûÔÚMissionÖĞµÄindex¡£
function AGYJ(nMapIndex,nChallengeIndex,nChallengeNameIndex)

	local i = 0;
	local x,y,z = 0,0,0;
	local nCamp = 0;
	local str_news = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		--±£Ö¤³¡µØÄÚ»¹Î´ÓĞÆäËûÌôÕ½Õß½øÈëÇÒ±ÈÈüÉĞÎ´¿ªÊ¼
		if GetMissionV(TEAM_GAME_STATE) == 1 then
		
			if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 then
				nCamp = 2;
			elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
				nCamp = 1;
			end
			
			if nCamp == 1 or nCamp == 2 then			
				OldPlayer = PlayerIndex;
				PlayerIndex = nChallengeIndex;
				if PlayerIndex > 0 then
					if GetName() == GetMissionS(nChallengeNameIndex) then
						--ÉêÇëÕß²»ÔÚµ±Ç°ÀŞÌ¨µØÍ¼³ÇÊĞÔò·µ»Ø
						if GetWorldPos() ~= SingleTeamMapTab[nMapIndex][2] then
							return
						end
						SetMissionS(nChallengeNameIndex,"");--Çå¿ÕÉêÇëÈËĞÕÃû
						if HaveSingleTemaGameTitleYJ() == 1 then
							--¿Û³ıÌôÕ½ÕßµÄÇ®
							if Pay(GetMissionV(MS_YAJING_NUM) * 10000) ~= 1 then
								Talk(1,"","<color=green>Chñ l«i ®µi<color>: vµng kh«ng ®ñ, ®Æt c­îc thÊt b¹i.")
								local sChallengeName = GetName();
								PlayerIndex = OldPlayer;
								Talk(1,"",format("<color=green>Chñ l«i ®µi<color>: KÎ khiªu chiÕn ‘%s’ mang kh«ng ®ñ vµng, khiªu chiÕn thÊt b¹i",sChallengeName))
								return
							end
							gf_WriteLogEx("L«i ®µi ®Æt c­îc","Chi tr¶ vµng c­îc",GetMissionV(MS_YAJING_NUM)," Kim ","",GetTongName(),"","","","");
							-----------------
							SetMissionV(CAPTAIN_ID+1,gf_GetTeamMember(0));
							SetMissionS(CAPTAIN_NAME+1,gf_GetCaptainName());
							-----------------
							for i=1, gf_GetTeamSize() do
								PlayerIndex = gf_GetTeamMember(i);
								if PlayerIndex > 0 then
									x,y,z = GetWorldPos();
									SetTask(MS_POS,x);
									SetTask(MS_POS+1,y);
									SetTask(MS_POS+2,z);
									CleanInteractive();
									NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
									SCCheckOfflineExp(4)
									AddMSPlayer(SINGLE_TEAM_MISSION_ID,2);--¼ÓÈëÕóÓª
									SetPlayerState(1,1,3);--ÉèÖÃ×¼±¸×´Ì¬
									SetTaskTemp(PLAYER_CAMP,2);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
									SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
									SetCreateTeam(1); --¹Ø±Õ×é¶Ó¹¦ÄÜ
								end
							end
							str_news = "Do"..gf_GetCaptainName().."DÉn theo tæ ®éi hoÆc c¸ nh©n ®¬n th©n khiªu chiÕn (cïng "..gf_GetTeamSize().." ng­êi) vµo trËn."
							Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
						end
					end
				end
				PlayerIndex = OldPlayer;
			end
		end
	end
	SubWorld = OldWorld;
end

--¾Ü¾øÌôÕ½ÕßµÄÉêÇë
--²ÎÊı nMapIndex£º±ÈÈü³¡µØÔÚSingleTeamMapTabÖĞµÄindex£»nChallengeIndex£ºÌôÕ½ÕßµÄPlayerIndex£»nChallengeNameIndex£ºÌôÕ½ÕßĞÕÃûÔÚMissionÖĞµÄindex¡£
function RG(nMapIndex,nChallengeIndex,nChallengeNameIndex)

local nRejectorName = "";
local nChallengeName = GetMissionS(nChallengeNameIndex);

	SetMissionS(nChallengeNameIndex,"");--Çå¿ÕÉêÇëÈËĞÕÃû
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		--OldWorld = SubWorld;
		--SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		--if SubWorld ~= -1 then
			if GetName() == nChallengeName then
				nRejectorName = GetMissionS(CAPTAIN_NAME);
				TalkEx("",{"Chñ l«i ®µi:"..nRejectorName.."®· tõ chèi lêi khiªu chiÕn cña b¹n!"});
			end
		--end
		--SubWorld = OldWorld;
	end
	PlayerIndex = OldPlayer;
end

--Ñº½ğÀŞÌ¨
--¾Ü¾øÌôÕ½ÕßµÄÉêÇë
--²ÎÊı nMapIndex£º±ÈÈü³¡µØÔÚSingleTeamMapTabÖĞµÄindex£»nChallengeIndex£ºÌôÕ½ÕßµÄPlayerIndex£»nChallengeNameIndex£ºÌôÕ½ÕßĞÕÃûÔÚMissionÖĞµÄindex¡£
function RGYJ(nMapIndex,nChallengeIndex,nChallengeNameIndex)

	local nRejectorName = "";
	local nChallengeName = GetMissionS(nChallengeNameIndex);

	SetMissionS(nChallengeNameIndex,"");--Çå¿ÕÉêÇëÈËĞÕÃû
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		--OldWorld = SubWorld;
		--SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		--if SubWorld ~= -1 then
			if GetName() == nChallengeName then
				nRejectorName = GetMissionS(CAPTAIN_NAME);
				TalkEx("",{"Chñ l«i ®µi:"..nRejectorName.."®· tõ chèi lêi khiªu chiÕn cña b¹n!"});
			end
		--end
		--SubWorld = OldWorld;
	end
	PlayerIndex = OldPlayer;
end

--µ¥Ìô¶ÓÎé¹ÛÕ½´¦Àí
function RequestViewSingleTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]); 
	
	if GetMissionV(TEAM_GAME_STATE) == 0 then
		Say("Xin lçi! TrËn ®Şa nµy ch­a b¾t ®Çu! LÇn sau h·y ®Õn nhĞ!",0);
	elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,3) < MAX_MULTIMAP_AUDIENCE_NUM then
		CleanInteractive();
		NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
		SetPlayerState(1,2);--ÉèÖÃ¹ÛÕ½×´Ì¬
		AddMSPlayer(SINGLE_TEAM_MISSION_ID,3);--¼ÓÈëÕóĞÍ
		SetTaskTemp(PLAYER_CAMP,3);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
	else 
		Say("Xin lçi! Kh¸n gi¶ ®· ®Çy. LÇn sau nhanh ch©n nhĞ!",0);
	end
	
	SubWorld = OldWorld;
	
end

---------------¶àÈË×é¶Ó»ìÕ½ÀŞÌ¨----------------------------
function RequestTeamGame(nMapIndex)

local nMapState = 0;
local strSay = "";

	--ÒÑ¾­Ô¤¶©ÁËµ¥ÈËÀŞÌ¨µÄÍæ¼Ò¸øÓèÍ¨Öª²¢²»ÔÊĞí½øÈëÈü³¡	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ng­¬i ®· ®¨ng kı trËn ®Şa ®¬n nh©n l«i ®µi, kh«ng thÓ vµo l«i ®µi kh¸c!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			if IsTeamAwardTime() == 1 then
				TeamGamePreparingTalk();
			else
				Say("L«i ®µi nµy ch­a cã ng­êi ®¨ng kı. Ng­¬i muèn ®¨ng kı trËn ®Şa kh«ng?",
						2,
						"§¨ng kı/#JoinTeamRoom("..nMapIndex..")",
						"Rêi khái/OnCancel_Talk"
				)
			end
		elseif GetMissionV(TEAM_GAME_STATE) == 1 then
			if GetGameTeamNum() < MAX_TEAM_NUM then
				if IsTeamAwardTime() == 1 then
					if GetMissionV(GAME_TYPE) == 3 then
						strSay = "§éi tr­ëng tæ ®éi tham gia <color=yellow>trËn thø 1<color> §oµn §éi kİch chiÕn cã thÓ b¸o danh thi ®Êu miÔn phİ. Thi ®Êu kÕt thóc, ng­êi tham dù ®Òu nhËn ®­îc <color=yellow>®iÓm søc kháe vµ phÇn th­ëng kh¸c<color>. Ch¼ng hay c¸c h¹ cã muèn tham gia?";
					elseif GetMissionV(GAME_TYPE) == 4 then
						strSay = "§Ó tham gia <color=yellow>trËn thø 2<color> §oµn §éi Kİch ChiÕn ®éi tr­ëng ph¶i nép <color=yellow>10 vµng<color> phİ b¸o danh thi ®Êu. Sè ®éi thi ®Êu tèi ®a lµ <color=yellow>10 tæ ®éi<color>. Tæ ®éi chiÕn th¾ng cuèi cïng cã thÓ nhËn ®­îc phÇn th­ëng tiÒn phong phó. Ch¼ng hay c¸c h¹ cã muèn tham gia?";
					end
				else
					strSay = "L«i ®µi nµy hiÖn cã <color=yellow>"..GetGameTeamNum().."<color> ®ang chuÈn bŞ thi ®Êu. C¸c h¹ muèn thi ®Êu hay vµo xem?";
				end
				
				Say(strSay,
						3,
						"Tham gia tû vâ/#JoinTeamRoom("..nMapIndex..")",
						"Vµo xem thi ®Êu/#RequestViewTeamGame("..nMapIndex..")",
						"Rêi khái/OnCancel_Talk"
				)
			else
				Say("Sè ®éi ngò b¸o danh trËn ®Şa nµy ®· ®¹t"..MAX_TEAM_NUM..", ng­¬i muèn vµo xem thi ®Êu kh«ng?",
					2,
					"Vµo xem thi ®Êu/#RequestViewTeamGame("..nMapIndex..")",
					"Rêi khái/OnCancel_Talk"
			)
			end
		
		elseif GetMissionV(TEAM_GAME_STATE) == 2 then
		
			Say("TrËn ®Şa thi ®Êu l«i ®µi nµy ®· b¾t ®Çu. Ng­¬i muèn vµo xem kh«ng?",
					2,
					"Vµo xem thi ®Êu/#RequestViewTeamGame("..nMapIndex..")",
					"Rêi khái/OnCancel_Talk"
			)
		end
	end
	SubWorld = OldWorld;
	
end

function JoinTeamRoom(nMapIndex)

local i = 0;
local x,y,z = 0,0,0;
local nGameTeamIndex = 0;
local news_str = "";
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld < 0 then
		WriteLog("[§a nh©n tæ ®éi l«i ®µi]T×nh tr¹ng ®Êu tr­êng hiÖn t¹i SubWorld b¸o lçi. B¸o lçi MapID lµ"..TeamMapTab[nMapIndex][1]..", SubWorld lµ"..SubWorld..".");
		SubWorld = OldWorld;
		return 0
	end
	
	if HaveTemaGameTitle(GetMissionV(GAME_TYPE)) == 0 then
		return
	end
	
	nGameState = GetMissionV(TEAM_GAME_STATE);
		
	--Èü³¡ÉĞÃ»ÓĞÈË
	if nGameState == 0 then
		OpenMission(TEAM_MISSION_ID);
		nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","§¹i Chİ C­êng",TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][6],TeamMapTab[nMapIndex][7]);--Ìí¼ÓÒ»¸ö´«ËÍ³ö³¡µØÓÃµÄNpc
		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\team_game_npc.lua")
		SetMissionV(NPC_INDEX,nNpcIndex)
		
		OldPlayer = PlayerIndex;
		
  		for i=1,gf_GetTeamSize() do
  			PlayerIndex = gf_GetTeamMember(i);
  			if PlayerIndex > 0 then
  				x,y,z = GetWorldPos();
  				SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
  				CleanInteractive();
  				NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
  				SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,1);--¼ÓÈëÕóÓª
					SetPlayerState(1,1,1);--ÉèÖÃ×¼±¸×´Ì¬
					SetTaskTemp(PLAYER_CAMP,1);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
					SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
					AddTitle(21,1);
					SetCurTitle(21,1);				
				end
  		end
  		
  		PlayerIndex = OldPlayer;
  		
  		SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
  		SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0));
  		
			StartMissionTimer(TEAM_MISSION_ID, TEAM_TIME_ID1, TEAM_TIMER_1);
			news_str = GetPlayerInfo(gf_GetTeamMember(0))..gf_GetCaptainName().."cïng n« béc ®ang ë"..TeamMapTab[nMapIndex][9].."l«i ®µi s¾p xÕp Tæ ®éi hçn chiÕn l«i ®µi! Mêi c¸c anh hïng tham gia thİ luyÖn!";
			SubWorld = OldWorld;
			Msg2SubWorld(news_str);
		
		--±¨Ãû½×¶Î	
		elseif nGameState == 1 then
		
			if GetGameTeamNum() >= MAX_TEAM_NUM then	
				TalkEx("",{"§éi ngò ®· v­ît qu¸ 10 ®éi! L¸t sau h·y quay l¹i!"});
				SubWorld = OldWorld;
				return
			end
		
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) == 0 then
					SetMissionS(CAPTAIN_NAME + i - 1,gf_GetCaptainName());
					SetMissionV(CAPTAIN_ID + i - 1,gf_GetTeamMember(0));
					nGameTeamIndex = i;
					break;
				end
			end
  		
  		OldPlayer = PlayerIndex;
  		
  		for i=1,gf_GetTeamSize() do
  			PlayerIndex = gf_GetTeamMember(i);
  			if PlayerIndex > 0 then
  				x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
  				CleanInteractive();
  				NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
  				SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,nGameTeamIndex);--¼ÓÈëÕóÓª
					SetPlayerState(1,1,1);--ÉèÖÃ×¼±¸×´Ì¬
					SetTaskTemp(PLAYER_CAMP,nGameTeamIndex);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
					SetTask(MULTIMAP_PLAYER_STATE,1);--±êÖ¾½ÇÉ«ÉíÔÚ¶àÈËÀŞÌ¨
					AddTitle(21,nGameTeamIndex);
					SetCurTitle(21,nGameTeamIndex);
				end
  		end
  		
  		PlayerIndex = OldPlayer;
  		
  		news_str = "Do "..GetName().." dÉn d¾t (gåm cã"..gf_GetTeamSize().." ng­êi) ®· ®· vµo l«i ®µi. Sè ®éi hiÖn t¹i lµ"..GetGameTeamNum()..". "
  		
  		if GetMissionV(GAME_TYPE) ~= 3 and GetMissionV(GAME_TYPE) ~= 4 and GetMissionV(TEAM_NEWS_STATE) > 3 then
				SetMissionV(TEAM_NEWS_STATE,GetMissionV(TEAM_NEWS_STATE)-3);
				news_str = news_str.."Do cã ®éi míi vµo trËn, thêi gian chuÈn bŞ sÏ kĞo dµi thªm 1 phót!";
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
		
		--±ÈÈü½×¶Î 
		elseif nGameState >= 2 then
			TalkEx("",{"Thi ®Êu ®· b¾t ®Çu! L¸t sau h·y ®Õn!"});
		end
	
	SubWorld = OldWorld;

end

--¶ÓÎé»ìÕ½¹ÛÕ½´¦Àí
function RequestViewTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]); 
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			Say("Xin lçi! TrËn ®Şa nµy ch­a b¾t ®Çu! LÇn sau h·y ®Õn nhĞ!",0);
		elseif GetMSPlayerCount(TEAM_MISSION_ID,1) < MAX_MULTIMAP_AUDIENCE_NUM then
			CleanInteractive();
			NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
			SetPlayerState(1,2);--ÉèÖÃ¹ÛÕ½×´Ì¬
			AddMSPlayer(TEAM_MISSION_ID,11);--¼ÓÈëÕóĞÍ
			SetTaskTemp(PLAYER_CAMP,11);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
		else
			Say("Xin lçi! Kh¸n gi¶ ®· ®Çy. LÇn sau nhanh ch©n nhĞ!",0);
		end
	end
	
	SubWorld = OldWorld;
	
end

function TeamGamePreparingTalk()
	
local nHour = GetLocalTime()

	if nHour >= 11 and nHour <= 12 then
		Say("Xin lçi! TrËn ®Şa ®ang chuÈn bŞ. <color=yellow>TrËn thø 1<color> §éi chiÕn b¾t ®Çu b¸o danh vµo <color=yellow>12:00<color>; <color=yellow>TrËn thø 2<color> b¾t ®Çu b¸o danh vµo<color=yellow>12:30<color>.",0)
	elseif nHour >= 17 and nHour <= 18 then
		Say("Xin lçi! TrËn ®Şa ®ang chuÈn bŞ. <color=yellow>TrËn thø 1<color> §éi chiÕn b¾t ®Çu b¸o danh vµo <color=yellow>18:00<color>; <color=yellow>TrËn thø 2<color> b¾t ®Çu b¸o danh vµo<color=yellow>18:30<color>.",0)
	elseif nHour >= 22 and nHour <= 23 then
		Say("Xin lçi! TrËn ®Şa ®ang chuÈn bŞ. <color=yellow>TrËn thø 1<color> §éi chiÕn b¾t ®Çu b¸o danh vµo <color=yellow>23:00<color>; <color=yellow>TrËn thø 2<color> b¾t ®Çu b¸o danh vµo<color=yellow>23:30<color>.",0)
	end
	
end
function GameOverTalk()
	Say("L«i ®µi ®· kÕt thóc! Xin ®îi trong gi©y l¸t!",0)
end
--51»î¶¯Ê¦ÃÅÀúÁ·ÀŞÌ¨ËµÃ÷
function AboutShiMenGame()

local nSZNum = 0;
local nGZNum = 0;

	if GetTask(PLAYERAWARD_DATE) == Zgc_pub_week_seq() then
		nSZNum = GetTask(PLAYERAWARD_TIMES);
	end
	
	if GetTask(AUDIENCEAWARD_DATE) == Zgc_pub_week_seq() then
		nGZNum = GetTask(AUDIENCEAWARD_TIMES);
	end

	strTalk = {
		"Ng­êi ch¬i trªn cÊp 75, lÖch nhau kh«ng qu¸ 5 cÊp ®Òu cã thÓ tham gia thi ®Êu. ChiÕn th¾ng sÏ nhËn ®­îc 1 quyÓn Thùc ChiÕn t©m ®¾c. Ng­êi ch¬i trªn cÊp 10 quan kh¸n sÏ nhËn ®­îc 1 quyÓn Quan ChiÕn t©m ®¾c. Mçi ng­êi mçi tuÇn cã thÓ nhËn tèi ®a 20 quyÓn Thùc ChiÕn t©m ®¾c vµ 40 quyÓn Quan ChiÕn t©m ®¾c. Ng­¬i tuÇn nµy ®· nhËn "..nSZNum.." quyÓn Thùc ChiÕn T©m §¾c vµ "..nGZNum.." quyÓn Quan ChiÕn T©m §¾c.",
		}

	TalkEx("",strTalk);
	
end
