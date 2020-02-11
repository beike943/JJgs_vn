Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3.lua")
Include("\\script\\lib\\itemfunctions.lua")
Include("\\script\\lib\\message.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\missions\\nvn\\data_mgr.lua")

function main()
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","Tİnh n¨ng nµy t¹m thêi kh«ng më");
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if 1 == nCurGs then
		main_ggs();
	else
		main_3v3();
	end	
end

function main_ggs()
	local tSel = {
		"\nTrë vÒ BiÖn Kinh/leave_3v3_map",
		"Kh«ng cã g×!/nothing",
	}
	Say(g_szInfoHead.."TriÒu ®×nh ®· h¹ chØ, chuÈn bŞ §¹i Héi TØ Vâ, c¸c anh hïng hµo kiÖt cã thÓ b¸o danh tham gia. §Ó kiÓm tra n¨ng lùc cña mçi ng­êi chän ra nh©n sÜ cã vâ nghÖ cao c­êng.",
		getn(tSel), tSel);
end

function leave_3v3_map()
	ChangeGroupWorld(200,1391,2820);
end

function main_3v3()
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","Tİnh n¨ng nµy t¹m thêi kh«ng më");
		return 0;
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."ThËt ng¹i qu¸, ng­¬i cÇn ph¶i gia nhËp m«n ph¸i tr­íc míi cã thÓ b¸o danh tham gia §¹i Héi TØ Vâ ®­îc.");
		return 0;
	end;
--	if GetLevel() < 80 then
--		Talk(1,"",g_szInfoHead.."ÄúµÄµÈ¼¶²»×ã80¼¶£¬»¹ÊÇÔÚ½­ºşÖĞ¶àÀúÁ·Ğ©°É¡£");
--		return 0;
--	end
	g_3v3DataMgr:getData("BattleDate", updateMatchInfo);
end

function updateMatchInfo(nCount, tData, bUpdate)
	DebugOutput("updateMatchInfo",nCount,tData,bUpdate);
	if nCount and bUpdate then
		g_t3v3Data:Init(tData["BattleDate"]);
	end
	main_3v3_2();
end

function main_3v3_2()
	local tSel = {
		--"ÁìÈ¡Èü¼¾½±Àø/getAward_3v3",
		"H­íng dÉn §¹i Héi TØ Vâ/info_3v3",
		--"·µ»Ø/main",
		"Kh«ng cã g×!/nothing",
	}
	--ÆÁ±ÎÔ¤Ñ¡ÈüºÍ¾öÈü
--	if g_t3v3Data.battleState == BS_PRELIMINARY then
--		tinsert(tSel, 1, "²Î¼Ó±ÈÎä´ó»áÁªÈüÔ¤Ñ¡Èü/before_GLB_3v3_Goto_Preliminary");
--	elseif g_t3v3Data.battleState == BS_FINALS then
--		tinsert(tSel, 1, "²Î¼Ó±ÈÎä´ó»áÁªÈü¾öÈü/before_GLB_3v3_Goto_Finals");
--		tinsert(tSel, 2, "²é¿´¾öÈüÃûµ¥/seePerliminaryRank");
--	else
	if g_t3v3Data.battleState == BS_DAYMATCH then
		tinsert(tSel, 1, "Vµo ®Êu tr­êng §¹i Héi TØ Vâ/before_GLB_3v3_Goto_Field");
		--tinsert(tSel, 2, "²é¿´ÉÏÈü¼¾¾öÈüÅÅÃû/seeFinalMatchRank");
	else
		tinsert(tSel, 1, "HiÖn t¹i kh«ng ph¶i lµ thêi gian thi ®Êu/main_3v3");
	end
	--tinsert(tSel, 3, "²é¿´Èü¼¾Õ½¶ÓÅÅÃû/seeMatchTeamRank");
	if TEST_MODAL == 1 then
		tinsert(tSel, getn(tSel), "TEST!!!/test");
	end
	Say(g_szInfoHead.."TriÒu ®×nh ®· h¹ chØ, chuÈn bŞ §¹i Héi TØ Vâ, c¸c anh hïng hµo kiÖt cã thÓ b¸o danh tham gia. §Ó kiÓm tra n¨ng lùc cña mçi ng­êi chän ra nh©n sÜ cã vâ nghÖ cao c­êng.",
		getn(tSel), tSel);
end

function test()
	local tSel = {}
	if TEST_MODAL == 1 then
		tinsert(tSel, "Xem xÕp h¹ng tuÇn tr­íc/seeLastWeekRank");
		tinsert(tSel, "KiÓm tra phÇn th­ëng quı/xxxcheckMatchAward");
		tinsert(tSel, "Xem xÕp h¹ng quı/seeLastMatchRank");
		tinsert(tSel, "§i ®Õn khu vùc ®Êu ngµy/#ChangeGroupWorld(8000,1393,2822,1)");
		tinsert(tSel, "§i ®Õn khu vùc chung kÕt/#ChangeGroupWorld(8000,1393,2822,3)");
		tinsert(tSel, "trë l¹i/main_3v3")
	end
	Say(g_szInfoHead.."TEST!!!", getn(tSel), tSel);
end

function before_GLB_3v3_Goto_Field(nCount, data)
	if not nCount then
		return g_3v3DataMgr:getData("LocalMatchRound", before_GLB_3v3_Goto_Field);
	end

	if check_CGW() ~= 1 then return end
	GLB_3v3_Goto_Field()
end

function GLB_3v3_Goto_Field(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		local szInfo		= "Ng­¬i ®· ®i vµo §¹i Héi TØ Vâ liªn ®Êu 3v3";
		local strtab = {
			"Ta ®· chuÈn bŞ xong!			/#GLB_3v3_Goto_Field(1)",
			"trë l¹i/main",
			"KÕt thóc ®èi tho¹i/nothing",
		};
		Say(g_szInfoHead..""..szInfo,
		getn(strtab),
		strtab)

		return
	end
	
	if 1 == _check_to_kuafu_condition() then
		--cdkey»î¶¯
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(2)");	
		
		SetTask(TASKID_EXCHG_SVR_TAG, 1, TASK_ACCESS_CODE_EXGSVR);
		SetTask(TASKID_NEED_SYNC_REALM_DATA,1);
		ChangeGroupWorld(8000,1399,2847,1);
	end
end

function before_GLB_3v3_Goto_Preliminary(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FIGHTTEAM_RANK2", before_GLB_3v3_Goto_Preliminary)
	--	return Talk(1, "", g_szInfoHead.."Ç°·½µÀÂ·²»Í¨, ÇëÉÔºóÔÙÊÔ");
	end
	if bUpdate then
		nCount = min(nCount, PRELIMINARY_TEAM_PER_GROUP);
		g_t3v3_PreliminaryTeams = {}
		for i = 1, nCount do
			local tFTInfo = tData[i-1];
			local name = tFTInfo[1];
			local aa,bb,strGbGroup,strTeamName = strfind(name,"(.-)*(.*)");
			local score = tFTInfo[2];
			local ftID = tFTInfo[3];
			DebugOutput(i, gf_UnPack(tFTInfo), strTeamName);
			g_t3v3_PreliminaryTeams[strTeamName] = ftID;
		end
	end
	DebugOutput(Val2Str(g_t3v3_PreliminaryTeams))
	if not g_t3v3_PreliminaryTeams then
		return Talk(1, "", "LÊy danh s¸ch vßng lo¹i bŞ lçi, hiÖn t¹i kh«ng thÓ ®i vµo ®Êu tr­êng");
	end
	local ftName = GetFightTeamInfo();
	if not ftName or ftName == "" then
		return Talk(1, "", "Ng­¬i ch­a gia nhËp chiÕn ®éi, kh«ng thÓ tham gia vßng lo¹i");
	end
	if not g_t3v3_PreliminaryTeams[ftName] then
		return Talk(1, "", "ChiÕn ®éi cña ng­¬i kh«ng cã t­ c¸ch tham gia vßng lo¹i, lÇn sau h·y cè g¾ng nhĞ");
	end
	GLB_3v3_Goto_Preliminary();
end

function GLB_3v3_Goto_Preliminary()
	if check_CGW() ~= 1 then return end
	ChangeGroupWorld(8000,1393,2822,3);
end

function before_GLB_3v3_Goto_Finals(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FINALS_TEAMS", before_GLB_3v3_Goto_Finals)
	--	return Talk(1, "", g_szInfoHead.."Ç°·½µÀÂ·²»Í¨, ÇëÉÔºóÔÙÊÔ");
	end
	if bUpdate then
		g_t3v3_FinalsTeams = {}
		for i = 1, nCount do
			local tFTInfo = tData[i - 1];
			local name = tFTInfo[1];
			local ftID = tFTInfo[2];
			g_t3v3_FinalsTeams[ftID] = name;
			DebugOutput(ftID, name)
		end
	end
	DebugOutput(Val2Str(g_t3v3_FinalsTeams))
	if not g_t3v3_FinalsTeams or getn(g_t3v3_FinalsTeams) == 0 then
		return Talk(1, "", "LÊy danh s¸ch chung kÕt bŞ lçi, hiÖn t¹i kh«ng thÓ ®i vµo ®Êu tr­êng");
	end
	local ftID = GetFightTeamID();
	DebugOutput("my ftid=", ftID)
	if ftID == 0 then
		return Talk(1, "", "Ng­¬i ch­a gia nhËp chiÕn ®éi, kh«ng thÓ tham gia chung kÕt");
	end
	if not g_t3v3_FinalsTeams[ftID] then
		return Talk(1, "", "ChiÕn ®éi cña ng­¬i kh«ng cã t­ c¸ch tham gia chung kÕt, lÇn sau h·y cè g¾ng nhĞ");
	end
	GLB_3v3_Goto_Finals()
end

function GLB_3v3_Goto_Finals()
	if check_CGW() ~= 1 then return end
	ChangeGroupWorld(8000,1393,2822,3);
end

function check_CGW()
	if 1 == TEST_MODAL then
		return 1;
	end
	local nTime = tonumber(date("%H%M"));
	if nTime < 2100 or nTime >= 2200 then
		Talk(1,"",g_szInfoHead..format("HiÖn nay kh«ng ph¶i thêi gian liªn ®Êu cña §¹i Héi Vâ L©m, xin ®¹i hiÖp ®Õn tham gia tr­íc %s mçi ngµy.", "21:00-22:00"));
		return 0;
	end
	if gf_JudgeRoomWeight(15,100,"") == 0 then
		return 0;
	end;
	if GetPKValue() >= 10 then
		Talk(1,"",g_szInfoHead.."S¸t ı cña ng­¬i qu¸ cao ( PK>=10), kh«ng thÓ ®i vµo §¹i Héi TØ Vâ.");
		return 0;		
	end
	return 1;
end

g_tAward_3v3 = {
	--¾­Ñé	µÈ¼¶*µÈ¼¶*120*Ê¤³¡Êı
	{giveClause = function (nCount)
		gf_Modify("Exp", GetLevel() * GetLevel() * 120 * nCount);
	end},
	--ÎåĞĞ³¾£¨¾ùÎª±äÁ¿£©	Ê¤³¡Êı*10
	{giveClause = function (nCount)
		ItemCreate.giveSeriesLowStone(nCount * 10)
	end},
	--ÎåĞĞÓñ£¨¾ùÎª±äÁ¿£©	Ê¤³¡Êı-9
	{giveClause = function (nCount)
		nCount = nCount - 9;
		if nCount > 0 then
			ItemCreate.giveSeriesHighStone(nCount)
		end
	end},
	--ÊÚÒµµãÊı	Ê¤³¡Êı*150
	{giveClause = function (nCount)
		gf_Modify("SYJY", nCount * 150);
	end},		
	--PVPµãÊı	Ê¤³¡Êı*3
	{giveClause = function (nCount)
		gf_Modify("Pvp", nCount * 3);
	end},		
	--½ğÇ®	Ê¤³¡Êı*50000£¨Í­£©
	{giveClause = function (nCount)
		gf_Modify("Money", nCount * 50000);
	end},
	--¶ÔÕ½¾­Ñé	Ê¤³¡Êı*3
	{giveClause = function (nCount)
		gf_Modify("Dzjy", nCount * 3);
	end},		
	--ºé»ÄËéÆ¬	Ê¤³¡Êı*1
	{giveClause = function (nCount)
		gf_AddItemEx2(
			{"M¶nh Hång Hoang", {2,95,1506,1,4}}, 
			nCount);
	end},
	{giveClause = function (nCount)
		if nCount >= 11 then
			gf_AddItemEx({2,95,1511,1,4}, "§Êu Ph¸ch LÖnh", 25);
		elseif nCount >= 8 then
			gf_AddItemEx({2,95,1511,1,4}, "§Êu Ph¸ch LÖnh", 10);
		end
	end},
	{giveClause = function (nCount)
		soul_GivePoint(nCount * 30);
	end},
}

function getAward_3v3()
	local tSel = {
--		"ÁìÈ¡3v3±ÈÎä´ó»áÁªÈü×òÈÕ½±Àø/getAward_3v3_daily",
--		"ÁìÈ¡3v3±ÈÎä´ó»áÁªÈüÉÏÖÜ½±Àø/getAward_3v3_week",
--		"µ¥ÈË²ÎÓë½±Àø/getAward_3v3_personal",
--		"Õ½¶Ó²ÎÓë½±Àø/getAward_3v3_fightteam",
--    "Õ½¶Ó¾öÈü½±Àø/getAward_3v3_match_before",
    	"trë l¹i/main_3v3",
    }
	Say(g_szInfoHead.."NhËn phÇn th­ëng quı", getn(tSel), tSel);
end

function getAward_3v3_personal(bSure)
	if gf_JudgeRoomWeight(3,100, "") ~= 1 then return end
	local maxcount = min(60,GetTask(TASKID_3V3_WIN_ROUND_MATCH))
	local count = maxcount - GetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED);
	if not bSure then
		if count <= 0 then
			return Talk(1, "", g_szInfoHead..format("Tæng sè phÇn th­ëng c¸ nh©n cã thÓ nhËn quı nµy %d, sè lÇn nhËn th­ëng d­ l¹i hiÖn t¹i %d", maxcount, count));
		end
		local tSel = {
			"NhËn lÊy phÇn th­ëng./#getAward_3v3_personal(1)",
			"trë l¹i/getAward_3v3",
			"KÕt thóc/nothing",
		}
		Say(g_szInfoHead..format("Tæng sè phÇn th­ëng c¸ nh©n cã thÓ nhËn quı nµy %d, sè lÇn nhËn th­ëng d­ l¹i hiÖn t¹i %d, cã muèn tiÕp tôc nhËn kh«ng?", maxcount, count),
			getn(tSel), tSel);
		return
	elseif count > 0 then
		gf_SetLogCaption("3v3_PersonalAward");
		local times = GetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED) + count;
		SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED, times);
		
--¾­Ñé	µÈ¼¶*µÈ¼¶*120*Ê¤³¡Êı
		gf_Modify("Exp", GetLevel() * GetLevel() * 120 * count);
--ÎåĞĞ³¾£¨¾ùÎª±äÁ¿£©	100
		ItemCreate.giveSeriesLowStone(100 * count)
--ÊÚÒµµãÊı	150
		gf_Modify("SYJY", 150 * count);
--PVPµãÊı	3
		gf_Modify("Pvp", 3 * count);
--¶ÔÕ½¾­Ñé	3
		gf_Modify("Dzjy", 3 * count);
--ºé»ÄËéÆ¬	1
		gf_AddItemEx2({"M¶nh Hång Hoang", {2,95,1506,1,4}}, 1 * count);
--±ÈÎä´ó»áÁîÅÆ	1
		gf_AddItemEx2({"Tû vâ ®¹i héi bµi", {2,0,1064,1,4}}, 1 * count);
		if times == 60 then
			gf_Modify("Money", 600 * 10000);
		end
		--Observer:onEvent(OE_3V3_DAILY_AWARD,{count});
		gf_SetLogCaption("");
	end
end

function getAward_3v3_fightteam(bSure)
	if gf_JudgeRoomWeight(3,100, "") ~= 1 then return end
	local maxcount = min(30, GetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL));
	local count = maxcount - GetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED);
	if not bSure then
		if count <= 0 then
			return Talk(1, "", g_szInfoHead..format("Tæng sè phÇn th­ëng chiÕn ®éi cã thÓ nhËn quı nµy %d, sè lÇn nhËn th­ëng d­ l¹i hiÖn t¹i %d", maxcount, count));
		end
		local tSel = {
			"NhËn lÊy phÇn th­ëng./#getAward_3v3_fightteam(1)",
			"trë l¹i/getAward_3v3",
			"KÕt thóc/nothing",
		}
		Say(g_szInfoHead..format("Tæng sè phÇn th­ëng chiÕn ®éi cã thÓ nhËn quı nµy %d, sè lÇn nhËn th­ëng d­ l¹i hiÖn t¹i %d, cã muèn tiÕp tôc nhËn kh«ng?", maxcount, count),
			getn(tSel), tSel);
		return
	elseif count > 0 then
		gf_SetLogCaption("3v3_FightTeamAward");
		local times = GetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED) + count;
		SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED, times);
--1¼¶ÎåĞĞÊ¯¡¾2,22,1¡¿°ó¶¨	1¸ö
		AddSkillAppCount(1, 1 * count);
		Msg2Player(format("Ng­¬i nhËn ®­îc %d cÊp 1 kü n¨ng th¹ch ®· l­u gi÷ vµo trong tói",count));
--¾­Ñé	µÈ¼¶*µÈ¼¶*120*Ê¤³¡Êı
		gf_Modify("Exp", GetLevel() * GetLevel() * 120 * count);
--ÎåĞĞ³¾	100
		ItemCreate.giveSeriesLowStone(100 * count)
--ÊÚÒµµãÊı	150
		gf_Modify("SYJY", 150 * count);
--PVPµãÊı	3
		gf_Modify("Pvp", 3 * count);
--¶ÔÕ½¾­Ñé	3
		gf_Modify("Dzjy", 3 * count);
--ºé»ÄËéÆ¬	1
		gf_AddItemEx2({"M¶nh Hång Hoang", {2,95,1506,1,4}}, 1 * count);
--±ÈÎä´ó»áÁîÅÆ£¨°ó¶¨£©	1
		gf_AddItemEx2({"Tû vâ ®¹i héi bµi", {2,0,1064,1,4}}, 1 * count);
		if times == 30 then
--¶îÍâ¸øÓè1¸öÎåĞĞÓñ²¢ÊÚÓè¡°ÁªÈüºÀÏÀ¡±³ÆºÅ
			ItemCreate.giveSeriesHighStone(1);
		end
		if mod(times, 3) == 0 then
			local titleLv = max(1, min(10, 11 - floor(times / 3)));
			DebugOutput("titleLv", titleLv);
			if titleLv < 10 then
				local sName, nID1, nID2 = gf_UnPack(g_tRankTitle[titleLv + 1]);
				RemoveTitle(nID1, nID2);
				Msg2Player(format("Ng­¬i ®· mÊt ®i [%s] danh hiÖu", sName));
			end
			local sName, nID1, nID2 = gf_UnPack(g_tRankTitle[titleLv]);
			if AddTitle(nID1, nID2) > 0 then
				SetTitleTime(nID1,nID2, GetTime() + 28*24*3600);
				SetCurTitle(nID1,nID2)
				Msg2Player("Ng­¬i nhËn ®­îc ["..sName.."] danh hiÖu");
				WriteLog(format("[3v3_FightTeamAward] [Role:%s Acc:%s] [danh hiÖu:%s]", GetName(), GetAccount(), sName));
			end
		end
		gf_SetLogCaption("");
	end
end

function getAward_3v3_match_before(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("BattleDate", getAward_3v3_match_before);
	end
	if bUpdate or not g_nLastMatchRound then
		local nCurMatchRound = data["LocalMatchRound"][1] or 0;
		if g_nLastMatchRound ~= nCurMatchRound then
			g_nLastMatchRound = nCurMatchRound;
			sdb = SDB(SDBKEY_3V3_MATCH_RANK, 0, nCurMatchRound, 2);
			g_3v3DataMgr:resetSDB("MATCH_RANK", sdb, 3600);
		end
	end
	g_3v3DataMgr:getData("MATCH_RANK", callout(getAward_3v3_match, nCurMatchRound));
end

function getAward_3v3_match(nCurMatchRound, nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("MATCH_RANK", callout(getAward_3v3_match, nCurMatchRound));
	end
	if bUpdate then
		g_3v3MatchRank = {}
		g_FightTeamID2Rank = {}
		for i = 1, nCount do
			DebugOutput("CËp nhËt xÕp h¹ng cuèi cïng");
			local tRankData = tData[i-1];
			DebugOutput(gf_UnPack(tRankData));
			local tRank = {};
			for j = 2, getn(tRank), 2 do
				tinsert(tRank, {tRankData[j], tRankData[j+1]});
				g_FightTeamID2Rank[tRankData[j]] = {tRankData[j+1], i};
			end
			g_3v3MatchRank[i] = tRank;
		end
	end
	if not g_3v3MatchRank or getn(g_3v3MatchRank) == 0 or not g_FightTeamID2Rank then
		return Talk(1, "", "T¹m thêi kh«ng thÓ nhËn th«ng tin phÇn th­ëng");
	end
	local ftID = GetFightTeamID();
	if not ftID == 0 then
		return Talk(1, "", "Ng­¬i kh«ng cã chiÕn ®éi, kh«ng thÓ nhËn th­ëng");
	end
	local rank = g_FightTeamID2Rank[ftID];
	if not rank then
		return Talk(1, "", "ChiÕn ®éi cña ng­¬i quı tr­íc kh«ng cã trong danh s¸ch chung kÕt, kh«ng thÓ nhËn th­ëng");
	end
	if GetTask(TASKID_3V3_MATCH_FINALS_AWARD_ROUND) >= nCurMatchRound then
		return Talk(1, "", "Ng­¬i ®· nhËn th­ëng quı tr­íc råi");
	end
	SetTask(TASKID_3V3_MATCH_FINALS_AWARD_ROUND, nCurMatchRound);
	getAward_3v3_match_real();
end
function getAward_3v3_match_real(rank)
--1		ÎåĞĞÓñ12£¬¼¼ÄÜÊ¯1¼¶*180£¬è­è²ÂöÆø*2500£¬¶·ÆÇÁî*2500£¬¿ÉÊÕ²Ø¹Ò¼ş0,120,138;0,120,139;0,120,140;0,120,141  
--2		ÎåĞĞÓñ10£¬¼¼ÄÜÊ¯1¼¶*150£¬è­è²ÂöÆø*2000£¬¶·ÆÇÁî*2000	
--4-3	ÎåĞĞÓñ8£¬¼¼ÄÜÊ¯1¼¶*120£¬è­è²ÂöÆø*1500£¬¶·ÆÇÁî*1500	
--8-5	ÎåĞĞÓñ6£¬¼¼ÄÜÊ¯1¼¶*90£¬è­è²ÂöÆø*1000£¬¶·ÆÇÁî*1000	
--16-9	ÎåĞĞÓñ4£¬¼¼ÄÜÊ¯1¼¶*60£¬è­è²ÂöÆø*500£¬¶·ÆÇÁî*500	
--32-17	ÎåĞĞÓñ2£¬¼¼ÄÜÊ¯1¼¶*30£¬è­è²ÂöÆø*250£¬¶·ÆÇÁî*250	
	local tcount = {
		{4	,60  ,800	,800   	},
		{3	,50  ,700	,700	},
		{3	,40  ,500	,500	},
		{2	,30	 ,300	,300	},
		{1	,20	 ,200	,200	},
		{1	,10	 ,80	,80		},
	}
	local count = tcount[rank];
	if not count then
		return Talk(1, "", "Danh s¸ch chiÕn ®éi trong quı cña ng­¬i h×nh nh­ cã vÊn ®Ò, h·y liªn hÖ víi Nghªnh Kh¸ch §­êng");
	end
	gf_SetLogCaption("3v3_MatchAward "..rank);
--ÎåĞĞÓñ
	ItemCreate.giveSeriesHighStone(count[1]);
--¼¼ÄÜÊ¯1¼¶
	AddSkillAppCount(1, count[2]);
	Msg2Player(format("Ng­¬i nhËn ®­îc %d cÊp 1 kü n¨ng th¹ch ®· l­u gi÷ vµo trong tói", count[2]));

--è­è²ÂöÆø
	gf_AddItemEx2({"Th«i X¸n M¹ch Khİ", {2,92,9,1,4}}, count[3]);
--¶·ÆÇÁî
	gf_AddItemEx({2,95,1511,1,4}, "§Êu Ph¸ch LÖnh", nCount[4]);
	if rank == 1 then
		local tItem = {
			{0,120,138,1,4},
			{0,120,139,1,4},
			{0,120,140,1,4},
			{0,120,141,1,4},
		}
		gf_AddItemEx(tItem[GetBody()], "Trang søc ®eo h«ng");
	end
	gf_SetLogCaption("");	
end

function getAward_3v3_daily()
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then return end

	local today = gf_TodayDate()
	local lastDay = GetTask(TASKID_3V3_AWARD_DAILY_DATE);
	if lastDay < today then
		nCount = GetTask(TASKID_3V3_WIN_ROUND_DAILY);
		SetTask(TASKID_3V3_WIN_ROUND_DAILY, 0);
		if nCount > 0 then
			gf_SetLogCaption("3v3_DailyAward");
			nCount = min(nCount, 12);
			for i = 1, getn(g_tAward_3v3) do
				g_tAward_3v3[i].giveClause(nCount);
			end
			gf_SetLogCaption("");
		else
			Talk(1, "", g_szInfoHead.."TrËn th¾ng cña ng­¬i h«m qua ch­a ®ñ hoÆc ®· nhËn th­ëng råi!");
		end
		SetTask(TASKID_3V3_AWARD_DAILY_DATE, today);
		--Observer:onEvent(OE_3V3_DAILY_AWARD,{GetTask(TASKID_3V3_TOTAL_ROUND_DAILY),nCount});
	else
		Talk(1, "", g_szInfoHead.."TrËn th¾ng cña ng­¬i h«m qua ch­a ®ñ hoÆc ®· nhËn th­ëng råi!");
	end
end

function getAward_3v3_week()
	if tonumber(date("%H")) < 12 then
		return Talk(1, "", g_szInfoHead.."Sau 12 giê h·y ®Õn nhËn th­ëng!");
	end
	g_3v3DataMgr:getData("RANK_LOCAL_LASTWEEK", updateXvXRank);
end

function updateXvXRank(nCount, s)
	if (nCount <= 0) then
		return
	end
	nCount = min(nCount, 10) - 1;
	g_tXvXRankLocak = {}
	for i = 0, nCount do
		g_tXvXRankLocak[s[i][1]] = i + 1;
	end
	getWeeklyAward_3v3();
end

g_tRankTitle = {
	{"Vâ L©m Minh ThËp Vâ Th¸nh", 67, 20	},
	{"Vâ L©m Minh Cöu Vâ T«n", 67, 19	},
	{"Vâ L©m Minh B¸t Vâ Quû", 67, 18	},
	{"Vâ L©m Minh ThÊt Vâ Hoµng", 67, 17	},
	{"Vâ L©m Minh Lôc Vâ Linh", 67, 16	},
	{"Vâ L©m Minh Ngò Vâ T«ng", 67, 15	},
	{"Vâ L©m Minh Tø Vâ HiÖp", 67, 14	},
	{"Vâ L©m Minh Tam Vâ S­", 67, 13	},
	{"Vâ L©m Minh NhŞ Vâ SÜ", 67, 12	},
	{"Vâ L©m Minh NhÊt Vâ Gi¶", 67, 11	},
}
g_3v3DailyAward = {
	50,
	45,
	40,
	35,
	30,
	25,
	20,
	15,
	10,
	5,
}

function getWeeklyAward_3v3()
	if not g_tXvXRankLocak then return end
	local nRank = g_tXvXRankLocak[GetName()];
	if not nRank or nRank <= 0 or nRank > 10 then
		return Talk(1, "", g_szInfoHead.."TuÇn tr­íc xÕp h¹ng trong server ng­¬i ch­a n»m trong top 10, kh«ng thÓ nhËn th­ëng!");
	end
	if GetTask(TASKID_3V3_WEEKLY_AWARD_DATE) >= tonumber(date("%Y%W")) then
		Talk(1, "", g_szInfoHead.."Ng­¬i ®· nhËn phÇn th­ëng tuÇn tr­íc, hy väng ®¹i hiÖp tiÕp tôc cè g¾ng!");
		return
	end
	SetTask(TASKID_3V3_WEEKLY_AWARD_DATE, tonumber(date("%Y%W")));
	gf_SetLogCaption("3v3 WeeklyAward");
	local sName, nID1, nID2 = g_tRankTitle[nRank][1], g_tRankTitle[nRank][2], g_tRankTitle[nRank][3]
	if AddTitle(nID1,nID2) > 0 then
		SetTitleTime(nID1,nID2, GetTime() + 7*24*3600);
		SetCurTitle(nID1,nID2)
		Msg2Player("B¹n nhËn ®­îc ["..sName.."] danh hiÖu");
		WriteLog(format("[3v3 phÇn th­ëng tuÇn] [Role:%s Acc:%s] nhËn ®­îc h¹ng %d liªn ®Êu", GetName(), GetAccount(), nRank));
		if gf_TodayDate() >= 20121224 and gf_TodayDate() <= 20121230 then
			local nCount = 100 - (nRank - 1) * 5;
			Msg2Player(format("Do thuéc tİnh danh hiÖu tuÇn nµy v« hiÖu, ng­¬I nhËn ®­îc %d §Êu Ph¸ LÖnh", nCount));
			gf_AddItemEx({2,95,1511,1,4}, "§Êu Ph¸ch LÖnh", nCount);
		end
	end
	gf_SetLogCaption("");
end

function info_3v3(nPage)
	if not nPage then
		local tSel = {
			"Giíi thiÖu cí chÕ/#info_3v3(1)",
			"Quy t¾c thi ®Êu/#info_3v3(2)",
			"Ph¸n ®o¸n th¾ng b¹i/#info_3v3(3)",
			"Gi¶i thİch chØ sè/#info_3v3(4)",
			"ThuyÕt minh phÇn th­ëng/#info_3v3(5)",
			"trë l¹i/main_3v3",
		}
		Say(g_szInfoHead.."Ng­¬i muèn biÕt néi dung vÒ mÆt nµo?", getn(tSel), tSel);
		return
	end
	local tInfo = {
	"[Giíi thiÖu c¬ chÕ] Liªn §Êu §¹i Héi TØ Vâ më víi h×nh thøc quı. Cã thÓ tham gia víi h×nh thøc c¸ nh©n hoÆc ®éi ngò.Mçi quı cã 28 ngµy, chia thµnh 25 ngµy ®Êu, 3 ngµy nghØ. Mçi quı míi nhÊt ®Şnh b¾t ®Çu vµo thø hai.TiÕn ®é cô thÓ vÒ gi¶i ®Êu quı, cã thÓ bÊm nót K xem giao diÖn më ra sau khi ®i vao ®Êu tr­êng. Gi¶i ®Êu më vµo 19:00, kÕt thóc vµo 20:00. Mçi trËn 5 phót, tæng céng cã 12 trËn. nÕu kh«ng më b×nh th­êng, th× muén nhÊt kĞo dµi ®Õn 22 giê 30 phót. tiÕp theo , mÆc dï kh«ng ®ñ 12 trËn, còng kh«ng më n÷a.",
	"[Quy t¾c thi ®Êu] Sau khi ®¹i hiÖp vµo ®Êu tr­êng, cã thÓ bÊm nót K më ra giao diÖn tham gia, bÊm nót tham gia sÏ ®i vµo ®éi ngò phèi hîp; HoÆc tæ ®éi thµnh ®éi ngò cã ba l­u ph¸i kh¸c nhau, do ®éi tr­ëng bÊm nót tham gia ®Ó ®i vµo ®éi ngò phèi hîp.§éi ngò hoÆc c¸ nh©n ®ang phèi hîp ®éi viªn sÏ kh«ng thÓ tiÕn hµnh ®éi ngò thao th¸c. Sau khi ®i vµo ®Êu tr­êng, hai bªn cã 30 gi©y ®Ó chuÈn bŞ, sau ®ã chİnh thøc b¾t ®Çu chiÕn ®Êu.",
	"[Ph¸n ®o¸n th¾ng b¹i] Mét phe toµn bé bŞ träng th­¬ng kh«ng thÓ ®¸nh tiÕp, ®èi ph­¬ng th¾ng lîi. Khi hai bªn ®Òu cã ®éi viªn ë tr¹ng th¸i cã thÓ ®¸nh tiÕp, l­îng s¸t th­¬ng cña phe nµo cao nhÊt th× phe ®ã chiÕn th¾ng.",
	"[Gi¶i thİch chØ sè] Lùc chiÕn ®Êu: ı lµ kh¶ n¨ng chiÕn ®Êu cña ng­êi ch¬i, do tû lÖ th¾ng, sè trËn tham gia,v,v..quyÕt ®Şnh. sau khi kÕt thóc gi¶i ®Êu quı, lùc chiÕn ®Êu sÔ gi¶m xuèng.§iÓm t­ c¸ch: c¨n cø sè trËn chiÕn th¾ng mçi ngµy cña ng­êi ch¬i, cã thÓ ®æi thµnh ®iÓm t­ c¸ch t­¬ng øng. Dïng ®Ó xÕp hµng, cã thÓ tİnh tæng céng. Gi¶i ®Êu quı kÕt thóc sÏ trë vÒ 0. ThiÖt h¹i: ı lµ gi¸ trŞ chiÕn ®Êu cña ng­êi ch¬i, do sè l­îng giÕt ng­êi vµ sè l­îng tö vong quyÕt ®Şnh. sè l­îng cµng cao, gi¸ trŞ cµng lín.",
	"[Gi¶i thİch gi¶i th­ëng] §¹i hiÖp cã thÓ nhËn gi¶i th­ëng tuÇn vµ quı trong giao diÖn Thiªn H¹ §Ö NhÊt §¹i Héi TØ Vâ, cßn cã c¸c gi¶i th­ëng kh¸c, xin vui lßng chê ®îi!",
	}

	suTalk("info_3v3", g_szInfoHead..tInfo[nPage]);
end

function seeLastWeekRank(nCount, data)
	if not nCount then
		return g_3v3DataMgr:getData(SDBKEY_RANK_LOCAL_LASTWEEK, seeLastWeekRank);
	end
	if nCount < 1 then
		return Talk(1, "", "T¹m thêi kh«ng cã d÷ liÖu, ®Õn sau nhĞ");
	end
	nCount = min(nCount, 10) - 1;
	local msg = "XÕp hµng tuÇn tr­íc nh­ sau:\n"
	for i = 0, nCount do
		local name = data[i][1];
		msg = msg .. format("%d    %s\n", i + 1, name);
	end
	Talk(1, "", msg);
end

function seeLastMatchRank(nCount, data)
	if not data then
		return SDBCallBack(SDBKEY_RANK_LOCAL, 0, 0, seeLastMatchRank);
	end
	nCount = min(nCount, 30);
	local msg = "XÕp h¹ng quı hiÖn t¹i nh­ sau: \n"
	for i = 0, nCount - 1 do
		local szTo = data[i][1];
		msg = msg .. format("%d    %s\n", i + 1, szTo);
	end	
	Talk(1, "", msg);
end

function xxxcheckMatchAward(nCount, data)
	Msg2Player("checkMatchAward...", nCount);
	if not nCount then
		return SDBCallBack(SDBKEY_3V3, 2, 0, xxxcheckMatchAward);
	end
	Msg2Player("Analysis Local Match data...")
	if nCount < 1 then
		Msg2Player("no local data!");
	else
		local tData = data["LocalMatchRound"];
		nLocalRound, bGiveAward = tData[1], tData[2];
		Msg2Player("LocalRound = ", nLocalRound, bGiveAward);
	end
	Msg2Player(" ");
	Msg2Player("Try GlobalData...");
	local s = SDB(SDBKEY_3V3, 2, 0, 2);
	s:apply2(xxxcheckMatchAward2);
end

function xxxcheckMatchAward2(nCount, data)
	Msg2Player("Analysis Global Match data...")
	nCount = nCount or 0;
	if nCount < 1 then
		Msg2Player("no global data!");
	else
		local tData = data["GlobalMatchRound"];
		nGlbRound = tData[1];
		Msg2Player("nGlbRound = ", nGlbRound);
	end
	
	Msg2Player(" ");
	Msg2Player("Try AwardData...");
	SDBCallBack(SDBKEY_RANK_LOCAL, 0, 0, xxxcheckAwardData);
end

function xxxcheckAwardData(nCount, data)
	Msg2Player("Analysis Award data...")
	if nCount < 1 then
		Msg2Player("no award data!");
	else
		Msg2Player("NO  Score  Name");
		local m = min(nCount, 20) - 1;
		for i = 0, m do
			local tData = data[i];
			Msg2Player(format("%02d  %4d  %s", i + 1, tData[2], tData[1]));
		end
	end
	
end

function seeMatchTeamRank(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FIGHTTEAM_RANK", seeMatchTeamRank)
	--	return Talk(1, "", g_szInfoHead.."Ç°·½µÀÂ·²»Í¨, ÇëÉÔºóÔÙÊÔ");
	end
	if bUpdate then
		g_MatchTeamRank = {}
		g_MatchTeamRankMsg = ""
		nCount = min(nCount, 30)
		for i = 1, nCount do
			local tFTInfo = tData[i-1];
			local name = tFTInfo[1];
			local aa,bb,strGbGroup,strGbName = strfind(name,"(.-)*(.*)");
			local score = tFTInfo[2];
			local ftID = tFTInfo[3];
			DebugOutput(i, gf_UnPack(tFTInfo));
			g_MatchTeamRank[ftID] = i;
			g_MatchTeamRankMsg = g_MatchTeamRankMsg .. format("H¹ng %2d liªn ®Êu %-16s %8d ®iÓm", i, strGbName, score);
			if mod(i, 2) == 1 then
				g_MatchTeamRankMsg = g_MatchTeamRankMsg.. "        ";
			else
				g_MatchTeamRankMsg = g_MatchTeamRankMsg.."\n";
			end
--			if mod(i, 8) == 0 then
--				g_MatchTeamRankMsg = g_MatchTeamRankMsg .. "\\p";
--			end
		end
	end
	if not g_MatchTeamRankMsg or not g_MatchTeamRank then
		return Talk(1, "", "HiÖn t¹i kh«ng thÓ lÊy sè liÖu xÕp h¹ng");
	end
	local msg = g_MatchTeamRankMsg;
	local myFTID = GetFightTeamID();
	if myFTID ~= 0 then
		nRank = g_MatchTeamRank[myFTID];
		if nRank then
			msg = msg .. format("\n xÕp h¹ng chiÕn ®éi cña ng­¬i: h¹ng %d liªn ®Êu", nRank);
		else
			msg = msg .. "\n xÕp h¹ng chiÕn ®éi cña ng­¬i kh«ng n»m trong top 30";
		end
	else
		msg = msg .. "\n Ng­¬i ch­a gia nhËp chiÕn ®éi";
	end
	local tSel = {
		"trë l¹i/main_3v3_2",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	suSay(msg, getn(tSel), tSel);
end

function seePerliminaryRank(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FINALS_TEAMS2", seePerliminaryRank)
	--	return Talk(1, "", g_szInfoHead.."Ç°·½µÀÂ·²»Í¨, ÇëÉÔºóÔÙÊÔ");
	end
	if bUpdate then
		nCount = min(nCount, PRELIMINARY_TEAM_PER_GROUP);
		g_FinalsRankMsg = "Danh s¸ch tham gia chung kÕt: \n"
		for i = 1, nCount do
			local tFTInfo = tData[i - 1];
			DebugOutput(gf_UnPack(tFTInfo));
			local name = tFTInfo[3];
			g_FinalsRankMsg = g_FinalsRankMsg .. format("H¹ng %2d liªn ®Êu %-32s", i, name);
			g_FinalsRankMsg = g_FinalsRankMsg.."\n";
		end
	end
	DebugOutput(g_FinalsRankMsg)
	if not g_FinalsRankMsg == 0 then
		return Talk(1, "", "LÊy danh s¸ch tham gia chung kÕt bŞ lçi");
	end
	local tSel = {
		"trë l¹i/main_3v3_2",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	local msg = g_FinalsRankMsg;
	PAGE_SIZE = 350
	suSay(msg, getn(tSel), tSel);
end

function seeFinalMatchRank(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("BattleDate", seeFinalMatchRank);
	end
	if bUpdate or not g_nLastMatchRound then
		local nCurMatchRound = tData["LocalMatchRound"][1] or 0;
		if g_nLastMatchRound ~= nCurMatchRound then
			g_nLastMatchRound = nCurMatchRound;
			sdb = SDB(SDBKEY_3V3_MATCH_RANK, 0, nCurMatchRound, 2);
			g_3v3DataMgr:resetSDB("MATCH_RANK", sdb, 3600);
		end
	end
	DebugOutput(g_nLastMatchRound)
	g_3v3DataMgr:getData("MATCH_RANK", callout(seeFinalMatchRank_cb, nCurMatchRound));
end

function seeFinalMatchRank_cb(nCurMatchRound, nCount, data, bUpdate)
	if bUpdate then
		nCount = nCount;
		g_FinalsRankMsg2 = ""
		for i = 0, nCount - 1 do
			local tFTInfo = tData[i];
			DebugOutput(gf_UnPack(tFTInfo));
			local count = getn(tFTInfo) / 2
			local name = tFTInfo[1];
			local ftID = tFTInfo[2];
			g_FinalsRankMsg2 = g_FinalsRankMsg2 .. format("XÕp h¹ng %2d liªn ®Êu \n", nTop);
			for n = 1, count do
				g_FinalsRankMsg2 = g_FinalsRankMsg2 .. tRoundTop[n*2] .. "\n";
			end
		end
	end
	DebugOutput(g_FinalsRankMsg2)
	if not g_FinalsRankMsg2 then
		return Talk(1, "", "LÊy danh s¸ch xÕp h¹ng chung kÕt quı tr­íc bŞ lçi");
	end
	local tSel = {
		"trë l¹i/main_3v3_2",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	local msg = g_FinalsRankMsg2 .. "\n phÇn th­ëng sÏ th«ng qua hÖ thèng th­ tİn ®Ó ph¸t";
	suSay(msg, getn(tSel), tSel);
end
