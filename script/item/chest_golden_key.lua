
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate <= 20080128 then
		Talk(1,"","Ch×a khãa vµng chØ cã thÓ sö dông sau <color=yellow>29.01.2008<color>.");
		return 0;
	end;
	if GetTask(1480) == 1 then
		Talk(1,"","Mçi nh©n vËt chØ cã thÓ sö dông 1 lÇn ch×a khãa vµng.");
		return 0;
	end;
	if GetFightState() == 1 then
		Talk(1,"","D¹ng thøc chiÕn ®Êu kh«ng thÓ sö dông vËt phÈm nµy!");
		return 0;
	end;
	local selTab = {
				"§ång ý/#use("..nItemIdx..")",
				"Hñy bá/nothing",
				}
	Say("B¹n x¸c ®Þnh sö dông <color=yellow>Ch×a khãa vµng<color>?",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nPage = GetStoreBoxPageCount();
		SetStoreBoxPageCount(nPage+1);
		Msg2Player("R­¬ng cña b¹n ®· cã thªm 1 trang");
		SetTask(1480,1);
	end;	
end;

function nothing()

end;