--File name:	feiyan_draw_award.lua
--Describe:		春节活动系统抽奖文件(飞燕仙子)
--Create Date:	2008-12-29
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua")

g_szThisFile = "\\script\\online\\viet_event\\new_year_09\\feiyan_draw_award.lua"

g_tbPlayerNameToday = {}

function main()
	if is_new_year_09_viet_open() == 0 then
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
		ret = ApplyRelayShareData(RELAY_DB_09_NEWYEAR_VIET,0,0,g_szThisFile,"draw_prize_cb")
--		print("\nfeiyan_draw_award : ",ret)
	end
end

function draw_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		return
	end

	local szPlayerName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nRandom = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())
	local nPlayerTableSize = 0
	local i = 1
	local j = 1

	if nCount <= 51 then
		for j = 1, nCount do
			szPlayerName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, j-1)
			if nDateNow - nDateFlag < 86400 then
				nPrizeType = i
				AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, szPlayerName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
--				AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 1, "", "", 0, tostring(nPrizeType), "ds", nDateFlag, szPlayerName)
				if nPrizeType == 1 then
					Msg2Global("H玬 nay nh﹏ v藅  "..szPlayerName.."   tr髇g thng. Xin m阨 n NPC Phi Y課  l躰h thng.")
				end
				i = i + 1
			end
		end
	else
		for j = 1, nCount do
			szPlayerName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, j-1)
			if nDateNow - nDateFlag < 86400 then
				tinsert(g_tbPlayerNameToday,j-1)
			end
		end

		nPlayerTableSize = getn(g_tbPlayerNameToday)
		if nPlayerTableSize <= 0 then
			return
		end

		if nPlayerTableSize <= 51 then
			for j = 1, nPlayerTableSize do
				szPlayerName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, g_tbPlayerNameToday[j])
				nPrizeType = j
				AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, szPlayerName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
--				AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 1, "", "", 0, tostring(nPrizeType), "ds", nDateFlag, szPlayerName)
				if nPrizeType == 1 then
					Msg2Global("H玬 nay nh﹏ v藅  "..szPlayerName.."   tr髇g thng. Xin m阨 n NPC Phi Y課  l躰h thng.")
				end
			end
		else
			for j = 1, 51 do
				nPlayerTableSize = getn(g_tbPlayerNameToday)
				nRandom = random(1,nPlayerTableSize)
				szPlayerName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, g_tbPlayerNameToday[nRandom])
				tremove(g_tbPlayerNameToday,nRandom)
				nPrizeType = j
				AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, szPlayerName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
--				AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 1, "", "", 0, tostring(nPrizeType), "ds", nDateFlag, szPlayerName)
				if nPrizeType == 1 then
					Msg2Global("H玬 nay nh﹏ v藅  "..szPlayerName.."   tr髇g thng. Xin m阨 n NPC Phi Y課  l躰h thng.")
				end
			end
		end
	end

	g_tbPlayerNameToday = nil
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
end

