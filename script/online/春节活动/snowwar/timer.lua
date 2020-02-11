--Create Date:2006年最后一天
--Describe:０７年春节雪仗Mission计时器脚本
--Author:yanjun
Include("\\script\\online\\春节活动\\snowwar\\snowwar_head.lua");
function OnTimer()
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_READY then
		--SW_ProcessReadyTimer();	--没用
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_FIGHT then
		SW_ProcessFightTimer();
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_COMPLETE then
		SW_ProcessWaitOutTimer();
	end;
end;

