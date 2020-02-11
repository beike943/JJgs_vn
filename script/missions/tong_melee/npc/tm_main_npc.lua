--°ïÅÉ´óÂÒ¶·¹¦ÄÜnpc
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

g_TimeLimit = 0;
g_TimeLimitOther = 0;
g_tTongRank = {};

--²Î¼Ó°ïÅÉ´óÂÒ¶·
function tm_join_tong_melee()
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local tSay = {
		"Lo¹n chiÕn bang héi lµ g×/tm_what_is_tong_melee",
		"§iÒu kiÖn tham gia lo¹n chiÕn bang héi/tm_join_condition",
		"Quy t¾c lo¹n chiÕn bang héi/tm_rule_tong_melee",
		"\n Ph¶n håi/tm_dialog_return",
		"Ra khái/nothing"
	}
	local nRet = IsPlayerQueuing(1);
	if not nRet  then return 0; end
	if nRet == 1 then
		tinsert(tSay, 1, "Tho¸t ra xÕp hµng bang héi lo¹n chiÕn/tm_cancle_tong_melee_now");
	else
		tinsert(tSay, 1, "Tham gia lo¹n chiÕn bang héi/tm_join_tong_melee_now");
	end
	Say(TM_TONG_AD_NPC.."Tø Linh ThÇn Thó lµ ®Ó rÌn luyÖn t­ c¸ch cña mäi ng­êi, c¸c bang héi lõng danh thiªn h¹ ®Õn ®Ó tham gia lo¹n chiÕn, ®ång thêi còng kiÓm tra thùc lùc cña c¸c bang héi.", getn(tSay), tSay);
end

--ÁìÈ¡°ïÅÉ´óÂÒ¶·½±Àø
function tm_award_tong_melee()
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local tSay = {
		"NhËn th­ëng mçi trËn/tm_get_every_match_award",
		"L·nh phÇn th­ëng bang héi/tm_get_tong_award",
		"Xem xÕp h¹ng hiÖn nay/tm_look_for_rank",
		"\n T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(TM_TONG_AD_NPC.."Tø Linh ThÇn Thó lµ ®Ó rÌn luyÖn t­ c¸ch cña mäi ng­êi, c¸c bang héi lõng danh thiªn h¹ ®Õn ®Ó tham gia lo¹n chiÕn, ®ång thêi còng kiÓm tra thùc lùc cña c¸c bang héi.", getn(tSay), tSay);
end

--·µ»Ø
function tm_dialog_return()
	SetPlayerScript("\\script\\ÊÀ½çµØÍ¼\\¿ç·þÑÝÎä³¡\\npc\\tong_ambassagor.lua");
	SendScript2VM("\\script\\ÊÀ½çµØÍ¼\\¿ç·þÑÝÎä³¡\\npc\\tong_ambassagor.lua", "main()");
end

function get_join_que_id()
	local nTime = tonumber(date("%H%M"));
	if nTime < 1300 then
		return 1
	else
		return 2
	end
end
function get_delete_que_id()
	local nTime = tonumber(date("%H%M"));
	if nTime < 2215 then
		return 1
	else
		return 2
	end
end

--²Î¼Ó°ï»á´óÂÒ¶·
function tm_join_tong_melee_now()
	if tm_checkJoinCondition() ~= 0 then
		AddPlayerToQueuing(get_join_que_id(), 1);
	end
end

--È¡Ïû°ï»á´óÂÒ¶·
function tm_cancle_tong_melee_now()
	local nRet = IsPlayerQueuing(1);
	if nRet and nRet == 1 then
		DelPlayerFromQueuing(get_delete_que_id());
	end
end

--Ê²Ã´ÊÇ°ï»á´óÂÒ¶·
function tm_what_is_tong_melee()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."Tø Linh ThÇn Thó lµ ®Ó rÌn luyÖn t­ c¸ch cña hä, kiÓm tra lùc chiÕn ®Êu cña bang héi, c¸c bang héi lõng danh thiªn h¹ cã thÓ tham gia lo¹n chiÕn. Toµn bé ho¹t ®éng lµ c¸c bang héi tham gia, mçi bang héi sÏ chän ra 8 ng­êi tham gia, ho¹t ®éng diÔn ra vµo lóc 19:45 thø 6, thø 7, chñ nhËt tham gia b¸o danh, 20:00 chÝnh thøc b¾t ®Çu.";
	tSay.sel = {
		{"\n Ph¶n håi", "tm_join_tong_melee"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

--²Î¼ÓÌõ¼þÊÇÊ²Ã´
function tm_join_condition()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."ChØ cÇn nh©n vËt ®¹t ®Õn cÊp 90 vµ häc hÕt kü n¨ng cÊp 55 , <color=red> ng­êi ch¬i ®· gia nhËp bang héi <color> th× cã thÓ tham gia. Nh­ng chØ cã <color=red> qu¶n lý bang héi <color> lµm ®éi tr­ëng ®­a tæ ®éi ®i vµo míi ®­îc!";
	tSay.sel = {
		{"\n Ph¶n håi", "tm_join_tong_melee"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end


function tm_rule_tong_melee()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."Sau khi lo¹n chiÕn bang héi b¾t ®Çu, ®éi tr­ëng cã thÓ ph©n phèi ThÇn Thó, giao cho 1 thµnh viªn b¶o vÖ. §¸nh b¹i thµnh viªn bang héi kh¸c sÏ nhËn ®­îc ®iÓm linh lùc thÇn thó, ®¸nh b¹i ng­êi b¶o vÖ thÇn thó, cã thÓ nhËn ®­îc cµng nhiÒu ®iÓm linh lùc thÇn thó. BÞ tö vong sÏ bÞ trõ ®iÓm linh lùc thÇn thó cña bang héi m×nh, khi ®iÓm linh lùc thÇn thó ®¹t ®Õn gi¸ trÞ nhÊt ®Þnh, thÇn thó sÏ th¨ng cÊp, mang ®Õn nhiÒu lîi Ých cho bang héi. §ång thêi bÞ trõ qu¸ nhiÒu ®iÓm linh lùc thÇn thó sÏ lµm cho thÇn thó bÞ h¹ cÊp. Cuèi cïng c¨n cø vµo ®iÓm linh lùc bang héi ®Ó tiÕn hµnh xÕp h¹ng cao thÊp vµ lµm ®iÒu kiÖn ®Ó ph©n ®Þnh th¾ng b¹i.";
	tSay.msg = tSay.msg..format("( mét bang héi nhiÒu nhÊt chØ ®­îc 3 thµnh viªn tham gia)",3);
	tSay.sel = {
		{"\n Ph¶n håi", "tm_join_tong_melee"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function tm_get_every_match_award()
	local nExp = GetTask(TM_TASKID_EXP);
	local nYinJuan = gf_GetMyTaskByte(TM_TASKID_YINJUAN, 1, 2);
	if nExp == 0 and nYinJuan == 0 then
		Talk(1,"",TM_TONG_AD_NPC.."Ng­¬i ®· nhËn phÇn th­ëng mçi trËn lo¹n chiÕn bang héi, hoÆc lµ ch­a tham gia lo¹n chiÕn bang héi lÇn nµo hÕt!");
		return 0;
	end
	if nExp > 0 then
		gf_Modify("Exp", nExp);
		SetTask(TM_TASKID_EXP, 0, TASK_ACCESS_CODE_TONG_MELEE);
	end
	if nYinJuan > 0 then
		yinquanapi_limittop_award_yinquan(nYinJuan)
		gf_SetMyTaskByte(TM_TASKID_YINJUAN, 1, 2, 0, TASK_ACCESS_CODE_TONG_MELEE);
	end
end

function tm_look_for_rank()
	local nTime = GetTime();
	DebugOutput(nTime - g_TimeLimit)
	--5min¸üÐÂÒ»´Î
	if nTime - g_TimeLimit < 5*60 then
		tm_look_for_rank_local();
	else
		local s = SDB(TM_RANK_INMATCHREALM, 0, 0, 2);
		s:apply2(tm_look_for_rank_cb);
		g_TimeLimit = nTime;
	end
end

function tm_look_for_rank_local()
	--²éÑ¯ÅÅÃû
	local nRank = -1;
	local nSorce = 0;
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for _, v in g_tTongRank do
		if v and type(v) == "table" and getn(v) == 3 and tostring(v[1]) == tostring(RealmTongName) then
			nRank = v[3];
			nSorce = v[2];
			break;
		end
	end
	--ÏÔÊ¾ÅÅÃû
	local msg;
	if nRank <= 0 then
		msg = TM_TONG_AD_NPC.."Sè liÖu xÕp h¹ng lo¹n chiÕn bang héi cña quý bang hiÖn t¹i t¹m thêi ch­a cã";
	elseif nRank > TM_TONG_RANK_MAX then
		msg = TM_TONG_AD_NPC..format("XÕp h¹ng lo¹n chiÕn bang héi cña quý bang hiÖn t¹i n»m ngoµi %d top", TM_TONG_RANK_MAX);
	else
		msg = TM_TONG_AD_NPC..format("TuÇn tr­íc quý bang nhËn ®­îc <color=green>%d<color> ®iÓm tÝch lòy bang héi, lo¹n chiÕn bang héi xÕp h¹ng  <color=green>%d<color>!", nSorce, nRank);
	end	
	local nIndex = 1;
	local tSay = {}
	for i = 1, getn(g_tTongRank) do
		local v = g_tTongRank[i];
		if v and type(v) == "table" and getn(v) == 3 then	
			if v[3] > TM_TONG_RANK_MAX then
				break;
			end	
			tSay[nIndex] = format("H¹ng thø %d, bang héi [%s], ®iÓm tÝch lòy [%d]", v[3], v[1], v[2]);
			nIndex = nIndex + 1;
		end
	end
	local suSay = {};
	suSay.msg = msg;
	suSay.sel = {};
	for i =1, getn(tSay) do
		tinsert(suSay.sel, {tSay[i], "nothing"});
	end
	tinsert(suSay.sel, {"T¹i h¹ chØ xem qua th«i", "nothing"});
	temp_Talk(suSay);
	return 1;
end

function tm_look_for_rank_cb(nCount, sdb)
	DebugOutput("tm_look_for_rank_cb", nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."NhËn sè liÖu xÕp h¹ng bang héi lo¹n ®Êu liªn server bÞ lçi");
		return 0;
	end
	--¼ÆËãÅÅÃû
	local tempData;
	local nLastSocre = -1;
	local nRealRank = 0;
	local nIndex = 1;
	for i = 1, nCount do
		tempData = sdb[i-1];
		if tempData and getn(tempData) == 2 then
			if tempData[2] < nLastSocre or nLastSocre == -1 then
				nRealRank = nRealRank + 1;
			end
			DebugOutput(tostring(tempData[1]), tonumber(tempData[2]), nRealRank);
			g_tTongRank[nIndex] = {tostring(tempData[1]), tonumber(tempData[2]), nRealRank};
			nIndex = nIndex + 1;
			nLastSocre = tempData[2];
		end
	end
	tm_look_for_rank_local()
end

function tm_get_tong_award()
	local nTime = GetTime()
	DebugOutput(nTime - g_TimeLimitOther)
	if nTime - g_TimeLimitOther < 90 then
		Talk(1,"","Server ®ang bËn, xin chê mét chót thö l¹i!")
		return
	end
	local nDuty = GetTongDuty();
	if nDuty <= 0 or nDuty >= 4 then
		Talk(1,"",TM_TONG_AD_NPC.."ChØ cã ng­êi qu¶n lý bang héi míi nhËn th­ëng phÇn th­ëng bang héi ®­îc!")
		return 0;
	end
	local today = Date();
	local wDay = today:week();
	if wDay == 0 or wDay == 5 or wDay == 6 then
		Talk(1,"",TM_TONG_AD_NPC.."PhÇn th­ëng bang héi chØ cã thÓ nhËn tõ thø 2 ®Õn thø 5 hµng tuÇn!")
		return 0;
	end
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s:apply2(_tm_get_tong_award)
	g_TimeLimitOther = nTime;
end

function _tm_get_tong_award(nCount, sdb)
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for i = 1, nCount do
		local tData = sdb[i-1];
		DebugOutput("TM_RANK_INSOURCEREALM", tData[1], tData[2], tData[3], tData[4], tData[5]);
		if tData and tostring(RealmTongName) == tostring(tData[1]) and 1 == tonumber(tData[2]) then
			Say(TM_TONG_AD_NPC..format("TuÇn tr­íc quý bang nhËn ®­îc %s ®iÓm tÝch lòy bang héi, lo¹n chiÕn bang héi xÕp h¹ng thø %d, phÇn th­ëng bang héi ®· ®­îc <color=red>%s<color> nhËn th­ëng!", 
				tData[4], tData[3], tData[5]), 0);
			return 0;
		end
	end
	local s = SDB(TM_RANK_INMATCHREALM, 0, 0, 2);
	s:apply2(_tm_get_tong_award_cd)
end

function _tm_get_tong_award_cd(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."NhËn sè liÖu xÕp h¹ng bang héi lo¹n ®Êu liªn server bÞ lçi");
		return 0;
	end
	--¼ÆËãÅÅÃû
	local tempData;
	local tTongRank = {}
	local nLastSocre = -1;
	local nRealRank = 0;
	for i = 1, nCount do
		tempData = sdb[i-1];
		if tempData and getn(tempData) == 2 then
			if tempData[2] < nLastSocre or nLastSocre == -1 then
				nRealRank = nRealRank + 1;
			end
			tinsert(tTongRank, {tostring(tempData[1]), tonumber(tempData[2]), nRealRank})
			nLastSocre = tempData[2];
		end
	end
	--²éÑ¯ÅÅÃû
	local nRank = -1;
	local nSorce = 0;
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for _, v in tTongRank do
		if v and type(v) == "table" and getn(v) == 3 and tostring(v[1]) == tostring(RealmTongName) then
			nRank = v[3];
			nSorce = v[2];
			break;
		end
	end
	if nRank <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."Sè liÖu xÕp h¹ng lo¹n chiÕn bang héi cña quý bang hiÖn t¹i t¹m thêi ch­a cã");
		return 0;
	end
	if nRank > TM_TONG_RANK_MAX then
		Talk(1,"",TM_TONG_AD_NPC..format("XÕp h¹ng lo¹n chiÕn bang héi cña quý bang hiÖn t¹i n»m ngoµi %d top", TM_TONG_RANK_MAX));
		return 0;
	end
	local msg = format("TuÇn tr­íc quý bang nhËn ®­îc <color=green>%d<color> ®iÓm tÝch lòy bang héi, lo¹n chiÕn bang héi xÕp h¹ng  <color=green>%d<color>!", nSorce, nRank);
	Say(TM_TONG_AD_NPC..msg, 2, format("NhËn lÊy./#_tm_get_tong_award_now(%d, %d)", nSorce, nRank), "T¹i h¹ chØ xem qua th«i/nothing");
	return 1;
end

function _tm_get_tong_award_now(nSorce, nRank)
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s:reflash();
	s:apply2(callout(_tm_get_tong_award_now_cb, nSorce, nRank));
end

function _tm_get_tong_award_now_cb(nSorce, nRank, nCount, sdb)
	DebugOutput("_tm_get_tong_award_now_cb", nSorce, nRank, nCount, sdb)
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	local tData = sdb[RealmTongName];
	DebugOutput(RealmTongName, tData, tData[1], tData[2], tData[3], tData[4], tData[5])
	if tData[1] and tData[1] ~= 0 then
		Talk(1,"",TM_TONG_AD_NPC..format("Thµnh viªn bang héi %s ®· nhËn th­ëng tr­íc ng­¬i mét b­íc råi!", tData[4]));
		return 0;
	end
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s[RealmTongName] = {"ddds", 1, nRank, nSorce, GetName()};
	--¸ø½±Àø----------------
	gf_AddItemEx2({2,1,30614,TM_TONG_AWARD[nRank][1]}, "L«i Hæ Tinh Ph¸ch", "Lo¹n chiÕn bang héi", "PhÇn th­ëng bang héi", 0, 1);
	AddRuntimeStat(12, 3, 0, TM_TONG_AWARD[nRank][1]);
	if TM_TONG_AWARD[nRank][2] == 2 then
		gf_AddItemEx2({2,1,30618,1}, "ChiÕn kú tø linh bang héi cao cÊp", "Lo¹n chiÕn bang héi", "PhÇn th­ëng bang héi", 0, 1);
	elseif TM_TONG_AWARD[nRank][2] == 1 then
		gf_AddItemEx2({2,1,30617,1}, "ChiÕn Kú Tø Linh Bang Héi", "Lo¹n chiÕn bang héi", "PhÇn th­ëng bang héi", 0, 1);
	end
	return 1;
end