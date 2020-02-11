--×÷±×¼ì²â»úÖÆ
t_player_cheat_list = {}

function pcd_initialize()
	pcd_clear_cheat_data()
end

function pcd_clear_cheat_data()
	t_player_cheat_list = {}
end

function __pcd_add_cheat_weight(nAdd)
	nAdd = nAdd or 0
	local szName = GetName() or ""
	local nWeight = t_player_cheat_list[szName] or 0
	nWeight = nWeight + nAdd
	t_player_cheat_list[szName] = nWeight
end

function pcd_get_cheat_weight()
	local szName = GetName() or ""
	local nWeight = t_player_cheat_list[szName] or 0
	
	return nWeight
end

function pcd_on_kill()
	__pcd_add_cheat_weight(-1)
end
function pcd_on_death()
	__pcd_add_cheat_weight(1)
end
