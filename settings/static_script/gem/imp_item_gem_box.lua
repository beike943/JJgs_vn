--±¦Ê¯´ü
Include("\\settings\\static_script\\lib\\item_define.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task_access_code_def.lua")

g_szItemNameGemBox		= "CÈm Nang §¸ Quý";
g_szTitle			= "<color=green>CÈm Nang §¸ Quý<color>";

G_MAX_GEM_STORE=255
assert(G_MAX_GEM_STORE > 0 and G_MAX_GEM_STORE <=255);
G_MAX_GEM_LEVEL=6
G_COMPOSE_NEED_GEM_NUM=4
g_tGemInfo ={
	--type,name
	[1] = {1,"HuyÕt TrÝch Th¹ch"},
	[2] = {2,"NguyÖt B¹ch Th¹ch"},
	[3] = {3,"Hæ Ph¸ch Th¹ch"},
	[4] = {4,"H¾c DiÖu Th¹ch"},
}
g_tComposeConsume = {
	nil,
	{1},--{need_gold}
	{4},
	{20},
	{100},
	{1000},
}

g_tGemTaskList = {
	--task_id, task_byte, access_code
	[101] = {3245, 1, TASK_ACCESS_CODE_GEM_SYSTEM},
	[102] = {3246, 1, TASK_ACCESS_CODE_GEM_SYSTEM},
	[103] = {3247, 1, TASK_ACCESS_CODE_GEM_SYSTEM},
	[104] = {3248, 1, TASK_ACCESS_CODE_GEM_SYSTEM},
	[105] = {3249, 1, TASK_ACCESS_CODE_GEM_SYSTEM},
	[106] = {3250, 1, TASK_ACCESS_CODE_GEM_SYSTEM},
	[201] = {3245, 2, TASK_ACCESS_CODE_GEM_SYSTEM},
	[202] = {3246, 2, TASK_ACCESS_CODE_GEM_SYSTEM},
	[203] = {3247, 2, TASK_ACCESS_CODE_GEM_SYSTEM},
	[204] = {3248, 2, TASK_ACCESS_CODE_GEM_SYSTEM},
	[205] = {3249, 2, TASK_ACCESS_CODE_GEM_SYSTEM},
	[206] = {3250, 2, TASK_ACCESS_CODE_GEM_SYSTEM},
	[301] = {3245, 3, TASK_ACCESS_CODE_GEM_SYSTEM},
	[302] = {3246, 3, TASK_ACCESS_CODE_GEM_SYSTEM},
	[303] = {3247, 3, TASK_ACCESS_CODE_GEM_SYSTEM},
	[304] = {3248, 3, TASK_ACCESS_CODE_GEM_SYSTEM},
	[305] = {3249, 3, TASK_ACCESS_CODE_GEM_SYSTEM},
	[306] = {3250, 3, TASK_ACCESS_CODE_GEM_SYSTEM},
	[401] = {3245, 4, TASK_ACCESS_CODE_GEM_SYSTEM},
	[402] = {3246, 4, TASK_ACCESS_CODE_GEM_SYSTEM},
	[403] = {3247, 4, TASK_ACCESS_CODE_GEM_SYSTEM},
	[404] = {3248, 4, TASK_ACCESS_CODE_GEM_SYSTEM},
	[405] = {3249, 4, TASK_ACCESS_CODE_GEM_SYSTEM},
	[406] = {3250, 4, TASK_ACCESS_CODE_GEM_SYSTEM},
};

function OnOpen_GemBox_FromNpc(nItemIdx)
	AddRuntimeStat(21, 1, 1, 1)
	OnUse_GemBox(nItemIdx)
end
function OnOpen_GemBox_FromItem(nItemIdx)
	AddRuntimeStat(21, 1, 0, 1)
	OnUse_GemBox(nItemIdx)
end

function OnUse_GemBox(nItemIdx)
	if IsGemSystemOpen(2) ~= 1 then
		return
	end
	
	local szTitle = format("%s:%s", g_szTitle, "Mçi lo¹i ®¸ quý cã thÓ cÊt gi÷ 255 c¸i, ta cã thÓ gióp ®­îc g×?")
	local tbSay = {}

	tinsert(tbSay, format("%s/_checkin_all_gem", "Bá tÊt c¶ ®¸ quý vµo trong tói"))
	tinsert(tbSay, format("%s/_checkout_gem", "Ta muèn rót ®¸ quý"))
	tinsert(tbSay, format("%s/_compose_gem", "Ta muèn ghÐp ®¸ quý"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _checkin_all_gem(bConfirm)
	if not bConfirm then
		local szTitle = format("%s:%s", g_szTitle, "Mçi lo¹i ®¸ quý cã thÓ cÊt gi÷ 255 c¸i, ®ång ý cÊt vµo kh«ng?")
    	local tbSay = {}
    
    	tinsert(tbSay, format("%s/#_checkin_all_gem(1)", "§ång ý"))
    	tinsert(tbSay, format("%s/OnUse_GemBox", "trë l¹i"))
    	tinsert(tbSay, format("%s/nothing", "Ra khái"))
		Say(szTitle, getn(tbSay), tbSay)
		return
	end
	
	local tItems = GetRoomItems(pos_equiproom)
	local tProcessed = {}
	for i, item_idx in tItems do
		local nG, nD, nP	= GetItemInfoByIndex(item_idx);
		if nG == item_other and nD == enumOD_GEM and not tProcessed[nP] then
			local nType = floor(nP/100)
			local nLevel = mod(nP,100)
			local nItemCnt = GetItemCount(nG, nD, nP)
			local nGemCnt = _get_gem_num(nType, nLevel)
			local nCnt = G_MAX_GEM_STORE - nGemCnt
			nCnt = min(nCnt, nItemCnt)
			if nCnt > 0 then
				tProcessed[nP] = {nCnt, nItemCnt}
			end
		end
	end
	
	for k,v in tProcessed do
		local nType = floor(k/100)
		local nLevel = mod(k,100)
		local nCnt = v[1]
		if v[2] > v[1] then
			local szItemName = GetItemName(item_other, enumOD_GEM, k)
			Msg2Player(format("%s-%s ®· ®¹t giíi h¹n %d, h·y ghÐp thµnh ®¸ quý cÊp cao råi cÊt vµo", g_szItemNameGemBox, szItemName, G_MAX_GEM_STORE))
		end
		if 1== DelItem(item_other, enumOD_GEM, k, nCnt) then
--			WriteLog(format("[%s][_checkin_all_gem][%s][%s][DelItem][gdp:%d,%d,%d][num:%d]",
--				g_szItemNameGemBox, GetAccount(), GetName(), nG, nD, nP, nCnt));
			_modify_gem_num(nType, nLevel, nCnt)
		end
	end
end

function _checkout_gem()
	local szTitle = format("%s:%s", g_szTitle, "LÊy lo¹i ®¸ quý nµo?")
	local tbSay = {}
	
	for i,v in g_tGemInfo do
		tinsert(tbSay, format("%s/#_checkout_gem_type(%d)", v[2], v[1]))
	end
	tinsert(tbSay, format("%s/OnUse_GemBox", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _checkout_gem_type(nType)
	local szTitle = format("%s:%s", g_szTitle, "LÊy ®¸ quý cÊp mÊy?")
	local tbSay = {}
	
	local tType = g_tGemInfo[nType]
	for lv=1,G_MAX_GEM_LEVEL do
		local nCnt = _get_gem_num(nType,lv)
		if nCnt > 0 then
			tinsert(tbSay, format("%d%s%s(%d)/#_checkout_gem_type_lv(%d,%d)", lv, " cÊp ",tType[2], nCnt, nType, lv))
		end
		
	end
	tinsert(tbSay, format("%s/_checkout_gem", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _checkout_gem_type_lv(nType, nLevel)
	local nMaxCnt = _get_gem_num(nType,nLevel)
	local szFunc = format("_checkout_gem_callback_%d_%d", nType, nLevel)
	AskClientForNumber(szFunc, 1, nMaxCnt, "Muèn lÊy ra bao nhiªu c¸i?");
end

function _checkout_gem_callback_1_1(nNum) return _checkout_gem_type_lv_num(1,1,nNum) end
function _checkout_gem_callback_1_2(nNum) return _checkout_gem_type_lv_num(1,2,nNum) end
function _checkout_gem_callback_1_3(nNum) return _checkout_gem_type_lv_num(1,3,nNum) end
function _checkout_gem_callback_1_4(nNum) return _checkout_gem_type_lv_num(1,4,nNum) end
function _checkout_gem_callback_1_5(nNum) return _checkout_gem_type_lv_num(1,5,nNum) end
function _checkout_gem_callback_1_6(nNum) return _checkout_gem_type_lv_num(1,6,nNum) end
function _checkout_gem_callback_2_1(nNum) return _checkout_gem_type_lv_num(2,1,nNum) end
function _checkout_gem_callback_2_2(nNum) return _checkout_gem_type_lv_num(2,2,nNum) end
function _checkout_gem_callback_2_3(nNum) return _checkout_gem_type_lv_num(2,3,nNum) end
function _checkout_gem_callback_2_4(nNum) return _checkout_gem_type_lv_num(2,4,nNum) end
function _checkout_gem_callback_2_5(nNum) return _checkout_gem_type_lv_num(2,5,nNum) end
function _checkout_gem_callback_2_6(nNum) return _checkout_gem_type_lv_num(2,6,nNum) end
function _checkout_gem_callback_3_1(nNum) return _checkout_gem_type_lv_num(3,1,nNum) end
function _checkout_gem_callback_3_2(nNum) return _checkout_gem_type_lv_num(3,2,nNum) end
function _checkout_gem_callback_3_3(nNum) return _checkout_gem_type_lv_num(3,3,nNum) end
function _checkout_gem_callback_3_4(nNum) return _checkout_gem_type_lv_num(3,4,nNum) end
function _checkout_gem_callback_3_5(nNum) return _checkout_gem_type_lv_num(3,5,nNum) end
function _checkout_gem_callback_3_6(nNum) return _checkout_gem_type_lv_num(3,6,nNum) end
function _checkout_gem_callback_4_1(nNum) return _checkout_gem_type_lv_num(4,1,nNum) end
function _checkout_gem_callback_4_2(nNum) return _checkout_gem_type_lv_num(4,2,nNum) end
function _checkout_gem_callback_4_3(nNum) return _checkout_gem_type_lv_num(4,3,nNum) end
function _checkout_gem_callback_4_4(nNum) return _checkout_gem_type_lv_num(4,4,nNum) end
function _checkout_gem_callback_4_5(nNum) return _checkout_gem_type_lv_num(4,5,nNum) end
function _checkout_gem_callback_4_6(nNum) return _checkout_gem_type_lv_num(4,6,nNum) end
function _checkout_gem_type_lv_num(nType, nLevel,nNum)
	local nMaxCnt = _get_gem_num(nType,nLevel)
	if nNum >= 1 and nNum <= nMaxCnt then
		local nP = nType*100+ nLevel
		
		if 1 ~= gf_JudgeRoomWeight(2, 0, g_szTitle) then return end
		
		if 1 == _modify_gem_num(nType,nLevel, -1*nNum) then
        	gf_SetLogCaption(g_szItemNameGemBox);
        	local tType = g_tGemInfo[nType]
        	gf_AddItemEx({item_other, enumOD_GEM, nP, nNum}, format("%d%s%s", nLevel," cÊp ", tType[2]));
        	gf_SetLogCaption("");
		end
	end
end

function _compose_gem()
	local szTitle = format("%s:%s", g_szTitle, "Tiªu hao 4 ®¸ quý cÊp thÊp sÏ ghÐp thµnh 1 ®¸ quý cÊp cao, muèn ghÐp lo¹i ®¸ quý nµo?")
	local tbSay = {}
	
	for i,v in g_tGemInfo do
		tinsert(tbSay, format("%s/#_compose_gem_type(%d)", v[2], v[1]))
	end
	tinsert(tbSay, format("%s/OnUse_GemBox", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _compose_gem_type(nType)
	local szTitle = format("%s:%s", g_szTitle, "Tiªu hao 4 ®¸ quý cÊp thÊp sÏ ghÐp thµnh 2 ®¸ quý cÊp cao, muèn ghÐp ®¸ quý cÊp mÊy?")
	local tbSay = {}
	
	local tType = g_tGemInfo[nType]
	for lv=1,G_MAX_GEM_LEVEL-1 do
		local nCnt = _get_gem_num(nType,lv)
		local nMaxCnt = floor(nCnt/G_COMPOSE_NEED_GEM_NUM)
		local nUpperLv = lv + 1
		local nUpCnt = _get_gem_num(nType,nUpperLv)
		--if nMaxCnt > 0 then
			tinsert(tbSay, format("%d%s%s(%s%d %s%d)/#_compose_gem_type_lv(%d,%d)", nUpperLv, " cÊp ",tType[2], "Cã thÓ ghÐp", nMaxCnt, "§· cã", nUpCnt, nType, nUpperLv))
		--end
		
	end
	tinsert(tbSay, format("%s/_compose_gem", "trë l¹i"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _get_compose_need_gold(nType, nLevel)
	if g_tGemInfo[nType] and g_tComposeConsume[nLevel] then
		return g_tComposeConsume[nLevel][1]
	end
	return -1
end
function _get_max_compose_count_by_gold(nType, nLevel)
	local nMaxComposeByGold = -1
	local nNeedGold = _get_compose_need_gold(nType, nLevel)
	if nNeedGold >= 0 then
		nMaxComposeByGold = G_MAX_GEM_STORE
    	if nNeedGold > 0 then
    		nMaxComposeByGold = floor(GetCash() / (10000*nNeedGold))
    	end
	end
	return nMaxComposeByGold
end
function _get_can_compose_cnt(nType, nLevel)
	local nMaxComposeByGold = _get_max_compose_count_by_gold(nType, nLevel)
	if nLevel <= 1 or nMaxComposeByGold <= 0 then
		return 0
	end
	local nUpperCurNum = _get_gem_num(nType, nLevel)
	local nLowerCurNum = _get_gem_num(nType, nLevel-1)
	local nMaxCompose = floor(nLowerCurNum / G_COMPOSE_NEED_GEM_NUM)
	local nCurCap = G_MAX_GEM_STORE - nUpperCurNum
	local nRealMaxCompose = min(nCurCap, nMaxCompose)
	
	local nRealCompose = min(nMaxComposeByGold, nRealMaxCompose)
	
	return nRealCompose
end

function _compose_gem_type_lv(nType, nLevel)
	local nMaxComposeByGold = _get_max_compose_count_by_gold(nType, nLevel)
	if nMaxComposeByGold <= 0 then
		Talk(1,"","Sè vµng kh«ng ®ñ, t¹m thêi kh«ng thÓ ghÐp ®¼ng cÊp nµy")
		return
	end
	
	local nMaxCnt = _get_can_compose_cnt(nType, nLevel)
	if nMaxCnt <= 0 then
		Talk(1,"","T¹m thêi kh«ng thÓ ghÐp thµnh ®¼ng cÊp nµy")
		return
	end
	local szFunc = format("_compose_gem_callback_%d_%d", nType, nLevel)
	AskClientForNumber(szFunc, 1, nMaxCnt, "GhÐp bao nhiªu c¸i?");
end

function _compose_gem_callback_1_1(nNum) return _compose_gem_type_lv_num(1,1,nNum) end
function _compose_gem_callback_1_2(nNum) return _compose_gem_type_lv_num(1,2,nNum) end
function _compose_gem_callback_1_3(nNum) return _compose_gem_type_lv_num(1,3,nNum) end
function _compose_gem_callback_1_4(nNum) return _compose_gem_type_lv_num(1,4,nNum) end
function _compose_gem_callback_1_5(nNum) return _compose_gem_type_lv_num(1,5,nNum) end
function _compose_gem_callback_1_6(nNum) return _compose_gem_type_lv_num(1,6,nNum) end
function _compose_gem_callback_2_1(nNum) return _compose_gem_type_lv_num(2,1,nNum) end
function _compose_gem_callback_2_2(nNum) return _compose_gem_type_lv_num(2,2,nNum) end
function _compose_gem_callback_2_3(nNum) return _compose_gem_type_lv_num(2,3,nNum) end
function _compose_gem_callback_2_4(nNum) return _compose_gem_type_lv_num(2,4,nNum) end
function _compose_gem_callback_2_5(nNum) return _compose_gem_type_lv_num(2,5,nNum) end
function _compose_gem_callback_2_6(nNum) return _compose_gem_type_lv_num(2,6,nNum) end
function _compose_gem_callback_3_1(nNum) return _compose_gem_type_lv_num(3,1,nNum) end
function _compose_gem_callback_3_2(nNum) return _compose_gem_type_lv_num(3,2,nNum) end
function _compose_gem_callback_3_3(nNum) return _compose_gem_type_lv_num(3,3,nNum) end
function _compose_gem_callback_3_4(nNum) return _compose_gem_type_lv_num(3,4,nNum) end
function _compose_gem_callback_3_5(nNum) return _compose_gem_type_lv_num(3,5,nNum) end
function _compose_gem_callback_3_6(nNum) return _compose_gem_type_lv_num(3,6,nNum) end
function _compose_gem_callback_4_1(nNum) return _compose_gem_type_lv_num(4,1,nNum) end
function _compose_gem_callback_4_2(nNum) return _compose_gem_type_lv_num(4,2,nNum) end
function _compose_gem_callback_4_3(nNum) return _compose_gem_type_lv_num(4,3,nNum) end
function _compose_gem_callback_4_4(nNum) return _compose_gem_type_lv_num(4,4,nNum) end
function _compose_gem_callback_4_5(nNum) return _compose_gem_type_lv_num(4,5,nNum) end
function _compose_gem_callback_4_6(nNum) return _compose_gem_type_lv_num(4,6,nNum) end
function _compose_gem_type_lv_num(nType, nLevel,nNum, bConfirm)
	local nPUpper = nType*100+nLevel
	local szItemName = GetItemName(item_other, enumOD_GEM, nPUpper)
	local nMaxComposeCnt = _get_can_compose_cnt(nType, nLevel)
	local nRealCompose = min(nNum, nMaxComposeCnt)
	if nRealCompose <= 0 then
		return
	end
	local nNeedGold = _get_compose_need_gold(nType, nLevel)
	if nNeedGold < 0 then
		return
	end
	local nNeedGoldAll = nNeedGold * nRealCompose

	if not bConfirm or bConfirm ~= 1 then
		local szMsg = format("GhÐp thµnh %d c¸i %s cÇn tiªu hao %d vµng, x¸c nhËn kh«ng?", nRealCompose, szItemName, nNeedGoldAll)
		local szTitle = format("%s:%s", g_szTitle, szMsg)
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#_compose_gem_type_lv_num(%d,%d,%d,1)", "§ång ý", nType, nLevel,nRealCompose))
    	tinsert(tbSay, format("%s/#_compose_gem_type(%d)", "trë l¹i", nType))
    	tinsert(tbSay, format("%s/nothing", "Tõ bá"))
    	Say(szTitle, getn(tbSay), tbSay)
		return
	end
	
	if nRealCompose < nNum then
		Msg2Player(format("%s-%s ®· ®¹t giíi h¹n %d, h·y ghÐp thµnh ®¸ quý cÊp cao", g_szItemNameGemBox, szItemName, G_MAX_GEM_STORE))
	end
	local nNeedMoneyAll = nNeedGoldAll * 10000
	if GetCash() < nNeedMoneyAll then
		--Talk(1,"",format("½ð×Ó²»×ã%d",nNeedGoldAll))
		return
	end
	if 1 == Pay(nNeedMoneyAll) then
		if 1==_modify_gem_num(nType, nLevel-1, -1*nRealCompose*G_COMPOSE_NEED_GEM_NUM) then
    		if 1 == _modify_gem_num(nType, nLevel, nRealCompose) then
    			AddRuntimeStat(21, 2, nPUpper, nRealCompose)
    			WriteLog(format("[%s][compose_gem][%s][%s][Type:%d][Level:%d][num:%d]",
    				g_szItemNameGemBox, GetAccount(), GetName(), nType, nLevel, nRealCompose));
    			local szMsg = format("GhÐp thµnh c«ng %d c¸i %d cÊp %s", nRealCompose, nLevel, g_tGemInfo[nType][2])
    			Msg2Player(szMsg)
    		end
    	end
	end
end

function _get_gem_num(nType, nLevel)
	local nRet = -1
	local nG = nType*100+nLevel
	local tTask = g_tGemTaskList[nG]
	if tTask then
		return gf_SafeGetTaskByte(tTask[1], tTask[2])
	end
	return nRet
	
end
function _modify_gem_num(nType, nLevel, nNum)
	local nRet = 0
	local nG = nType*100+nLevel
	local tTask = g_tGemTaskList[nG]
	if tTask then
		local nCur = _get_gem_num(nType, nLevel)
		local nNew = nCur + nNum
		if nNew >= 0 and nNew <= G_MAX_GEM_STORE then
			gf_SafeSetTaskByte(tTask[1], tTask[2], nNew, tTask[3])
			WriteLog(format("[%s][modify_gem_num][%s][%s][Type:%d][Level:%d][num:%d->%d]",
				g_szItemNameGemBox, GetAccount(), GetName(), nType, nLevel, nNum, _get_gem_num(nType, nLevel)));
			nRet = 1
		end
	end
	return nRet
end


function nothing()
end


