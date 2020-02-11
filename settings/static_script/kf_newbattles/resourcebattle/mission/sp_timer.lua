--describe:Ãÿ ‚º∆ ±∆˜°£ø…“‘∏˘æ›º∆ ±∆˜µƒ◊¥Ã¨¿¥—°‘Ò¥•∑¢“ª–© ¬º˛
--“ª∞„¿¥Àµ’‚∏ˆ ¬º˛µƒ≥÷–¯ ±º‰≤ª≥§
Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnTimer()
	local nTimerState = GetMissionV(MV_SP_TIMER_STATE);
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if nTimerState == TM_STATE_CATERAN_SONG or nTimerState == TM_STATE_CATERAN_LIAO then
			Process_Sp_Careran_Even(nTimerState);
		end;
	else
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nTimerState-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nTimerState-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	end;
end;
--…Ω‘ÙΩŸ”™ ¬º˛,nCamp÷∏µƒ «…Ω‘Ùµƒ’Û”™
function Process_Sp_Careran_Even(nCamp)
	local nLoop = GetMissionV(MV_SP_TIMER_LOOP);
	SetMissionV(MV_SP_TIMER_LOOP,nLoop-1)
	local nCateranCount = CountGroupUnit(CATERAN_GROUP_SONG+nCamp-1);
	local nEnemyCamp = 3 - nCamp;
	if nLoop == 0 then
		if nCateranCount > 0 then
			if nEnemyCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"S¨n t∆c hÀu doanh phe TËng d≠Íng nh≠ chπy m t dπng");
			else
				Msg2MSAll(MISSION_ID,"S¨n t∆c hÀu doanh phe Li™u d≠Íng nh≠ chπy m t dπng");
			end;
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nCamp-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nCamp-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	elseif nLoop <= 45 then	--15√Î∫Û≤≈”––ßπ˚
		if nCateranCount == 0 then
			if nLoop > 30 then
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"S¨n t∆c trong hÀu doanh phe TËng g«n nh≠ bﬁ ÆuÊi Æi h’t");
				else
					Msg2MSAll(MISSION_ID,"S¨n t∆c trong hÀu doanh phe Li™u g«n nh≠ bﬁ ÆuÊi Æi h’t");
				end;
			else
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"S¨n t∆c trong hÀu doanh phe TËng g«n nh≠ bﬁ ÆuÊi Æi h’t");
				else
					Msg2MSAll(MISSION_ID,"S¨n t∆c trong hÀu doanh phe Li™u g«n nh≠ bﬁ ÆuÊi Æi h’t");
				end;
			end;
			SetMissionV(MV_SP_TIMER_STATE,0);
			StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
			return 0;
		end;
		Add_Resource(nCamp,nCateranCount);	--nCamp∑Ω¡∏≤›‘ˆº”
		Msg2MSGroup(MISSION_ID,"ß∏nh s¨n t∆c: Æoπt Æ≠Óc"..nCateranCount.." bao l≠¨ng th∂o",nCamp);
		Dec_Resource(nEnemyCamp,nCateranCount);	--nEnemyCamp∑Ω¡∏≤›ºı…Ÿ
		Msg2MSGroup(MISSION_ID,"ß∏nh s¨n t∆c:"..nCateranCount.." bao l≠¨ng th∂o cÒa ta Æ∑ bﬁ s¨n t∆c c≠Ìp Æi",nEnemyCamp);
	elseif nCateranCount == 0 then	--15√Îƒ⁄»Áπ˚…Ω‘Ù ˝¡øŒ™0
		if nEnemyCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"T≠Ìng s‹  phe TËng kﬁp thÍi ÆuÊi s¨n t∆c Æi");
		else
			Msg2MSAll(MISSION_ID,"T≠Ìng s‹  phe TËng kﬁp thÍi ÆuÊi s¨n t∆c Æi");
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
		return 0;		
	end;
end;
