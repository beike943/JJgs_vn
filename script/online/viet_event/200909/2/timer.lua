--=============================================
--create by baiyun 2009.8.31
--describe:越南版9月份中秋活动走军灯笼定时器函数文件
--=============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_functions.lua");
function OnTimer()
	for i=1,getn(TB_EVEN_PROC) do
		if GetMissionV(MV_MISSION_STATE) == TB_EVEN_PROC[i][1] then
			TB_EVEN_PROC[i][2]();
			return 1;
		end;
	end;
end;
--============================================================================
--关联不同状态对应的处理函数
TB_EVEN_PROC = 
{
	[1] = {MS_STATE_IDEL,do_nothing},
	[2] = {MS_STATE_READY,MS_ProcessReadyTimer},
	[3] = {MS_STATE_STARTED,MS_ProcessStartedTimer},
	[4] = {MS_STATE_ENDING,MS_ProcessEndingTimer},
}
--一个什么都不做的空函数
function do_nothing()
	return 1;
end;
