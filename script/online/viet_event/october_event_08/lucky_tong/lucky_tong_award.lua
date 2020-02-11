--File name:	lucky_tong_award.lua
--Describe:		十月活动系统抽奖文件(幸运帮会)
--Create Date:	2008-09-27
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\october_event_08\\oct_event_head.lua");

g_szThisFile = "\\script\\online\\viet_event\\october_event_08\\lucky_tong\\lucky_tong_award.lua"

function main()
	if is_oct_event_viet_open() == 0 then
		return
	end
	
	SubWorld = SubWorldID2Idx(300)
	if SubWorld >= 0 then
		local ret = nil
		PlayerIndex = 1
		for i=1,100 do
			local lv = GetLevel()
			if lv ~= nil and lv > 0 then
				break
			end
			PlayerIndex = PlayerIndex + 1
		end
		ret = ApplyRelayShareData(RELAY_DB_08_OCT_EVENT_VIET,0,0,g_szThisFile,"draw_prize_cb")
		print("lucky_tong_event award:",ret)
	end
end

function draw_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		return
	end

	local szTongName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nRandom = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())
	local tbTongNameToday = {}
	local nTongTableSize = 0
	local i = 1
	local j = 1

	if nCount <= 3 then
		for j = 1, nCount do
			szTongName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, j-1)
			if nDateNow - nDateFlag < 68400  then
				nPrizeType = i
				AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 0, "", "", 0, szTongName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
				AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 1, "", "", 0, tostring(nPrizeType), "ds", nDateFlag, szTongName)
				WriteLogEx("Hoat Dong Thang 10","tr髇g gi秈 "..nPrizeType,"","","",szTongName)
				i = i + 1
			end
		end
	else
		for j = 1, nCount do
			szTongName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, j-1)
			if nDateNow - nDateFlag < 68400  then
				tinsert(tbTongNameToday,j-1)
			end
		end

		nTongTableSize = getn(tbTongNameToday)
		if nTongTableSize <= 0 then
			return
		end
		
		if nTongTableSize <= 3 then
			for j = 1, nTongTableSize do
				szTongName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, tbTongNameToday[j])
				nPrizeType = i
				AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 0, "", "", 0, szTongName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
				AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 1, "", "", 0, tostring(nPrizeType), "ds", nDateFlag, szTongName)
				WriteLogEx("Hoat Dong Thang 10","tr髇g gi秈 "..nPrizeType,"","","",szTongName)
				i = i + 1
			end
		else
			for j = 1, 3 do
				nTongTableSize = getn(tbTongNameToday)
				nRandom = random(1,nTongTableSize)
				szTongName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, tbTongNameToday[nRandom])
				tremove(tbTongNameToday,nRandom)
				nPrizeType = i
				AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 0, "", "", 0, szTongName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
				AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 1, "", "", 0, tostring(nPrizeType), "ds", nDateFlag, szTongName)
				WriteLogEx("Hoat Dong Thang 10","tr髇g gi秈 "..nPrizeType,"","","",szTongName)
				i = i + 1
			end
		end
	end

	DelRelayShareDataCopy(szKey,nKey1,nKey2)
end

