--create date:2007-07-30 9:32
--author:yanjun
--describe:Ìæ²¹ÇøÐ¡¹ÖËÀÍö½Å±¾
Include("\\script\\missions\\tong_mission\\main_function.lua");
function OnDeath(nNpcIdx)
	local nKillCount = GetMissionV(MV_KILL_SUB_NPC);
	SetMissionV(MV_KILL_SUB_NPC,nKillCount+1);
	if mod(nKillCount+1,50) == 0 then
		Msg2MSAll(MISSION_ID,"HiÖn t¹i ®· tiªu diÖt sè l­îng vÖ b×nh ngo¹i ®­êng ®¹t ®Õn "..(nKillCount+1).."c¸i");
	end;
end;