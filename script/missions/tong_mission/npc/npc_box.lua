--create date:2007-07-25 15:57
--author:yanjun
--describe:¹Ø¿¨½±Àø±¦Ïä
Include("\\script\\missions\\tong_mission\\main_function.lua");

function main()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"","ViÖn trî ngo¹i bang kh«ng thÓ nhÆt b¶o r­¬ng.");
		return 0;
	end;
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"","B¶o r­¬ng ph¶i ®­îc më bëi Bang chu, Phã bang chñ, Tr­ëng l·o.");
		return 0;
	end;
	local nParam2 = GetUnitCurStates(nNpcIdx,2);	
	local nStage = GetUnitCurStates(nNpcIdx,1);	
	local nNeedRoom = 2;
	if nStage == MAX_STAGE then
		nNeedRoom = 7;	--µÚ6¹ØÐèÒª7¸ö¿Õ¼ä
	end;
	if gf_JudgeRoomWeight(nNeedRoom,50,"") == 0 then
		return 0;
	end;
	if nParam2 ~= 1 then	--Èç¹ûÎ´±»Ê°È¡
		TM_SetUnitCurStates(nNpcIdx,2,1);	--ÉèÖÃÒÑ±»Ê°È¡
		SetNpcLifeTime(nNpcIdx,0);
		AddItem(2,0,740+nStage-1,2);
		if nStage == MAX_STAGE then	--Èç¹ûÊÇµÚ6¹Ø£¬ÔòÔÙ¸ø1ÖÁ5¹ØµÄÏä×Ó¸÷1¸ö
			for i=1,5 do
				AddItem(2,0,740+i-1,1);
			end;
			Msg2MSAll(MISSION_ID,GetName().."Më b¶o r­¬ng cña ¶i "..nStage..", thu ®­îc 7 b¶o r­¬ng Tö Quang C¸c");
		else
			Msg2MSAll(MISSION_ID,GetName().."Më b¶o r­¬ng cña ¶i "..nStage..", thu ®­îc 2 b¶o r­¬ng Tö Quang C¸c");
		end;
		SetMissionV(MV_GET_BOX,0);
		SendTongMessage(GetName().."NhÆt ®­îc r­¬ng cña ¶i"..nStage..".	");
		WriteLog("[Bang héi v­ît ¶i]:"..GetName().."NhÆt ®­îc thø"..nStage..".	");
	end;
end;