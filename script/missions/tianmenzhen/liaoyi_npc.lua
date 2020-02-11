--ÁËÒâ

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

function main()
	if GetMissionV(MV_TMZ_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>LiÔu ı<color>: gÇn ®©y, trong thiªn m«n trËn kh«ng biÕt tõ ®©u ®Õn v« sè kÎ ¸c nh©n, ®o¹t lÊy biÕt bao Tinh TrÇn HËn cña ta! Nh÷ng Tinh TrÇn HËn nµy ®Òu lµ t©m huyÕt bao l©u nay cña ta, cÇu xin thiÕu hiÖp h·y gióp ta gi¶i quyÕt n¹n nµy.");
		return 0;
	end;
	if GetItemCount(2,0,795) < 1 then
		Talk(1,"","<color=green>LiÔu ı<color>: gÇn ®©y, trong thiªn m«n trËn kh«ng biÕt tõ ®©u ®Õn v« sè kÎ ¸c nh©n, ®o¹t lÊy biÕt bao Tinh TrÇn HËn cña ta! Nh÷ng Tinh TrÇn HËn nµy ®Òu lµ t©m huyÕt bao l©u nay cña ta, cÇu xin thiÕu hiÖp h·y gióp ta gi¶i quyÕt n¹n nµy.");
	else
		local nPlayerCamp = TMZ_GetCamp();
		local nMVPoint = MV_TMZ_CAMPONE_POINT-1+nPlayerCamp;	
		if DelItem(2,0,795,1) == 1 then
			Talk(1,"","<color=green>LiÔu ı<color>: c¶m t¹ thiÕu hiÖp! Tuy ta kh«ng thËt sù n¾m râ huyÒn c¬ cña trËn ph¸p nµy, nh­ng còng biÕt vµi bİ mËt, thiÕu hiÖp chØ cÇn nh­ thÕ… nµy nh­ thÕ nµy… lµ ®­îc.");
			SetMissionV(nMVPoint,GetMissionV(nMVPoint)+10); --+10·Ö
			TMZ_Set_ShowData_Msg();				
			Msg2MSAll(MISSION_ID,"Do "..GetName().."§­îc cao nh©n t­¬ng trî, n¾m ®­îc huyÒn c¬ ph¸ Thiªn M«n TrËn "..tCampName[nPlayerCamp].."¦u thÕ chiÕn trËn ®· ®­îc n©ng cao!")
			if GetMissionV(nMVPoint) >= OVER_GAME_POINT then
				StopMissionTimer(MISSION_ID,TIMER_ID);
				StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
				SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
				SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
				SetMissionV(MV_TMZ_WINNER_CAMP,nPlayerCamp);
				Msg2MSAll(MISSION_ID,format("Phe %s chiÕm trËn ®¹t tû sè %d, ®· giµnh chiÕn th¾ng.",tCampName[nPlayerCamp],OVER_GAME_POINT));			
				TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			end			
		end
	end
end