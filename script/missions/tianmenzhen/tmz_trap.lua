
Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

tXueHen = {--²î¾àÊı ¹¥»÷Ìá¸ßÊıÖµ ÉúÃüÉÏÏŞÌá¸ßÊıÖµ ÃâÒß¸ºÃæ´ÎÊı
	{21,150,300,14,"TuyÕt HËn cÊp 10","C«ng kİch t¨ng 150%, giíi h¹n sinh mÖnh t¨ng 300%, miÔn dŞch tr¹ng th¸i bŞ h¹i 14 lÇn. "},
	{19,150,300,14,"TuyÕt HËn cÊp 10","C«ng kİch t¨ng 150%, giíi h¹n sinh mÖnh t¨ng 300%, miÔn dŞch tr¹ng th¸i bŞ h¹i 14 lÇn. "},
	{17,135,270,14,"TuyÕt HËn cÊp 9","C«ng kİch t¨ng 135%, giíi h¹n sinh mÖnh t¨ng 270%, miÔn dŞch tr¹ng th¸i bŞ h¹i 14 lÇn. "},
	{15,120,240,13,"TuyÕt HËn cÊp 8","C«ng kİch t¨ng 120%, giíi h¹n sinh mÖnh t¨ng 240%, miÔn dŞch tr¹ng th¸i bŞ h¹i 13 lÇn. "},
	{13,105,210,13,"TuyÕt HËn cÊp 7","C«ng kİch t¨ng 105%, giíi h¹n sinh mÖnh t¨ng 210%, miÔn dŞch tr¹ng th¸i bŞ h¹i 13 lÇn. "},
	{11,90 ,180,12,"TuyÕt HËn cÊp 6","C«ng kİch t¨ng 90%, giíi h¹n sinh mÖnh t¨ng 180%, miÔn dŞch tr¹ng th¸i bŞ h¹i 12 lÇn. "},
	{9 ,75 ,150,12,"TuyÕt HËn cÊp 5","C«ng kİch t¨ng 75%, giíi h¹n sinh mÖnh t¨ng 150%, miÔn dŞch tr¹ng th¸i bŞ h¹i 12 lÇn. "},
	{7 ,60 ,120,10,"TuyÕt HËn cÊp 4","C«ng kİch t¨ng 60%, giíi h¹n sinh mÖnh t¨ng 120%, miÔn dŞch tr¹ng th¸i bŞ h¹i 10 lÇn. "},
	{5 ,45 ,90 , 5,"TuyÕt HËn cÊp 3","C«ng kİch t¨ng 45%, giíi h¹n sinh mÖnh t¨ng 90%, miÔn dŞch tr¹ng th¸i bŞ h¹i 5 lÇn. "},
	{3 ,30 ,60 , 3,"TuyÕt HËn cÊp 2","C«ng kİch t¨ng 30%, giíi h¹n sinh mÖnh t¨ng 60%, miÔn dŞch tr¹ng th¸i bŞ h¹i 3 lÇn. "},
	{1 ,15 ,30 , 1,"TuyÕt HËn cÊp 1","C«ng kİch t¨ng 15%, giíi h¹n sinh mÖnh t¨ng 30%, miÔn dŞch tr¹ng th¸i bŞ h¹i 1 lÇn. "},
};

function main()
	local nCamp = TMZ_GetCamp();
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_PEACE then
		Talk(1,"","Qu©n sÜ 2 bªn diÔn vâ vÉn ch­a ®¹t ®Õn<color=yellow>"..PLAYER_NEED_NUM.."ng­êi <color>, vu lßng ®îi thªm gi©y l¸t. ");
		SetPos(tPositionCamp[nCamp][1][1],tPositionCamp[nCamp][1][2]);
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_READY then
		Talk(1,"","Thiªn M«n TrËn diÔn vâ tr­êng lËp tøc b¾t ®Çu, c¸c vŞ ®¹i hiÖp h·y chuÈn bŞ. ");
		SetPos(tPositionCamp[nCamp][1][1],tPositionCamp[nCamp][1][2]);		
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_FIGHT then
		if GetTime() - GetTaskTemp(TASK_TEMP_DIE_TIME) < 10 then
			Talk(1,"","C¸c h¹ chuÈn bŞ ch­a ®ñ 10 gi©y, cÇn ®îi thªm.");
			return 0;
		end
		local nKillNum = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKilledNum = GetTask(TASKID_TMZ_PLAYER_KILLED);
		local nKillDistance = nKilledNum-nKillNum;
		local nTbIdx = 0;
		if nKillDistance > 0 then
			for i = 1,getn(tXueHen) do
				if nKillDistance >= tXueHen[i][1] then
					nTbIdx = i;
					break;
				end
			end
		end
		local nRand = random(1,2);	
		SetPos(tPositionCamp[nCamp][2][nRand][1],tPositionCamp[nCamp][2][nRand][2]);
		ClearColdDown();	--Çå³ıÒ©CD
		SetTaskTemp(PTT_DIE_LOOP,0);
		SetFightState(1);
		--ÏÈÇåÑ©ºŞ×´Ì¬ÔÙ¼Ó
		RemoveState(9908);
		RemoveState(9909);
		RemoveState(9910);
		RemoveState(9911);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18); --ÎŞµĞ
		if nTbIdx ~= 0 then
			CastState("state_p_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9908,1); --Íâ¹¥¹¥»÷
			CastState("state_m_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9909,1);	--ÄÚ¹¥¹¥»÷
			CastState("state_life_max_percent_add",tXueHen[nTbIdx][3],2*60*18,1,9910,1);		--ÉúÃüÉÏÏŞ
			CastState("state_buff_resist",tXueHen[nTbIdx][4],2*60*18,1,9911,1);					--ÃâÒß¸ºÃæ×´Ì¬
			SyncCustomState(1,9908,1,tXueHen[nTbIdx][5]);
			Msg2Player("B¹n nhËn ®­îc "..tXueHen[nTbIdx][5].."HiÖu qu¶: "..tXueHen[nTbIdx][6].."Duy tr× 2 phót.");
		end
		TMZ_RestoreAll();
	end;		
end