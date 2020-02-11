
function OnUse(nItemIdx)
	local selTab = {
			"§ång ý/#confirm("..nItemIdx..")",
			"Ta suy nghÜ l¹i!/nothing",
			}
	Say("B¹n muèn ®Æt <color=yellow>999 l­îng<color> vµo trong bao l× x× hoµng kim?",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if Pay(9990000) ~= 1 then
		Talk(1,"","Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		nRetCode = AddItem(2,1,539,1)
		if nRetCode ~= 0 then
			Msg2Player("B¹n thµnh c«ng bá 999 l­îng vµo bao l× x× hoµng kim");
			AddRuntimeStat(14, 3, 0, 1)
			WriteLog(GetName().."GhÐp thµnh 1".."§¹i hång bao hoµng kim");
		else
			WriteLog("[Bao l× x× hoµng kim]:"..GetName().."§ãng gãi bao l× x× hoµng kim AddItem b¸o lçi, trÞ ph¶n håi:"..nRetCode);
		end;
	end;
end;

function nothing()

end;