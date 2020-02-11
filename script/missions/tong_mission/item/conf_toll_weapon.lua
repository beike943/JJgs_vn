--脚本名称：帮会关卡武器使用脚本
--脚本功能：所有的帮户武器相关脚本统一调用的技能脚本
--策划人：侯盾
--代码开发人：村长
--代码开发时间：2007-007-30
--代码修改记录：
Tb_weapon_skill = {}
Tb_weapon_skill[2351] = {898,3}
Tb_weapon_skill[2352] = {898,3}
Tb_weapon_skill[2353] = {899,3}
Tb_weapon_skill[2354] = {899,3}
Tb_weapon_skill[2355] = {901,3}
Tb_weapon_skill[2356] = {899,3}
Tb_weapon_skill[2357] = {899,3}
Tb_weapon_skill[2358] = {898,3}
Tb_weapon_skill[2359] = {901,3}
Tb_weapon_skill[2360] = {899,3}
Tb_weapon_skill[2361] = {902,3}
Tb_weapon_skill[2362] = {898,3}
Tb_weapon_skill[2363] = {901,3}
Tb_weapon_skill[2364] = {905,2}
Tb_weapon_skill[2365] = {904,3}
Tb_weapon_skill[2366] = {902,3}
--Tb_weapon_skill[2367] = {898,3}
--Tb_weapon_skill[2368] = {901,3}
Tb_weapon_skill[2369] = {901,3}
Tb_weapon_skill[2370] = {902,3}
function OnUse(weapon_index)
	local goods_id = GetItemParticular(weapon_index)
	local nPlace = GetItemPlace(weapon_index)
	if nPlace == 1 then
		if DoFireworks(Tb_weapon_skill[goods_id][1],Tb_weapon_skill[goods_id][2]) == 1 then
			SetItemUseLapse(weapon_index,3*60*18)
		end
		return 1
	end
	return 0
end

function CanEquip()
	return 0;	--返回非1表示能右键装备。返回1表示不能装备
end

function OnEquip()
	return 0
end

function OnUnEquip()
	return 0
end