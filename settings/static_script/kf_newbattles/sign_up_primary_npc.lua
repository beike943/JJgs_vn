Include("\\settings\\static_script\\kf_newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\settings\\static_script\\kf_newbattles\\battleaward.lua");
Include("\\script\\lib\\lingshi_head.lua");

--g_sNpcNameºÍg_nNpcCamp¶¼ÊÇÒ»¸öÈ«¾Ö±äÁ¿£¬ËüÃÇÔÚÏôÔ¶Â¥ºÍÕÔÑÓÄêµÄ½Å±¾ÉÏ¶¨Òå

function battle_main()
	BT_NewBattleClear();
	if GetLevel() < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ChiÕn tr­êng lµ n¬i nguy hiÓm, ®îi ng­¬i luyÖn tËp thªm mét thêi gian ®¹t cÊp <color=yellow>40<color> råi h·y quay l¹i!");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V« danh tiÓu tèt nh­ ng­¬i mµ còng muèn tham gia cuéc chiÕn Tèng-Liªu µ? Gia nhËp m«n ph¸i råi h·y tÝnh.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--»ñÈ¡Íæ¼Ò±¨ÃûµÄÊÇÄÄÒ»³¡´ÎµÄÕ½³¡
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--»ñÈ¡Íæ¼Ò±¨ÃûµÄÇé¿ö£ºÄÄ¸öÕ½³¡£¬ÄÄ·½
	local nBattleType = BT_GetBattleType();
	local nSongPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,SONG_ID);
	local nLiaoPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,LIAO_ID);
	--ÐÂÑ¡ÏîÖ»ÄÜ¼ÓÔÚÏÂÃæµÚ2¸öÑ¡ÏîÖ®ºó
	local selTab = {
			"B¸o danh"..tBattleName[PRIMARY_MAINBATTLE_ID].."[Tèng "..nSongPlayerMSCount.." ng­êi]: [Liªu "..nLiaoPlayerMSCount.." ng­êi]/#sign_up("..PRIMARY_MAINBATTLE_ID..")",
			"Ta muèn vµo"..tBattleName[nBattleType].."chiÕn tr­êng [Tèng "..nSongPlayerMSCount.." ng­êi]: [Liªu "..nLiaoPlayerMSCount.." ng­êi]/#join_battle("..nBattleType..")",
			"Ta muèn nhËn phÇn th­ëng chiÕn tr­êng/get_battle_award",
			"§æi phÇn th­ëng chiÕn tr­êng/battle_regular_award",
			"Ta muèn ®­îc h­íng dÉn vÒ chiÕn tr­êng/get_battle_book",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nBattleSegment = mod(nGlobalState,10);	--»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	if nGlobalState == 0 or nBattleSegment == 1 or nBattleSegment == 2 then
		for i=1,2 do
			tremove(selTab,1);
		end;
		Say("<color=green>"..g_sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.",getn(selTab),selTab);
		return 0;
	end;
	if nBattleType ~= 0 and nBattleType ~= PRIMARY_MAINBATTLE_ID then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n ®· b¸o danh tham gia chiÕn tr­êng Nh¹n M«n quan, mêi b¹n ®Õn n¬i b¸o danh b¸o danh BiÖn Kinh ®Ó tham gia chiÕn ®Êu.");
		return 0;
	end;
	if BT_GetCamp() == SONGLIAO_ID-g_nNpcCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: NÕu ng­¬i ®· chän §¹i Liªu"..tCampNameZ[3-g_nNpcCamp].." ta còng kh«ng c­ìng Ðp. Xin b¶o träng!");
		return 0;
	end;
	local nCurRank = BT_GetCurRank();
	if nBattleSegment == 2 or nBattleSegment == 4  then	--Õ½³¡½øÐÐÖÐ
		if nDate*1000+nGlobalState-1 == nSignUpTime then	--Èç¹ûÖ®Ç°ÓÐ±¨Ãû
			for i=1,1 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>: Vµo chiÕn tr­êng? Tr­íc ®ã ng­¬i ®· b¸o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
			return 0;			
		else	--Ö®Ç°Ã»ÓÐ±¨Ãû	
			tremove(selTab,2);	--È¥µô½øÈëÕ½³¡Ñ¡Ïî
			if nCurRank >= 4 then	--ÏÈ·æÒÔÉÏ¾üÏÎ¿ÉÒÔÔÚÕ½³¡¿ªÊ¼ºó¼ÌÐø±¨Ãû
				Say("<color=green>"..g_sNpcName.."<color>: Xin chän chiÕn tr­êng muèn tham gia.",getn(selTab),selTab);
			else
				Say("<color=green>"..g_sNpcName.."<color>: Thêi gian b¸o danh ®· qua, b¹n cã thÓ chän sö dông V« Song Phi T­íng MËt LÖnh (Ngù C¸c) tiÕn hµnh b¸o danh (BÞ h¹n chÕ sè ng­êi tèi ®a vµ sè ng­êi 2 bªn chªnh lÖch) hoÆc 1 Qu©n C«ng Ch­¬ng ®Ó b¸o danh (b¸o danh vµ vµo chiÕn tr­êng kh«ng bÞ giíi h¹n sè ng­êi).",getn(selTab),selTab);
			end;
		end;
		return 0;
	elseif nDate*1000+nGlobalState == nSignUpTime then	--ÔÚ±¨Ãû½×¶Î£»±¨¹ýÃûµÄ
		for i=1,1 do
			tremove(selTab,1)
		end;
		Say("<color=green>"..g_sNpcName.."<color>: Vµo chiÕn tr­êng? Tr­íc ®ã ng­¬i ®· b¸o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
		return 0;		
	elseif nBattleSegment == 3 then	--Ö÷Õ½³¡±¨ÃûÖÐ£»Î´±¨¹ýÃûµÄ
		tremove(selTab,2);	--È¥µô½øÈëÕ½³¡Ñ¡Ïî
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Xin chän chiÕn tr­êng muèn tham gia.",getn(selTab),selTab);
end;

function sign_up(nBattleType)	--ÅÐ¶ÏÕ½³¡Ê±¼äÓëÍæ¼ÒµÈ¼¶
	local nUpLevel,nLowLevel = 0,0;
	if IB_VERSION == 1 then
		nLowLevel,nUpLevel = 60,79;
	else
		nLowLevel,nUpLevel = 60,79;
	end;
	if GetLevel() > nUpLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: §¼ng cÊp cña b¹n ®· rÊt cao, mêi b¹n ®Õn BiÖn Kinh ®Ó t×m <color=yellow>TriÖu Diªn Niªn <color>hoÆc <color=yellow>Tiªu ViÔn L©u<color>b¸o danh tham gia chiÕn tr­êng Nh¹n M«n quan. ");
		return 0;
	end;
	if GetLevel() < nLowLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ch­a ®¹t cÊp "..nLowLevel.." (cÊp) kh«ng thÓ tham gia ChiÕn tr­êng Ngäc M«n quan.");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nLevel = GetLevel();
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nCurCamp = BT_GetCurCamp();
	local nCurRank = BT_GetCurRank();
	local szBattleName = tostring(tBattleName[nBattleType]);
	if BT_GetData(PT_LAST_CAMP) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i ch­a nhËn phÇn th­ëng lÇn tr­íc.");
		return 0;
	end;
	if GetPKValue() >= 4 then	--ºìÃû²»ÄÜ½øÕ½³¡
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Téi ¸c tµy trêi kh«ng thÓ tham gia chiÕn tr­êng!");
		return 0;
	end;
	if nBattleType == RESOURCE_ID then	--Èç¹ûÊÇ²Ý¹È³¡
		local nNeedLevel = 0;
		if IB_VERSION == 1 then
			nNeedLevel = 85;	--Ãâ·Ñ85¼¶
		else
			nNeedLevel = 90;	--ÊÕ·Ñ90¼¶
		end;
		if nLevel > nNeedLevel then	--´óÓÚnNeedLevel¼¶²»ÈÃ²Î¼Ó
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Lín h¬n cÊp "..nNeedLevel.." kh«ng thÓ b¸o danh tham gia"..szBattleName..".");
			return 0;
		end;
		if nCurRank >= 4 then	--¾üÏÎÎªÏÈ·æ¼°ÒÔÉÏ£¨°üÀ¨ÓÀ¾Ã¾üÏÎ£©µÄÍæ¼Ò²»ÔÊÐí½øÈëÁ¸²ÝÕ½³¡
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­êi ch¬i cã qu©n hµm lµ tiªn phong vµ lín h¬n (bao gåm qu©n hµm vÜnh viÔn) kh«ng thÓ b¸o danh tham gia"..szBattleName..".");
			return 0;
		end;
	end;
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	local nMaxPlayer,nPlayerDiff = 0,0;
	local nRequireLevel = 0;
	if nBattleType == VILLAGE_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 60;
		else
			nRequireLevel = 70;
		end;
	elseif nBattleType == RESOURCE_ID then
		nRequireLevel = 40; 
	elseif nBattleType == EMPLACEMENT_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 75;
		else
			nRequireLevel = 80;
		end;
	elseif nBattleType == MAINBATTLE_ID then
		nRequireLevel = 80;
	elseif nBattleType == PRIMARY_MAINBATTLE_ID then
		nRequireLevel = 60;
	end;
	if nLevel < nRequireLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ch­a ®¹t cÊp "..nRequireLevel.." kh«ng ®­îc tham gia."..szBattleName..".");
		return 0;	
	end;
	local selTab = {
				"Kh«ng dïng Qu©n C«ng Ch­¬ng b¸o danh (ng­êi ch¬i qu©n hµm d­íi Tiªn phong sÏ bÞ giíi h¹n sè ng­êi tèi ®a vµ sè ng­êi chªnh lÖch)/#sign_up_confirm("..nBattleType..",0)",
				"\nTa muèn dïng 1 Qu©n C«ng Ch­¬ng b¸o danh (kh«ng bÞ giíi h¹n sè ng­êi chªnh lÖch vµ sè ng­êi tèi ®a, trªn Tiªn phong kh«ng thÓ sö dông)/#sign_up_confirm("..nBattleType..",1)",
				"Ta suy nghÜ l¹i!/nothing",
				}
	if nBattleSegment == 2 or nBattleSegment == 4 then
		tremove(selTab,1);
		tinsert(selTab,1,"Ta muèn sö dông 1 V« Song Phi T­íng MËt LÖnh b¸o danh (Ng­êi ch¬i qu©n hµm d­íi Tiªn phong sÏ bÞ giíi h¹n sè ng­êi chªnh lÖch vµ sè ng­êi tèi ®a)/#sign_up_confirm("..nBattleType..",2)");
	end;
	local szNotice = "";
	if BT_GetData(PT_RANKPOINT) ~= 0 and nCurCamp ~= g_nNpcCamp then
		szNotice = "<color=red> B¹n tham gia phe ®èi ®Þch nªn kh«ng thÓ nhËn phÇn th­ëng kinh nghiÖm <color>. ";
	end;
	Say("<color=green>"..g_sNpcName.."<color>: <color=red> Thó c­ng sÏ biÕn mÊt sau khi vµo chiÕn tr­êng. <color>B¹n muèn gia nhËp phe <color=yellow>"..tCampNameZ[g_nNpcCamp].." kh«ng?<color>"..szNotice,getn(selTab),selTab);
end;

function sign_up_confirm(nBattleType,nSignUpType)	--ÅÐ¶ÏÕ½³¡Ê±¼ä¡¢×î´óÈËÊý¡¢×î´óÈËÊý²î
	local nCamp = g_nNpcCamp;
	local nCurRank = BT_GetCurRank();
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	nSignUpType = nSignUpType or 0;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
		return 0;
	end;
	if nCurRank >= 4 and nSignUpType == 1 then	--ÏÈ·æÒÔÉÏ¾üÏÎ²»ÄÜÊ¹ÓÃ¾ü¹¦ÕÂ
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu©n hµm cña b¹n hiÖn rÊt cao, cã thÓ kh«ng dïng ®­îc ®¹o cô b¸o danh.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	if nBattleSegment == 2 or nBattleSegment == 4 then
		if nCurRank >= 4 or nSignUpType ~= 0 then
			nGlobalState = nGlobalState - 1;	--ÈÃnGlobalStateÎªÆæÊý£¬±íÊ¾ÊÇ±¨Ãû½×¶Î
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: TrËn chiÕn ®· diÔn ra nh÷ng ai ch­a tham gia vui lßng ®îi trËn sau.");
			return 0;
		end;
	end;
	if nSignUpType == 1 then
		if DelItem(2,1,9999,1) == 1 then
			BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,nSignUpType);
			WriteLog("[ChiÕn tr­êng]:"..GetName().." dïng 1 Qu©n C«ng Ch­¬ng b¸o danh tham gia chiÕn tr­êng");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n cÇn <color=yellow>1 Qu©n C«ng Ch­¬ng<color> míi cã thÓ b¸o danh.");
			return 0;
		end;
	elseif nSignUpType == 2 then
		if DelItem(2,1,9964,1) ~= 1 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n cÇn cã <color=yellow>1 V« Song Phi T­íng MËt LÖnh<color> míi cã thÓ b¸o danh.");
			return 0;
		end;
	end;
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n ®· b¸o danh tham gia phe <color=yellow>"..tCampNameZ[nCamp].."<color>. Xin chuÈn bÞ chê khai chiÕn! Sè ng­êi phe");
end;

function join_battle(nBattleType)
	local nDate = tonumber(date("%y%m%d"));
	local nCurRank = BT_GetCurRank();
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--»ñÈ¡Íæ¼Ò±¨ÃûµÄÊÇÄÄÒ»³¡Õ½³¡
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--»ñÈ¡Íæ¼Ò±¨ÃûµÄÇé¿ö£ºÄÄ¸öÕ½³¡£¬ÄÄ·½
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
	local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
		return 0;
	end;
	if nDate*1000+nGlobalState - nSignUpTime > 1 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ng­¬i ch­a b¸o danh kh«ng thÓ tham gia chiÕn tr­êng.");
		return 0;	
	end;
	local nCurMapID = GetWorldPos();
	local nCamp = mod(nSignUpInfo,10);
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nSongPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],SONG_ID,nBattleMapID);
	local nLiaoPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],LIAO_ID,nBattleMapID);
	local tPlayerCount = {nSongPlayerCount,nLiaoPlayerCount};
	if nBattleType == MAINBATTLE_ID or nBattleType == PRIMARY_MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end;
	if nCurRank < 4 and BT_GetData(PTNC_ENTER_USE_JUNGONGZHANG) == 0 then	--Èç¹û¾üÏÎÔÚÏÈ·æÒÔÏÂ²¢ÇÒÃ»ÓÃ¾ü¹¦ÕÂ²¹±¨µÄ¾ÍÐèÒª×÷ÈËÊýÉÏÏÞºÍÈËÊý²îÅÐ¶Ï
		local selTab = {
					"Ta muèn dïng Qu©n C«ng Ch­¬ng vµo chiÕn tr­êng/#join_battle_use_jungongzhang_confirm("..nBattleType..")",
					"\n§Ó ta suy nghÜ thªm/nothing",
					}
		if tPlayerCount[nCamp] >= nMaxPlayer then
			Say("<color=green>"..g_sNpcName.."<color>: "..tCampNameZ[nCamp].." lµ <color=yellow>"..nMaxPlayer.."<color> ®· ®ñ, "..tSexName[GetSex()].."B¹n cã thÓ <color=yellow>sö dông Qu©n C«ng Ch­¬ng vµo chiÕn tr­êng<color> hoÆc ®îi ë bªn ngoµi.",getn(selTab),selTab);
			return 0;
		end;
		if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID-nCamp] >= nDiffPlayerCount then
			Say("<color=green>"..g_sNpcName.."<color>: "..tCampNameZ[nCamp].."_ binh lùc ®· ®ñ, "..tSexName[GetSex()].."B¹n cã thÓ <color=yellow>sö dông Qu©n C«ng Ch­¬ng vµo chiÕn tr­êng<color> hoÆc ®îi bªn ngoµi, hiÖn sè ng­êi 2 phe trong chiÕn tr­êng lµ: <color=yellow>Tèng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Liªu<color>.",getn(selTab),selTab);
			Msg2Player("Sè ng­êi hiÖn t¹i kho¶ng "..nDiffPlayerCount);
			return 0;
		end;
	end;
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--¸ù¾ÝnSignUpInfoÒ²¿ÉÒÔµÃµ½nBattleType£¬ÕâÀïÔÙ±£´æÒ»´Î»á²»»á¶àÓàÄØ£¿
	mf_JoinMission(tBTMSInfo[nBattleType][1],nCamp,nBattleMapID);
end;

function join_battle_use_jungongzhang_confirm(nBattleType)
	local selTab = {
				"§ång ý/#join_battle_use_jungongzhang("..nBattleType..")",
				"Hñy bá/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: B¹n muèn sö dông <color=yellow>Qu©n C«ng Ch­¬ng<color> vµo chiÕn tr­êng?",getn(selTab),selTab);
end;

function join_battle_use_jungongzhang(nBattleType)
	if DelItem(2,1,9999,1) == 1 then
		BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,1);
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n cÇn cã <color=yellow>1 Qu©n C«ng Ch­¬ng<color> míi cã thÓ vµo chiÕn tr­êng.");
		return 0;
	end;	
	join_battle(nBattleType);
end;

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ch¼ng ph¶i ng­¬i cã quyÓn s¸ch sao?");
	end;
end;

tbJUNGONGZHANG = 
{
	[1] = {"Qu©n C«ng Ch­¬ng",2,1,9999,2},
	[2] = {"Qu©n C«ng §¹i",2,1,9998,5},
	[3] = {"Qu©n C«ng Huy Hoµng",2,1,9977,10},
}
function get_battle_award()
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nCurCamp = BT_GetCurCamp();
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local szLastResult = "";
	if nLastCamp == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Mau ®i tham gia chiÕn tr­êng råi ®Õn ®©y l·nh th­ëng!");
		return 0;
	end;
	if g_nNpcCamp ~= nLastCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: TrËn chiÕn b¹n tham gia lµ <color=yellow>"..tCampNameZ[nLastCamp].." <color>. Xin mêi ®Õn n¬i b¸o danh l·nh th­ëng.")
		return 0;
	end;
	if nLastResult == 0 then
		szLastResult = "KÕt qu¶ 2 bªn Tèng Liªu hßa nhau."
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	elseif nLastCamp == nLastResult then
		szLastResult = "KÕt qu¶"..tCampNameZ[nLastCamp].." ®· th¾ng.";
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		szLastResult = "KÕt qu¶"..tCampNameZ[SONGLIAO_ID-nLastCamp].." ®· th¾ng.";
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	local selTab = {
	                format("Ta muèn sö dông qu©n c«ng ch­¬ng (phÇn th­ëng qu©n c«ng %d, phÇn th­ëng kinh nghiÖm*"..nExpMul1.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[1][5],1),
                    format("Ta muèn sö dông ®¹i qu©n c«ng ch­¬ng (phÇn th­ëng qu©n c«ng %d lÇn, phÇn th­ëng kinh nghiÖm "..nExpMul2.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[2][5],2),
                    format("Ta muèn sö dông Huy hoµng qu©n c«ng ch­¬ng (phÇn th­ëng qu©n c«ng %d lÇn, phÇn th­ëng kinh nghiÖm "..nExpMul3.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[3][5],3),
                    "Kh«ng dïng/not_use_jungongzhang_confirm",
                    "Ch­a muèn nhËn th­ëng/nothing",
                    }
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nCurGoldenExp = GetGoldenExp();
	local szSay = "";
	local szJunGong = "";
	local nDate = tonumber(date("%y%m%d"));
	if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
		szJunGong = "(NÕu qu©n c«ng nhËn ®­îc <400 ®iÓm, dïng Qu©n C«ng Ch­¬ng sÏ t¨ng ®«i theo 400 ®iÓm, nÕu nhËn qu©n c«ng nhËn ®­îc <600 ®iÓm, dïng Qu©n C«ng Ch­¬ng vµ Qu©n C«ng Ch­¬ng huy hoµng sÏ t¨ng ®«i theo 600)";
	else
		szJunGong = "(NÕu qu©n c«ng nhËn ®­îc <200 ®iÓm, dïng Qu©n C«ng Ch­¬ng sÏ t¨ng ®«i theo 200 ®iÓm, nÕu qu©n c«ng nhËn ®­îc <400 ®iÓm, dïng §¹i Qu©n C«ng Ch­¬ng vµ Huy hoµng Qu©n C«ng Ch­¬ng sÏ nh©n ®«i theo 400 ®iÓm)";
	end;
	local szExpAward = "Mçi ngµy ng­êi ch¬i chØ cã thÓ nhËn "..MAX_GET_EXP_AWARD.." lÇn phÇn th­ëng chiÕn tr­êng chÝnh.";
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nGetExpAwardCount >= MAX_GET_EXP_AWARD and (nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID) then	--Èç¹ûµ±Ìì»ñµÃ¹ý¾­Ñé½±Àø
		nExpAward = 0;
		if IB_VERSION ~= 1 then
			szExpAward = "Mçi ngµy ng­êi ch¬i chØ cã thÓ nhËn "..MAX_GET_EXP_AWARD.." lÇn phÇn th­ëng chiÕn tr­êng chÝnh. <color=yellow>H«m nay b¹n ®· nhËn "..MAX_GET_EXP_AWARD.." phÇn th­ëng råi, v× vËy kh«ng thÓ nhËn n÷a<color>";
		end;
	end;
	if IB_VERSION == 1 then 	--Èç¹ûÊÇIB°æ±¾
		szExpAward = "phÇn th­ëng nhËn ®­îc lµ <color=yellow>"..nExpAward.." ®iÓm<color>. ";
	else
		szExpAward = "phÇn th­ëng nhËn ®­îc lµ <color=yellow>"..nExpAward.." ®iÓm<color>, tèi ®a chuyÓn <color=yellow>"..nGoldenExpAward.." ®iÓm<color> søc kháe chuyÓn thµnh kinh nghiÖm (HiÖn t¹i søc kháe cña b¹n lµ <color=yellow>"..nCurGoldenExp.."<color> ®iÓm)."..szExpAward;
	end;
	if nLastCamp ~= nCurCamp then
		szExpAward = "V× b¹n tham gia phe ®èi ph­¬ng nªn kh«ng thÓ nhËn phÇn th­ëng.";
	end;
	szSay = "TrËn chiÕn b¹n tham gia lÇn tr­íc lµ phe <color=yellow>"..tCampNameZ[nLastCamp].."<color>, "..szLastResult.." phÇn th­ëng tÝch lòy lµ <color=yellow>"..nPointAward.." ®iÓm<color> tÝch lòy, <color=yellow>"..nJunGongAward.." ®iÓm<color>"..szJunGong.."."..szExpAward
    Say("<color=green>"..g_sNpcName.."<color>: "..szSay,getn(selTab),selTab);
end;

function get_battle_award_confirm(nType)
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--ÊÇ·ñÔÚ¼äµý×°Êø×÷ÓÃÐ§¹ûÄÚ
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp ~= nCurCamp and bSpyTime == 0 then
		Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: B¹n tham gia chiÕn tr­êng cña phe ®èi ph­¬ng, kh«ng thÓ sö dông qu©n c«ng ch­¬ng/®¹i qu©n c«ng ch­¬ng/huy hoµng ch­¬ng, xin h·y chän dßng kh«ng sö dông qu©n c«ng ch­¬ng nhËn phÇn th­ëng.");
		return 0;
	end;
	local selTab = {
				format("§óng/#get_all_award(%d)",nType),
				"Sai/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i muèn sö dông <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>?",getn(selTab),selTab);
end;

function get_all_award(nType)
	if gf_JudgeRoomWeight(1,10,"<color=green>"..g_sNpcName.."<color>: ") == 0 then
		return 0;
	end;
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--ÊÇ·ñÔÚ¼äµý×°Êø×÷ÓÃÐ§¹ûÄÚ
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nLevel = GetLevel();
	if nType ~= 0 then
		if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
			if nType == 1 then
				nJunGongAward = max(400,nJunGongAward);
			else
				nJunGongAward = max(600,nJunGongAward);
			end;
		else
			if nType == 1 then
				nJunGongAward = max(200,nJunGongAward);
			else
				nJunGongAward = max(400,nJunGongAward);
			end;
		end;
	end;
	if nLastCamp == nLastResult or nLastResult == 0 then
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) == 1 then
			nJunGongAward = nJunGongAward*tbJUNGONGZHANG[nType][5];
		else
			Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: Ng­¬i kh«ng mang theo <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> th× ph¶i!");
			return 0;
		end;
	end;
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PT_JUNGONG_AWARD,0);
	BT_SetData(PT_EXP_AWARD,0);
	BT_SetData(PT_GOLDENEXP_AWARD,0);
	BT_SetData(PT_LAST_CAMP,0);
	BT_SetData(PT_SPYCLOTH_TIME,0);
	BT_SetData(PT_LAST_BATTLE,0);
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local tbExpMultiple = --¾ü¹¦ÕÂµÄ½±Àø·­±¶±¶Êý
	{
		[0] = 1,
		[1] = nExpMul1,
		[2] = nExpMul2,
		[3] = nExpMul3,
	};
	local nCurCamp = BT_GetCurCamp();
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nLastBattle ~= MAINBATTLE_ID and nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--Èç¹ûÊÇÐ¡Õ½³¡
		if nLastCamp == nCurCamp then
			nExpAward = floor(nExpAward*tbExpMultiple[nType]);
			ModifyExp(nExpAward);
			Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
		else
			Msg2Player("B¹n tham gia phe ®èi ®Þch, v× vËy kh«ng thÓ nhËn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm ®­îc.");
		end;
	else	--´óÕ½³¡½±Àø
		if nGetExpAwardCount < MAX_GET_EXP_AWARD then	--Èç¹û»ñÈ¡´óÕ½³¡½±Àø´ÎÊýÐ¡ÓÚ1
			if nLastCamp == nCurCamp then
				nExpAward = floor(nExpAward*tbExpMultiple[nType]);
				ModifyExp(nExpAward);
				Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");	
				BT_SetData(PT_GET_EXP_AWARD_COUNT,nGetExpAwardCount+1);
				BT_SetData(PT_GET_EXP_AWARD_DATE,nDate);
			else
				Msg2Player("B¹n tham gia phe ®èi ®Þch, v× vËy kh«ng thÓ nhËn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm ®­îc.");
			end;	
		else
			Msg2Player("H«m nay b¹n ®· nhËn ®­îc "..MAX_GET_EXP_AWARD.." lÇn nhËn phÇn th­ëng kinh nghiÖm, mçi ngµy chØ cã thÓ nhËn 1 lÇn"..MAX_GET_EXP_AWARD.." lÇn nhËn phÇn th­ëng kinh nghiÖm ®¹i chiÕn tr­êng");
		end;
		local nLSLevel = 0;
		if nLevel <= 70 then
			nLSLevel = random(1,4);		
		elseif nLevel <= 80 then
			nLSLevel = random(1,5);
		elseif nLevel <= 100 then
			nLSLevel = random(2,5);
		end;
		if nLSLevel ~= 0 then
			lspf_AddLingShiInBottle(nLSLevel,1);
			Msg2Player("B¹n nhËn ®­îc 1 "..nLSLevel.." (cÊp) Linh th¹ch, ®· cho vµo Tô Linh ®Ønh");		
		end;
	end;
	if IB_VERSION ~= 1 then	--Èç¹ûÊÇÊÕ·Ñ°æ±¾£¬Ôö¼Ó½¡¿µ×ª¾­Ñé½±Àø
		if nLastCamp == nCurCamp then
			gf_GoldenExp2Exp(nGoldenExpAward);
		else
			Msg2Player("B¹n tham gia phe ®èi ®Þch, v× vËy kh«ng thÓ nhËn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm ®­îc.");
		end;
	end;
	local nCurRankPoint = BT_GetData(PT_RANKPOINT);
	if abs(nCurRankPoint) < MAX_PRIMARY_JUNGONG or nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--¾ü¹¦µÍÓÚMAX_PRIMARY_JUNGONGÊ±²Å»áÓÐ¾ü¹¦ºÍ»ý·Ö½±Àø
		BT_SetData(PT_TOTALPOINT,BT_GetData(PT_TOTALPOINT)+nPointAward);
		SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);	--Ö´ÐÐSetRankPoint»áË¥¼õ¾ü¹¦
		Msg2Player("B¹n nhËn ®­îc "..nPointAward.." ®iÓm tÝch lòy chiÕn tr­êng");
		nCurRankPoint = BT_GetData(PT_RANKPOINT);	--»ñÈ¡Ë¥¼õºóµÄ¾ü¹¦
		if bSpyTime == 1 then	--Èç¹û¼äµý×°ÊøÓÐÐ§
			if nCurCamp == LIAO_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("B¹n nhËn ®­îc "..tCampNameZ[nCurCamp].."Ph­¬ng "..nJunGongAward.." ®iÓm c«ng tr¹ng");
		else
			if nLastCamp == SONG_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("B¹n nhËn ®­îc "..tCampNameZ[nLastCamp].."Ph­¬ng "..nJunGongAward.." ®iÓm c«ng tr¹ng");
		end;
	else
		Msg2Player("Qu©n c«ng cña b¹n ®· cao h¬n "..MAX_PRIMARY_JUNGONG.." ®iÓm, tham gia ChiÕn tr­êng Ngäc M«n quan kh«ng ®­îc nhËn qu©n c«ng vµ phÇn th­ëng ®iÓm tÝch lòy.");
	end;
	WriteLog("[phÇn th­ëng chiÕn trËn]:"..GetName().."nhËn l·nh phÇn th­ëng chiÕn tr­êng ("..nLastCamp..","..nLastBattle..","..nLastResult.."), c¸c lo¹i qu©n c«ng ch­¬ng: "..nType..". Sè qu©n c«ng tr­íc: "..nCurRankPoint..", sè qu©n c«ng cã ®­îc:"..BT_GetData(PT_RANKPOINT));
end;

function not_use_jungongzhang_confirm()
	local selTab = {
				"Sö dông qu©n c«ng ch­¬ng/get_battle_award",
				"Kh«ng muèn dïng qu©n c«ng nµo hÕt/#not_use_jungongzhang_confirm2(0)",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i kh«ng dïng qu©n c«ng ch­¬ng sao?",getn(selTab),selTab);
end;

function not_use_jungongzhang_confirm2()
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	if nLastCamp == nCurCamp or nTimePassed <= ITEM_SPYCLOTH_TIME then	--Èç¹û²Î¼ÓµÄÊÇ±¾·½ÕóÓª»ò¼äµý×°ÊøÔÚÓÐÐ§Ê±¼äÄÚ
		get_all_award(0);
		return 0;
	end;
	local selTab = {
				"§ång ý/#get_all_award(0)",
				"Ra khái/nothing",
				}
	if IB_VERSION == 1 then
		Say("<color=green>"..g_sNpcName.."<color>: ChiÕn tr­êng b¹n tham gia lµ cña phe ®èi ph­¬ng, v× thÕ <color=red>kh«ng thÓ nhËn ®­îc phÇn th­ëng kinh nghiÖm<color> vµ trùc tiÕp nhËn phÇn th­ëng ®ång thêi trõ ®iÓm qu©n c«ng cña b¹n, cã thÓ dïng <color=yellow>Gi¸n §iÖp trang<color> ®Ó nhËn qu©n c«ng phe m×nh. NÕu b¹n vÉn muèn nhËn phÇn th­ëng h·y chän 'X¸c nhËn', nÕu b¹n muèn suy nghÜ thªm h·y chän 'Tho¸t khái'.",getn(selTab),selTab);	
	else
		Say("<color=green>"..g_sNpcName.."<color>: ChiÕn tr­êng b¹n tham gia lµ cña phe ®èi ph­¬ng v× thÕ <color=red>kh«ng thÓ nhËn ®­îc phÇn th­ëng kinh nghiÖm vµ phÇn th­ëng søc kháe ®æi ®iÓm kinh nghiÖm<color>, vµ trùc tiÕp nhËn phÇn th­ëng ®ång thêi trõ ®iÓm qu©n c«ng cña b¹n, cã thÓ dïng <color=yellow>Gi¸n §iÖp trang<color> ®Ó nhËn qu©n c«ng phe m×nh. NÕu b¹n vÉn muèn nhËn phÇn th­ëng h·y chän 'X¸c nhËn', nÕu b¹n muèn suy nghÜ thªm h·y chän 'Tho¸t khái'.",getn(selTab),selTab);	
	end;
end;

function battle_regular_award()
	local selTab = {
				"§æi trang bÞ chiÕn tr­êng/BTA_Main",
				"Ta muèn ®æi 100000 ®iÓm tÝch lòy lÊy H¹ y cña Tµng KiÕm cÊp 70/want_cangjian_equip",
				"Ta muèn ®æi 30000 ®iÓm tÝch lòy lÊy LÖnh bµi bang héi/want_ling_pai",
				"Ta muèni 1000 ®iÓm tÝch lòy lÊy ®iÓm kinh nghiÖm/want_exp_award",
				"Ta muèn ®æi Tr¶m Tinh ThÇn Sa (100 ®iÓm tÝch lòy chiÕn tr­êng ®æi 1 c¸i)/want_zscs",
				"Quay l¹i néi dung tr­íc./main",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	if IB_VERSION == 1 then	--IB°æ±¾Ã»ÓÐ»ý·Ö»»×°±¸¡¢¾­Ñé¡¢»áÃËÁîÅÆ½±Àø
		tremove(selTab,2);
		tremove(selTab,2);
		tremove(selTab,2);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i muèn ®æi phÇn th­ëng nµo?",getn(selTab),selTab);
end;

function want_zscs()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nCount = floor(nCurPoint/1000);
	if nCount <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: §iÓm tÝch lòy chiÕn tr­êng cña b¹n kh«ng ®ñ, h·y x¸c nhËn b¹n cã Ýt nhÊt <color=yellow>1000 ®iÓm tÝch lòy chiÕn tr­êng<color>.");
		return 0;
	end;
	AskClientForNumber("give_zscs",1,min(nCount,100),"B¹n muèn ®æi bao nhiªu?");	--£±´Î×î¶à»»£±£°£°¸ö
end;

function give_zscs(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	if nCurPoint < nCount*1000 then
		Talk(1,"",g_szInforHeader.."B¹n kh«ng ®ñ ®iÓm tÝch lòy chiÕn tr­êng, h·y x¸c nhËn b¹n cã Ýt nhÊt <color=yellow>"..(nCount*1000).." ®iÓm tÝch lòy chiÕn tr­êng<color>.")	
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nCount*1000);
	AddItem(2,1,3334,nCount);
	Msg2Player("B¹n ®æi "..(nCount*1000).." ®iÓm tÝch lòy ®æi lÊy "..nCount.." Tr¶m Tinh ThÇn Sa");
	WriteLog("[phÇn th­ëng chiÕn trËn]:"..GetName().."®æi "..nCount.." Tr¶m Tinh ThÇn Sa");
end;

function want_ling_pai()
	local selTab = {
			"§ång ý/give_ling_pai",
			"Hñy bá/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: §æi <color=yellow>LÖnh bµi bang héi<color> cÇn <color=yellow>30000 ®iÓm tÝch lòy<color>, b¹n x¸c nhËn muèn ®æi?",getn(selTab),selTab);
end;

function give_ling_pai()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 30000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin lçi! §iÓm tÝch lòy cña b¹n kh«ng ®ñ ");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Hµnh trang cña b¹n kh«ng ®ñ chç trèng!");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(2,0,125,1);
	if nRetCode == 1 then
		Msg2Player("B¹n ®· ®æi mét LÖnh bµi bang héi");
		WriteLog("[phÇn th­ëng chiÕn trËn]:"..GetName().." ®· ®æi mét lÖnh bµi bang héi");
	else
		WriteLog("[phÇn th­ëng bÞ lçi]"..GetName().."Khi ®æi lÖnh bµi bang héi AddItem b¸o lçi, nRetCode:"..nRetCode);
	end;
end;

function want_cangjian_equip()
	local selTab = {
			"§ång ý/give_cangjian_equip",
			"Hñy bá/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: Muèn ®æi <color=yellow>H¹ y Tµng KiÕm cÊp 70<color> cÇn <color=yellow>100000 ®iÓm tÝch lòy<color>, b¹n x¸c nhËn muèn ®æi?",getn(selTab),selTab);
end;

function give_cangjian_equip()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 100000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin lçi! §iÓm tÝch lòy cña b¹n kh«ng ®ñ ");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,100) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Hµnh trang cña b¹n kh«ng ®ñ chç trèng!");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n ph¶i gia nhËp m«n ph¸i míi cã thÓ ®æi H¹ y Tµng KiÕm");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nNum = nRoute * 100 + 70 + nBody;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(0,101,nNum,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B¹n ®æi "..nNeedPoint.." ®iÓm tÝch lòy lÊy 1 H¹ y Tµng KiÕm cÊp 70");
		WriteLog("[phÇn th­ëng chiÕn trËn]:"..GetName().." ®æi lÊy H¹ y Tµng KiÕm cÊp 70");
	else
		WriteLog("[phÇn th­ëng bÞ lçi]"..GetName().."§æi lÊy H¹ y Tµng KiÕm cÊp 70 AddItem b¸o lçi, nRetCode:"..nRetCode);
	end;
end;

function want_exp_award()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 1000;
	local nLevel = GetLevel();
	if nLevel < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin lçi! Nh©n vËt d­íi cÊp <color=yellow>40<color> kh«ng thÓ ®æi phÇn th­ëng kinh nghiÖm");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_EXCHANGE_EXP_DATE) then
		BT_SetData(PT_EXCHANGE_EXP_COUNT,0);
	end;
	local nCurCount = BT_GetData(PT_EXCHANGE_EXP_COUNT);
	if nCurCount >= 20 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin lçi! H«m nay b¹n ®· nhËn <color=yellow>20<color> lÇn phÇn th­ëng ®iÓm kinh nghiÖm, mçi ngµy chØ cã thÓ ®æi ®iÓm tÝch lòy lÊy ®iÓm kinh nghiÖm 20 lÇn");
		return 0;
	end;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin lçi! §iÓm tÝch lòy cña b¹n kh«ng ®ñ ");
		return 0;
	end;
	local nExpAward = floor((((nLevel^2)/1600)^2)*20000);
	nCurCount = nCurCount + 1;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	BT_SetData(PT_EXCHANGE_EXP_COUNT,nCurCount);
	BT_SetData(PT_EXCHANGE_EXP_DATE,nDate);
	ModifyExp(nExpAward);
	Msg2Player("B¹n ®æi "..nNeedPoint.." ®iÓm tÝch lòy ®æi lÊy "..nExpAward.." ®iÓm kinh nghiÖm, ®©y lµ lÇn ®æi ®iÓm kinh nghiÖm thø "..nCurCount..".");
	WriteLog("[phÇn th­ëng chiÕn trËn]:"..nLevel.."-(cÊp):"..GetName().." ®· dïng ®iÓm tÝch lòy ®æi"..nExpAward.." ®iÓm kinh nghiÖm");
end;
