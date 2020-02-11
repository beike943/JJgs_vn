Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		CastState("state_burst_enhance_rate",30,30*18,1,156000);	--施展速度提高30%，持续30秒
		Msg2Player("T鑓  xu蕋 chi猽 t╪g 30% trong 30 gi﹜");
		Msg2_LeiTai("B竛h Trung Thu Xo礽");
	end;
end;