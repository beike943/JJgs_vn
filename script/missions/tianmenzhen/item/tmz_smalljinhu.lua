
g_tItem = {"Ti”u Ti”u Kim HÊ", {2,95,696,1}};

g_tModels ={"Ti”u Ti”u Kim HÊ"};

Include("\\script\\item\\summon_pet_charm.lua")

_check = check;
function check()
	if GetFollower() ~= 0 then
		KillFollower();
		return 0;
	end
	return _check();
end
function create_pet(sName)
	SummonNpc(getPetModel(), sName)
end
