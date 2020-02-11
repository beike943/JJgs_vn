--ºÚÄ¾ÑÂÉñÃØ½ÌÍ½½Å±¾

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua");

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green> <color>%s t×m ta cã viÖc g×?",sName),2,"Ta muèn ®Õn H¾c Méc Nhai/in_map","Kh«ng cÇn ®©u/do_nothing");
end

function in_map()
	if IsHaveTaskOrCanGet2(57, 58) == 1 then
		NewWorld(6015,1632,3242);
		SetFightState(1);
		SetCampToPlayer("camp_enemy");
		return 1;
	end
	if IsHaveTaskOrCanGet2(65, 72) == 1 then
		NewWorld(6017,1632,3242);
		SetFightState(1);
		SetCampToPlayer("camp_enemy");
		return 1;
	end
	if IsHaveTaskOrCanGet(73) == 1 then
		NewWorld(6018,1632,3242);
		SetFightState(1);
		SetCampToPlayer("camp_enemy");
		return 1;
	end
	Talk(1,"","c¸c h¹ kh«ng thÓ vµo khu vùc nµy.");
end

function do_nothing()
end