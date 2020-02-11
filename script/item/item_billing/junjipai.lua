function OnUse(nItemIdx)
	local selTab = {
				format("§ång ı/#use(%d)",nItemIdx),
				"Hñy bá",
				}
	Say("Sö dông Qu©n tİch bµi cã thÓ t¨ng <color=yellow>1000<color> ®iÓm tİch lòy.",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(707,GetTask(707)+1000)
		Msg2Player("B¹n sö dông Qu©n tİch bµi, ®iÓm tİch lòy chiÕn trËn t¨ng 1000 ®iÓm");
		WriteLog("[ChiÕn tr­êng Nh¹n M«n Quan]:"..GetName().."Sö dông Qu©n tİch bµi ");
	end;
end;