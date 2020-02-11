--ÅàÔªµ¤ÎïÆ·½Å±¾

Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MAX_USETIME_PER_DAY=12
SZ_THIS_SCRIPT="\\settings\\static_script\\meridian\\item_peiyuandan.lua"
N_THIS_CALL_BACK_CODE=17 --Ëæ±ãµÄÒ»¸öÊıÖµ ÓÃÓÚĞ£ÑéµÄ(<100±íÊ¾Òª¼ì²éÕæÆøÈİÁ¿)

N_ADD_ZHENQI_TYPE = AWARD_QENUINEQI_DAILY_TASK

SZ_ITEM_NAME="Båi Nguyªn §¬n"
N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 3
N_ONE_AWARD_ZHENQI = 2

N_CNT_DAILY_TASK_IDX=3
N_CNT_DAILY_TASK_BYTE_IDX=1

t_rand_npc_sfx = 
{
	927, 931, 935
}

--²½½ø»Øµ÷º¯Êı
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,926,0,1); --µØÃæÌØĞ§
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --ÌØĞ§
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹³å»÷
	else
		if 1 ~= AwardGenuineQiByType(N_ONE_AWARD_ZHENQI, N_ADD_ZHENQI_TYPE) then
			DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹³å»÷
		end
	end
end

function OnUse_Real(id)
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng, hiÖn vÉn ch­a thÓ sö dông vËt phÈm nµy!"))
		return 0
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"",format("Ch­a ph¶i c¶nh giíi kİch ho¹t, t¹m thêi kh«ng thÓ sö dông vËt phÈm nµy!"))
		return 0
	end
	
	local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
	if nDailiCapacity <= 0 then
		Talk(1,"",format("Th«ng qua %s trong ngµy h«m nay ®· kh«ng thÓ nhËn thªm ch©n khİ!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
		return
	else
		_DoUseItem(id)
	end
	
--	local nTodayUseCnt = _GetTodayUseCount()
--	if nTodayUseCnt < MAX_USETIME_PER_DAY then
--		local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
--    	if nDailiCapacity <= 0 then
--    		Talk(1,"",format("½ñÈÕÍ¨¹ı%sÒÑ¾­²»ÄÜÔÙ»ñµÃÕæÆø!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
--    		return
--    	elseif nDailiCapacity < N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT then
--    		local szTitle = format("Ê¹ÓÃ%s×î¶à¿É»ñµÃ%dµãÕæÆø£¬Äã½ñÈÕÍ¨¹ı%s×î¶à»¹¿ÉÒÔ»ñµÃ%dµãÕæÆø£¬¶àÓàµÄ½«Ôì³ÉÀË·Ñ,È·¶¨Ê¹ÓÃÂğ?", SZ_ITEM_NAME, N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT
--    			, t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5], nDailiCapacity)
--        		local tbSay = {}
--        		tinsert(tbSay, format("È·¶¨Ê¹ÓÃ/#_DoUseItem(%d)", id))
--        		tinsert(tbSay, "ËãÁË£¬»¹ÊÇ²»Ê¹ÓÃÁË/no")
--        		Say(szTitle, getn(tbSay), tbSay)
--    		return
--    	else
--    		_DoUseItem(id)
--    	end
--	else
--		Talk(1,"",format("½ñÈÕÊ¹ÓÃ%sµÄÒÑ¾­³¬¹ı%d´Î£¬ÇëÃ÷ÌìÔÙ³Ô°É!", SZ_ITEM_NAME, MAX_USETIME_PER_DAY))
--	end

--	local szTitle = format("Ê¹ÓÃ%s×î¶à¿É»ñµÃ%dµãÕæÆø£¬Äã½ñÈÕÍ¨¹ı%s×î¶à»¹¿ÉÒÔ»ñµÃ%dµãÕæÆø£¬¶àÓàµÄ½«Ôì³ÉÀË·Ñ,È·¶¨Ê¹ÓÃÂğ?", SZ_ITEM_NAME, N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT
--		, t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5], nDailiCapacity)
--		local tbSay = {}
--		tinsert(tbSay, format("È·¶¨Ê¹ÓÃ/#_DoUseItem(%d)", id))
--		tinsert(tbSay, "ËãÁË£¬»¹ÊÇ²»Ê¹ÓÃÁË/no")
--		Say(szTitle, getn(tbSay), tbSay)
end

function _DoUseItem(id)
	
	local nDelResult = DelItemByIndex(id, -1)
	if 1 == nDelResult then
		AwardGenuineQiByType(N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT, N_ADD_ZHENQI_TYPE)
	end
	
--	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 0) then
--		--É¾³ıÎïÆ·
--		local nDelResult = DelItemByIndex(id, -1)
--		if 1 == nDelResult then
--			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
--			SetCurrentNpcSFX(nPidxNpc,926,0,1); --µØÃæÌØĞ§
--			SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --ÌØĞ§
--
--			if 1 ~= _AddTodayUseCount() then
--				DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹ĞŞÁ¶
--			end
--			--DoWait(0, 0,g_nReadTime-nReadTime);
--			
--			local nTodayUseCnt = _GetTodayUseCount()
--			local szMsg = format("Äã½ñÌì»¹ÄÜÊ¹ÓÃ%d/%d¸ö%s", MAX_USETIME_PER_DAY - nTodayUseCnt, MAX_USETIME_PER_DAY, SZ_ITEM_NAME)
--			Msg2Player(szMsg)
--		else
--			DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹ĞŞÁ¶
--		end
--	end
end

function _GetTodayUseCount()
	local nDailyTaskVal = GetDailyTask(N_CNT_DAILY_TASK_IDX)
	local nCnt = GetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX)
	return nCnt
end

function _AddTodayUseCount()
	local nDailyTaskVal = GetDailyTask(N_CNT_DAILY_TASK_IDX)
	local nCnt = GetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX)
	if nCnt < 255 then
		nCnt = nCnt + 1
		local nNewVal = SetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX, nCnt)
		SetDailyTask(N_CNT_DAILY_TASK_IDX, nNewVal)
		return 1
	else
		return 0
	end
	
	return 0
end

function no()
end
