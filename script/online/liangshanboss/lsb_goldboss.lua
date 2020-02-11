--boss每掉20%的血回调的脚本
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function DealPer20()
	--print("刷40个箱子")
	local nIndex = GetGlbValue(GS_GLOBAL_VALUE3);
	if nIndex ~= 0 then
		for i = 1, GlodBoss_Drop_Num do
			local nNpcIdx = CreateNpc("B秓 rng T礽 nguy猲", "B秓 rng", LSB_GOLD_BOSS_LOCATION[nIndex][1], LSB_GOLD_BOSS_LOCATION[nIndex][2], LSB_GOLD_BOSS_LOCATION[nIndex][3],6,1,1,400);
			SetNpcLifeTime(nNpcIdx,3 * 60);
			--SetTaskTemp(Sma_Boss_Index,nNpcIdx);
			SetNpcScript(nNpcIdx,Box_A_Script);
		end
	end
end