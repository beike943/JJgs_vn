-- Ãû²¶Ö°Îñ

Include("\\script\\online\\zgc_public_fun.lua")

tCityName =
{
	[300] = "Thµnh §«",
	[100] = "TuyÒn Ch©u",
	[350] = "T­¬ng D­¬ng",
}

tMapTitleID =
{
	[300] = {51, 4},
	[100] = {51, 8},
	[350] = {51, 12},
}

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	if tMapTitleID[nItemMapID] == nil then
		Talk(1,"","<color=red>Sö dông script [C«ng thµnh chiÕn] bæ nhiÖm danh bé lçi! Xin h·y b¸o l¹i cho nhµ ph¸t hµnh!!<color>")
		return
	end
	local nMapID = GetWorldPos()
	if nItemMapID ~= nMapID then
		Say("ChØ ë "..tCityName[nItemMapID].." míi sö dông vËt phÈm nµy ", 0)
		return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
	local szTongName = GetCityWarInfo(nItemMapID, "base")
	if szTongName == nil or szTongName == "" then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
		return
	end
	if nJoinTime <= 604800 then
		Say("§¹i hiÖp kh«ng thÓ bæ nhiÖm thµnh danh bé, xin h·y x¸c nhËn ®· gia nhËp vµo  "..szTongName.." 7 ngµy trë lªn", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 25) == 0 then		-- Õâ¸öÅÐ¶ÏÒªÏÈ×ö
		return
	end
	local nRet = SetCityWarPlayerDuty(nItemMapID, 2)
	if nRet == -1 then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
	elseif nRet == 1 then
		local nCount = GetCityWarInfo(nItemMapID, "fighter")
		if nCount >= 4 then
			Say("C¸c h¹ kh«ng thÓ bæ nhiÖm thµnh danh bé, "..szTongName.."§· cã ®ñ 4 vÞ danh bé råi", 0)
		else
			Say("C¸c h¹ kh«ng thÓ bæ nhiÖm thµnh danh bé, xin h·y x¸c nhËn vÉn ch­a ®¶m nhiÖm c¸c chøc vô kh¸c", 0)
		end
	elseif nRet == 0 then
		if DelItem(2,1,1205,1) == 1 then
			-- °Ñ¶àÓàµÄÆ¸ÊéÉ¾³ýµô
			local n = BigGetItemCount(2,1,1204)
			if n > 0 then
				BigDelItem(2,1,1204,n)
			end
			
			n = BigGetItemCount(2,1,1205)
			if n > 0 then
				BigDelItem(2,1,1205,n)
			end

			AddItem(2,1,1211,25,1)					-- ³É¶¼ËÑ²¶Áî
			AddTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			SetCurTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			Say("b¹n ®­îc bæ nhiÖm lµ "..tCityName[nItemMapID].." danh bé. \n<color=red>Chó ý:  Danh hiÖu danh bé ph¶i kÝch ho¹t míi cã chøc n¨ng cña danh bé.<color>", 0)
			SendTongMessage(GetName().."Sö dông danh bé tiÕn cö th­ trë thµnh danh bé.")
			WriteLog("C«ng thµnh chiÕn-Qu¶n lý:"..szTongName.."-"..GetName().." trë thµnh "..tCityName[nItemMapID].."Danh bé")
			SaveNow()
		end
	end
end

function no_say()
end