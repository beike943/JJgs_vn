-- ±ÈÎä´ó»á»Øµ÷Ïà¹Ø½Å±¾

function OnArrive(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRank(szKey, nKey1, nKey2, 1)
	else
		BuildBWRank(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function OnArriveInfo(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRankInfo(szKey, nKey1, nKey2, 1)
	else
		BuildBWRankInfo(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function SyncZgPoint(nPoint)
	local nBodyPoint = GetTask(662)
	local nDiff = nPoint - nBodyPoint
	if nDiff > 0 then
		SetTask(662, nPoint, 21)
		Msg2Player("§iÓm t­ c¸ch ®¹i héi tû vâ cña b¹n ®· t¨ng lªn "..nDiff.." ®iÓm, ®iÓm t­ c¸ch hiÖn t¹i lµ "..nPoint.." Phót ")
	end
	WriteLog("[§¹i héi tû vâ] event=CËp nhËt ®iÓm t­ c¸ch name="..GetName().." "..nBodyPoint.." "..nPoint)
end