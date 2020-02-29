Include("\\script\\lib\\globalfunctions.lua")

JLMD_TABLE = {
	[2] = {15, {5, 100000000, 500}, 0},
	[3] = {10, {10, 200000000, 1000}, 0},
	[4] = {4, {15, 400000000, 3000}, 0},
	[5] = {2, {20, 1000000000, 8000}, 1},
};

function OnUse(nItem)
	local nLevel = gf_GetPetSkillLevel();
	if nLevel < 1 then
		Say("你还没有学会降灵术", 0);
		return
	end
	if not JLMD_TABLE[nLevel + 1] then
		Say("功能暂未开放！", 0);
		return
	end
	local tCost = JLMD_TABLE[nLevel + 1][2];
	Say(format("你同意消耗<color=red>%s*%d, EXP %d,降灵秘典%d<color>获得更高的降灵术等级吗？", "降灵术", tCost[1], tCost[2], tCost[3]), 2, format("同意/#try_update_jinglingshu(%d)", nLevel + 1), "取消/nothing");
end

function try_update_jinglingshu(nIndex)
	local tCost = JLMD_TABLE[nIndex][2];
	if not tCost then
		return 
	end
	if GetItemCount(2, 1, 30725) < tCost[1] then
		Say(format("数量<color=gold>%s<color>不足<color=red>%d<color>", "降灵秘典", tCost[1]), 0);
		return
	end
	if GetExp() < tCost[2] then
		Say(format("数量<color=gold>%s<color>不足<color=red>%d<color>", "经验", tCost[2]), 0);
		return
	end
	if GetPopur() < tCost[3] then
		Say(format("数量<color=gold>%s<color>不足<color=red>%d<color>", "积分", tCost[3]), 0);
		return
	end
	if DelItem(2, 1, 30725, tCost[1]) ~= 1 then
		return
	end
	
	AddRuntimeStat(28, 1, nIndex, 1);--冲击降灵术X级的次数
	AddRuntimeStat(28, 2, 0, tCost[1]); --消耗降灵秘典数量
	
	ModifyExp(-tCost[2]);
	ModifyPopur(-tCost[3]);
	local rand = random(100);
	if rand <= JLMD_TABLE[nIndex][1] then
		gf_SetPetSkillLevel(nIndex);
		if JLMD_TABLE[nIndex][3] == 1 then
			Msg2Global(format("恭喜你[%s]使用降灵秘典成功的升级了降灵术%d", GetName(), nIndex));
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		Say("升级失败！", 0);
	end
end
