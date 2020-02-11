Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[9][2],tMoonCake[9][3],tMoonCake[9][4],1) == 1 then
		CastState("state_move_speed_percent_add",20,30*18,1,178000);	--跑动速度提高20%，持续30秒
		Msg2Player("T鑓  di chuy觧 t╪g 20% trong 30 gi﹜");
		Msg2_LeiTai("B竛h Trung Thu S莡 Ri猲g Giang S琻");
	end;
end;