Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3.lua")
--Include("\\script\\mail\\mail_head.lua");


function sendMail(szTo, szFrom, szTitle, szContent, script, check)
	local tMailInfo = 
	{
		szTo				= szTo,
		szFrom				= szFrom,		-- 32 char
		szTitle				= szTitle,
		byPRI				= eMAIL_PRI_HIGH,
	};
	local tMailAttachmentInfo = 
	{
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= script,
		},
	};

	local tMailConditionInfo = 
	{
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= check,
		},
	};
	nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
	WriteLog(format("[Mail %s] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s Scr:%s Chk:%s]", 
		(nRet >= 1 and "Success") or "Failed", szTitle,
		guid, szFrom, tMailInfo.szTo, szTitle, szContent, script, check));
	return nRet;
end

g_3v3MatchAward = {
	2500,
	2400,
	2300,
	2200,
	2100,
	2000,
	1900,
	1800,
	1700,
	1600,
	1500,
	1400,
	1300,
	1200,
	1100,
	1000,
	900 ,
	800 ,
	700 ,
	600 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
}

SDBKEY_3V3 = " _3V3_DATA_";
SDBKEY_RANK_LOCAL = "XVX_RANK_LOCAL";
SDBKEY_RANK_LOCAL_LASTWEEK = "XVX_RANK_LOCAL_LASTWEEK";


function OnMatchRankAward(nCount, data)
	if gf_TodayDate() >= 20130116 and gf_TodayDate() <= 20130201 then
		return
	end
	if not data then
		return SDBCallBack(SDBKEY_RANK_LOCAL, 0, 0, OnMatchRankAward);
	end
	nCount = min(nCount, 30);

	local g_szContent = 
[[×ð¾´µÄÍæ¼Ò£º
    ÄúºÃ£¬¹§Ï²ÄúÔÚ±ÈÎä´ó»áÁªÈüÉÏ¸öÈü¼¾ÖÐ»ñµÃ±¾·þµÚ%dÃû£¬Çëµã»÷¸½¼þ½ÓÊÜ½±Àø¡£

                       ±ÈÎä´ó»áÁªÈü¹Ù·½
]]
	for i = 0, nCount - 1 do
		local szContent = format(g_szContent, i + 1);
		local szTo = data[i][1];
		local script = format("gf_AdditemEx({2,95,1511,%d}, '§Êu Ph¸ch LÖnh');", g_3v3MatchAward[i+1] or 250);
		sendMail(szTo, "Quan Liªn §Êu §¹i Héi TØ Vâ", "PhÇn th­ëng quý liªn ®Êu §¹i Héi TØ Vâ", szContent, script, "check_room_1");
	end	
end

function on3V3AwardTimer()
	DebugOutput("on3V3AwardTimer")
	if GetGSIndex()[0] == 1 then
		SDBCallBack(SDBKEY_3V3, 2, 0, update3v3MatchRank)
--	else
--		Msg2Player("ÇëÔÚãê¾©Ö´ÐÐ´Ë²Ù×÷£¬½±Àø·¢·ÅÊ§°Ü");
	end
end

function update3v3MatchRank(nCount, s)
	DebugOutput("update3v3MatchRank", nCount, s)
	local nRound, bAwarded = 0, 0
	if nCount > 0 then
		local tData = s["LocalMatchRound"];
		nRound, bAwarded = tData[1] or 0, tData[2] or 0;
	end
	local s = SDB(SDBKEY_3V3, 2, 0, 2)
	DebugOutput(format("Quý hiÖn t¹i: %d", nRound));
	s:apply2(callout(update3v3MatchRankCB2, nRound, bAwarded));
end

function update3v3MatchRankCB2(nRound, bAwarded, nCount, s)
	DebugOutput("update3v3MatchRankCB2",nRound, bAwarded, nCount, s)
	if nCount <= 0 then
		DebugOutput("Kh«ng cã sè liÖu toµn cuéc, ph¸t th­ëng thÊt b¹i");
		return
	end
	local tData = s["GlobalMatchRound"];
	DebugOutput("GlobalMatchRound =",tData[1])
	local nGlbMatchRound = tData[1] or 0;
	if nRound < nGlbMatchRound then
		local localSDB = SDB(SDBKEY_3V3, 2, 0);
		localSDB["LocalMatchRound"] = {"dd", nGlbMatchRound, 1};
		DebugOutput(format("Toµn cuéc ®Êu quý: %d", nGlbMatchRound));
--		OnMatchRankAward();
		local s = SDB(SDBKEY_RANK_LOCAL, 0, 0);
		s:delete();
		local s = SDB(SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0);
		s:delete();
		local msg = "Liªn §Êu §¹i Héi TØ Vâ 3V3 sÏ më gi¶i ®Êu quý míi vµo 10 giê s¸ng h«m nay, xin c¸c ®¹i hiÖp ®¨ng nhËp l¹i game tr­íc khi më gi¶i ®Êu quý míi, ®Ó ®¶m b¶o xÕp hµng quý tr­íc b×nh th­êng!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
		--ReloadAllScript(); --ÓÉÓÚÖ´ÐÐÁË¿çÈü¼¾£¬»º´æ»¹´æÔÚ£¬ÎÒÀÕ¸öÈ¥
	end
end
