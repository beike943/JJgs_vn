--×÷Õß£ºÑÏ¾ü
--´´½¨ÈÕÆÚ£º07Äê11ÔÂ21ÈÕ14:34
--Íæ¼ÒËÀÍö½Å±¾

g_szThisFile = "\\script\\task\\faction_back_room\\death_player.lua";

Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	WantTo1v1(PlayerIndex,"B¹n bÞ ®¸nh ng·, b¹n cã muèn tiÕp tôc kh«ng? CÇn "..NEED_NUM_JIEGUAN.."c¸i"..TB_ITEM[1][1]..". §Õm ng­îc %d gi©y...",30,g_szThisFile);
end;

function OnWant(nPIdx, nType)
	if BR_CheckMissionName() ~= 1 then
		return 0;
	end;
	RevivePlayer(0);
	if nType == 0 then	--Ñ¡ÔñÈ¡Ïû»ò²Ù×÷³¬Ê±
		Say("V­ît ¶i thÊt b¹i, ®ang ®­a b¹n trë vÒ, xin h·y ®îi......",0);
		process_failure();
		return 0;
	end;
	if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < NEED_NUM_JIEGUAN then
		Say("CÇn cã "..NEED_NUM_JIEGUAN.."c¸i"..TB_ITEM[1][1].." míi cã thÓ tiÕp tôc, v­ît ¶i thÊt b¹i! §ang ®­a b¹n trë vÒ, xin h·y ®îi......",0);
		process_failure();
		return 0;
	end;
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	--³É¹¦½Ó¹Ø
	Say("TiÕp tôc thµnh c«ng !",0);
	Msg2MSAll(MISSION_ID,"TiÕp tôc thµnh c«ng !");
	BR_RestorePlayer();
	DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],NEED_NUM_JIEGUAN);
	BR_UnInitStageEven(nDiff,nStage);
	if nCurStage == 1 or nCurStage == 5 or nCurStage == 9 then	--µ±Ç°Òª½ÓµÄ¹ØÊÇ1,5,9¹Ø
		BR_PauseStage();	--²¹¸ø½×¶Î
	else	--½øÈë¶ÌÔÝÐÝÏ¢ÆÚ
		--ÒÔ½áÊøÄ³Ò»¹Ø¿¨×÷Îª¹Ø¿¨Ö®¼äµÄ·Ö½çµã
		BR_ChangeMSState(MS_STATE_SHORT_PAUSE);
	end;
end;

function process_failure()
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	Msg2MSAll(MISSION_ID,"V­ît ¶i thÊt b¹i ......");
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	BR_CreateDisciple();
	WriteLog(LOG_HEADER.."V­ît ¶i thÊt b¹i. §é khã: "..nCurDiff..", ¶i  "..nCurStage..". Tªn: "..GetName()..", cÊp:"..GetLevel()..","..GetMissionV(MV_ROUTE)..", nguyªn nh©n: tö vong nªn kh«ng thÓ tiÕp tôc");
end;
