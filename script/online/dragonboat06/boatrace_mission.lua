--File name:boatrace_mission.lua
--Describe:ÁúÖÛÈümission½Å±¾
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function InitMission()
	SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSIGNUP);
	StartMissionTimer(MISSION_ID,READY_TIMER_ID,READY_TIME);
	SetMissionV(MV_TIMELEFT,READY_TIMER_LOOP);
	local GameID = tonumber(date("%d%H%M%S"));
	SetMissionV(MV_GAMEID,GameID);
	Write_Log("§ua thuyÒn Rång tÕt §oan Ngä","Cuéc thi b¾t ®Çu"..GameID);
end;

function RunMission()
	StopMissionTimer(MISSION_ID,WAITSTART_TIMER_ID);
	StartMissionTimer(MISSION_ID,MATCH_TIMER_ID,MATCH_TIME);
	SetMissionV(MV_ROOMSTATE,MS_STATE_STARTED);
	SetMissionV(MV_TIMELEFT,MATCH_TIMER_LOOP);
	SetMissionV(MV_GAMELOOP,GetGameLoop());
	Msg2MSAll(MISSION_ID,"Cuéc thi chÝnh thøc b¾t ®Çu, c¸c vÞ h·y cè g¾ng lªn. Chó ý: Trong lóc thi ®Êu nÕu tho¸t ra sÏ kh«ng ®­îc tÝnh thµnh tÝch thi ®Êu.");	
end;

function EndMission()
	local TotalPlayerNum = GetMSPlayerCount(MISSION_ID,CAMP_ALL);
	local IDTab = {};
	local msidx,sidx;
	--ÕâÀï¶ÔMissionÀïÃæµÄÍæ¼ÒµÄ²Ù×÷Òª·ÖÁ½²½À´½øÐÐ¡£
	--µÚÒ»²½ÊÇÏÈÓÃÒ»¸öÊý×éÀ´±£´æMissionÀïÃæËùÓÐÍæ¼ÒµÄË÷Òý¡£
	--µÚ¶þ²½Õë¶ÔÃ¿Ò»¸öÍæ¼Ò½ø×÷²Ù×÷¡£
	if TotalPlayerNum ~= 0 then
		msidx = 0;
		for i=1,TotalPlayerNum do
			msidx,sidx = GetNextPlayer(MISSION_ID,msidx,CAMP_ALL);
			if sidx > 0 then
				IDTab[i] = sidx;
			end
		end
		if TotalPlayerNum ~= getn(IDTab) then
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Trong EndMission, tÊt c¶ ng­êi ch¬i b¸o lçi.");
		end;
		for i=1,getn(IDTab) do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				DelMSPlayer(MISSION_ID,CAMP_ALL);
			end;
		end
	end;
	SetMissionV(MV_ROOMSTATE,MS_STATE_IDLE);
	SetMissionV(MV_ENTERORDER,0);
	SetMissionV(MV_COMPLETENUM,0);
	SetMissionV(MV_TIMELEFT,0);
	Write_Log("§ua thuyÒn Rång tÕt §oan Ngä","TrËn ®Êu kÕt thóc"..GetMissionV(MV_GAMEID));
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	if GetTask(FINISHTIME) ~= 999999999 then	--Èç¹ûÊÇÍê³É±ÈÈüµÄÈËÍË³öÁË
		if GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
			Write_Log("Ho¹t ®éng tÕt §oan Ngä","Ng­êi ch¬i"..GetName().."sau khi c¸n ®Ých kh«ng chê th«ng b¸o thµnh tÝch ®· tho¸t khái cuéc thi");
			SetMissionV(MV_COMPLETENUM,GetMissionV(MV_COMPLETENUM)-1);
		end;
	end;
	local status = GetTask(STATUS);
	if status == CAMP_AUDIENCE then
		Restore_Audience_State();
	elseif status == CAMP_PLAYER then
		Restore_Player_State();
	else
		Write_Log("Ho¹t ®éng tÕt §oan Ngä",GetName().."Khi rêi khái tr­êng ®Êu tr¹ng th¸i ph¸t sinh sai sãt, STATUS lµ"..status);
	end;
	local MapID = GetWorldPos();
	SetMapTaskTemp(MapID,1,0);
	local MapIndex = floor(MapID/1000);
	if MapIndex == 1 then
		MapIndex = 3;
	elseif MapIndex == 3 then
		MapIndex = 1;
	end;
	NewWorld(LeavePoint[MapIndex][1],LeavePoint[MapIndex][2],LeavePoint[MapIndex][3]);
end;

function JoinMission(RoleIndex,Camp)
	PlayerIndex = RoleIndex
	if Camp == CAMP_PLAYER then
		Set_Player_State();
	else	--CAMP_AUDIENCE
		Set_Audience_State();
	end;
	AddMSPlayer(MISSION_ID,Camp);
end;
