Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MAX_ZHENQI_PER_DAY=1000
--bCostItem=nil --ÊÇ·ñÏûºÄµÀ¾ß
SZ_THIS_SCRIPT="\\script\\meridian\\meridian_exp_exchg_zhenqi.lua"
N_THIS_CALL_BACK_CODE_NO_ITEM=13 --Ëæ±ãµÄÒ»¸öÊýÖµ ÓÃÓÚÐ£ÑéµÄ <100±íÊ¾ÒªÅÐ¶ÏÕæÆøÈÝÁ¿
N_THIS_CALL_BACK_CODE_HAVE_ITEM=14

N_ONE_CALL_BACK_SEC = 5
N_ONE_AWARD_CALL_BACK_CNT = 3

N_CONSUME_EXP_ONE_TIME_UNIT=10000

t_expression = 
{
	--{":Z", ":<", ":H", "@@", ":$", ":@", ":(", ":L", ":F", ":(", ":T", ":W", "(dd)", ":o","(sx)"},
	--{":)", ":U", ":P", "^o^", "^^", ":E", ":D", ":K",  ":0", "^0^", "^m^", ":U", ":)"},
}

N_MAX_RATE = 100
t_level_exp_chg_table =
{
	[2] = 
	{
		--open_item_add_rate = 0,
		t_add_rate_item = nil, --{2, 1, 1001, 1, "ÅàÔªµ¤"}
		exchg_table = 
		{
        	--ÈÕ»ñµÃÕæÆø×îÐ¡Öµ£¬ÈÕ»ñµÃÕæÆø×î´óÖµ£¬ÏûºÄ¾­Ñé(Íò)£¬»ù´¡³É¹¦ÂÊ£¬µÀ¾ßÔö¼Ó³É¹¦ÂÊ£¬¶Ò»»³É¹¦»ñµÃµÄÕæÆø
        	{  1, 200,  100, 70, 0, 10},
        	{201, 400,  100, 60, 0, 10},
        	{401, 600,  100, 50, 0, 10},
        	{601, 800,  100, 40, 0, 10},
        	{801, 1000, 100, 30, 0, 10},
		}
	}
}

--open_item_add_rate = 0
--t_exchg_level_info = {}
--t_exchg_para = {}

t_rand_npc_sfx = 
{
	928, 929, 930, 932, 949
}

--²½½ø»Øµ÷º¯Êý
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE_NO_ITEM and wCheckCode ~= N_THIS_CALL_BACK_CODE_HAVE_ITEM then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,905,0,1); --µØÃæÌØÐ§
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --ÌØÐ§
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹³å»÷
	elseif (mod(wCurProcess, N_ONE_AWARD_CALL_BACK_CNT) == 0) then
		local nState = _DoOneExpChgZhenqi(wCheckCode == N_THIS_CALL_BACK_CODE_HAVE_ITEM)
		local tFaceTable = nil
		if nState == 0 then
			Msg2Player("KÝch huyÖt thÊt b¹i")
			SetCurrentNpcSFX(nPidxNpc, 922, 0, 0); --ÌØÐ§
			tFaceTable = t_expression[1]
		elseif nState == 1 then
			Msg2Player("KÝch huyÖt thµnh c«ng")
			SetCurrentNpcSFX(nPidxNpc, 921, 0, 0); --ÌØÐ§
			tFaceTable = t_expression[2]
		else
			DoStartScriptCallBack(0, 0, 0, "", 1)--Í£Ö¹³å»÷
		end
		if tFaceTable then
			local nFaceIndex = random(1,getn(tFaceTable))
			local szFaceMsg = format("%s", tFaceTable[nFaceIndex])
			NpcChat(PIdx2NpcIdx(PlayerIndex), szFaceMsg, 1)
		end
	end
	
	local nExpEnough = _CheckCanStartExpExchg(1, 0)
	if 1 ~= nExpEnough then
		DoStartScriptCallBack(0, 0, 0, "", 1) --Í£Ö¹³å»÷
		Talk(1,"",format("Kinh nghiÖm kh«ng ®ñ, t¹m dõng kÝch huyÖt ch©n khi!"))
	end
end

--¾­ÂöÏµÍ³¾­Ñé¶Ò»»ÕæÆø½Å±¾
function DoStartExpExchgGenuineQi(nCount)
	--¹Ø±Õ¾­Ñé³å»÷ÕæÆø¹¦ÄÜ
	do	return 0 end
	--¹Ø±Õ¾­Ñé³å»÷ÕæÆø¹¦ÄÜend
	
	if 1 ~= IsMeridianSystemOpen() then
		return 0
	end
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return
	end
	local nExpEnough = _CheckCanStartExpExchg(1, 0)
	if nExpEnough == 1 then
		if tChg then
    		local szNeedItemDesc = ""
    		local tbSay = {}
    		tinsert(tbSay, format("KÝch huyÖt th«ng th­êng/#_OnExchange(%d)", nCount))
    		if tItem then
    			szNeedItemDesc = format("Sö dông ®¹o cô<color=yellow>%s<color>KÝch huyÖt sÏ cã tû lÖ thµnh c«ng cao h¬n", tItem[5] or "");
--    			tinsert(tbSay, format("sö dông %s kÝch huyÖt/#_OnExchangeByItem(%d)", tItem[5] or "", nCount))
    		end
    		tinsert(tbSay, "Th«i, kh«ng muèn kÝch huyÖt n÷a/no")
    		local szTitle = format("C¸c h¹ ®· chän tiÕn hµnh <color=yellow>%d<color> lÇn kinh nghiÖm kÝch huyÖt ch©n khÝ, mçi lÇn kÝch huyÖt cÇn tiªu hao 100 v¹n kinh nghiÖm, cã c¬ héi nhËn ®­îc 10 ch©n khÝ. %s c¸c h¹ cÇn kÝch huyÖt nh­ thÕ nµo?", nCount, szNeedItemDesc)
    		Say(szTitle, getn(tbSay), tbSay)
		end
	else
		--Talk(1,"",format("¾­Ñé²»×ã£¬¿ªÆô³å»÷ÕæÆøÊ§°Ü!"))
	end
end

function _OnExchange(nCount)
	_DoExchange(nCount, N_THIS_CALL_BACK_CODE_NO_ITEM);
end

function _OnExchangeByItem(nCount)
	_DoExchange(nCount, N_THIS_CALL_BACK_CODE_HAVE_ITEM);
end

function _DoExchange(nCount, nCallBackCode)
	--DoStartScriptCallBack(0, 0, 0, "", 1)--ÏÈÍ£Ö¹ÕýÔÚ½øÐÐµÄ»Øµ÷
	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_AWARD_CALL_BACK_CNT * nCount + 1, nCallBackCode, SZ_THIS_SCRIPT, 1) then
		local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
		SetCurrentNpcSFX(nPidxNpc,905,0,1); --µØÃæÌØÐ§
	end
end

-- Ö´ÐÐÒ»´Î³å»÷
-- ·µ»Ø-1±íÊ¾Ã»±ØÒªÔÙ½øÐÐ³å»÷ÁË
-- ·µ»Ø0 ±íÊ¾±¾´Î³å»÷Ê§°Ü
-- ·µ»Ø1 ±íÊ¾±¾´Î³å»÷³É¹¦
function _DoOneExpChgZhenqi(bNeedItem)
	local nCurIndex = _GetCurrentExpExchgIndex()
	local nExpEnough = _CheckCanStartExpExchg(1, 1)
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return -1
	end
	if nCurIndex >=1 and nCurIndex <= getn(tChg) and nExpEnough == 1 then
		local bAddRate = 0
		if bNeedItem and tItem then
			bAddRate = DelItem(tItem[1], tItem[2], tItem[3], tItem[4])
			if 0 == bAddRate then
				Msg2Player(format("%s kh«ng ®ñ, sö dông ph­¬ng thøc th«ng th­êng kÝch huyÖt ch©n khÝ",tItem[5]))
			end
		end
		local nRate = tChg[nCurIndex][4]
		if 1 == bAddRate then
			nRate = nRate + tChg[nCurIndex][5]
		end
		if random(1, N_MAX_RATE) <= nRate then
			local nArardStatus = AwardGenuineQiByType(tChg[nCurIndex][6], AWARD_QENUINEQI_TYPE_EXP)
			if 1 ~= nArardStatus then--»ñµÃÕæÆøÊ§°Ü
				return -1
			end
			return 1
		else
			return 0
		end
		
	end
	return -1
end

function _GetCurrentExpExchgIndex()
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return 0
	end
	local nCurCount = GetTodayAwardGenuineQiByType(AWARD_QENUINEQI_TYPE_EXP)
	nCurCount = nCurCount + 1
	for i=1, getn(tChg) do
		if nCurCount >= tChg[i][1] and nCurCount <= tChg[i][2] then
			return i
		end
	end
	return 0
end

--ÅÐ¶ÏÊÇ·ñ¿ÉÒÔ¿ªÊ¼¾­Ñé³å»÷ÕæÆø
function _CheckCanStartExpExchg(nCount, bModify)
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return 0
	end
	local nCurIndex = _GetCurrentExpExchgIndex()
	if nCurIndex >=1 and nCurIndex <= getn(tChg) then
		local nNeedExp = tChg[nCurIndex][3] * N_CONSUME_EXP_ONE_TIME_UNIT
		local nCurExp = GetExp()
		if nCurExp < nNeedExp then
			--Msg2Player(format("µ±Ç°¾­Ñé²»×ã[%d]²»ÄÜ³å»÷ÕæÆø", nNeedExp))
			Talk(1, "", format("Kinh nghiÖm kh«ng ®ñ [%d] kh«ng thÓ kÝch huyÖt ch©n khÝ", nNeedExp));
			return 0
		end
		local  nCapacity = GetTodayAwardGenuineQiLeftCapacityByType(AWARD_QENUINEQI_TYPE_EXP)
		if nCapacity <= 0 then
			Talk(1, "", format("KÝch huyÖt kinh m¹ch trong ngµy h«m nay kh«ng thÓ nhËn thªm ch©n khÝ"));
			return 0
		end
		if bModify == 1 then
			ModifyExp(-1 * nNeedExp)--¿Û³ý¾­Ñé
		end
		return 1
	else
		Talk(1, "", format("KÝch huyÖt kinh m¹ch trong ngµy h«m nay kh«ng thÓ nhËn thªm ch©n khÝ"));
		--Msg2Player("½ñÈÕÍ¨¹ý³å»÷¾­ÂöÒÑ²»ÄÜÔÙ»ñµÃÕæÆø")
		return 0
	end
	return 0
end

--»ñÈ¡ÄÜÁ¶»¯¾­ÑéµÄ´ÎÊý
function GetCanExpchgCnt(bNotify)
	--print(format("GetCanExpchgCnt(%d)", bNotify))
	local nRet = 0
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return 0
	end
	local nCurIndex = _GetCurrentExpExchgIndex()
	local nMaxIndex = getn(tChg)
	local nIndex = nCurIndex
	if nCurIndex >= 1 and nCurIndex <= nMaxIndex then
		local nLeftExp = GetExp()
		local  nLeftCapacity = GetTodayAwardGenuineQiLeftCapacityByType(AWARD_QENUINEQI_TYPE_EXP)
		local nCurAwardGenuineQiCount = GetTodayAwardGenuineQiByType(AWARD_QENUINEQI_TYPE_EXP)
		local bLoop = 1
		while bLoop == 1 and nIndex <= nMaxIndex do
			local nIndexNeedExp = tChg[nIndex][3] * N_CONSUME_EXP_ONE_TIME_UNIT
			if nIndexNeedExp <= 0 then
				nIndexNeedExp = 1
			end
			local nIndexAwardGenuineQi = tChg[nIndex][6]
			if nIndexAwardGenuineQi <= 0 then
				nIndexAwardGenuineQi = 1
			end
			local nIndexLeftGenuineQi = tChg[nIndex][2] - nCurAwardGenuineQiCount
			if nIndexLeftGenuineQi > nLeftCapacity then
				nIndexLeftGenuineQi = nLeftCapacity
				--Ê£ÓàÈÝÁ¿²»×ãÁË£¬ÍË³öÑ­»·
				bLoop = 0
			end
			local nCntByExp = nLeftExp / nIndexNeedExp
			local nCntByGenuineQi = nIndexLeftGenuineQi / nIndexAwardGenuineQi
			local nCntAdd = nCntByGenuineQi
			if nCntAdd > nCntByExp then
				nCntAdd = nCntByExp
				--¾­Ñé²»×ãÁË£¬ÍË³öÑ­»·
				bLoop = 0
			end

			local nOldIndex = nIndex
			if nCntAdd > 0 then
				nRet = nRet + nCntAdd
				if  bLoop == 1 then
					nCurAwardGenuineQiCount = tChg[nIndex][2]
					nLeftCapacity = nLeftCapacity - (nCntAdd * tChg[nIndex][6])
					nLeftExp = nLeftExp - (nCntAdd * nIndexNeedExp)
					nIndex = nIndex + 1
				else
					bLoop = 0
					break
				end
			else
				bLoop = 0
				break
			end
			
--			print(format("\n--------------------\n"))
--			print(format("nOldIndex = %d\n", nOldIndex))
--			print(format("nMaxIndex = %d\n", nMaxIndex))
--			print(format("nIndexLeftGenuineQi = %d\n", nIndexLeftGenuineQi))
--			print(format("nOldIndex = %d\n", nOldIndex))
--			print(format("nLeftExp = %d\n", nLeftExp))
--			print(format("nCntByExp = %d\n", nCntByExp))
--			print(format("nIndexLeftGenuineQi = %d\n", nIndexLeftGenuineQi))
--			print(format("nCntByGenuineQi = %d\n", nCntByGenuineQi))
--			print(format("nCntAdd = %d\n", nCntAdd))
--			print(format("bLoop = %d\n", bLoop))
--			print(format("nRet = %d\n", nRet))
--			print(format("nCurAwardGenuineQiCount = %d\n", nCurAwardGenuineQiCount))
--			print(format("nLeftCapacity = %d\n", nLeftCapacity))
		end
	end
	
	if 1 == bNotify and nRet <= 0 then
		--Msg2Player("µ±Ç°²»ÄÜ¿ªÊ¼Á¶»¯ÕæÆø")
		Talk(1, "", format("Kinh nghiÖm kh«ng ®ñ 100 v¹n hoÆc  Ch©n KhÝ luyÖn hãa ®· ®¹t giíi h¹n trong ngµy, kh«ng thÓ luyÖn hãa Ch©n KhÝ"));
	end
	return nRet
end

function _GetExchgLevelInfo()
	local nCurMeridianLevel = MeridianGetLevel()
	local tPara = t_level_exp_chg_table[nCurMeridianLevel]
	return tPara
end

function no()
end
