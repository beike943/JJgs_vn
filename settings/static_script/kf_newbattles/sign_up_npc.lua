Include("\\settings\\static_script\\kf_newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\settings\\static_script\\kf_newbattles\\battleaward.lua");
Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");

Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--½±ÀøÕæÆøµÄ½Ó¿Ú
Include("\\script\\function\\vip_card\\vc_head.lua")

Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\global\\merit.lua")

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
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--»ñÈ¡Íæ¼Ò±¨ÃûµÄÊÇÄÄÒ»³¡´ÎµÄÕ½³¡
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--»ñÈ¡Íæ¼Ò±¨ÃûµÄÇé¿ö£ºÄÄ¸öÕ½³¡£¬ÄÄ·½
	local nBattleType = BT_GetBattleType();
	local nSongPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID,SONG_ID);
	local nLiaoPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID,LIAO_ID);
	local nSongPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID,SONG_ID);
	local nLiaoPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID,LIAO_ID);
	local nSongPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID,SONG_ID);
	local nLiaoPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID,LIAO_ID);
	local nSongPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID,SONG_ID);
	local nLiaoPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID,LIAO_ID);
	local nSongPlayerMSCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerMSCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	--ÐÂÑ¡ÏîÖ»ÄÜ¼ÓÔÚÏÂÃæµÚÎå¸öÑ¡ÏîÖ®ºó
	local selTab = {
			"B¸o danh"..tBattleName[VILLAGE_ID].." [Tèng "..nSongPlayerCountV.." ng­êi]: [Liªu "..nLiaoPlayerCountV.." ng­êi]/#sign_up("..VILLAGE_ID..")",
			"B¸o danh"..tBattleName[RESOURCE_ID].." [Tèng "..nSongPlayerCountR.." ng­êi]: [Liªu "..nLiaoPlayerCountR.." ng­êi]/#sign_up("..RESOURCE_ID..")",
			"B¸o danh"..tBattleName[EMPLACEMENT_ID].." [Tèng "..nSongPlayerCountE.." ng­êi]: [Liªu "..nLiaoPlayerCountE.." ng­êi]/#sign_up("..EMPLACEMENT_ID..")",
			"B¸o danh"..tBattleName[MAINBATTLE_ID].." [Tèng "..nSongPlayerCountM.." ng­êi]: [Liªu "..nLiaoPlayerCountM.." ng­êi]/#sign_up("..MAINBATTLE_ID..")",
			"Ta muèn vµo"..tBattleName[nBattleType].."chiÕn tr­êng [Tèng "..nSongPlayerMSCount.." ng­êi]: [Liªu "..nLiaoPlayerMSCount.." ng­êi]/#join_battle("..nBattleType..")",
			"Xem sè liÖu thèng kª/BTS_ViewBattleStatistic",
			"Ta muèn nhËn phÇn th­ëng chiÕn tr­êng/get_battle_award",
			"§æi phÇn th­ëng chiÕn tr­êng/battle_regular_award",
			"Tham gia ®¸nh gi¸ qu©n hµm/assess_rank",
			"Ta muèn ®­îc h­íng dÉn vÒ chiÕn tr­êng/get_battle_book",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		for i=1,5 do
			tremove(selTab,1);
		end;
		Say("<color=green>"..g_sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.",getn(selTab),selTab);
		return 0;
	end;
	if BT_GetCamp() == SONGLIAO_ID-g_nNpcCamp then
		if 3-g_nNpcCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: NÕu ng­¬i ®· chän §¹i Tèng ta còng kh«ng c­ìng Ðp, xin b¶o träng!");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: NÕu ng­¬i ®· chän §¹i Liªu ta còng kh«ng c­ìng Ðp, xin b¶o träng!");
		end;
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	if nBattleSegment == 2 or nBattleSegment == 4  then	--Õ½³¡½øÐÐÖÐ
		if nDate*1000+nGlobalState-1 == nSignUpTime then	--Èç¹ûÖ®Ç°ÓÐ±¨Ãû
			for i=1,4 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>: Vµo chiÕn tr­êng? Tr­íc ®ã ng­¬i ®· b¸o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
			return 0;			
		else	--Ö®Ç°Ã»ÓÐ±¨Ãû
			for i=1,5 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>: Thêi gian b¸o danh ®· kÕt thóc, xin ®îi trËn sau!",getn(selTab),selTab);
		end;
		return 0;
	elseif nDate*1000+nGlobalState == nSignUpTime then	--ÔÚ±¨Ãû½×¶Î£»±¨¹ýÃûµÄ
		for i=1,4 do
			tremove(selTab,1)
		end;
		Say("<color=green>"..g_sNpcName.."<color>: Vµo chiÕn tr­êng? Tr­íc ®ã ng­¬i ®· b¸o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
		return 0;		
	elseif nBattleSegment == 1 then	--¸±Õ½³¡±¨ÃûÖÐ£»Î´±¨¹ýÃûµÄ
		tremove(selTab,4);	--È¥µôÖ÷Õ½³¡±¨Ãû
		tremove(selTab,4);	--È¥µô½øÈëÕ½³¡Ñ¡Ïî
	elseif nBattleSegment == 3 then	--Ö÷Õ½³¡±¨ÃûÖÐ£»Î´±¨¹ýÃûµÄ
		for i=1,3 do
			tremove(selTab,1)
		end;
		tremove(selTab,2);	--È¥µô½øÈëÕ½³¡Ñ¡Ïî
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Xin chän chiÕn tr­êng muèn tham gia.",getn(selTab),selTab);
end;

function sign_up(nBattleType)	--ÅÐ¶ÏÕ½³¡Ê±¼äÓëÍæ¼ÒµÈ¼¶
	if BT_GetData(PT_LAST_CAMP) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i ch­a nhËn phÇn th­ëng lÇn tr­íc.");
		return 0;
	end;
	if GetPKValue() >= 4 then	--ºìÃû²»ÄÜ½øÕ½³¡
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Téi ¸c tµy trêi kh«ng thÓ tham gia chiÕn tr­êng!");
		return 0;
	end;
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	if nBattleSegment == 2 or nBattleSegment == 4 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: TrËn chiÕn ®· diÔn ra nh÷ng ai ch­a tham gia vui lßng ®îi trËn sau.");
		return 0;
	end;
	local nMaxPlayer,nPlayerDiff = 0,0;
	if nBattleType < 4 then
		if GetLevel() < 40 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Nhá h¬n cÊp 40 kh«ng thÓ tham gia chiÕn tr­êng phô.");
			return 0;
		end;
	else
		if GetLevel() < 60 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Nhá h¬n cÊp 60 kh«ng thÓ tham gia chiÕn tr­êng chÝnh.");
			return 0;
		end;
	end;
	local sMedicineStr = "";
	if nBattleType == VILLAGE_MAP_ID or nBattleType == EMPLACEMENT_MAP_ID then
		--sMedicineStr = "ÔÚÈ·ÈÏ±¨Ãû<color=yellow>"..tBattleName[].."ºó£¬Äã¿ÉÒÔÃâ·Ñ»ñµÃ";
	end;
	local selTab = {
				"§ång ý/#sign_up_confirm("..nBattleType..")",
				"Ta suy nghÜ l¹i!/nothing",
				}
	if g_nNpcCamp == SONG_ID then
		Say("<color=green>"..g_sNpcName.."<color>: <color=red>Chó ý: Thó c­ng sÏ biÕn mÊt sau khi vµo chiÕn tr­êng. <color>B¹n muèn gia nhËp <color=yellow>phe Tèng<color>?",getn(selTab),selTab);
	else
		Say("<color=green>"..g_sNpcName.."<color>: <color=red>Chó ý: Thó c­ng sÏ biÕn mÊt sau khi vµo chiÕn tr­êng. <color>B¹n muèn gia nhËp <color=yellow>phe Liªu<color>?",getn(selTab),selTab);
	end;
end;

function sign_up_confirm(nBattleType)	--ÅÐ¶ÏÕ½³¡Ê±¼ä¡¢×î´óÈËÊý¡¢×î´óÈËÊý²î
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	if nBattleSegment == 2 or nBattleSegment == 4 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: TrËn chiÕn ®· diÔn ra nh÷ng ai ch­a tham gia vui lßng ®îi trËn sau.");
		return 0;
	end;
	local nMaxPlayer,nPlayerDiff = SUB_BATTLE_SIGNUP_MAX_PLAYER,SUB_BATTLE_SIGNUP_PLAYER_DIFF;
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_SIGNUP_MAX_PLAYER;
		nPlayerDiff = MAIN_BATTLE_SIGNUP_PLAYER_DIFF;
	end;
	local nCurPlayerCount = BT_GetSignUpPlayerCount(nBattleType,nCamp);
	local nOppositePlayerCount = BT_GetSignUpPlayerCount(nBattleType,SONGLIAO_ID-nCamp);
	if nCurPlayerCount >= nMaxPlayer then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: HiÖn t¹i chiÕn tr­êng<color> ®· ®Çy, mêi c¸c anh hïng chän chiÕn tr­êng hoÆc phe kh¸c.");
		return 0;
	end;
	if nCurPlayerCount-nOppositePlayerCount >= nPlayerDiff then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: HiÖn sè ng­êi Tèng-Liªu ®«i bªn b¸o danh ®¹t tèi ®a <color=yellow>"..nPlayerDiff.." ng­êi<color>, mêi c¸c anh hïng chän chiÕn tr­êng hoÆc phe kh¸c");
		Msg2Player("Sè ng­êi hiÖn t¹i kho¶ng "..nPlayerDiff);
		return 0;
	end;
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	BT_AddSignUpPlayerCount(nBattleType,nCamp);
	if nCamp == SONG_ID then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n ®· b¸o danh tham gia <color=yellow>phe Tèng<color>, xin chuÈn bÞ chê khai chiÕn!");
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n ®· b¸o danh tham gia <color=yellow>phe Liªu<color>, xin chuÈn bÞ chê khai chiÕn!");
	end;
end;

function join_battle(nBattleType)
	local nDate = tonumber(date("%y%m%d"));
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
	local nBattleType = BT_GetBattleType();
	local nCamp = mod(nSignUpInfo,10);
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	local tPlayerCount = {nSongPlayerCount,nLiaoPlayerCount};
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end;
	if tPlayerCount[nCamp] >= nMaxPlayer then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Phe nµy ®· cã <color=yellow>"..nMaxPlayer.."<color> ng­êi, khi kh¸c h·y quay l¹i!");
		return 0;
	end;
	if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID-nCamp] >= nDiffPlayerCount then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Binh lùc phe nµy ®· ®ñ, B»ng h÷u h·y quay l¹i sau nhÐ! Sè ng­êi ®«i bªn hiÖn lµ: <color=yellow>Tèng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Liªu<color>.");
		Msg2Player("Sè ng­êi hiÖn t¹i kho¶ng "..nDiffPlayerCount);
		return 0;
	end;
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--¸ù¾ÝnSignUpInfoÒ²¿ÉÒÔµÃµ½nBattleType£¬ÕâÀïÔÙ±£´æÒ»´Î»á²»»á¶àÓàÄØ£¿
	local Old_SubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nBattleMapID);
	JoinMission(tBTMSInfo[nBattleType][1],nCamp);
	SubWorld = Old_SubWorld;
	--cdkey
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_BZBD_PVP_Set(%d)", 3 + BT_GetBattleType()));
end;

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ch¼ng ph¶i ng­¬i cã quyÓn s¸ch sao?");
	end;
end;

function battle_shouxian()
	local nValue = GetTask(701)
	if g_nNpcCamp == SONG_ID and nValue < 0 then	-- ÔÚÕÔÑÓÄê·½²»ÄÜ½øÐÐÁÉ·½ÊÚÏÎ
		Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i kh«ng ph¶i phe Tèng kh«ng thÓ nhËn qu©n hµm", 0)
	elseif g_nNpcCamp == LIAO_ID and nValue > 0 then	-- ÏôÔ¶Â¥·½²»ÄÜ½øÐÐËÎ·½ÊÚÏÎ
		Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i kh«ng ph¶i phe Liªu kh«ng thÓ nhËn qu©n hµm", 0)
	else
		Say("<color=green>"..g_sNpcName.."<color>: NÕu tuÇn nµy ch­a tham gia qua chiÕn tr­êng mµ muèn nhËn xÕp h¹ng qu©n c«ng ta ph¶i tham gia nghi thøc trao qu©n hµm, cßn nÕu ng­êi ch¬i ®· tham gia qua sÏ mÆc ®Þnh tham gia nhËn qu©n hµm, <color=yellow>21 giê tèi thø 6 h»ng tuÇn<color> cö hµnh nghi thøc trao qu©n hµm cho ng­êi ch¬i <color=yellow>online vµ tham gia nhËn qu©n hµm<color>, nhËn xong ta cã thÓ <color=yellow>®¨ng nhËp l¹i hoÆc ®Õn ®©y<color> nhËn qu©n hµm míi nhÊt.", 2, "Tham gia nhËn qu©n hµm/battle_shouxian_yes", "Kh«ng cÇn/nothing")
	end
end

function battle_shouxian_yes()
	SetRankPoint(5, 701, 1)
end

function update_cur_rank()
	CalcBattleRank()
	UpdateBattleMaxRank()
	Say("<color=green>"..g_sNpcName.."<color>: Qu©n hµm cña ng­¬i ®· ®­îc thay ®æi.", 0)
end


tbJUNGONGZHANG = 
{
	[1] = {"Qu©n C«ng Ch­¬ng",2,1,9999,2},
	[2] = {"Qu©n C«ng §¹i",2,1,9998,5},
	[3] = {"Qu©n C«ng Huy Hoµng",2,1,9977,10},
	[4] = {"qu©n c«ng ch­¬ng vinh dù ",2,1,30642,14},
}
function get_battle_award()
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Mau ®i tham gia chiÕn tr­êng råi ®Õn ®©y l·nh th­ëng!");
		return 0;
	end;
	if g_nNpcCamp ~= nLastCamp then
		if nLastCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: LÇn tr­íc b¹n ®· tham gia phe <color=yellow>Tèng<color>, mêi ®Õn ®iÓm b¸o danh l·nh th­ëng!")
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: LÇn tr­íc b¹n ®· tham gia phe <color=yellow>Liªu<color>, mêi ®Õn ®iÓm b¸o danh l·nh th­ëng!")
		end;
		return 0;
	end
	local selTab = {
	                format("Dïng qu©n c«ng ch­¬ng (PhÇn th­ëng qu©n c«ng gÊp %d lÇn, kinh nghiÖm gÊp 1.5 lÇn)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[1][5],1),
                    format("Dïng ®¹i qu©n c«ng ch­¬ng (PhÇn th­ëng qu©n c«ng gÊp %d lÇn, kinh nghiÖm gÊp ®«i)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[2][5],2),
                    format("Dïng huy hoµng ch­¬ng (PhÇn th­ëng qu©n c«ng gÊp %d lÇn, kinh nghiªm gÊp 2.5 lÇn)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[3][5],3),
                    format("Ta muèn dïng Vinh Dù Qu©n C«ng Ch­¬ng (PhÇn th­ëng qu©n c«ng %d lÇn, phÇn th­ëng kinh nghiÖm 3 lÇn)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[4][5],4),
                    "Kh«ng dïng/not_use_jungongzhang_confirm",
                    "Ch­a muèn nhËn th­ëng/nothing",
                    }
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local szSay = "";
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local szExpAward = "Mçi ngµy mçi ng­êi chØ cã thÓ nhËn phÇn th­ëng 1 lÇn";
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nGetExpAwardCount >= 1 and nLastBattle == MAINBATTLE_ID then	--Èç¹ûµ±Ìì»ñµÃ¹ý¾­Ñé½±Àø
		nExpAward = 0;
		szExpAward = "Mçi ngµy mçi ng­êi chØ cã thÓ nhËn phÇn th­ëng 1 lÇn, <color=yellow>h«m nay b¹n ®· nhËn qua phÇn th­ëng<color>.";
	end;
	if IB_VERSION == 1 then 	--Èç¹ûÊÇIB°æ±¾
		szSay = "PhÇn th­ëng kinh nghiÖm lÇn tr­íc b¹n nhËn lµ <color=yellow>"..nExpAward.." ®iÓm<color>,"..szExpAward.." phÇn th­ëng tÝch lòy lµ <color=yellow>"..nPointAward.." ®iÓm<color> tÝch lòy, <color=yellow>"..nJunGongAward.." ®iÓm<color>. <color=yellow>B¹n cã thÓ dïng qu©n c«ng ch­¬ng ®Ó nh©n ®«i phÇn th­ëng qu©n c«ng vµ phÇn th­ëng kinh nghiÖm<color>.";
	else
		szSay = "PhÇn th­ëng kinh nghiÖm lÇn tr­íc b¹n nhËn lµ <color=yellow>"..nExpAward.." ®iÓm<color>,"..szExpAward..", cã thÓ chuyÓn <color=yellow>"..nGoldenExpAward.." ®iÓm<color> søc kháe thµnh ®iÓm kinh nghiÖm, phÇn th­ëng tÝch lòy lµ <color=yellow>"..nPointAward.." ®iÓm<color> tÝch lòy, <color=yellow>"..nJunGongAward.." ®iÓm<color> qu©n c«ng. <color=yellow>B¹n cã thÓ dïng qu©n c«ng ch­¬ng ®Ó nh©n ®«i phÇn th­ëng qu©n c«ng<color>."
	end;
    Say("<color=green>"..g_sNpcName.."<color>: "..szSay,getn(selTab),selTab);
end;

function get_battle_award_confirm(nType)
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp ~= nCurCamp then
		Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: Ng­¬i tham gia chiÕn tr­êng phe cña ®èi ph­¬ng, kh«ng thÓ dïng Qu©n C«ng Ch­¬ng/§¹i Qu©n C«ng Ch­¬ng/Huy Hoµng Qu©n C«ng Ch­¬ng/Vinh Dù Qu©n C«ng Ch­¬ng, h·y chän dßng kh«ng dïng Qu©n C«ng Ch­¬ng ®Ó nhËn th­ëng.");
		return 0;
	end;
	local selTab = {
				format("§óng/#get_all_award(%d)",nType),
				"Sai/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i muèn sö dông <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>?",getn(selTab),selTab);
end;

function get_all_award(nType)
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local nLevel = GetLevel();
	
	if gf_JudgeRoomWeight(3,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Hµnh trang cña b¹n kh«ng ®ñ chç trèng!");
		return 0;
	end;
	
	if nType ~= 0 then
		if nTimePassed <= ITEM_SPYCLOTH_TIME then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: HiÖu qu¶ mÆt n¹ Gi¸n §iÖp cña b¹n vÉn cßn, kh«ng thÓ sö dông phÇn th­ëng qu©n c«ng nhËn phÇn th­ëng. Thêi gian sö dông mÆt n¹ Gi¸n §iÖp: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.");
			return 0;
		end;
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) == 1 then
			nJunGongAward = nJunGongAward*tbJUNGONGZHANG[nType][5];
		else
			Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: Ng­¬i kh«ng mang theo <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> th× ph¶i!");
			return 0;
		end;
	end;
	
	--ÏÈÇåÀí±äÁ¿ ·ÀÖ¹¶à´ÎÁì½±
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PT_JUNGONG_AWARD,0);
	BT_SetData(PT_EXP_AWARD,0);
	BT_SetData(PT_GOLDENEXP_AWARD,0);
	BT_SetData(PT_LAST_CAMP,0);
	BT_SetData(PT_SPYCLOTH_TIME,0)
	BT_SetData(PT_LAST_BATTLE,0);
	
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local tbExpMultiple = --¾ü¹¦ÕÂµÄ½±Àø·­±¶±¶Êý
	{
		[0] = 1,
		[1] = 1.5,
		[2] = 2,
		[3] = 2.5,
		[4] = 3,
	};	
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nLastBattle ~= MAINBATTLE_ID then	--Èç¹ûÊÇÐ¡Õ½³¡
		nExpAward = floor(nExpAward*tbExpMultiple[nType]);
		--< Added by SunZhuoshi
		HBRewardInSmallBattleField();
		-->
		ModifyExp(nExpAward);
		Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");	
		--ÎäÁÖvipÁî
		_vc_JoinSmallBattle();
	else	--´óÕ½³¡½±Àø
		--< Added by SunZhuoshi
		HBRewardInBigBattleField();
		-->
		if nGetExpAwardCount < 1 then	--Èç¹û»ñÈ¡´óÕ½³¡½±Àø´ÎÊýÐ¡ÓÚ1
			nExpAward = floor(nExpAward*tbExpMultiple[nType]);
			ModifyExp(nExpAward);
			Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");	
			BT_SetData(PT_GET_EXP_AWARD_COUNT,nGetExpAwardCount+1);
			BT_SetData(PT_GET_EXP_AWARD_DATE,nDate);		
		else
			Msg2Player("H«m nay b¹n ®· nhËn 1 lÇn phÇn th­ëng kinh nghiÖm, mçi ngµy chØ cã thÓ nhËn 1 lÇn");
		end;
		--ÎäÁÖvipÁî
		_vc_JoinBigbattle();
	end;
	-- Ô½ÄÏ2008 5.1 »î¶¯½±Àø
	local is_main_batter = (nLastBattle == MAINBATTLE_ID) or 0;
	local is_winner = (nLastCamp == nLastResult) or 0
	viet_51_battle_award(is_main_batter, is_winner);
	
	local tYinXiongXunZhang = {
		[0] = {0, 1,},
		[1] = {1, 2,},
		[2] = {2, 3,},
		[3] = {3, 4,},
		[4] = {4, 5,},
	}
	local nYinXiongXunZhangCnt = tYinXiongXunZhang[nType][is_winner+1] or 0
	if nYinXiongXunZhangCnt > 0 then
		gf_SetLogCaption("NewBattle");
    	gf_AddItemEx({2, 1, 30499, nYinXiongXunZhangCnt}, "Hu©n ch­¬ng anh hïng");
    	gf_SetLogCaption("");
	end

	
	--ÕæÆø½±Àø
	AwardZhenQi_ZhanChang(is_main_batter, is_winner)
	
	--Ô½ÄÏ2009Äê8ÔÂ»î¶¯½±Àø£¬Ö÷Õ½³¡²Å¸ø
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		local nDayWeek = tonumber(date("%w"));
		if nDayWeek == 0 or nDayWeek == 1 or nDayWeek == 5 or nDayWeek == 6 then 
			if is_main_batter == 1 then
				local nCurRank = BT_GetData(PT_CURRANK);
				nCurRank = abs(nCurRank);
				if nCurRank == 1 then
					ModifyExp(100000);
				elseif nCurRank == 2 then
					ModifyExp(200000);
				elseif nCurRank == 3 then		-- ¶¼Í³
					ModifyExp(350000 + is_winner * 50000);
				elseif nCurRank == 4 then
					ModifyExp(700000 + is_winner * 100000);
				elseif nCurRank == 5 then
					ModifyExp(1000000 + is_winner * 200000);
				end
			end
		end
	end
	
	if IB_VERSION ~= 1 then	--Èç¹ûÊÇÊÕ·Ñ°æ±¾£¬Ôö¼Ó½¡¿µ×ª¾­Ñé½±Àø
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	BT_SetData(PT_TOTALPOINT,BT_GetData(PT_TOTALPOINT)+nPointAward);
	SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);	--Ö´ÐÐSetRankPoint»áË¥¼õ¾ü¹¦
	Msg2Player("B¹n nhËn ®­îc "..nPointAward.." ®iÓm tÝch lòy chiÕn tr­êng");
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		nJunGongAward = 0;
		Msg2Player("HiÖu qu¶ mÆt n¹ Gi¸n §iÖp: B¹n kh«ng nhËn ®­îc qu©n c«ng");
	end;
	nCurRankPoint = BT_GetData(PT_RANKPOINT);	--»ñÈ¡Ë¥¼õºóµÄ¾ü¹¦
	if nLastCamp == SONG_ID then
		BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
	else
		BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
	end;
	SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
	Msg2Player("B¹n nhËn ®­îc "..tCampNameZ[nLastCamp].."Ph­¬ng "..nJunGongAward.." ®iÓm c«ng tr¹ng");
	--ÎäÁÖ¹¦Ñ«
	if nLastBattle ~= MAINBATTLE_ID then	--Èç¹ûÊÇÐ¡Õ½³¡
		if nLastCamp == nLastResult then
			merit_SmallBattle(1, nType);
		else
			merit_SmallBattle(0, nType);
		end
	else
		if nLastCamp == nLastResult then
			merit_BigBattle(1, nType);
		else
			merit_BigBattle(0, nType);
		end
	end
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
	Say("<color=green>"..g_sNpcName.."<color>: B¹n tham gia chiÕn tr­êng phe ®èi ph­¬ng, trùc tiÕp nhËn th­ëng sÏ bÞ khÊu trõ ®iÓm qu©n c«ng, cã thÓ sö dông <color=yellow>mÆt n¹ Gi¸n §iÖp<color> lµm qu©n c«ng b¹n bÞ khÊu trõ thµnh 0. NÕu b¹n vÉn muèn nhËn phÇn th­ëng h·y chän x¸c nhËn, nÕu b¹n muèn suy nghÜ thªm hay chän Rêi khái.",getn(selTab),selTab);
end;

function assess_rank()
	local selTab = {
			"Ta muèn nhËn qu©n hµm qu©n c«ng tuÇn nµy/battle_shouxian",
			"§æi míi qu©n hµm/update_cur_rank",
			"Quay l¹i néi dung tr­íc./main",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i muèn tham gia trao qu©n hµm tuÇn nµy ­?",getn(selTab),selTab);
end;

function battle_regular_award()
	local selTab = {
				"§æi trang bÞ chiÕn tr­êng/BTA_Main",
				"Ta muèn ®æi 100000 ®iÓm tÝch lòy lÊy H¹ y cña Tµng KiÕm cÊp 70/want_cangjian_equip",
				"Ta muèn ®æi 30000 ®iÓm tÝch lòy lÊy LÖnh bµi bang héi/want_ling_pai",
				"Ta muèni 1000 ®iÓm tÝch lòy lÊy ®iÓm kinh nghiÖm/want_exp_award",
				"Quay l¹i néi dung tr­íc./main",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	if IB_VERSION == 1 then	--IB°æ±¾Ã»ÓÐ»ý·Ö»»×°±¸¡¢¾­Ñé¡¢»áÃËÁîÅÆ½±Àø
		tremove(selTab,2);
		tremove(selTab,3);
--		tremove(selTab,2);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i muèn ®æi phÇn th­ëng nµo?",getn(selTab),selTab);
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

function change_camp()
	local nDate = tonumber(date("%y%m%d"));
	if nDate > 070920 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Thêi gian ®æi phe miÔn phÝ ®· qua, c¸c vÞ ®¹i hiÖp h·y cÈn träng khi chän phe!");
		return 0;
	end;
	if BT_GetData(PT_CHANGE_CAMP_COUNT) >= MAX_CHANGE_CAMP then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B¹n ®· ®æi qu©n c«ng <color=yellow>"..MAX_CHANGE_CAMP.."<color> lÇn, kh«ng thÓ ®æi tiÕp.");
		return 0;
	end;
	local selTab = {
				"Tèng/#change_camp_confirm(1)",
				"Liªu/#change_camp_confirm(2)",
				"Ta suy nghÜ l¹i/nothing",
				}
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	if nJunGong < 0 then
		szStr = "B¹n ®ang thuéc phe Liªu, qu©n c«ng hiÖn t¹i:"..abs(nJunGong)..".";
	elseif nJunGong > 0 then
		szStr = "B¹n ®ang thuéc phe Tèng, qu©n c«ng hiÖn t¹i:"..abs(nJunGong)..".";
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu©n c«ng hiÖn t¹i cña b¹n lµ 0, kh«ng cÇn ph¶i chuyÓn qu©n c«ng.");
		return 0;
	end;
	local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
	Say("<color=green>"..g_sNpcName.."<color>: "..szStr.."Ng­¬i muèn cèng hiÕn cho phe nµo? <color=yellow>Tr­íc 20/9<color> ta cã thÓ gióp ng­êi ®æi qu©n c«ng miÔn phÝ 3 lÇn. HiÖn giê ng­¬i cã thÓ chuyÓn ®æi qu©n c«ng <color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount).."<color> lÇn.",getn(selTab),selTab);
end;

function change_camp_confirm(nCamp)
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
	if nJunGong <= 0 then
		if nCamp == LIAO_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i ®· lµ T­íng sÜ phe Liªu, kh«ng cÇn chuyÓn ®æi qu©n c«ng!");
			return 0;
		end;
		szStr = "B¹n ®· ®æi sang phe Tèng, qu©n c«ng cña b¹n lµ: <color=yellow>"..abs(nJunGong).."<color>. B¹n cßn <color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount-1).."<color> lÇn ®æi phe miÔn phÝ";
	elseif nJunGong > 0 then
		if nCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i ®· lµ T­íng sÜ phe Tèng, kh«ng cÇn chuyÓn ®æi qu©n c«ng!");
			return 0;
		end;	
		szStr = "B¹n ®· ®æi sang phe Liªu, qu©n c«ng cña b¹n lµ: <color=yellow>"..abs(nJunGong).."<color>. B¹n cßn <color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount-1).."<color> lÇn ®æi phe miÔn phÝ";
	end;
	BT_SetData(PT_RANKPOINT,-nJunGong);
	BT_SetData(PT_CHANGE_CAMP_COUNT,nChangeCampCount+1);
	Talk(1,"","<color=green>"..g_sNpcName.."<color>: "..szStr);
end;
