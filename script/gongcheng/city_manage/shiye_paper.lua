-- ¾üÊ¦Ö°Îñ

tCityName =
{
	[300] = "Thµnh §«",
	[100] = "TuyÒn Ch©u",
	[350] = "T­¬ng D­¬ng",
}

tMapTitleID =
{
	[300] = {51, 3},
	[100] = {51, 7},
	[350] = {51, 11},
}

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	if tMapTitleID[nItemMapID] == nil then
		Talk(1,"","<color=red>Sö dông script [C«ng thµnh chiÕn] bæ nhiÖm qu©n s­ lçi! Xin h·y b¸o l¹i cho nhµ ph¸t hµnh!!<color>")
		return
	end
	local nMapID = GetWorldPos()
	if nItemMapID ~= nMapID then
		Say("ChØ ë "..tCityName[nItemMapID].." míi sö dông vËt phÈm nµy ", 0)
		return
	end
	local szTongName = GetCityWarInfo(nItemMapID, "base")
	if szTongName == nil or szTongName == "" then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
		return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 604800 then
		Say("Ng­¬i kh«ng thÓ bæ nhiÖm thµnh qu©n s­, xin h·y x¸c nhËn ®· gia nhËp  "..szTongName.." 7 ngµy trë lªn", 0)
		return
	end

	local nRet = SetCityWarPlayerDuty(nItemMapID, 1)
	if nRet == -1 then
		Say("Thµnh nµy hiÖn ch­a cã bang héi chiÕm lÜnh", 0)
	elseif nRet == 1 then
		local nCount = GetCityWarInfo(nItemMapID, "manager")
		if nCount >= 1 then
			Say("Ng­¬i kh«ng thÓ bæ nhiÖm thµnh qu©n s­, xin h·y x¸c nhËn ®· gia nhËp "..szTongName.."§· tån t¹i 1 vÞ qu©n s­ råi.", 0)
		else
			Say("§¹i hiÖp kh«ng thÓ bæ nhiÖm thµnh qu©n s­, h·y x¸c nhËn ch­a ®¶m nhiÖm chøc vô kh¸c", 0)
		end
	elseif nRet == 0 then
		if DelItem(2,1,1204,1) == 1 then
			-- °Ñ¶àÓàµÄÆ¸ÊéÉ¾³ýµô
			local n = BigGetItemCount(2,1,1204)
			if n > 0 then
				BigDelItem(2,1,1204,n)
			end
			
			n = BigGetItemCount(2,1,1205)
			if n > 0 then
				BigDelItem(2,1,1205,n)
			end
			
			AddTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			SetCurTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			Say("b¹n ®­îc bæ nhiÖm lµ "..tCityName[nItemMapID].."Qu©n s­", 0)
			SetTask(2546, 1);--ÉèÖÃ¾üÊ¦ÁìÈ¡½±ÀøµÄ±ê¼Ç
			SendTongMessage(GetName().."Sö dông qu©n s­ tiÕn cö trë thµnh qu©n s­.")
			WriteLog("C«ng thµnh chiÕn-Qu¶n lý:"..szTongName.."-"..GetName().." trë thµnh "..tCityName[nItemMapID].."Qu©n s­")
			SaveNow()
		end
	end
end

function no_say()
end