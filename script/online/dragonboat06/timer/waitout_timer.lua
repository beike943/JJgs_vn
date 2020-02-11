--File name:waitout_timer.lua
--Describe:公布成绩后等待离场倒计时脚本
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	StopMissionTimer(MISSION_ID,WAITOUT_TIMER_ID);
	Msg2MSAll(MISSION_ID,"Thi u k誸 th骳, h穣 nhanh ch鉵g r阨 kh醝 b秐 .");
	CloseMission(MISSION_ID);
end;