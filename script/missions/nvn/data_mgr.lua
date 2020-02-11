Include("\\script\\lib\\sdb.lua")

----sdb data-------------------------------------------
SDBKEY_3V3 = " _3V3_DATA_";
--nkey = 0, 0		-- 赛程数据
--  Item["BattleDate"] = {"ddddd", self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
--			PreLiminaryFinish or 0, FinalsFinish or 0, nMatchRound or 1}
--nKey = 1, gsId	-- 每日场次数据
--	Item["DailyData"] = {"dd", gf_TodayDate(), nRound};
--nkey = 2, 0		-- 赛季
--	Item["GlobalMatchRound"] = {"dd", nMatchRound, 0};
--nkey = 3, 1		-- 决赛队伍
--	Item[i] = {"s", tTeams[i].name};

----sdb data-------------------------------------------
SDBKEY_RANK_GLOBAL = "XVX_RANK_GLOBAL";
--nKey = 0, 0		-- 排名数据
----sdb data end---------------------------------------

----sdb data-------------------------------------------
SDBKEY_RANK_LOCAL = "XVX_RANK_LOCAL";
--nKey = 0, 0		-- 排名数据
----sdb data end---------------------------------------

----sdb data-------------------------------------------
SDBKEY_3V3_FIGHTTEAM_RANK = " _3V3_FT_RANK";
--nKey = 0, 0		-- 战队排名数据
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_RANK = " _3v3_Match_Rank";
--nKey = 0, nMatchRound
--	Item[i] = {"fsfsfs...", FightTeamID, FightTeamName,...}
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_AWARD = " _3V3_MATCH_AWARD";
--nKey = 0, nMatchRound		-- 战队排名数据
--	Item[Name] = {"d", nRank}
----sdb data end---------------------------------------

PRELIMINARY_TEAM_PER_GROUP = 20


SDBKEY = {
	BattleDate = {SDBKEY_3V3, 0, 0, 2, 3600},	--赛季时间
	GlobalMatchRound = {SDBKEY_3V3, 2, 0, 2, 1200},--跨服赛季标记
	LocalMatchRound = {SDBKEY_3V3, 2, 0, 0, 1200}, --源服赛季标记
	GlobalRank = {SDBKEY_RANK_GLOBAL, 0, 0, 2, 1200},
	LocalRank = {SDBKEY_RANK_LOCAL, 0, 0, 0, 1200},
	SDBKEY_RANK_LOCAL_LASTWEEK = {SDBKEY_RANK_LOCAL_LASTWEEK, 0, 0, 0, 3600},
	FIGHTTEAM_RANK  = {SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0, 0, 3600},
	FIGHTTEAM_RANK2  = {SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0, 0, 3600},
	FINALS_TEAMS = {SDBKEY_3V3, 3, 1, 2, 3600},
	FINALS_TEAMS2 = {SDBKEY_3V3, 3, 1, 2, 3600},
	MATCH_RANK = {SDBKEY_3V3_MATCH_RANK, 0, -1, 2, 3600},
	MATCH_AWARD = {SDBKEY_3V3_MATCH_AWARD, 0, -1, 2, 3600},
}

g_3v3DataMgr = DataMgr();
g_3v3DataMgr:Init(SDBKEY);

--print(Val2Str(g_3v3DataMgr))
--g_3v3DataMgr:getData("BattleData", print)
