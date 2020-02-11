--date:2007-3-8
--author:yanjun
--describe:the script file of the box npc
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
function main()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) > 10 then
		Msg2Player("B¹n ®øng c¸ch r­¬ng qu¸ xa");
		return 0;
	end;
	if KH_Check_Skill_Level() == 0 then
		Msg2Player("Vâ c«ng cña b¹n cßn kÐm qu¸, kh«ng thÓ më r­¬ng");
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIdx);
	local nCurTime = GetTime();
	local nParam1 = GetUnitCurStates(nNpcIdx,1);	--¼ÇÂ¼Ê±¼ä
	local nParam2 = GetUnitCurStates(nNpcIdx,2);	--ÊÇ·ñÕýÔÚ±»Ê¹ÓÃ
	local nTimeDiff = nCurTime - nParam1;
	if nParam2 ~= 1 or nTimeDiff > 60 then
		KH_SetUnit_CurStates(nNpcIdx,1,nCurTime)
		KH_SetUnit_CurStates(nNpcIdx,2,1)
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,nNpcIdx)
		DoWait(3,4,10)				--½øÈëµ÷ÓÃ
	else
		Talk(1,"","§· cã ng­êi ch¬i tõng sö dông <color=red>"..sNpcName.."<color>(Thêi gian cßn l¹i: <color=yellow>"..(60-nTimeDiff).." gi©y<color>).")
		return
	end
end;