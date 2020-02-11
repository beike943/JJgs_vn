--¾ÛÁéÍèÎïÆ·½Å±¾ÊµÏÖ

Include("\\script\\task_access_code_def.lua")

TASKVAL_JULING_LASTACTIVE_TIME = 3112		-- ¼ÇÂ¼×î½üÒ»´Î»ñµÃ¾ÛÁé¾­ÑéµÄÊ±¼ä
TASKVAL_JULING_OFFLINE_TIME = 3111			-- ÀëÏß¾ÛÁéÊ±¼ä£¨ÀÛ»ý£©·ÖÖÓ

ZHENQIWAN_TYPE0 = 3	--¾ÛÁéÍè
ZHENQIWAN_TYPE1 = 2 -- ´ó¾ÛÁéÍè
ZHENQIWAN_TYPE2 = 1 -- ¾ÛÁéÏÉµ¤

ZHENQIWAN_ACCESS_CODE = TASK_ACCESS_CODE_OFFLINELIVE --±äÁ¿ACCESS CODE
TASKVAL_ZHENQIWAN = 3105	-- ¾ÛÁéÍèµÄÊ±¼ä(·ÖÖÓ)
TASKVAL_ZHENQIWAN1 = 3106	-- ´ó¾ÛÁéÍèµÄÊ±¼ä(·ÖÖÓ)
TASKVAL_ZHENQIWAN2 = 3107	-- ¾ÛÁéÏÉµ¤µÄÊ±¼ä(·ÖÖÓ)
t_ZhenQiWanPara = 
{
	--time task, task access code, add zhenqi
	{TASKVAL_ZHENQIWAN2, ZHENQIWAN_ACCESS_CODE, 3, "Tô Linh Tiªn §¬n"},
	{TASKVAL_ZHENQIWAN1, ZHENQIWAN_ACCESS_CODE, 2, "§¹i Tô Linh Hoµn"},
	{TASKVAL_ZHENQIWAN,  ZHENQIWAN_ACCESS_CODE, 1, "Tô Linh Hoµn"},
}

t_ItemInfo =
{
	--[ItemParticular]=type, name, time add(min)
	[30458] = {ZHENQIWAN_TYPE0, "Tô Linh Hoµn", 480},
	[30459] = {ZHENQIWAN_TYPE1, "§¹i Tô Linh Hoµn", 480},
	[30460] = {ZHENQIWAN_TYPE2, "Tô Linh Tiªn §¬n", 480},
}

function OnUse_Real(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == 2 and d == 1 then
		local p = GetItemParticular(id)
		local t = t_ItemInfo[p]
		if t then
			--É¾³ýÎïÆ·
			local nDelResult = DelItemByIndex(id, -1)
			if 1 == nDelResult then
				AddJuLingWanTime(t[1], t[3])
				local nNewTime = GetJuLingWanTime(t[1])
				local szMsg = format("C¸c h¹ sö dông %s nhËn ®­îc thêi gian ñy th¸c %s %s, hiÖn t¹i thêi gian ñy th¸c %s lµ %s", t[2], _GetTimeStr(t[3]), t[2], t[2], _GetTimeStr(nNewTime))
				Msg2Player(szMsg)
			end
		end
	end
	return 0
end

function _GetTimeStr(nTime)
	local nHour = floor(nTime / 60)
	local nMin	= mod(nTime, 60)
	local szTime = ""
	if nHour > 0 then
		szTime = format("%s%d giê", szTime, nHour)
	end
	if nMin > 0 or nHour <= 0 then
		szTime = format("%s%d phót", szTime, nMin)
	end
	return szTime
end

function GetJuLingWanTime(nType)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		return GetTask(tPara[1])
	end
	assert(0)
	return 0;
end

function GetJuLingWanAllTime()
	local nTime = 0
	for i=1, getn(t_ZhenQiWanPara) do
		nTime = nTime + GetTask(t_ZhenQiWanPara[i][1])
	end
	return nTime
end

function AddJuLingWanTime(nType, nVal)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		local nTaskVal = GetTask(tPara[1])
		nTaskVal = nTaskVal + nVal
		SetTask(tPara[1], nTaskVal, tPara[2])
		return 1
	end
	assert(0)
	return 0;
end

function SetJuLingWanTime(nType, nVal)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		SetTask(tPara[1], nVal, tPara[2])
		return 1
	end
	assert(0)
	return 0;
end

function GetJuLingWanEffect(tPara)
	if tPara then
		return tPara[3] or 0
	end
	return 0
end

function GetJuLingWanEffectByType(nType)
	local tPara = _GetJunLingWanPara(nType)
	return GetJuLingWanEffect(tPara)
end

function _GetJunLingWanPara(nType)
	if nType >= 1 and nType <= getn(t_ZhenQiWanPara) then
		return t_ZhenQiWanPara[nType];
	end
	return nil
end

--¸üÐÂ»ñµÃ¾ÛÁé¾­ÑéµÄÊ±¼ä
function UpdateAwardJuLingExpTime()
	SetTask(TASKVAL_JULING_LASTACTIVE_TIME, GetTime(), ZHENQIWAN_ACCESS_CODE)
end

--»ñµÃÄ³ÖÖÀëÏßÊ±¼ä
function UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, nLastAwardTimeTaskId, nOfflineTimeTaskId, nTaskAccessCode)
	if 0 == LogoutTime then
		return 0
	end
	local LastAwardTime = GetTask(nLastAwardTimeTaskId)
	if LastAwardTime == 0 then
		LastAwardTime = LogoutTime
	end
	LastAwardTime = max(LastAwardTime, LogoutTime)--È¡ÉÏ´ÎÀëÏßÊ±¼äºÍÉÏ´Î»ñµÃ¾­ÑéÊ±¼äµÄ½Ï´óÕß
	-- ¼ÆËã¿ÉÒÔ»ñµÃµÄ¾ÛÁéÊ±¼ä
	local OfflineAddTime = max(0, LoginTime - LastAwardTime)
	if GetTask(nLastAwardTimeTaskId) < 0 then
		SetTask(nLastAwardTimeTaskId, 0, nTaskAccessCode)
	end
	
	local nCurTime = GetTask(nOfflineTimeTaskId)
	local nNewTime = nCurTime + floor(OfflineAddTime / 60)
	if nNewTime > nMaxTime then
		nNewTime = nMaxTime
	end
	SetTask(nOfflineTimeTaskId, nNewTime, nTaskAccessCode)
	return nNewTime
end

SYS_ONLINE_TIME = MkTime(2013, 1, 25, 0, 0, 0)
function UpdateJuLingOfflineTime(LogoutTime, LoginTime, MaxOfflineTime)
	--¹«Æ½Æð¼û£¬ËùÓÐÈË¶¼´Ó¹æ¶¨Ê±¼ä¿ªÊ¼ÀÛ¼Æ
	if LoginTime < SYS_ONLINE_TIME then
		return 0
	end
		
	local nCurOffLineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)--µ±Ç°ÀëÏßÊ±¼ä
	local nCalcLogOutTime = LogoutTime
	--ÎªÁË¹«Æ½Æð¼ûÀëÏßÊ±¼ä¶¼´ÓÏµÍ³ÉÏÏßÊ±¼ä¿ªÊ¼¼ÆËã
	if LogoutTime < SYS_ONLINE_TIME then
		nCalcLogOutTime = SYS_ONLINE_TIME
		local nY,nM,nD,nH,nMin,nS = GmTime(LogoutTime)
		local nY2,nM2,nD2,nH2,nMin2,nS2 = GmTime(SYS_ONLINE_TIME)
		local szMsg = format("Player:%s Last Logout at %d-%d-%d %d:%d:%d, offline time calculate from %d-%d-%d %d:%d:%d"
				, GetName(), nY,nM,nD,nH,nMin,nS, nY2,nM2,nD2,nH2,nMin2,nS2)
		WriteLog(szMsg)
	end
	local nNewTime = UpdateOneOfflineTime(nCalcLogOutTime, LoginTime, MaxOfflineTime
		, TASKVAL_JULING_LASTACTIVE_TIME, TASKVAL_JULING_OFFLINE_TIME, ZHENQIWAN_ACCESS_CODE)
	return nNewTime
end

--ÓÃÀëÏßÊ±¼ä»»È¡¾ÛÁéÍèÍÐ¹Ü¾­Ñé
function get_offline_juling_talk()
	local OfflineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)
	if OfflineTime <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian Tô Linh Hoµn.", 0)
		return
	end
	
	local tTime = {
		GetJuLingWanTime(ZHENQIWAN_TYPE0),
		GetJuLingWanTime(ZHENQIWAN_TYPE1),
		GetJuLingWanTime(ZHENQIWAN_TYPE2),
	}
	
	local tExchgTime = {
		min(tTime[1], OfflineTime),
		min(tTime[2], OfflineTime),
		min(tTime[3], OfflineTime),
	}
	
	local tZhenQi = {
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE0) * tExchgTime[1],
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE1) * tExchgTime[2],
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE2) * tExchgTime[3],
	}
	
	local tZhenQiAll = {
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE0) * OfflineTime,
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE1) * OfflineTime,
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE2) * OfflineTime,
	}

	local szMsg = ""
	szMsg = format("%s thêi gian Tô Linh Hoµn cã thÓ quy ®æi <color=yellow>%d phót<color>, sö dông Tô Linh Hoµn/ §¹i Tô Linh Hoµn/ Tô Linh Tiªn §¬n cã thÓ quy ®æi lÇn l­ît <color=yellow>%d/%d/%d<color> ®iÓm ch©n khÝ"
		, szMsg, OfflineTime, tZhenQiAll[1], tZhenQiAll[2], tZhenQiAll[3])
	szMsg = format("%s\n thêi gian Tô Linh Hoµn cã thÓ dïng quy ®æi lµ <color=yellow>%d phót (ch©n khÝ:%d)<color>", szMsg, tExchgTime[1], tZhenQi[1])
	szMsg = format("%s\n thêi gian §¹i Tô Linh hoµn lµ <color=yellow>%d phót (ch©n khÝ:%d)<color>", szMsg, tExchgTime[2], tZhenQi[2])
	szMsg = format("%s\n thêi gian Tô Linh Tiªn §¬n lµ <color=yellow>%d phót (ch©n khÝ:%d)<color>", szMsg, tExchgTime[3], tZhenQi[3])
	
	local tSay = 
	{
		format("Dïng thêi gian Tô Linh Hoµn ®æi ch©n khÝ/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE0),
		format("Dïng thêi gian §¹i Tô Linh Hoµn ®æi ch©n khÝ/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE1),
		format("Dïng thêi gian Tô Linh Tiªn §¬n ®æi ch©n khÝ/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE2),
		"trë l¹i/offline_exchange_talk_main",
		"Rêi khái/no",
	}
	Say(szMsg, getn(tSay), tSay)
end

function confirm_use_juling_offline_time(nType)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		local szMsg = format("X¸c ®Þnh sö dông <color=yellow>%s<color> thêi gian ñy th¸c ®Ó quy ®æi ch©n khÝ?", tPara[4])
		local tSay = 
    	{
    		format("§ång ý/#yes_get_offline_juling_zhenqi(%d)",nType),
    		"trë l¹i/get_offline_juling_talk",
    		"Rêi khái/no",
    	}
    	Say(szMsg, getn(tSay), tSay)
	end
end

function yes_get_offline_juling_zhenqi(nType)
	local tPara = _GetJunLingWanPara(nType)
	if not tPara then
		return
	end
	local nTime = GetJuLingWanTime(nType)
	if nTime <= 0 then
		Say(format("C¸c h¹ kh«ng ®ñ %s thêi gian, kh«ng thÓ quy ®æi.", tPara[4]), 0)
		return
	end
	local OfflineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)
	local CalcTime = min(nTime, OfflineTime)
	
	local nEffect = GetJuLingWanEffectByType(nType)
	local nLeftCapacity = MeridianGetLeftGenuineQiCapcity()
	local nMaxExchgTime = floor(nLeftCapacity / nEffect)
	if nMaxExchgTime <= 0 then
		Say(format("C¸c h¹ ch­a ®¶ th«ng kinh m¹ch hoÆc ch©n khÝ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi."), 0)
		return
	end
	
	local ActualTime = min(CalcTime, nMaxExchgTime)
	local GiveZhenQi = ActualTime * nEffect
	
	SetJuLingWanTime(nType, nTime - ActualTime)
	SetTask(TASKVAL_JULING_OFFLINE_TIME, OfflineTime - ActualTime, ZHENQIWAN_ACCESS_CODE)
	AwardGenuineQi(GiveZhenQi)
	local szLog = format("OfflineLiveEx Player:%s use %d minute %s time gain %d ZhenQi", GetName(), ActualTime, tPara[4], GiveZhenQi)
	WriteLog(szLog)
	local LeftZhenQi = nEffect * OfflineTime - GiveZhenQi
	local szMsg = format("C¸c h¹ ®· sö dông thµnh c«ng %s thêi gian ñy th¸c ®Ó ®æi <color=yellow>%d<color> ®iÓm ch©n khÝ, hiÖn cßn l¹i %d ®iÓm ch©n khÝ ñy th¸c cã thÓ ®æi, c¸c h¹ cã thÓ dïng Tô Linh Hoµn/§¹i Tô Linh/ Tô Linh Tiªn §¬n tiÕp tôc quy ®æi.", tPara[4], GiveZhenQi, LeftZhenQi)
	Say(szMsg, 0)
	Msg2Player(format("C¸c h¹ dïng %s thêi gian ñy th¸c quy ®æi thµnh %d ®iÓm ch©n khÝ", tPara[4], GiveZhenQi))
end

function no()
end

