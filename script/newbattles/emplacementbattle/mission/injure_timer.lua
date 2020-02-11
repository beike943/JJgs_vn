Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		local nRand = random(1,100);
		if nRand <= EMPLACEMENT_HURT_PROBABILITY then 
			BT_OperateAllPlayer(judge_injure,{},ALL_ID);
		end;
	end;	
end;

function judge_injure(tArg)
	if BT_GetDistance(EMPLACEMENT_POS[1],EMPLACEMENT_POS[2]) <= EMPLACEMENT_HURT_RANGE then
		Msg2Player("Ph¸o ®µi do nhiÒu n¨m kh«ng tu söa nªn bÞ môc n¸t, binh sÜ ®øng gÇn sÏ chÞu tæn th­¬ng nhÊt ®Þnh");		
		--ÉËº¦£´£°£°£°ÉúÃü
		CastState("imme_damage_life_directly",6000,0);
	end;
end;