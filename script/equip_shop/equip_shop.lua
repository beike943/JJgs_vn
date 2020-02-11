--½Å±¾Ãû³Æ£º
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£º¶Ü¶Ü
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2011-05-27
--´úÂëÐÞ¸Ä¼ÇÂ¼

Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_tItemDetail2EquipPos = {
	[100]	= 1,
	[101]	= 3,
	[102]	= 4,
	[103]	= 0,
	[105]	= 10,
	[107]	= 11,
	[108]	= 6,
	[109]	= 7,
	[110]	= 8,
	[112]	= 9,
--	[113]	= 18,
--	[114]	= 19,
--	[115]	= 20,
--	[116]	= 17,
--	[117]	= 22,
--	[118]	= 23,
--	[119]	= 24,
--	[120]	= 25,
--	[121]	= 26,
	--Èý¼þÌ×
	[152]	= 17,--Åû·ç
	[153]	= 18,--»ÕÕÂ
	[154]	= 19,--Ð¬
};

function get_gdp_id(nG, nD, nP)
	if not nG or 0 > nG or nG > 255		then return	0;	end
	if not nD or 0 > nD or nD > 255		then return	0;	end
	if not nP or 0 > nP or nP > 65535	then return	0;	end

	-- 65536	2^16
	-- 16777216	2^24
	return nG * 16777216 + nD * 65536 + nP;
end

g_tBaguaItem = {
	get_gdp_id(0, 103, 85),
	get_gdp_id(0, 103, 86),
	get_gdp_id(0, 103, 87),
	get_gdp_id(0, 103, 88),
	get_gdp_id(0, 100, 85),
	get_gdp_id(0, 100, 86),
	get_gdp_id(0, 100, 87),
	get_gdp_id(0, 100, 88),
	get_gdp_id(0, 101, 85),
	get_gdp_id(0, 101, 86),
	get_gdp_id(0, 101, 87),
	get_gdp_id(0, 101, 88),
	get_gdp_id(0, 0,   17),
	get_gdp_id(0, 2,   39),
	get_gdp_id(0, 5,   43),
	get_gdp_id(0, 1,   56),
	get_gdp_id(0, 3,   67),
	get_gdp_id(0, 10,  78),
	get_gdp_id(0, 9,   89),
	get_gdp_id(0, 8,   100),
	get_gdp_id(0, 6,   111),
	get_gdp_id(0, 4,   122),
	get_gdp_id(0, 11,  15),
	get_gdp_id(0, 7,   15),
	get_gdp_id(0, 12,  15),
	get_gdp_id(0, 13,  15),
	get_gdp_id(0, 3,   125),
	get_gdp_id(0, 0,   125),
	get_gdp_id(0, 8,   125),
	get_gdp_id(0, 1,   125),
	get_gdp_id(0, 2,   125),
	get_gdp_id(0, 10,  125),
	get_gdp_id(0, 0,   126),
	get_gdp_id(0, 5,   125),
	get_gdp_id(0, 2,   126),
	get_gdp_id(0, 9,   125),
	get_gdp_id(0, 6,   125),
	get_gdp_id(0, 4,   125),
	get_gdp_id(0, 7,   125),
	get_gdp_id(0, 11,  125),
	get_gdp_id(0, 2,   127),
	get_gdp_id(0, 3,   126),
	get_gdp_id(0, 9,   126),
	get_gdp_id(0, 11,  126),
	get_gdp_id(0, 13,  125),
	get_gdp_id(0, 12,  125),
}

function get_equip_pos(nD)
	if not nD				then return		end
	if 0 <= nD and 15 >= nD	then return 2;	end
	return g_tItemDetail2EquipPos[nD];
end

--ÅäÖÃµÄÊ±¼äµ¥Î»×ª»»ÎªÃë
function config_time_to_sec(nTime)
	local nRet = nTime or 0;
	nRet = nRet * 60 * 60;--ÅäÖÃµÄÊ±¼äÒÔÐ¡Ê±Îªµ¥Î»£¬×ª»»³ÉÃë
	return nRet;
end

function _DoOneExchange(tGoodInfo, tExchangeInfo, uShopId, uGoodID, uExchangeID)
	-- ¼ì²é¶Ò»»´ÎÊý
	if 0 < tGoodInfo.AwardTimes[1] then
		local nTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		if nTaskValue >= tGoodInfo.AwardTimes[2] then
			Talk(1, "", format("Sè lÇn quy ®æi cña c¸c h¹ ®· ®¹t giíi h¹n %d lÇn, kh«ng thÓ ®æi [%s].", tGoodInfo.AwardTimes[2], tGoodInfo.Name));
			return 0
		end
	end

	-- ¼ì²é±äÁ¿ÏÞÖÆ
	local bCheckLimitVaild	= 1;
	for _, tLimitTask in tExchangeInfo.LimitTask do
		if 1 ~= bCheckLimitVaild then
			break;
		end

		if 0 < tLimitTask[1] then
			local nTaskValue	= GetTask(tLimitTask[1]);
			local bNeedProcess	= 1;

			------------------
			-- ÌØÊâ´¦Àí
			if 704 == tLimitTask[1] then
				if 0 < tLimitTask[2] and tLimitTask[2] > nTaskValue then
					bCheckLimitVaild = 0;
					break;
				end
				if 0 > tLimitTask[2] and tLimitTask[2] < nTaskValue then
					bCheckLimitVaild = 0;
					break;
				end
				bNeedProcess	= 0;
			end
			-- ÌØÊâ´¦Àí
			------------------

			if 1 == bNeedProcess then
				if 0 < tLimitTask[2] and tLimitTask[2] > nTaskValue then -- ×îÐ¡Öµ
					bCheckLimitVaild = 0;
					break;
				end
				if 0 < tLimitTask[3] and tLimitTask[3] < nTaskValue then -- ×î´óÖµ
					bCheckLimitVaild = 0;
					break;
				end
			end
		end
	end

	for _, tCostTask in tExchangeInfo.CostTask do
		if 1 ~= bCheckLimitVaild then
			break;
		end
		if 0 < tCostTask[1] then
			local nTaskValue	= GetTask(tCostTask[1]);
			if tCostTask[2] > nTaskValue then
				bCheckLimitVaild = 0;
				break;
			end
		end
	end

	if 1 ~= bCheckLimitVaild then
		Talk(1, "", format("C¸c h¹ kh«ng tháa “%s”, kh«ng thÓ ®æi [%s].", tExchangeInfo.LimitDesc, tGoodInfo.Name));
		return 0
	end

	-- ¼ì²éÇ®
	for _, tCostMoney in tExchangeInfo.CostMoney do
    	if tCostMoney[1] ~= 0 then
    		local nCoin = GetVMoney(tCostMoney[1]);
    		if tCostMoney[2] > nCoin then
    			Talk(1, "", format("Ng­¬i kh«ng mang ®ñ tiÒn, kh«ng thÓ ®æi [%s].", tGoodInfo.Name));
				return 0
    		end
    	end
    end

	-- ¼ì²éÎïÆ·ÏÞÖÆ
	local tEquipInfo		= {};
	local nEquipPos			= 0;
	local nEquipIDX			= 0;
	local nEquipEnhance		= 0;
	local nEquipEnhanceFail = 0;
	local nEquipLingqi		= 0;
	local nEquipDing5		= 0;
	local nEquipDing7		= 0;
	local nEquipDing10		= 0;
	local tItemTemplate		= GetItemTemplateInfo(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3]);
	local nFreeRoom			= GetFreeItemRoom();
	local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight();
	local nNeedRoom			= ((0 == tGoodInfo.AwardItem[1] or 0 >= tItemTemplate.StackCount) and tGoodInfo.AwardItem[4]) or ceil(tGoodInfo.AwardItem[4] / tItemTemplate.StackCount);
	local nNeedWeight		= ((nil and (1 == _JX2WZ)) and 0) or (((0 == tGoodInfo.AwardItem[1]) and tItemTemplate.Weight) or tItemTemplate.Weight * tGoodInfo.AwardItem[4]);

	-- ¸ºÖØ
	if nFreeWeight < nNeedWeight then
		Talk(1, "", format("C¸c h¹ mang theo vËt phÈm qu¸ n¨ng, kh«ng thÓ ®æi [%s]. Mang nÆng cÇn %d .", tGoodInfo.Name, nNeedWeight));
		return 0
	end

	-- ¿Õ¼ä
	if nFreeRoom < nNeedRoom then -- ×°±¸
		Talk(1, "", format("Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng, kh«ng thÓ ®æi [%s]. CÇn tr«ng %d « hµnh trang.", tGoodInfo.Name, nNeedRoom));
		return 0
	end

	local tAttrSave = nil
	local szSpecialOpStr =  tExchangeInfo.ExchangeFlag.SpecialOpStr or ""
	if 1 == tExchangeInfo.Type then -- Éý¼¶
		tEquipInfo						= tExchangeInfo.CostItem[1];
		nEquipPos						= get_equip_pos(tEquipInfo[2]);
		nEquipIDX						= GetPlayerEquipIndex(nEquipPos);
		local szItemName				= GetItemName(tEquipInfo[1], tEquipInfo[2], tEquipInfo[3]);
		local nEquipG, nEquipD, nEquipP	= GetPlayerEquipInfo(nEquipPos);
		if nEquipG ~= tEquipInfo[1] or nEquipD ~= tEquipInfo[2] or nEquipP ~= tEquipInfo[3] then
			Talk(1, "", format("H·y mang [%s] trªn ng­êi. NÕu lµ vËt trang søc h·y ®Æt t¹i « trang søc thø nhÊt.", szItemName));
			return 0
		end
		if tEquipInfo[5] and tEquipInfo[5] > 0 and  GetItemLevel(nEquipIDX) < tEquipInfo[5] then
			Talk(1, "", format("N©ng cÊp cÇn %d cÊp [%s]", tEquipInfo[5], szItemName));
			return 0
		end
		
		
		if szSpecialOpStr ~= "" then
			if SpecialOp_AttrCheck(szSpecialOpStr, nEquipIDX) ~= 1 then
				return 0
			end
		end
		
		if szSpecialOpStr ~= "" then
			tAttrSave = SpecialOp_AttrSave(szSpecialOpStr, nEquipIDX)
			if not tAttrSave then
				VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s SpecialOpStr:%s] attrsave fail",
					uShopId, uGoodID, uExchangeID,GetAccount(), GetName(), szSpecialOpStr);
				return 0
			end
		end

--		if 1 == tExchangeInfo.ExchangeFlag.Baoliu then
--			nEquipEnhance				= GetEquipAttr(nEquipIDX, 2);
--			nEquipEnhanceFail			= GetEquipAttr(nEquipIDX, 3);
--
----			if 1 == _JX2WZ then
----				nEquipDing5				= GetItemSpecialAttr(nEquipIDX, "DING5");
--				nEquipDing10			= GetItemSpecialAttr(nEquipIDX, "DING10");
----			end
--
--			--if 1 == _JX2IB then
--				nEquipDing7				= GetItemSpecialAttr(nEquipIDX, "DING7");
--			--end
--		end

		if 1 == tExchangeInfo.ExchangeFlag.Bagua then
			nEquipLingqi				= GetItemMaxLingQi(nEquipIDX);
			if 0 >= nEquipLingqi then
				Talk(1, "", format("[%s] kh«ng ph¶i lµ trang bÞ B¸t Qu¸i.", szItemName));
				return 0
			end
			local nAttribute, _			= GetItemAttr(nEquipIDX, 1);
			if 0 ~= nAttribute then
				Talk(1, "", format("H·y rót Linh Th¹ch trong [%s] mang trªn ng­êi.", szItemName));
				return
			end
		end

		if 1 == GetItemSpecialAttr(nIndex, "LOCK") then
			Talk(1, "", format("§Ó ®¶m b¶o tµi s¶n cña c¸c h¹, h·y më khãa [%s].", szItemName));
			return 0
		end

		tremove(tExchangeInfo.CostItem, 1);
		tExchangeInfo.CostItem.n = nil;
	end

	for _, tCostItem in tExchangeInfo.CostItem do
		if 0 < tCostItem[4] then
			local nCount	= GetItemCount(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[5] or 0);
			if tCostItem[4] > nCount then
				local szItemName = GetItemName(tCostItem[1], tCostItem[2], tCostItem[3]);
				Talk(1, "", format("C¸c h¹ mang theo [%s] kh«ng ®ñ %u, kh«ng thÓ ®æi [%s].", szItemName, tCostItem[4], tGoodInfo.Name));
				return 0
			end
		end
	end

	-- ¿Û³ýÊý¾Ý -----------------------------------------------
	-- ¿Û³ýÎïÆ·
	if 0 ~= nEquipIDX then
		local nRet = DelItemByIndex(nEquipIDX, -1);
		local tExchangeInfo2	= GetEquipShopExchangeData(uExchangeID);
		local tEquipInfo2						= tExchangeInfo2.CostItem[1];
		local szItemName2				= GetItemName(tEquipInfo2[1], tEquipInfo2[2], tEquipInfo2[3]);
		VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostEquip:%d %s(%d,%d,%d,%d)][Ret:%d][Enhance:%d][Ding7:%d]",uShopId , uGoodID, uExchangeID
			, nEquipPos, szItemName2, tEquipInfo2[1], tEquipInfo2[2], tEquipInfo2[3], tEquipInfo2[4]
			, nRet, nEquipEnhance, nEquipDing7));
		if 1 ~= nRet then return 0 end
	end

	for _, tCostItem in tExchangeInfo.CostItem do
		if 0 < tCostItem[4] then
			local nRet = DelItem(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4], tCostItem[5] or 0);
			local szItemName = GetItemName(tCostItem[1], tCostItem[2], tCostItem[3]);
			VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostItem:%s(%d,%d,%d,%d,%d)][Ret:%d]", uShopId, uGoodID, uExchangeID, szItemName, tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4], tCostItem[5] or 0, nRet));
			if 1 ~= nRet then return 0 end
		end
	end

	-- ¿Û³ý½ðÇ®
	for _, tCostMoney in tExchangeInfo.CostMoney do
    	if tCostMoney[1] ~= 0 then
    		local nRet = PayVMoney(tCostMoney[1], tCostMoney[2])
    		--local nRet = Pay(tExchangeInfo.CostCoin);
    		VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostMoney:%d %d][Ret:%d]", uShopId, uGoodID, uExchangeID, tCostMoney[1], tCostMoney[2], nRet));
    		if 1 ~= nRet then return 0 end
    	end
	end

	-- ¿Û³ý±äÁ¿
	for _, tCostTask in tExchangeInfo.CostTask do
		if 0 < tCostTask[1] then
			local nTaskValue	= GetTask(tCostTask[1]);
			SetTask(tCostTask[1], nTaskValue - tCostTask[2]);
			local nNewTaskValue	= GetTask(tCostTask[1]);
			VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostTask:%d,%d,%d][Ret:%d]", uShopId, uGoodID, uExchangeID, tCostTask[1], nTaskValue, nNewTaskValue, 1));
		end
	end

	--------------------------------
	-- °ËØÔ×°±¸´¦Àí
	local nEquipG	= 0;
	if nEquipG == tGoodInfo.AwardItem[1] and 0 >= nEquipLingqi then
		local nID	= get_gdp_id(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3]);
		for _, id in g_tBaguaItem do
			if id == nID then
				nEquipLingqi						= 120;
				tExchangeInfo.ExchangeFlag.Bagua	= 1;
				break;
			end
		end
	end
	-- °ËØÔ×°±¸´¦Àí
	--------------------------------

	-- ¸ø¶«Î÷ -----------------------------------------------
	local nParam		= ((1 == tExchangeInfo.ExchangeFlag.Bangding)	and 4) or 1;
	local nAttribute	= ((1 == tExchangeInfo.ExchangeFlag.Bagua)		and 0) or -1;
	local nItemIDX		= 0;
	local bIBFlag		= 0;

	--------------------------------
	-- Íâ×°´¦Àí ¼° ÓÐÄÍ¾Ã¶ÈµÄ´ì±ÈµÀ¾ß¡¾200¡¿
	local nCoatG		= 0;
	local tCoatD		= {108, 109, 110, 111, 200};
	if nCoatG == tGoodInfo.AwardItem[1] then
		for _, nD in tCoatD do
			if nD == tGoodInfo.AwardItem[2] then
				bIBFlag		= 1;	-- IB±êÊ¶
				nAttribute	= 0;	-- ÎÞÊôÐÔ
				break;
			end
		end
	end
	-- Íâ×°´¦Àí ¼° ÓÐÄÍ¾Ã¶ÈµÄ´ì±ÈµÀ¾ß¡¾200¡¿
	--------------------------------
	for i = 1, tGoodInfo.AwardItem[4] do
    	if 0 == tGoodInfo.AwardItem[1] then
    		_, nItemIDX = AddItem(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], 1, nParam, nAttribute, nAttribute, nAttribute, nAttribute, nAttribute, nAttribute);
    	else
    		_, nItemIDX = AddItem(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], 1, nParam);
    	end
    --	WriteLog(format("[EquipShop:%d,%d][AwardItem:%d,%d,%d,%d,%d][ItemIDX:%d][Enhance:%d][EnhanceFail:%d][Ding5:%d][Ding7:%d][Ding10:%d][Lingqi:%d]",
    --	uGoodID, uExchangeID,
    --	tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], tGoodInfo.AwardItem[4], nParam,
    --	nItemIDX, nEquipEnhance, nEquipEnhanceFail, nEquipDing5, nEquipDing7, nEquipDing10, nEquipLingqi));
    
    	if 0 >= nItemIDX then return 0 end
    	
    	--ÉèÖÃÎïÆ·µÄ¹ýÆÚÊ±¼ä
    	local nExpireTime = tGoodInfo.TimeLimitSec or 0;
    	if nExpireTime > 0 then
    		SetItemExpireTime(nItemIDX, nExpireTime);
    	end
    	
    	local szItemName = GetItemName(nItemIDX);
    	VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][AwardItem:%s(%d,%d,%d,%d/%d,%d)][ItemIDX:%d][Enhance:%d][Ding7:%d][Lingqi:%d][ItemExpireTimeSecond:%d]",
    	uShopId, uGoodID, uExchangeID,
    	szItemName,tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], i, tGoodInfo.AwardItem[4], nParam,
    	nItemIDX, nEquipEnhance, nEquipDing7, nEquipLingqi, nExpireTime));

		if szSpecialOpStr ~= "" then
			local nR = SpecialOp_AttrRestore(szSpecialOpStr, nItemIDX, tAttrSave)
			if nR ~= 1 then
				VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s SpecialOpStr:%s] attrrestore fail",
					uShopId, uGoodID, uExchangeID,GetAccount(), GetName(), szSpecialOpStr);
				return 0
			end
		end
--    	if 1 == tExchangeInfo.ExchangeFlag.Baoliu then
--    		if 0 < nEquipEnhance		then
--    			SetItemEnhance(nItemIDX, nEquipEnhance);
--    		end
--    
--    --		if 0 < nEquipEnhanceFail	then
--    --			SetItemEnhanceFailedNum(nItemIDX, nEquipEnhanceFail);
--    --		end
--    
--    --		if 1 == _JX2WZ then
--    --			if 0 < nEquipDing5			then
--    --				SetItemSpecialAttr(nItemIDX, "DING5", 1);
--    --			end
--    --
--   				if 0 < nEquipDing10			then
--    				SetItemSpecialAttr(nItemIDX, "DING10", 1);
--    			end
--    --		end
--    
--    		--if 1 == _JX2IB then
--    			if 0 < nEquipDing7			then
--    				SetItemSpecialAttr(nItemIDX, "DING7", 1);
--    			end
--    		--end
--    	end
    
    	if 1 == tExchangeInfo.ExchangeFlag.Bagua then
    		if 0 < nEquipLingqi			then
    			SetItemMaxLingQi(nItemIDX, nEquipLingqi);
    		end
    	end
    
    	if 1 == bIBFlag then
    		SetItemStatus(nItemIDX, 1, 1);
    	end
    
    	SyncItem2Client(nItemIDX);
  
	end
	
    if 0 < tGoodInfo.AwardTimes[1] then
		local nTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		SetTask(tGoodInfo.AwardTimes[1], nTaskValue + 1);
		local nNewTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		VET_WriteEquipShopLog(format("[EquipShop:%d,%d][AwardTimes:%d,%d,%d][Ret:%d]", uGoodID, uExchangeID, tGoodInfo.AwardTimes[1], nTaskValue, nNewTaskValue, 1));
	end
	
	return 1
end

function OnExchange(uShopId, uGoodID, uExchangeID, uBatchNum)
	-- »ñÈ¡Êý¾Ý -----------------------------------------------
	if not uGoodID			or 0 >= uGoodID		then return end
	if not uExchangeID		or 0 >= uExchangeID	then return end

	local tGoodInfo		= GetEquipShopGoodData(uGoodID);
	local tExchangeInfo	= GetEquipShopExchangeData(uExchangeID);
	if not tGoodInfo		or 'table' ~= type(tGoodInfo)		or uGoodID		~= tGoodInfo.ID		then return end
	if not tExchangeInfo	or 'table' ~= type(tExchangeInfo)	or uExchangeID	~= tExchangeInfo.ID	then return end

	local bCheckExchangeIDVaild		= 0;
	for _, uID in tGoodInfo.ExchangeData do
		if uID == uExchangeID then
			bCheckExchangeIDVaild	= 1;
			break;
		end
	end
	if 1 ~= bCheckExchangeIDVaild then return end

	-- ¼ì²éÊý¾Ý -----------------------------------------------

	-- ¼ì²éÏä×Ó
	if 1 == IsBoxLocking() then
		Talk(1, "", format("§Ó ®¶m b¶o tµi s¶n cña c¸c h¹, h·y më khãa kho tr­íc ®i."));
		return
	end
	
	local nRealExchgCnt = 0;
	local bBreak = 0
	
	VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s] log begin",
		uShopId, uGoodID, uExchangeID,GetAccount(), GetName());
	for i = 1, uBatchNum do
		local suc = _DoOneExchange(tGoodInfo, tExchangeInfo, uShopId, uGoodID, uExchangeID)
		if suc and 1 == suc  then
			nRealExchgCnt = nRealExchgCnt + 1
			
			--Í³¼Æ
			VET_EquipShopStatic(uShopId, uGoodID, uExchangeID);
		--	tGoodInfo.StatKey		= tGoodInfo.StatKey 	or "";
		--	tExchangeInfo.StatKey	= tExchangeInfo.StatKey	or "";
		--	if "" ~= tGoodInfo.StatKey or "" ~= tExchangeInfo.StatKey then
		--		--AddStatValue(format("%s%s", tGoodInfo.StatKey, tExchangeInfo.StatKey), 1);
		--	end
		else
			break
		end
	end --for nRealExchgCnt=0,uBatchNum
	
	if nRealExchgCnt >= 1 then
		if uBatchNum > 1 then
			Msg2Player(format("Ng­¬i thµnh c«ng hoµn thµnh [%d/%d] lÇn ®æi nhËn ®­îc [%s]x%d", nRealExchgCnt, uBatchNum, tGoodInfo.Name, nRealExchgCnt*tGoodInfo.AwardItem[4]));
		else
			Msg2Player(format("C¸c h¹ nhËn ®­îc [%s]x%d", tGoodInfo.Name, tGoodInfo.AwardItem[4]));
		end

		if 1 == tGoodInfo.GlobalMsg then
			Msg2Global(format("Chóc mõng [%s] ®· nhËn ®­îc [%s]x%d ", GetName(), tGoodInfo.Name, nRealExchgCnt*tGoodInfo.AwardItem[4]));
		end
	end
end

function VET_WriteEquipShopLog(strFormat, ...)
	local strLogPath = "logs/equip_shop/"
	local strLog = format(strFormat, unpack(arg));
	local strDate = date("%Y_%m_%d");
	local strLogFile = format("equipshoplog_%s.log", strDate);
	local strLogFilePath = format("%s%s",strLogPath, strLogFile);

	local hFile = openfile(strLogFilePath, "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", strLogPath));
		hFile = openfile(strLogFilePath, "a+");
	end
	if (hFile ~= nil) then
		write (hFile, strLog .. "\n");
		closefile (hFile);
	end
end

--some special operation
--function Special_Op_Check(szOpStr, nItemIdx)
--end

--some condition check
function SpecialOp_AttrCheck(szOpStr, nOldItemIdx)
	if not szOpStr or not nOldItemIdx then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[1] then
			return t[1](nOldItemIdx)
		else
			return 1
		end
	end
	return 0
end

--save some attrs of old item
function SpecialOp_AttrSave(szOpStr, nOldItemIdx)
	if not szOpStr or not nOldItemIdx then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[2] then
			return t[2](nOldItemIdx)
		else
			return 1
		end
	end
end

--set some attrs to new items
function SpecialOp_AttrRestore(szOpStr, nNewItemIdx, tSave)
	if not szOpStr or not nNewItemIdx or not tSave then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[3] then
			return t[3](nNewItemIdx, tSave)
		else
			return 1
		end
		
	end
end

function _specialop_attrcheck_reduce_enhance(nOldItemIdx)
	local nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
	if nEquipEnhance >= 13 then
		return 1
	else
		Msg2Player("CÊp c­êng hãa trang bÞ ch­a ®¹t +13, kh«ng thÓ tiÕn hµnh n©ng cÊp!")
		return 0
	end
end

function _specialop_attrsave_reduce_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_reduce_enhance(nNewItemIdx, tSave)
	local nEnhance = tSave.nEquipEnhance
	local nNewEnhance = 0
	if nEnhance > 0 then
		if nEnhance >= 1 and nEnhance <=13 then
			nNewEnhance = 0
		elseif nEnhance >= 14 and nEnhance <=15 then
			nNewEnhance = 7
		end
		if nNewEnhance > 0 then
			SetItemEnhance(nNewItemIdx, nNewEnhance);
		end
    end
    return 1
end

function __check_enhance_n(nOldItemIdx,nEnhanceLv)
	local nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
	if nEquipEnhance >= nEnhanceLv then
		return 1
	else
		Msg2Player(format("§é c­êng hãa cña trang bÞ kh«ng ®ñ +%d, kh«ng thÓ tham gia th¨ng cÊp!", nEnhanceLv))
		return 0
	end
end
function _specialop_attrcheck_reduce_enhance1(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 1) end
function _specialop_attrcheck_reduce_enhance2(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 2) end
function _specialop_attrcheck_reduce_enhance3(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 3) end
function _specialop_attrcheck_reduce_enhance4(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 4) end
function _specialop_attrcheck_reduce_enhance5(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 5) end
function _specialop_attrcheck_reduce_enhance6(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 6) end
function _specialop_attrcheck_reduce_enhance7(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 7) end
function _specialop_attrcheck_reduce_enhance8(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 8) end
function _specialop_attrcheck_reduce_enhance9(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 9) end
function _specialop_attrcheck_reduce_enhance10(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 10) end
function _specialop_attrcheck_reduce_enhance11(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 11) end
function _specialop_attrcheck_reduce_enhance12(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 12) end
function _specialop_attrcheck_reduce_enhance13(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 13) end
function _specialop_attrcheck_reduce_enhance14(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 14) end
function _specialop_attrcheck_reduce_enhance15(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 15) end
function _specialop_attrsave_none(nOldItemIdx)	return 1 end
function _specialop_attrrestore_none(nNewItemIdx, tSave)	return 1 end

--function _specialop_attrsave_reduce_enhance14(nOldItemIdx)
--	return _specialop_attrsave_reduce_enhance(nOldItemIdx)
--end
--function _specialop_attrrestore_reduce_enhance14(nNewItemIdx, tSave)
--	--Ç¿»¯¶È±äÎª0£¬²»±£Áô¶¨»êÐ§¹û
--    return 1
--end

function _specialop_attrsave_save_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_save_enhance(nNewItemIdx, tSave)
	if 0 < tSave.nEquipEnhance then
    	SetItemEnhance(nNewItemIdx, tSave.nEquipEnhance);
    end
    if 0 < tSave.nEquipDing10 then
    	SetItemSpecialAttr(nNewItemIdx, "DING10", 1);
    end
    if 0 < tSave.nEquipDing7 then
    	SetItemSpecialAttr(nNewItemIdx, "DING7", 1);
    end
    return 1
end

function _specialop_attrsave_half_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_half_enhance(nNewItemIdx, tSave)
	local nEnhance = floor(tSave.nEquipEnhance / 2)
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
end
function _specialop_attrsave_enhance_reduce_3(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_enhance_reduce_3(nNewItemIdx, tSave)
	local nEnhance = tSave.nEquipEnhance - 3
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
end



--this table must at end of file
T_OPSTR_2_FUNC = {
	--{check_func, save_func, restore_func}
	["reduce_enhance"] = {_specialop_attrcheck_reduce_enhance, _specialop_attrsave_reduce_enhance, _specialop_attrrestore_reduce_enhance},
	["reduce_enhance1"] = {_specialop_attrcheck_reduce_enhance1, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance2"] = {_specialop_attrcheck_reduce_enhance2, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance3"] = {_specialop_attrcheck_reduce_enhance3, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance4"] = {_specialop_attrcheck_reduce_enhance4, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance5"] = {_specialop_attrcheck_reduce_enhance5, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance6"] = {_specialop_attrcheck_reduce_enhance6, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance7"] = {_specialop_attrcheck_reduce_enhance7, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance8"] = {_specialop_attrcheck_reduce_enhance8, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance9"] = {_specialop_attrcheck_reduce_enhance9, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance10"] = {_specialop_attrcheck_reduce_enhance10, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance11"] = {_specialop_attrcheck_reduce_enhance11, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance12"] = {_specialop_attrcheck_reduce_enhance12, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance13"] = {_specialop_attrcheck_reduce_enhance13, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance14"] = {_specialop_attrcheck_reduce_enhance14, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance15"] = {_specialop_attrcheck_reduce_enhance15, _specialop_attrsave_none, _specialop_attrrestore_none},
	["save_enhance"] = {nil, _specialop_attrsave_save_enhance, _specialop_attrrestore_save_enhance},
	["half_enhance"] = {nil, _specialop_attrsave_half_enhance, _specialop_attrrestore_half_enhance},
	["enhance_reduce_3"] = {nil, _specialop_attrsave_enhance_reduce_3, _specialop_attrrestore_enhance_reduce_3},
}

--ÉÌ¶Ó¶Ò»»Í³¼Æ
function VET_EquipShopStatic(uShopId, uGoodID, uExchangeID)
	--¶Ò»»µÄÊÇÄÄÒ»ÀàÎïÆ·
	if uGoodID == 30735 then
		AddRuntimeStat(7, 34, 0, 1);
	elseif uGoodID == 30736 then
		AddRuntimeStat(7, 35, 0, 1);
	elseif uGoodID == 30737 then
		AddRuntimeStat(7, 36, 0, 1);
	elseif uGoodID == 30738 then
		AddRuntimeStat(7, 37, 0, 1);
	elseif uGoodID == 30739 then
		AddRuntimeStat(7, 38, 0, 1);
	elseif uGoodID == 30740 then
		AddRuntimeStat(7, 39, 0, 1);
	elseif uGoodID == 30741 then
		AddRuntimeStat(7, 40, 0, 1);
	elseif uGoodID == 30742 then
		AddRuntimeStat(7, 41, 0, 1);
	elseif uGoodID == 30743 then
		AddRuntimeStat(7, 42, 0, 1);
	elseif uGoodID == 30744 then
		AddRuntimeStat(7, 43, 0, 1);
	elseif uGoodID >= 30745 and uGoodID <= 30784 then
		AddRuntimeStat(7, 44, 0, 1);
	elseif uGoodID >= 30785 and uGoodID <= 30789 then
		AddRuntimeStat(7, 45, 0, 1);
	elseif uGoodID == 30790 then
		AddRuntimeStat(7, 46, 0, 1);
	elseif uGoodID == 31336 then
		AddRuntimeStat(24, 1, 0, 1);
	elseif uGoodID == 31337 then
 		AddRuntimeStat(24, 2, 0, 1); 
	elseif uGoodID >= 31339 and uGoodID <= 31355 then
		AddRuntimeStat(24, 3, 0, 1);
	end
end