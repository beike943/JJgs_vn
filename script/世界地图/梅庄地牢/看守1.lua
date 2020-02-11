--Ã·×¯µØÀÎµØÍ¼¿´ÊØ´«Èë½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Thñ vÖ: <color>%s cÇn vµo Mai Trang §Şa Lao kh«ng?",sName),2,"Ta muèn vµo/entrance","Kh«ng cÇn ®©u/do_nothing");
end

function entrance()
	if IsHaveTaskOrCanGet2(46, 52) == 1 then
		NewWorld(6013,1606,3206);
		SetFightState(1);
		return 1;	
	end
	Talk(1,"","c¸c h¹ kh«ng thÓ vµo khu vùc nµy.");	
end

function do_nothing()
end