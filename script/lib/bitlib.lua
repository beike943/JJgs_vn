-- !!! ×¢Òâ, ÓÉÓÚgettaskºÍsettask½Ó¿ÚÏŞÖÆ, ÈÎÎñ±äÁ¿µÚ32Î´²»ÄÜÊ¹ÓÃ

-- getSubBit »ñÈ¡nValueÖĞ´ÓlÎ»¿ªÊ¼µ½hÎ»µÄÊı
-- l = µÍÎ», ´Ó1¿ªÊ¼; h = ¸ßÎ», ´Ó1¿ªÊ¼; Èç¹ûl > h, »á×Ô¶¯»¥»»
-- bDecimal = ½øÖÆ, nil±íÊ¾2½øÖÆ,ÆäËû±íÊ¾ÊäÈëµÄ½øÖÆ
function getSubBit(nValue, l, h, bDecimal)
	if nValue < 0 then
		nValue = 65536 * 65536 - (-nValue);
	end
	if l > h then l, h = h, l end
	local t = bDecimal or 2;
	return mod(floor(nValue/t^(l-1)), t^(h-l+1))
end
-- setSubBit °ÑnValueÖĞ´ÓlÎ»¿ªÊ¼µ½hÎ»µÄÊı¸Ä³ÉnSubValue
-- l = µÍÎ», ´Ó1¿ªÊ¼; h = ¸ßÎ», ´Ó1¿ªÊ¼; Èç¹ûl > h, »á×Ô¶¯»¥»»
-- bDecimal = ½øÖÆ, nil±íÊ¾2½øÖÆ,ÆäËû±íÊ¾ÊäÈëµÄ½øÖÆ
function setSubBit(nValue, l, h, nSubValue, bDecimal)
	if nValue < 0 then
		nValue = 65536 * 65536 - (-nValue);
	end
	if l > h then l, h = h, l end
	local t = bDecimal or 2;
	assert(nSubValue < t^(h-l+1))
	local nOldValue = getSubBit(nValue,l,h,bDecimal);
	nValue = nValue + (nSubValue - nOldValue) * t^(l-1);
	return nValue;
end

TBitFlag = {
	taskId = {},	-- Ê¹ÓÃÄÄĞ©ÈÎÎñ±äÁ¿À´¼ÇÂ¼flag
--	tFlags = {		-- flag×éÖ¯¸ñÊ½
--		1,			-- 	µ¥¸öµÄflag
--		{2, 3},		--	Ò»×éflag
--	}
}
-- ÒÔÏÂ²ÎÊıµÄflagÊÇ1¸öÊı×Ö»òÊı×é, ÓÃÓÚ¼ÇÂ¼±ê¼Ç
function TBitFlag:hasFlag(flag)		-- »ñÈ¡ÊÇ·ñÓĞ¿ÕÓà±ê¼Ç
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == 0 then
			return 1;
		end
	end
	return nil;
end
function TBitFlag:getFreeFlagCount(flag)
	local nFreeFlagCount = 0;
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == 0 then
			nFreeFlagCount = nFreeFlagCount + 1;
		end
	end
	return nFreeFlagCount;
end
function TBitFlag:addFlag(flag, bClear)		-- ÉèÖÃ±ê¼Ç, bClear == 0 Ê±ÎªÇå³ı1¸ö±ê¼Ç
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	local nClear = 0;
	if bClear then
		nClear = 1;
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == nClear then
			self:setFlagBit(flag[i], bClear);
			return 1;
		end
	end
	gf_Warning(format("[TBitFlag:addFlag] [ERROR] [Role:%s Acc:%s] [kh«ng cã vŞ trİ phèi hîp]", GetName(), GetAccount()));
end
function TBitFlag:clearFlag(flag)	-- Çå³ı±ê¼Ç
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == 0 then
			self:setFlagBit(flag[i], 0);
		end
	end
end
function TBitFlag:getFlagBit(nBit)
	nBit = nBit - 1;
	local nRealTask = floor(nBit / 31);
	local nTaskId = self.taskId[nRealTask + 1];
	if not nTaskId then
		gf_Error("!!!!!!!!! Lçi biÕn l­îng nhiÖm vô !!!!!!!!!!!!");
		return
	elseif nTaskId == 0 then
		gf_Error("!!!!!!!!! Thö sö dông TASKiD=0 !!!!!!!!!!!!");
		return
	end
	local nRealBit = mod(nBit, 31) + 1;
	local nValue = GetTask(nTaskId)
	return GetBit(nValue, nRealBit);
end
function TBitFlag:setFlagBit(nBit, nVal)
	nBit = nBit - 1;
	local nRealTask = floor(nBit / 31);
	local nTaskId = self.taskId[nRealTask + 1];
	if not nTaskId then
		gf_Error("!!!!!!!!! Lçi biÕn l­îng nhiÖm vô !!!!!!!!!!!!");
		return
	elseif nTaskId == 0 then
		gf_Error("!!!!!!!!! Thö sö dông TASKiD=0 !!!!!!!!!!!!");
		return
	end
	local nRealBit = mod(nBit, 31) + 1;
	local nValue = GetTask(nTaskId)
	if nVal == 0 then
		nValue = SetBit(nValue, nRealBit, 0);
	else
		nValue = SetBit(nValue, nRealBit, 1);
	end
	SetTask(nTaskId, nValue);
end
gf_Warning = gf_Warning or print
