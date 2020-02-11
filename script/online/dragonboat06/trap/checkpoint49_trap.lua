Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local nPos = GetTask(POSITION);
	local MapID,MapX,MapY = GetWorldPos();
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		if nPos == TRAPCOUNT-1 then
			SetTask(POSITION,TRAPCOUNT);
			clearflag();
			Msg2Player("B¹n ®· hoµn thµnh ®­êng ®ua, h·y vµo khu nghØ mÖt ®Ó ®îi trËn ®Êu kÕt thóc.");
			if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED then 
				StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
				StartMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID,WAITSTOP_TIME);
				SetMissionV(MV_TIMELEFT,WAITSTOP_TIMER_LOOP);
				SetMissionV(MV_ROOMSTATE,MS_STATE_WAITCOMPLETE);
				Msg2MSAll(MISSION_ID,GetName().." Ng­êi vÒ ®Ých tr­íc tiªn cßn 1 phót n÷a thêi gian thi ®Êu míi kÕt thóc.");
			end;
			SetMissionV(MV_COMPLETENUM,GetMissionV(MV_COMPLETENUM)+1);	
			SetTask(RANK,GetMissionV(MV_COMPLETENUM));
			SetTask(FINISHTIME,GetGameLoop()-GetMissionV(MV_GAMELOOP));
			if GetTask(BEST_TIME) == 0 then
				SetTask(BEST_TIME,GetTask(FINISHTIME));	--¼ÇÂ¼×îºÃ³É¼¨£¬µ¥Î»ÎªÖ¡				
			elseif GetTask(BEST_TIME) > GetTask(FINISHTIME) then
				Msg2Player("Chóc mõng b¹n ®· ph¸ kû lôc vÒ ®Ých sím nhÊt.");
				SetTask(BEST_TIME,GetTask(FINISHTIME));	--¼ÇÂ¼×îºÃ³É¼¨£¬µ¥Î»ÎªÖ¡
			end;
			local FinishTime = GetTask(FINISHTIME);
			FinishTime = FinishTime/18;
			local nMin = floor(FinishTime/60);
			local nSec = format("%.2f",FinishTime - nMin*60);	--Ð¡ÊýµãºóÁ½Î»¾Í¹»ÁË
			local sResult = "Tæng thêi gian"..nMin.." phót "..nSec.." Gi©y "

			Msg2MSAll(MISSION_ID,GetName().."c¸n ®Ých."..sResult);
			if GetMissionV(MV_COMPLETENUM) == GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) then
				StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
				Msg2MSAll(MISSION_ID,"TrËn ®Êu kÕt thóc, h·y xem thø h¹ng cña m×nh.");
				StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);
				SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
				Report_Result(Get_Rank());
				Give_Award();
			end;
			ForbidChangePK(0);
			SetPKFlag(0,0);	--ÉèÖÃÎªÍÀÉ±×´Ì¬
			ForbidChangePK(1);	--½ûÖ¹¸Ä±äPK×´Ì¬
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);		
		else
			NewWorld(MapID,2019,3291);
			InteractiveEnable(0);
			Msg2Player("Kh«ng ®­îc ®ua ng­îc chiÒu");
		end;
	end;
end;

function clearflag()
	for i=FLAG_BEGIN,FLAG_END do	--Çå³ýÔø´©¹ýµÄÆì×ÓµÄ¼ÇÂ¼
		SetTask(i,0);
	end;
end;