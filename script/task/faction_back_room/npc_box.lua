--create date:2007-12-21 16:49
--author:yanjun
--describe:¹Ø¿¨½±Àø±¦Ïä
Include("\\script\\task\\faction_back_room\\back_room_function.lua");

function main()
	if GetTask(TSK_WC_FAIL_TIMES) >= MAX_FAILURE_TIMES then
		Talk(1,"","Sè lÇn xo¸ d÷ liÖu trong tuÇn ®· lín h¬n hoÆc b»ng <color=yellow>"..MAX_FAILURE_TIMES.."<color>, kh«ng thÓ nhËn b¶o r­¬ng.");
		return 0;
	end;
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight(1,20,"") == 0 then
		return 0;
	end;
	local nDiff = GetUnitCurStates(nNpcIdx,1);	--±¦Ïä¶ÔÓ¦µÄ¹Ø¿¨	
	local nStage = GetUnitCurStates(nNpcIdx,2);	--±¦Ïä¶ÔÓ¦µÄ¹Ø¿¨
	local nParam3 = GetUnitCurStates(nNpcIdx,3);
	if nParam3 ~= 1 then	--Èç¹ûÎ´±»Ê°È¡
		gf_SetUnitCurState(nNpcIdx,3,1);	--ÉèÖÃÒÑ±»Ê°È¡
		local nCurDiff = BR_GetCurDiff();	--±¦Ïä¶ÔÓ¦µÄ¹Ø¿¨µÄÏÂÒ»¹Ø¡£ÒòÎª´´½¨±¦Ïäºó£¬µ±Ç°¹Ø¿¨½«»á±»ÖÃÎªÏÂÒ»¹Ø
		local nCurStage = BR_GetCurStage();	--±¦Ïä¶ÔÓ¦µÄ¹Ø¿¨µÄÏÂÒ»¹Ø
		BR_SaveRecord(nCurDiff,nCurStage);	--Ê°È¡±¦Ïäºó±£´æ½ø¶ÈÎªÏÂÒ»¹Ø
		SetNpcLifeTime(nNpcIdx,0);
		BR_GetBoxAward(nDiff,nStage);
	end;
end;