Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[8][2],tMoonCake[8][3],tMoonCake[8][4],1) == 1 then
		CastState("state_burst_enhance_rate",15,30*18,1,156000);	--施展速度提高15%，持续30秒
		Msg2Player("T鑓  thi tri觧 t╪g 15% trong 30 gi﹜");
		Msg2_LeiTai("B竛h Trung Thu Xo礽 Giang S琻");
	end;
end;