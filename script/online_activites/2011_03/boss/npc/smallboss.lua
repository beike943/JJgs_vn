Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\2011_03\\boss\\string.lua");
Include("\\script\\online_activites\\2011_03\\boss\\eventboss.lua");

function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	
	if (VET_201103_EventBoss_CheckSmallAward() == 1) then
		if gf_Judge_Room_Weight(1, 0, "") == 1 then
			local nTimeNow = GetTime();
			-- Chèng auto click NPC
			SetNpcScript(nNpcIndex, "")
			SetNpcLifeTime(nNpcIndex, 0)
			VET_201103_EVENTBOSS_TaskGroup:SetTask(VET_201103_EVENTBOSS_TaskGroup.TSK_LAST_AWARD_TIME, nTimeNow);
			gf_EventGiveCustomAward(1, 100000, 1, VET_STR_201103_EVENTBOSS_LOG_TITLE, format(VET_TB_201103_EVENTBOSS_LOG_ACTION_LIST[1],VET_TB_201103_EVENTBOSS_NPC_NAME[2]));
			gf_AddItemEx2({2,1,30292, 10},VET_TB_201103_EVENTBOSS_ITEM_TITLE[5],VET_STR_201103_EVENTBOSS_LOG_TITLE,format(VET_TB_201103_EVENTBOSS_LOG_ACTION_LIST[1],VET_TB_201103_EVENTBOSS_NPC_NAME[2]),0,1);
		end
	end
end