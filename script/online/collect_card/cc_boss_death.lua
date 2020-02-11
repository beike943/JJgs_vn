--BOSSÀ¿Õˆ
Include("\\script\\online\\collect_card\\cc_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		--øÁÃÏ«Â¿Ì
		cc_daily_clear();
		local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
		if nTimes < CC_BOX_MAX_LM_CARD then
			gf_AddItemEx2({2,1,30507,1}, "ThŒ Linh Mi™u VÀn", "Hoπt ÆÈng m´n ph∏i mÌi", "ThŒ T˘ BOSS", 0, 1);
			CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + 1);
		else
			Msg2Player("ThŒ T˘ Linh Mi™u VÀn Æ∑ Æπt Æ’n giÌi hπn sË l«n nhÀn mÁi ngµy");
		end
	end
	local nMapID, nX, nY = GetNpcWorldPos(id);
	local nBoxIndex = CreateNpc("huangjinbaobei", "Hoµng Kim B∂o BËi", nMapID, nX, nY);
	SetNpcScript(nBoxIndex, "\\script\\online\\collect_card\\cc_boss_box.lua");
	SetNpcLifeTime(nBoxIndex, 10*60);
	local strMsg = format("BOSS %s Æ∑ bﬁ hi÷p s‹ %s ti™u di÷t, BOSS r¨i ra Hoµng Kim B∂o BËi, c∏c Æπi hi÷p nhanh ch©n Æ’n thu thÀp!", GetNpcName(id), GetName());
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
	SetNpcLifeTime(id, 0);
end