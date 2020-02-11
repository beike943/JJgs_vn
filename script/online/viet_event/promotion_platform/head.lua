-- Promotion Platform 2010
-- Created by TriHM

Include("\\script\\online\\viet_event\\promotion_platform\\strings.lua")

function plat_main_dialog()
	local nPlatLvl = CheckVerifyLvl()
	if nPlatLvl > 2 then
		nPlatLvl = 2
	end
	if nPlatLvl == 0 then
		Talk(1, "", PROMOT_PLAT_DLG[1])
		return
	end
	local tSay = {}
	local szHeader = PROMOT_PLAT_STRINGS[1]
	
	tinsert(tSay, format(PROMOT_PLAT_STRINGS[3].."/#buy_promot_goods(1)", PROMOT_PLAT_GOODS_PRICE[nPlatLvl][1]))
	tinsert(tSay, format(PROMOT_PLAT_STRINGS[4].."/#buy_promot_goods(2)", PROMOT_PLAT_GOODS_PRICE[nPlatLvl][2]))
	tinsert(tSay, format(PROMOT_PLAT_STRINGS[5].."/#buy_promot_goods(3)", PROMOT_PLAT_GOODS_PRICE[nPlatLvl][3]))
	tinsert(tSay, PROMOT_PLAT_STRINGS[6].."/promot_active_exp")
	tinsert(tSay, PROMOT_PLAT_STRINGS[7].."/promot_get_prize")
	
	tinsert(tSay, PROMOT_PLAT_STRINGS[8].."/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

-- B¸n giê ñy th¸c gi¶m gi¸
function buy_promot_goods(nType)
	local nPlatLvl = CheckVerifyLvl()
	if nPlatLvl > 2 then
		nPlatLvl = 2
	end
	local nPrice = PROMOT_PLAT_GOODS_PRICE[nPlatLvl][nType]
	local nQuantity = 80 * 60
	local nBuy = floor(mod(GetExtPoint(2), 100) / 10)
	if nBuy == 0 then
		Talk(1, "", PROMOT_PLAT_DLG[3])
		return
	end
	if GetItemCount(2, 1, 30230) < nPrice then
		Talk(1, "", PROMOT_PLAT_DLG[2])
		return
	end

	if DelItem(2, 1, 30230, nPrice) == 1 then
		PayExtPoint(2, 10)
		if nType == 1 then
			SetTask(GLB_TASK_BAIJUWAN_SMALL, GetTask(GLB_TASK_BAIJUWAN_SMALL) + nQuantity)
		elseif nType == 2 then
			SetTask(GLB_TASK_BAIJUWAN_LARGE, GetTask(GLB_TASK_BAIJUWAN_LARGE) + nQuantity)
		elseif nType == 3 then
			SetTask(GLB_TASK_BAIJUXIANDAN, GetTask(GLB_TASK_BAIJUXIANDAN) + nQuantity)
		end
		local nHour = nQuantity / 60
        	Msg2Player(format(PROMOT_PLAT_MSG[nType], nHour))
        	gf_WriteLogEx(PROMOT_PLAT_LOG_TITLE, format(PROMOT_PLAT_LOG_ACTIONS[nType], nType))
	end
end

-- NhËn th­ëng bonus exp hµng ngµy
function promot_active_exp()
	local nActive = floor(mod(GetExtPoint(2), 1000) / 100)
	local nExp = PROMOT_PLAT_BONUS_EXP[nActive]
	if nActive == 0 then
		Talk(1, "", PROMOT_PLAT_DLG[4])
		return
	end
	
	PayExtPoint(2, nActive * 100)
	if floor(mod(GetExtPoint(2), 1000) / 100) == 0 then
		ModifyExp(nExp)
		Msg2Player(format(PROMOT_PLAT_MSG[4], nExp))
		gf_WriteLogEx(PROMOT_PLAT_LOG_TITLE, format(PROMOT_PLAT_LOG_ACTIONS[4], nExp))
	end
end

-- NhËn thuëng quay sè
function promot_get_prize()
	local nPrize = floor(mod(GetExtPoint(2), 100000) / 1000)
	if nPrize <= 0 then
		Talk(1, "", PROMOT_PLAT_DLG[5])
		return
	end
	
	if gf_Judge_Room_Weight(1, 10 , "") ~= 1 then
		return
	end
	
	local nIsTrue = nPrize - 1
	PayExtPoint(2, 1000)
	if floor(mod(GetExtPoint(2), 100000) / 1000) == nIsTrue then
		gf_EventGiveRandAward(PROMOT_PLAT_PRIZE, 100, 6, PROMOT_PLAT_LOG_TITLE, PROMOT_PLAT_LOG_ACTIONS[5])		
	end
end

function CheckVerifyLvl()
	local nBase = GetExtPoint(2)
	local nLvl = mod(nBase, 10)
	return nLvl
end

function do_nothing()

end