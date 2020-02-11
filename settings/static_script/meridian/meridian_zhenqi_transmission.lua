--ÕæÆø´«¹¦½Å±¾
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\npccmdhead.lua")

SZ_THIS_SCRIPT = "\\settings\\static_script\\meridian\\meridian_zhenqi_transmission.lua"
--N_THIS_CALL_BACK_CODE=1314 --Ëæ±ãµÄÒ»¸öÊıÖµ ÓÃÓÚĞ£ÑéµÄ£¨>=100±íÊ¾²»ĞèÒª¼ì²éÕæÆøÈİÁ¿£©
--N_ONE_CALL_BACK_SEC = 15
--N_ONE_CALL_BACK_CNT = 5000


tb_main_city = {
	[100] = 1, 
	[150] = 1, 
	[200] = 1, 
	[300] = 1, 
	[350] = 1, 
	[400] = 1, 
	[500] = 1,
}
N_CALL_BACK_TIME = 15
N_GAME_FRAME = 18
N_EXPORT_ZHENQI_MAX = 4000
N_IMPORT_ZHENQI_MAX = 4000
N_MEMBER_CONSUME_ZHENQI = 12 --¶ÓÔ±Ã¿´ÎÏûºÄÕæÆøÊı
N_WARNING_TIME = 5 --×ÊÔ´²»×ã5´ÎÊ±ÌáĞÑ
_N_MEMBER_MAX_DISTANCE = 15--¼¯ÆøÊõ¹ı³ÌÖĞ¶ÓÔ±¾àÀë¶Ó³¤µÄ×îÔ¶¾àÀë
N_MEMBER_MAX_DISTANCE = _N_MEMBER_MAX_DISTANCE*_N_MEMBER_MAX_DISTANCE--Êµ¼Ê¼ÆËãµÄÊ±ºòÃ»ÓĞ¿ªÆ½·½

TMP_TASK_ID_TRANSMISSION_STATE = TMP_TASK_TRANS_ZHENQI_STATE--ÕæÆø´«Êä×´Ì¬¼ÇÂ¼±äÁ¿
TASK_ID_IMPORT_EXPORT_LIMIT	= DAILY_TASK_ID_TRANS_ZHENQI_LIMIT--Ã¿ÈÕ´«ÊäÕæÆøÉÏÏŞ¼ÇÂ¼±äÁ¿
TASK_EXPORT_LIMIT_WORD_IDX = 1--¼ÇÂ¼Êä³öµÄword
TASK_IMPORT_LIMIT_WORD_IDX = 2--¼ÇÂ¼ÊäÈëµÄword

t_jiqishu_para = 
{
	--×î´ó×é¶ÓÈËÊı£¬Ã¿´Î´ÓÃ¿Î»¶ÓÔ±»ñµÃÕæÆøÊı£¬{¶Ó³¤ÏûºÄ}£¬ÏûºÄÃèÊö
	{2, 4, {{ZHENQIWAN_TYPE0, 4, "Tô Linh Hoµn"},}, "4 phót Tô Linh Hoµn"},
	{3, 5, {{ZHENQIWAN_TYPE1, 4, "§¹i Tô Linh Hoµn"},}, "4 phót §¹i Tô Linh Hoµn"},
	{4, 6, {{ZHENQIWAN_TYPE2, 4, "Tô Linh Tiªn §¬n"},}, "4 phót Tô Linh Tiªn §¬n"},
	{5, 8, {{ZHENQIWAN_TYPE2, 8, "Tô Linh Tiªn §¬n"},}, "8 phót Tô Linh Tiªn §¬n"},
}

--µã»÷±±¶·¼¯ÆøÊõ¶Ô»°
function OnTalkZhenqiTransmission()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng, kh«ng thÓ sö dông tİnh n¨ng B¾c §Èu Tô Khİ ThuËt"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Lß luyÖn ®¬n NguyÖt L­îng Thè: B¾c §Èu Tô Khİ ThuËt tæng céng cã %d cÊp, chØ ®­îc ®éi tr­ëng ph¸t ®éng. Tô khİ thuËt cÊp ®é cµng cao hç trî cho tæ ®éi cµng nhiÒu ng­êi, th«ng qua ®éi viªn ®éi tr­ëng cã thÓ nhËn ®­îc cµng nhiÒu ch©n khİ (®éi viªn mçi lÇn tiªu hao cè ®Şnh %d ®iÓm ch©n khİ)", getn(t_jiqishu_para), N_MEMBER_CONSUME_ZHENQI)
	szTitle = format("%s\n H«m nay c¸c h¹ ®· nhËn ®­îc <color=yellow>%d/%d<color> ®iÓm ch©n khİ th«ng qua B¾c §Èu Tô Khİ ThuËt, truyÒn ®i <color=yellow>%d/%d<color> ®iÓm ch©n khİ", szTitle, _get_import_zhenqi_count(), N_IMPORT_ZHENQI_MAX, _get_export_zhenqi_count(), N_EXPORT_ZHENQI_MAX)
	for i=1, getn(t_jiqishu_para) do
		local t =t_jiqishu_para[i]
		tinsert(tbSay, format("B¾c §Èu Tô Khİ ThuËt cÊp %d/#_try_start_transmission(%d)", i, i))
	end
	tinsert(tbSay, format("Dõng Tô Khİ ThuËt/_user_do_stop_transmission"))
	tinsert(tbSay, format("T×m hiÓu Tô Khİ ThuËt/_jiqishu_desc"))
	tinsert(tbSay, format("Ta chØ ghĞ ch¬i/nothing"))
	Say(szTitle, getn(tbSay), tbSay)
end

function _jiqishu_desc()
	local tbSay = {}
	local szTitle = format("Lß luyÖn ®¬n NguyÖt L­îng Thá:")
	--local szTitle = format("ÔÂÁÁÍÃÁ¶µ¤Â¯£º±±¶·¼¯ÆøÊõ¹²ÓĞ%d¼¶£¬Ö»ÄÜ¶Ó³¤·¢¶¯¡£Ô½¸ß¼¶µÄ¼¯ÆøÊõ¿ÉÒÔÖ§³Ö¸ü¶àÈË×é¶Ó£¬¶Ó³¤¿ÉÒÔ´Ó¶ÓÔ±ÉíÉÏ»ñµÃ¸ü¶àÕæÆø£¨¶ÓÔ±Ã¿´Î¹Ì¶¨ÏûºÄ%dµãÕæÆø£©¡£", getn(t_jiqishu_para), N_MEMBER_CONSUME_ZHENQI)
	--szTitle = format("%s\nÄú½ñÌìÒÑ¾­Í¨¹ı¼¯ÆøÊõ»ñµÃ<color=yellow>%d/%d<color>µãÕæÆø£¬´«³ö<color=yellow>%d/%d<color>µãÕæÆø", szTitle, _get_import_zhenqi_count(), N_IMPORT_ZHENQI_MAX, _get_export_zhenqi_count(), N_EXPORT_ZHENQI_MAX)
	for i=1, getn(t_jiqishu_para) do
		local t =t_jiqishu_para[i]
		szTitle = format("%s\nTô Khİ ThuËt cÊp %d: hç trî tæ ®éi nhiÒu nhÊt %d ng­êi, ®éi tr­ëng nhËn ®­îc %d ch©n khİ/ng­êi, tiªu hao %s", szTitle, i, t[1], t[2], t[4])
	end
	tinsert(tbSay, format("trë l¹i/OnTalkZhenqiTransmission"))
	tinsert(tbSay, format("Ta chØ ghĞ ch¬i/nothing"))
	Say(szTitle, getn(tbSay), tbSay)
end

--´ò×ø»Øµ÷º¯Êı
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	return OnProgressCallback(wCurProcess, wMaxProcess, wCheckCode)
end

--½ø¶ÈÌõ»Øµ÷º¯Êı
function	OnProgressCallback(wCurProcess, wMaxProcess, wCheckCode)
	local bOk,szMsg = 1, ""
	local nLevel = _get_transmission_level()
	if GetCaptainName() == GetName() then
		if _get_transmission_caption_flag() ~= 1 then
			bOk, szMsg = 0, "§éi tr­ëng rêi khái ®éi"
		end
	else
		if GetTeamSize() < 2 then
			_process_member_state_when_stop_real({})--¶ÓÔ±ÒÑ¾­Àë¶Ó£¬Í£Ö¹¼¯ÆøÊõ×´Ì¬
			Msg2Player("Tr¹ng th¸i tô khİ cña c¸c h¹ ®· dõng")
		end
		return 0
	end
	
	if 1 == bOk then
    	bOk,szMsg = _check_can_start(nLevel, 0, 0, 0)
    	if bOk == 1 then
    		bOk,szMsg = _check_can_start(nLevel, 1, 0, 0)--¼ì²éÍ¨¹ıÁË Ö´ĞĞÏûºÄ²Ù×÷
    		if bOk == 1 then
    			local tPara = t_jiqishu_para[nLevel]
    			local nTeamSize = GetTeamSize();
    			local nGain = (nTeamSize - 1) * tPara[2]
    			_add_import_zhenqi_count(nGain)
    			AwardGenuineQi(nGain)
    			SetCurrentNpcSFX(PIdx2NpcIdx(),927,0,0)--»ñµÃÕæÆøµÄÌØĞ§
    			_process_team_state_when_trans()--¶ÁÌõ´¦Àí
    			return 1
    		end
    	end
	end

	_do_stop_transmission(szMsg or "")
	return 0
end

function _do_broadcast_team_msg(szMessage)
	local tCheckMemberPara = {--¼ì²é¶ÓÔ±×´Ì¬ĞèÒªµÄ²ÎÊı
		szMsg = szMessage
	}
	local tCallInfo = { --º¯Êıµ÷ÓÃĞÅÏ¢
		func = _broadcast_msg,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	gf_operate_on_teammembers(tCallInfo) --¶ÔËùÓĞ¶ÓÔ±Ö´ĞĞ²Ù×÷
end

function _broadcast_msg(tPara)
	szMsg = tPara.szMsg
	Msg2Player(szMsg)
	HeadMsg2Player(szMsg)
	return 1
end

function _user_do_stop_transmission()
	if GetCaptainName() == GetName() then
		return _do_stop_transmission(nil)
	else
		Talk(1,"",format("ChØ cã ®éi tr­ëng ®­îc phĞp dõng Tô Khİ ThuËt"))
		return 0
	end
	return 1
end

--Í£Ö¹¼¯ÆøÊõ
function _do_stop_transmission(szMsg)
	if not szMsg then
    	if GetCaptainName() == GetName() then
    		if _get_verify_code() ~= 0 then
    			_do_broadcast_team_msg(format("%s ®· dõng chøc n¨ng Tô Khİ ThuËt", GetName()))
    		end
    	end
    else
    	szMsg = format("%s, dõng chøc n¨ng Tô Khİ ThuËt", szMsg or "")
    	_do_broadcast_team_msg(szMsg)
	end
	
	_process_team_state_when_stop()
end

--¼¯ÆøÊõÍ£Ö¹Ê±µÄ¶ÓÔ±×´Ì¬Çå³ı²Ù×÷
function _process_team_state_when_stop()
	local tCheckMemberPara = {--¼ì²é¶ÓÔ±×´Ì¬ĞèÒªµÄ²ÎÊı
	}
	local tCallInfo = { --º¯Êıµ÷ÓÃĞÅÏ¢
		func = _process_member_state_when_stop,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --¶ÔËùÓĞ¶ÓÔ±Ö´ĞĞ²Ù×÷
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "Lçi ®éi viªn ch­a x¸c ®Şnh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_stop(tPara)
	local nRet, szLogRet = _process_member_state_when_stop_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_stop_real(tPara)
	_set_verify_code(0, 0, 0)--ÉèÖÃĞ£ÑéÂë
	
	SetPlayerScript("")
	ProgressSlot(0)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_stand,0,0,0,0)--Õ¾ÆğÀ´
	--DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹³å»÷
	
	SetCurrentNpcSFX(PIdx2NpcIdx(),0,0,0)--È¡ÏûÌØĞ§
	
	return 1, ""
end


function _try_start_transmission(nLevel)
	local bOk,szMsg = _check_can_start(nLevel, 0, 0, 1)
	if 1 ~= bOk then
		Talk(1,"", format("%s, kh«ng thÓ khëi ®éng Tô Khİ ThuËt cÊp %d", szMsg, nLevel))
		return 0
	end
	bOk,szMsg = _process_team_state_when_start(nLevel)
	if 1 ~= bOk then
		Talk(1,"", format("%s, khëi ®éng Tô Khİ ThuËt cÊp %d thÊt b¹i", szMsg, nLevel))
		return 0
	end
	
	return 1
end

--¼¯ÆøÊõ¿ªÊ¼Ê±µÄ¶ÓÔ±×´Ì¬³õÊ¼»¯²Ù×÷
function _process_team_state_when_start(nLevel)
	local tCheckMemberPara = {--¼ì²é¶ÓÔ±×´Ì¬ĞèÒªµÄ²ÎÊı
		nCheckLevel = nLevel,
		nVerifyCode = SafeSetByte(GetTime(), 4, 0),--Ğ£ÑéÂë
	}
	local tCallInfo = { --º¯Êıµ÷ÓÃĞÅÏ¢
		func = _process_member_state_when_start,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --¶ÔËùÓĞ¶ÓÔ±Ö´ĞĞ²Ù×÷
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "Lçi ®éi viªn ch­a x¸c ®Şnh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_start(tPara)
	local nRet, szLogRet = _process_member_state_when_start_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_start_real(tPara)
	local nCheckLevel = tPara.nCheckLevel
	local nVerifyCode = tPara.nVerifyCode--Ğ£ÑéÂë
	local bIsCaption = 0
	if GetCaptainName() == GetName() then
		bIsCaption = 1
	end
	_set_verify_code(nVerifyCode, nCheckLevel, bIsCaption)--ÉèÖÃĞ£ÑéÂë
	
	SetPlayerScript(SZ_THIS_SCRIPT)--Éè¶¨»Øµ÷½Å±¾
	ProgressSlot(N_CALL_BACK_TIME * N_GAME_FRAME)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_sit,0,0,0,0)--×øÏÂ
--	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 1) then
--
--	else
--		Msg2Player("¿ªÆô¼¯ÆøÊõ×´Ì¬Ê§°Ü")
--	end
	
	local szMsg = format("%s ®· khëi ®éng B¾c §Èu Tô Khİ ThuËt cÊp %d", GetCaptainName(), nCheckLevel)
	Msg2Player(szMsg)
	HeadMsg2Player(szMsg)

	return 1, ""
end


--¼¯ÆøÊõ¿ªÊ¼Ê±µÄ¶ÓÔ±×´Ì¬³õÊ¼»¯²Ù×÷
function _process_team_state_when_trans()
	local tCheckMemberPara = {--¼ì²é¶ÓÔ±×´Ì¬ĞèÒªµÄ²ÎÊı
	}
	local tCallInfo = { --º¯Êıµ÷ÓÃĞÅÏ¢
		func = _process_member_state_when_trans,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --¶ÔËùÓĞ¶ÓÔ±Ö´ĞĞ²Ù×÷
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "Lçi ®éi viªn ch­a x¸c ®Şnh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_trans(tPara)
	local nRet, szLogRet = _process_member_state_when_trans_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_trans_real(tPara)
	SetPlayerScript(SZ_THIS_SCRIPT)--Éè¶¨»Øµ÷½Å±¾
	ProgressSlot(N_CALL_BACK_TIME * N_GAME_FRAME)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_sit,0,0,0,0)--×øÏÂ
	return 1, ""
end


function _check_can_start(nLevel, bDelete, bNotify, bIsFirstStart)
	local szLog = nil
	local tPara = t_jiqishu_para[nLevel]
	if not tPara then
		return _fail_with_msg(bNotify, format("Tô Khİ ThuËt cÊp %d ch­a khai th«ng", nLevel))
	end
	if GetName() ~= GetCaptainName() then
		return _fail_with_msg(bNotify, "Kh«ng ph¶i lµ ®éi tr­ëng")
	end
	if  1 == bIsFirstStart then
		_process_team_state_when_stop()--Èç¹ûÊÇ¶Ó³¤¿ªÆô£¬ÏÈÇå³ıËùÓĞÈËµÄ¼¯ÆøÊõ×´Ì¬
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize < 2 then			
		return _fail_with_msg(bNotify, "Thµnh viªn trong ®éi kh«ng ®ñ 2 ng­êi")
	end
	if nTeamSize > tPara[1] then
		return _fail_with_msg(bNotify, format("Thµnh viªn trong ®éi nhiÒu h¬n %d ng­êi", tPara[1]))
	end
	local nMapID0, nX0, nY0 = GetWorldPos()
	if 1 ~= tb_main_city[nMapID0] then
		return _fail_with_msg(bNotify, "Ngoµi khu vùc thµnh chİnh")
	end
	if IsStalling() == 1 then
		return _fail_with_msg(bNotify, "§ang bµy b¸n")
	end
	if IsSleeping() == 1 then
		return _fail_with_msg(bNotify, "§ang ngñ say")
	end
	if MeridianGetLeftGenuineQiCapcity() <= 0 then
		return _fail_with_msg(bNotify, format("%s ch©n khi trong khİ h¶i ®· ®¹t giíi h¹n", GetName()))
	end
	
	--¼ì²é¶Ó³¤¿É½ÓÊÜµÄÕæÆø
	if _get_import_zhenqi_count() >= N_IMPORT_ZHENQI_MAX then
		return _fail_with_msg(bNotify, format("%s sè ch©n khİ cã thÓ nhËn trong ngµy ®· ®¹t giíi h¹n", GetName()))
	end
	
	--¼ì²é¶Ó³¤ÍĞ¹ÜÊ±¼ä
	local nRet, szLog = _check_caption_consume(nLevel, bDelete, bNotify)
	if nRet ~= 1 then
		return _fail_with_msg(bNotify, szLog)
	end
	
	--¶Ó³¤Ğ£ÑéÂë
	local nLeaderVerifyCode = _get_verify_code()
	
	local tCheckMemberPara = {--¼ì²é¶ÓÔ±×´Ì¬ĞèÒªµÄ²ÎÊı
		nLeaderMap = nMapID0,
		nLeaderX = nX0,
		nLeaderY = nY0,
		nCheckLevel = nLevel,
		bNeedDelete = bDelete, 
		bNeedNotify = bNotify,
		nLeaderVerifyCode = nLeaderVerifyCode,--Ğ£ÑéÂë
	}
	local tCallInfo = { --º¯Êıµ÷ÓÃĞÅÏ¢
		func = _check_member_status,
		bExceptCaption = 1,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --¶ÔËùÓĞ¶ÓÔ±Ö´ĞĞ²Ù×÷
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "Lçi ®éi viªn ch­a x¸c ®Şnh")
	end
	
	return 1, szLog
end

--¼ì²é¶Ó³¤ÏûºÄÎï
function _check_caption_consume(nLevel, bDelete, bNotify)
	local szLog = ""
	local tPara = t_jiqishu_para[nLevel]
	if not tPara then
		return 0, szLog
	end
	
	local s = tPara[3]
	for i = 1, getn(s) do
		local t = s[i]
		local nCurTime = GetJuLingWanTime(t[1])
		local nCount = floor(nCurTime / t[2])
		if nCount < 1 then
			szLog = format("%s thêi gian kh«ng ®ñ %d phót", t[3], t[2])
			return 0, szLog
		elseif nCount < N_WARNING_TIME then
			szLog = format("%s cßn l¹i %s, chØ cã thÓ duy tr× %d lÇn", szLog, t[3], nCount)
		end
	end
	
	if 1 == bDelete then--ËùÓĞµÄ¶¼¼ì²éÍ¨¹ıÁË ¿ÉÒÔ¿Û³ıÁË
		for i = 1, getn(s) do
    		local t = s[i]
    		local nCurTime = GetJuLingWanTime(t[1])
    		if nCurTime >= t[2] then
    			if SetJuLingWanTime(t[1],nCurTime - t[2]) ~= 1 then
    				szLog = format("Lçi ch­a x¸c ®Şnh", t[3], t[2])
    				return 0, szLog
    			end
    		elseif nCount < N_WARNING_TIME then
    			szLog = format("%s thêi gian kh«ng ®ñ %d phót", t[3], t[2])
    			return 0, szLog
    		end
    	end
	end

	return 1, szLog
end

--¼ì²é¶ÓÔ±µÄ×´Ì¬
	--¼ì²é¶ÓÔ±Óë¶Ó³¤µÄ¾àÀë
	--¼ì²é¶ÓÔ±Ê£ÓàÕæÆø
	--¼ì²é¶ÓÔ±ÕæÆøÊä³öÇé¿ö
function _check_member_status(tPara)
	local nRet, szLogRet = _check_member_status_real(tPara)
	return nRet, {szLog = szLogRet,}
end 

function _check_member_status_real(tPara)
	local nLeaderMap = tPara.nLeaderMap
	local nLeaderX = tPara.nLeaderX
	local nLeaderY = tPara.nLeaderY
	local nCheckLevel = tPara.nCheckLevel
	local bNeedDelete = tPara.bNeedDelete
	local bNeedNotify = tPara.bNeedNotify
	local nLeaderVerifyCode = tPara.nLeaderVerifyCode
	local bInitVeryfyCode = tPara.bInitVeryfyCode

	local nMyVerifyCode = _get_verify_code()
	if nMyVerifyCode ~= nLeaderVerifyCode then
		return _fail_with_msg(bNotify, format("%s kiÓm chøng thÊt b¹i", GetName()))
	end
	
	if IsStalling() == 1 then
		return _fail_with_msg(bNotify, format("%s ®ang bµy b¸n", GetName()))
	end
	
	if IsSleeping() == 1 then
		return _fail_with_msg(bNotify, format("%s ®ang ngñ say", GetName()))
	end

	local nMapID, nX, nY = GetWorldPos()
	if nMapID ~= nLeaderMap then
		return _fail_with_msg(bNotify, format("%s kh«ng cïng chung 1 thµnh thŞ", GetName()))
	end
	local nDistance = _Distance2BetweenPoints(nLeaderMap, nLeaderX, nLeaderY, nMapID, nX, nY)
	if nDistance < 0 or nDistance > N_MEMBER_MAX_DISTANCE then
		return _fail_with_msg(bNotify, format("%s c¸ch ®éi tr­ëng qu¸ xa", GetName()))
	end
	if _get_export_zhenqi_count() >= N_EXPORT_ZHENQI_MAX then
		return _fail_with_msg(bNotify, format("%s ch©n khİ cã thÓ chuyÓn trong ngµy ®· ®¹t giíi h¹n", GetName()))
	end
	
	--¼ì²é¶ÓÔ±µÄÊ£ÓàÕæÆøÊ±¼ä
	local nRet, szLog = _check_member_consume(nCheckLevel, bNeedDelete, bNeedNotify)
	if nRet ~= 1 then
		return _fail_with_msg(bNotify, szLog)
	end
	
	return 1, szLog
end

function _check_member_consume(nLevel, bDelete, bNotify)
	if MeridianGetQiHai() < N_MEMBER_CONSUME_ZHENQI then
		return _fail_with_msg(bNotify, format("%s ch©n khi kh«ng ®ñ", GetName()))
	end
	if 1 == bDelete then
		if 1 ~= AwardGenuineQi(-1*N_MEMBER_CONSUME_ZHENQI) then
			return _fail_with_msg(bNotify, format("%s khÊu trõ ch©n khİ thÊt b¹i", GetName()))
		else
			_add_export_zhenqi_count(N_MEMBER_CONSUME_ZHENQI)
			SetCurrentNpcSFX(PIdx2NpcIdx(),918,0,0)--ÏûºÄÕæÆøµÄÌØĞ§
		end
	end
	return 1,""
end


--»ñÈ¡Êä³öµÄÕæÆøÊı
function _get_export_zhenqi_count()
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_EXPORT_LIMIT_WORD_IDX)
	return nWord
end

function _add_export_zhenqi_count(nAdd)
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_EXPORT_LIMIT_WORD_IDX)
	nWord = nWord + nAdd
	local nSave = setWord(nVal, TASK_EXPORT_LIMIT_WORD_IDX, nWord)
	return rc_SetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT, nSave)
end

--»ñÈ¡ÊäÈëµÄÕæÆøÊı
function _get_import_zhenqi_count()
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_IMPORT_LIMIT_WORD_IDX)
	return nWord
end

function _add_import_zhenqi_count(nAdd)
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_IMPORT_LIMIT_WORD_IDX)
	nWord = nWord + nAdd
	local nSave = setWord(nVal, TASK_IMPORT_LIMIT_WORD_IDX, nWord)
	return rc_SetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT, nSave)
end

--»ñÈ¡Ğ£ÑéÂë
function _get_verify_code()
	local nVal = GetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE)
	local nCode = SafeSetByte(nVal, 4, 0)
	return nCode
end

function _get_transmission_level()
	local nVal = GetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE)
	local nHighByte = SafeGetByte(nVal, 4)
	local nLevel = mod(nHighByte, 10)
	return nLevel
end

function _get_transmission_caption_flag()
	local nVal = GetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE)
	local nHighByte = SafeGetByte(nVal, 4)
	local nFlg = floor(nHighByte/10)
	nFlg = mod(nFlg, 10)
	return nFlg
end

--ÉèÖÃĞ£ÑéÂë
function _set_verify_code(nCode, nLevel, bIsCaption)
	nCode = SafeSetByte(nCode, 4, 0)
	nLevel = mod(nLevel, 10)
	bIsCaption = mod(bIsCaption, 10)
	local nHighByte = bIsCaption * 10 + nLevel
	local nVal = SafeSetByte(nCode, 4, nHighByte)
	SetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE, nVal)
end

function _fail_with_msg(bNotify, szMsg)
--	if bNotify > 0 then
--		Talk(1,"", szMsg or "")
--	end
	return 0, szMsg
end

--tPara = 
--{
--	func = some function
--	bExceptCaption
--	tFunctionPara
--}
function	gf_operate_on_teammembers(tPara)
	local nOldIndex = PlayerIndex;
	local nTeamSize = GetTeamSize();
	local bRet = 1
	local tRet = {}
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if tPara.bExceptCaption == 0 or GetName() ~= GetCaptainName() then
			bRet,tRet = tPara.func(tPara.tFunctionPara)
			if bRet == 0 then
				break
			end
		end
	end
	PlayerIndex = nOldIndex
	return bRet,tRet
end

function nothing()
end

--ÅĞ¶Ï¾àÀë
function _Distance2BetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
        return -1
    else
		local dx = MapX2 - MapX1
        local dy = MapY2 - MapY1
        local nDist = (dx * dx + dy * dy)
        return nDist
    end
end

