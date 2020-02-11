Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function OnUse()
	local nMapID,nMapX,nMapY = GetWorldPos();
	if nMapID ~= MAPID then
		Msg2Player("S¬n tÆc-chiÕn cæ chØ dïng ®­îc trong ChiÕn tr­êng Th¶o cèc.");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("T¹m thêi kh«ng thÓ dïng s¬n tÆc-chiÕn cæ.");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nLastUseTime = GetMissionV(MV_DRUM_USE_TIME_SONG+nCamp-1);
	local nCurTime = GetTime();
	if nCurTime - nLastUseTime > 5 then
		if DelItem(tBattleItem[8][2],tBattleItem[8][3],tBattleItem[8][4],1) == 1 then
			BT_OperateAllPlayer(func,{nMapX,nMapY},3-nCamp);		
			SetMissionV(MV_DRUM_USE_TIME_SONG+nCamp-1,nCurTime);
		end;
	else
		Msg2Player("Phe ta kh«ng thÓ dïng s¬n tÆc-chiÕn cæ nhiÒu lÇn, xin ®îi gi©y l¸t.");
	end;
end;

function func(tArg)
	local nPosX,nPosY = tArg[1],tArg[2];
	local _,nMapX,nMapY = GetWorldPos();
	if GetFightState() == 0 or IsPlayerDeath() ~= 0 then	--ºÍÆ½×´Ì¬ºÍËÀÍö×´Ì¬²»²Ù×÷
		return 0;
	end;
	local nRand = random(1,3);
	if abs(nMapX-nPosX) <= 50 and abs(nMapY-nPosY) <= 50 then
		if nRand == 1 then
			CastState("state_confusion",1,5*18);	--»ìÂÒ5Ãë
		elseif nRand == 2 then
			CastState("state_fetter",1,5*18)	--¶¨Éí5Ãë
		else
			CastState("state_vertigo",1,5*18)	--Ñ£ÔÎ5Ãë
		end;
	end;
end;
