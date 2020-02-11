
function OnUse(nItemIdx)
	local selTab = {
			"§ång ý/#confirm("..nItemIdx..")",
			"Ta suy nghÜ l¹i!/nothing",
			}
	Say("B¹n muèn bá <color=yellow>360 vµng<color> vµo Tö Kim ®¹i hång bao?",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if Pay(3600000) ~= 1 then
		Talk(1,"","Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		nRetCode = AddItem(2,1,537,1)
		if nRetCode ~= 0 then
			Msg2Player("B¹n bá thµnh c«ng 360 vµng vµo Tö Kim ®¹i hång bao!");
		else
			WriteLog("[Tö Kim ®¹i hång bao]:"..GetName().."Trong lóc ®ãng gãi Tö Kim ®¹i hång bao AddItem bÞ lçi, trÞ ph¶n håi:"..nRetCode);
		end;
	end;
end;

function nothing()

end;