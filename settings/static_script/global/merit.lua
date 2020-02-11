--Œ‰¡÷π¶—´∫ÕΩ£œ¿µ„ ˝
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\system_switch_config.lua")

PLAYER_IB_VERSION = 1 --µ±«∞∞Ê±æ∫≈
PLAYER_IB_BASE_VALUE = 1000 --ª˘¥°π¶—´÷µ
PLAYER_IB_TRANS_JUNGONG = 10 --Ω£œ¿µ„ ˝◊™ªªŒ™æ¸π¶µƒ±∂¬ 
PLAYER_IB_WEEKLY_DECAY_1V1_TIMES = 15 --÷¡…Ÿ≤Œº”15≥°1V1
PLAYER_IB_WEEKLY_DECAY_3V3_TIMES = 8  --÷¡…Ÿ≤Œº”8≥°3v3
PLAYER_IB_DECAY_PROB = 0.95 --À•ºı±»¬ 
PLAYER_IB_1V1_LIMIT = 20 --ªÒ»°Ω£œ¿µ„ ˝µƒ≥°¥Œ…œœﬁ
PLAYER_IB_3V3_LIMIT = 10 --ªÒ»°Ω£œ¿µ„ ˝µƒ≥°¥Œ…œœﬁ
PLAYER_IB_1V1_VIP_ADD = 0.1  --VipCardLevel*µ»º∂º”≥…
PLAYER_IB_3V3_VIP_ADD = 0.05 --VipCardLevel*µ»º∂º”≥…
PLAYER_IB_PROB = 1; --±»Œ‰œµ ˝

--define GameDataDef.h------
PLAYER_IB_WEEK_LIMIT = 8000	    --Ω£œ¿µ„ ˝÷‹…œœﬁ8K
PLAYER_IB_TOTAL_LIMIT = 400000	--Ω£œ¿µ„ ˝◊‹…œœﬁ40W
PLAYER_IB_WEEK_LIMIT_VIP_ADD = 0.05 --vip…œœﬁº”≥…

TASKID_WULIN_GONGXUN = 3254       --Œ‰¡÷π¶—´
TASKID_JIANXIA_TOTAL_NUM = 3255		--Ω£œ¿µ„ ˝
TASKID_JIANXIA_WEEKLY_NUM = 3256  --÷‹Ω£œ¿µ„ ˝
----------------------------
TASKID_JOIN_TIMES_NUM = 3257			--1◊÷Ω⁄º«¬º≤Œº”3v3¥Œ ˝£¨2◊÷Ω⁄º«¬º≤Œº”1v1¥Œ ˝
TASKID_IB_ITEM_TIME = 3258		--º«¬º «∑Ò π”√¡ÀIBµ¿æﬂ


--ªÒ»°∞Ê±æ∫≈
function _merit_GetVersion()
	return gf_GetTaskByte(TASKID_WULIN_GONGXUN, 4);
end

--…Ë÷√∞Ê±æ∫≈
function _merit_SetVersion(nValue)
	gf_SetTaskByte(TASKID_WULIN_GONGXUN, 4, nValue, TASK_ACCESS_CODE_PLAYER_IB);
	Msg2Player(format("C´ng trπng v‚ l©m cÀp nhÀt Æ’n phi™n b∂n %d", nValue));
end

--ªÒ»°Œ‰¡÷π¶—´
function _merit_GetMerit()
	return gf_GetMyTaskByte(TASKID_WULIN_GONGXUN, 1, 3);
end

--…Ë÷√Œ‰¡÷π¶—´
function _merit_SetMerit(nValue)
	gf_SetMyTaskByte(TASKID_WULIN_GONGXUN, 1, 3, nValue, TASK_ACCESS_CODE_PLAYER_IB);
end

--÷ÿ÷√Œ‰¡÷π¶—´
function _merit_ResetMerit()
	_merit_SetMerit(PLAYER_IB_BASE_VALUE);
	Msg2Player(format("C´ng trπng v‚ l©m Æ∑ thi’t lÀp lπi thµnh %d", PLAYER_IB_BASE_VALUE));
end

--ªÒ»°Ω£œ¿µ„ ˝
function _merit_GetSword()
	return GetTask(TASKID_JIANXIA_TOTAL_NUM);
end

--…Ë÷√Ω£œ¿µ„ ˝
function _merit_SetSword(nValue)
	SetTask(TASKID_JIANXIA_TOTAL_NUM, nValue, TASK_ACCESS_CODE_PLAYER_IB);
end

--ªÒ»°÷‹Ω£œ¿µ„ ˝
function _merit_GetWeeklySword()
	return GetTask(TASKID_JIANXIA_WEEKLY_NUM);
end

--…Ë÷√÷‹Ω£œ¿µ„ ˝
function _merit_SetWeeklySword(nValue)
	SetTask(TASKID_JIANXIA_WEEKLY_NUM, nValue, TASK_ACCESS_CODE_PLAYER_IB);
end

--3V3
function _merit_Get3V3JoinTimes()
	return gf_GetTaskByte(TASKID_JOIN_TIMES_NUM, 1);
end

function _merit_3V3AddOnce()
	gf_SetTaskByte(TASKID_JOIN_TIMES_NUM, 1, gf_GetTaskByte(TASKID_JOIN_TIMES_NUM, 1) + 1, TASK_ACCESS_CODE_PLAYER_IB);
end

function _merit_3V3Reset()
	gf_SetTaskByte(TASKID_JOIN_TIMES_NUM, 1, 0, TASK_ACCESS_CODE_PLAYER_IB);
	Msg2Player(format("SË trÀn tham gia %s Æ∑ thi’t lÀp lπi thµnh %d, c„ th” ti’p tÙc nhÀn Æ≠Óc %s.", "1V1", 0, "ßi”m ki’m hi÷p"));
end

--1V1
function _merit_Get1V1JoinTimes()
	return gf_GetTaskByte(TASKID_JOIN_TIMES_NUM, 2);
end

function _merit_1V1AddOnce()
	gf_SetTaskByte(TASKID_JOIN_TIMES_NUM, 2, gf_GetTaskByte(TASKID_JOIN_TIMES_NUM, 2) + 1, TASK_ACCESS_CODE_PLAYER_IB);
end

function _merit_1V1Reset()
	gf_SetTaskByte(TASKID_JOIN_TIMES_NUM, 2, 0, TASK_ACCESS_CODE_PLAYER_IB);
	Msg2Player(format("SË trÀn tham gia %s Æ∑ thi’t lÀp lπi thµnh %d, c„ th” ti’p tÙc nhÀn Æ≠Óc %s.", "3V3", 0, "ßi”m ki’m hi÷p"));
end

--IBµ¿æﬂ
function _merit_UseIbItem(bCheck)
	local nNow = GetTime();
	local nTime = nNow - GetTask(TASKID_IB_ITEM_TIME);
	if nTime < 72 * 3600 then
		Say(format("Bπn Æ∑ tıng sˆ dÙng ThŒ Ph«n Th≠Îng V‚ L©m, thÍi gian k›ch hoπt cﬂn d≠ lµ %d", 72 * 3600 - nTime), 0);
		return 0;
	end
	if not bCheck then
		SetTask(TASKID_IB_ITEM_TIME, nNow, TASK_ACCESS_CODE_PLAYER_IB);
		Msg2Player("ChÛc mıng bπn Æ∑ k›ch hoπt thµnh c´ng ThŒ Ph«n Th≠Îng V‚ L©m, trong 1V1 nhÀn Æ≠Óc Æi”m ki’m hi÷p t®ng 40%");
		Msg2Player("Trong 3V3 nhÀn Æ≠Óc Æi”m ki’m hi÷p t®ng 20%. Khi th t bπi, Khi th t bπi th◊ Æi”m c´ng trπng bﬁ trı gi∂m 20%. Duy tr◊ 3 ngµy, sang tu«n mÌi sœ bi’n m t.");
	end
	return 1;
end

function _merit_IsIbItem()
	local nActTime = GetTask(TASKID_IB_ITEM_TIME);
	if nActTime <= 0 then
		return 0;
	end
	if GetTime() - nActTime > 72 * 3600 then
		return 0;
	end
	return 1;
end

--–ﬁ∏ƒŒ‰¡÷π¶—´-----------------------------------------
function merit_ModifyMerit(nValue, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if 0 == nValue then 
		return 0;
	end
	--æ¸π¶’¬
	nIB = nIB or 0;
	if nValue > 0 and nIB > 0 then
		if nIB == 1 then
			nValue = floor(nValue * (1 + 0.2));
		elseif nIB == 2 then
			nValue = floor(nValue * (1 + 0.4));
		elseif nIB == 3 then
			nValue = floor(nValue * (1 + 0.6));
		elseif nIB == 4 then
			nValue = floor(nValue * (1 + 1));
		end
	end
	if nValue < 0 and nIB > 0 then
		if nIB == 1 then
			nValue = floor(nValue * (1 - 0.2));
		elseif nIB == 2 then
			nValue = floor(nValue * (1 - 0.4));
		elseif nIB == 3 then
			nValue = floor(nValue * (1 - 0.6));
		elseif nIB == 4 then
			nValue = floor(nValue * (1 - 1));
		end
	end	
	local nRet = max(nValue + _merit_GetMerit(), 0);
	_merit_SetMerit(nRet);
	if nValue > 0 then
		Msg2Player(format("Bπn nhÀn Æ≠Óc %d%s", nValue, "C´ng trπng v‚ l©m"));
	elseif nValue < 0 then
		Msg2Player(format("Bπn m t Æi %d%s", -nValue, "C´ng trπng v‚ l©m"));
	end
	return 1;
end

--–ﬁ∏ƒΩ£œ¿µ„ ˝÷µ
function merit_ModifySword(nValue, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if 0 == nValue then
		return 0;
	end
	--æ¸π¶’¬
	nIB = nIB or 0;
	if nValue > 0 and nIB > 0 then
		if nIB == 1 then
			nValue = floor(nValue * (1 + 0.2));
		elseif nIB == 2 then
			nValue = floor(nValue * (1 + 0.4));
		elseif nIB == 3 then
			nValue = floor(nValue * (1 + 0.6));
		elseif nIB == 4 then
			nValue = floor(nValue * (1 + 1));
		end
	end
	if nValue < 0 and nIB > 0 then
		if nIB == 1 then
			nValue = floor(nValue * (1 - 0.2));
		elseif nIB == 2 then
			nValue = floor(nValue * (1 - 0.4));
		elseif nIB == 3 then
			nValue = floor(nValue * (1 - 0.6));
		elseif nIB == 4 then
			nValue = floor(nValue * (1 - 1));
		end
	end
	local nWeeklyLimit = floor(PLAYER_IB_WEEK_LIMIT * (1 + GetVipCardLevel() * PLAYER_IB_WEEK_LIMIT_VIP_ADD));
	local nWeeklyRet = min(nValue, max(nWeeklyLimit - _merit_GetWeeklySword(), 0));
	if nWeeklyRet == 0 then
		Msg2Player("ßi”m ki’m hi÷p Æ∑ Æπt giÌi hπn tu«n");
		return 0;
	end
	local nTotalRet = min(nWeeklyRet, PLAYER_IB_TOTAL_LIMIT - _merit_GetSword());
	if nTotalRet == 0 then
		Msg2Player("ßi”m ki’m hi÷p Æ∑ Æπt giÌi hπn");
		return 0;
	end
	_merit_SetSword(max(nTotalRet + _merit_GetSword(), 0));
	if nTotalRet > 0 then
		_merit_SetWeeklySword(nTotalRet + _merit_GetWeeklySword());
	end
	if nTotalRet > 0 then
		Msg2Player(format("Bπn nhÀn Æ≠Óc %d%s", nTotalRet, "ßi”m ki’m hi÷p"));
	elseif nTotalRet < 0 then
		Msg2Player(format("Bπn m t Æi %d%s", nTotalRet, "ßi”m ki’m hi÷p"));
	end
	return 1;
end

--µ«¬ººÏ≤È-----------------------------------------
function merit_PlayerLogin()
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	local nSelfVersion = _merit_GetVersion();
	if nSelfVersion == PLAYER_IB_VERSION then
		return 0;
	end
	--∏¸–¬∞Ê±æ∫≈
	_merit_SetVersion(PLAYER_IB_VERSION);
	--÷ÿ÷√Œ‰¡÷π¶—´
	local nSelfMerit = _merit_GetMerit();
	_merit_SetMerit(PLAYER_IB_BASE_VALUE);
	--Ω£œ¿µ„ ˝◊™æ¸π¶
	local nSelfSword = _merit_GetSword();
	local nSelfWeeklySword = _merit_GetWeeklySword();
	if nSelfSword > 0 then
		if GetTask(701) >= 0 then
  	 	SetTask(701, GetTask(701) + nSelfSword * PLAYER_IB_TRANS_JUNGONG)
	  else
	  	SetTask(701, GetTask(701) - nSelfSword * PLAYER_IB_TRANS_JUNGONG)
	  end
	  Msg2Player(format("Bπn nhÀn Æ≠Óc %d%s", nSelfSword * PLAYER_IB_TRANS_JUNGONG, "C´ng trπng"));
  end
  --Ω£œ¿µ„ ˝÷√¡„
  _merit_SetSword(0);
  _merit_SetWeeklySword(0);
  --LOG
  WriteLog(format("[Merit Update] Version:%d-%d MeritValue:%d SwordValue:%d WeeklySword:%d", nSelfVersion, PLAYER_IB_VERSION, nSelfMerit, nSelfSword, nSelfWeeklySword));
end

--√ø÷‹À•ºı
function merit_WeeklyDecay()
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	--÷‹…œœﬁ÷√¡„
	_merit_SetWeeklySword(0);
	--Œ‰¡÷π¶—´À•ºı
	if _merit_Get3V3JoinTimes() < PLAYER_IB_WEEKLY_DECAY_3V3_TIMES or 
		_merit_Get1V1JoinTimes() < PLAYER_IB_WEEKLY_DECAY_1V1_TIMES then
		local nMerit = _merit_GetMerit();
		_merit_SetMerit(max(floor(nMerit * PLAYER_IB_DECAY_PROB), PLAYER_IB_BASE_VALUE));
		Msg2Player(format("ßi”m c´ng trπng v‚ l©m gi∂m cﬂn %d", nMerit * PLAYER_IB_DECAY_PROB));
	end
	--÷ÿ÷√≤Œº”¥Œ ˝
	_merit_3V3Reset();
	_merit_1V1Reset();
end

--–°’Ω≥°
function merit_SmallBattle(nRet, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if nRet > 0 then
		merit_ModifyMerit(15, nIB)
		merit_ModifySword(floor(20 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	else
		merit_ModifyMerit(-15, nIB)
		merit_ModifySword(floor(5 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	end
end

--¥Û’Ω≥°
function merit_BigBattle(nRet, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if nRet > 0 then
		merit_ModifyMerit(30, nIB)
		merit_ModifySword(floor(100 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	else
		merit_ModifyMerit(-30, nIB)
		merit_ModifySword(floor(25 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	end
end

--ÃÏ√≈’Û
function merit_TianMenZhen(nRet, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if nRet > 0 then
		merit_ModifyMerit(25, nIB)
		merit_ModifySword(floor(60 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	else
		merit_ModifyMerit(-25, nIB)
		merit_ModifySword(floor(15 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	end
end

--øÁ∑˛
function merit_KfBattle(nRet, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if nRet == 1 then
		merit_ModifyMerit(35, nIB)
		merit_ModifySword(floor(120 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	elseif nRet == 0 then
		merit_ModifyMerit(-35, nIB)
		merit_ModifySword(floor(30 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD)), nIB)
	elseif nRet == -1 then
		merit_ModifyMerit(-1)
	end
end

--1V1
function merit_1V1(IsWin, nBase, nLevel, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if IsWin == 1 then
		local nValue = _celWinMerit(nBase, nLevel);
		merit_ModifyMerit(nValue, nIB);
		if _merit_Get1V1JoinTimes() < PLAYER_IB_1V1_LIMIT then
			merit_ModifySword(floor((nValue / 2 + 10) * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD + ((_merit_IsIbItem() == 1) and 0.4 or 0))), nIB);
			_merit_1V1AddOnce();
		else
			Msg2Player(format("[%s] MÁi tu«n tËi Æa chÿ c„ th” th´ng qua %d trÀn nhÀn Æ≠Óc Æi”m ki’m hi÷p, c„ th” dÔng Æπo cÙ IB thi’t lÀp lπi sË l«n nhÀn Æ≠Óc", "1V1", PLAYER_IB_1V1_LIMIT));
		end
	elseif IsWin == 0 then
		local nValue = _celLostMerit(nBase, nLevel);
		--IBµ¿æﬂ
		if nValue < 0 and _merit_IsIbItem() == 1 then
			nValue = ceil(nValue * (1 - 0.2));
		end	
		merit_ModifyMerit(nValue, nIB);
		if _merit_Get1V1JoinTimes() < PLAYER_IB_1V1_LIMIT then
			merit_ModifySword(floor(5 * (1 + GetVipCardLevel() * PLAYER_IB_1V1_VIP_ADD + ((_merit_IsIbItem() == 1) and 0.4 or 0))), nIB);
			_merit_1V1AddOnce();
		else
			Msg2Player(format("[%s] MÁi tu«n tËi Æa chÿ c„ th” th´ng qua %d trÀn nhÀn Æ≠Óc Æi”m ki’m hi÷p, c„ th” dÔng Æπo cÙ IB thi’t lÀp lπi sË l«n nhÀn Æ≠Óc", "1V1", PLAYER_IB_1V1_LIMIT));
		end
	elseif IsWin == -1 then
		merit_ModifyMerit(-1);
	end
end

--3V3
function merit_3V3(IsWin, nBase, nLevel, nIB)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	if IsWin > 0 then
		local nValue = _celWinMerit(nBase, nLevel);
		merit_ModifyMerit(nValue, nIB);
		if _merit_Get3V3JoinTimes() < PLAYER_IB_3V3_LIMIT then
			merit_ModifySword(floor((nValue + 20) * (1 + GetVipCardLevel() * PLAYER_IB_3V3_VIP_ADD + ((_merit_IsIbItem() == 1) and 0.2 or 0))), nIB);
			_merit_3V3AddOnce();
		else
			Msg2Player(format("[%s] MÁi tu«n tËi Æa chÿ c„ th” th´ng qua %d trÀn nhÀn Æ≠Óc Æi”m ki’m hi÷p, c„ th” dÔng Æπo cÙ IB thi’t lÀp lπi sË l«n nhÀn Æ≠Óc", "3V3", PLAYER_IB_3V3_LIMIT));
		end
	else
		local nValue = _celLostMerit(nBase, nLevel);
		--IBµ¿æﬂ
		if nValue < 0 and _merit_IsIbItem() == 1 then
			nValue = ceil(nValue * (1 - 0.2));
		end	
		merit_ModifyMerit(nValue, nIB);
		if _merit_Get3V3JoinTimes() < PLAYER_IB_3V3_LIMIT then
			merit_ModifySword(floor(10 * (1 + GetVipCardLevel() * PLAYER_IB_3V3_VIP_ADD + ((_merit_IsIbItem() == 1) and 0.2 or 0))), nIB);
			_merit_3V3AddOnce();
		else
			Msg2Player(format("[%s] MÁi tu«n tËi Æa chÿ c„ th” th´ng qua %d trÀn nhÀn Æ≠Óc Æi”m ki’m hi÷p, c„ th” dÔng Æπo cÙ IB thi’t lÀp lπi sË l«n nhÀn Æ≠Óc", "3V3", PLAYER_IB_3V3_LIMIT));
		end
	end
end

function OnUse(nItem)
	if IsMeritSystemOpen(SYS_SWITCH_MERIT) ~= 1 then
		return 0;
	end
	local G = tonumber(GetItemGenre(nItem));
	local D = tonumber(GetItemDetail(nItem));
	local P = tonumber(GetItemParticular(nItem));
	if G == 2 and D == 1 and P == 30710 then
		if _merit_GetMerit() >= PLAYER_IB_BASE_VALUE then
			Say(format("C´ng trπng v‚ l©m lÌn h¨n %d, kh´ng th” thi’t lÀp lπi.", PLAYER_IB_BASE_VALUE), 0);
			return 0;
		end
		if DelItemByIndex(nItem, 1) == 1 then
			_merit_ResetMerit();
		end
		return 1;
	end
	if G == 2 and D == 1 and P == 30711 then
		Say("H∑y ch‰n loπi ßπi HÈi T˚ V‚ thi’t lÀp lπi: ", 3, format("1V1/#Reset1V1JoinTimes(%d)", nItem), format("3V3/#Reset3V3JoinTimes(%d)", nItem), "Ra kh·i/nothing")
		return 1;
	end
	if G == 2 and D == 1 and P == 30712 then
		if _merit_UseIbItem(1) ~= 1 then
			return 0;
		end
		if DelItemByIndex(nItem, 1) == 1 then
			_merit_UseIbItem();
		end
		return 1;
	end	
end

function Reset1V1JoinTimes(nItem)
	if _merit_Get1V1JoinTimes() < PLAYER_IB_1V1_LIMIT then
		Say(format("%s cﬂn sË l«n c„ th” nhÀn Æ≠Óc Æi”m ki’m hi÷p lµ %d, kh´ng th” thi’t lÀp lπi.", "1V1", PLAYER_IB_1V1_LIMIT - _merit_Get1V1JoinTimes()), 0);
		return 0;
	end
	local nIndex = tonumber(nItem)
	if DelItemByIndex(nIndex, 1) == 1 then
		_merit_1V1Reset();
	end
end

function Reset3V3JoinTimes(nItem)
	if _merit_Get3V3JoinTimes() < PLAYER_IB_3V3_LIMIT then
		Say(format("%s cﬂn sË l«n c„ th” nhÀn Æ≠Óc Æi”m ki’m hi÷p lµ %d, kh´ng th” thi’t lÀp lπi.", "3V3", PLAYER_IB_3V3_LIMIT - _merit_Get3V3JoinTimes()), 0);
		return 0;
	end
	local nIndex = tonumber(nItem)
	if DelItemByIndex(nIndex, 1) == 1 then
		_merit_3V3Reset();
	end
end

function _celWinMerit(nBase, nLevel)
	local tMeritTable = {
		[1] = {300, 1}, 
		[2] = {270, 4}, 
		[3] = {240, 8}, 
		[4] = {210, 12}, 
		[5] = {180, 16}, 
		[6] = {150, 20}, 
		[7] = {120, 22}, 
		[8] = {90, 24}, 
		[9] = {60, 26}, 
		[10] = {30, 28},
		[11] = {-30, 30}, 
		[12] = {-60, 31}, 
		[13] = {-90, 32}, 
		[14] = {-120, 30}, 
		[15] = {-150, 27}, 
		[16] = {-180, 24}, 
		[17] = {-210, 21}, 
		[18] = {-240, 18}, 
		[19] = {-270, 17}, 
		[20] = {-300, 16},
		[21] = {-999999, 15},
	}
	local nMerit = 1;
	for i = 1, getn(tMeritTable) do
		if nBase > tMeritTable[i][1] then
			nMerit = tMeritTable[i][2];
			break;
		end
	end 
	local tLevelTable = {
		[1] = {10, 1}, 
		[2] = {9, 1}, 
		[3] = {8, 0.95}, 
		[4] = {7, 0.95}, 
		[5] = {6, 0.95}, 
		[6] = {5, 0.9}, 
		[7] = {4, 0.9}, 
		[8] = {3, 0.9}, 
		[9] = {2, 0.85}, 
		[10] = {1, 0.85},
		[11] = {0, 0.85}, 
		[12] = {-1, 0.8}, 
		[13] = {-2, 0.8}, 
		[14] = {-3, 0.8}, 
		[15] = {-4, 0.75}, 
		[16] = {-5, 0.75},
		[17] = {-999999, 0.75}, 
	}
	local nProb = 1;
	for i = 1, getn(tLevelTable) do
		if nLevel >= tLevelTable[i][1] then
			nProb = tLevelTable[i][2];
			break;
		end
	end
	return ceil(nMerit * nProb * PLAYER_IB_PROB);
end

function _celLostMerit(nBase, nLevel)
	local tMeritTable = {
		[1] = {300, 40}, 
		[2] = {270, 39}, 
		[3] = {240, 38}, 
		[4] = {210, 37}, 
		[5] = {180, 36}, 
		[6] = {150, 35}, 
		[7] = {120, 34}, 
		[8] = {90, 33}, 
		[9] = {60, 32}, 
		[10] = {30, 31},
		[11] = {-30, 30}, 
		[12] = {-60, 28}, 
		[13] = {-90, 26}, 
		[14] = {-120, 24}, 
		[15] = {-150, 22}, 
		[16] = {-180, 20}, 
		[17] = {-210, 16}, 
		[18] = {-240, 12}, 
		[19] = {-270, 8}, 
		[20] = {-300, 4},
		[21] = {-999999, 1},
	}
	local nMerit = 1;
	for i = 1, getn(tMeritTable) do
		if nBase > tMeritTable[i][1] then
			nMerit = tMeritTable[i][2];
			break;
		end
	end 
	local tLevelTable = {
		[1] = {10, 1}, 
		[2] = {9, 1}, 
		[3] = {8, 1.05}, 
		[4] = {7, 1.05}, 
		[5] = {6, 1.05}, 
		[6] = {5, 1.1}, 
		[7] = {4, 1.1}, 
		[8] = {3, 1.1}, 
		[9] = {2, 1.15}, 
		[10] = {1, 1.15},
		[11] = {0, 1.15}, 
		[12] = {-1, 1.2}, 
		[13] = {-2, 1.2}, 
		[14] = {-3, 1.2}, 
		[15] = {-4, 1.25}, 
		[16] = {-5, 1.25},
		[17] = {-999999, 1.25}, 
	}
	local nProb = 1;
	for i = 1, getn(tLevelTable) do
		if nLevel >= tLevelTable[i][1] then
			nProb = tLevelTable[i][2];
			break;
		end
	end
	return -ceil(nMerit * nProb * PLAYER_IB_PROB);	
end