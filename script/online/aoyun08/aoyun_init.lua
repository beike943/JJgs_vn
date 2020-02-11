--圣火传递活动初始化
--by vivi
--2008/06/10

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

if GetGlbValue(GLB_AOYUN_TIME_STATE) == 1 then
	local nNpcNum = GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM); --第几号台点燃
	local nNpcIdx = GetGlbValue(GLB_AOYUN_NPC_YI+nNpcNum);
	local nNpcName = GetNpcName(nNpcIdx);
	if nNpcNum == 0 then
		SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nNpcNum+1);
		if nNpcName == tHuojuName[1][1] then
			SetCurrentNpcSFX(nNpcIdx,910,2,1);--点燃
			Msg2Global(tHuojuName[1][1].."Х th緋.");
		end
	elseif nNpcNum < 30 then
		SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nNpcNum+1);
		if nNpcName == tHuojuName[nNpcNum][2] then
			SetCurrentNpcSFX(nNpcIdx,909,2,1);--点燃
			Msg2Global(tHuojuName[nNpcNum][2].."Х th緋.");	
		end		
	elseif nNpcNum == 30 then
		SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nNpcNum+1);
		if nNpcName == tHuojuName[nNpcNum][2] then
			SetCurrentNpcSFX(nNpcIdx,913,2,1);--点燃
			Msg2Global(tHuojuName[nNpcNum][2].."Х th緋.");
		end			
	end
end