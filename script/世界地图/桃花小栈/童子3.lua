--ÌÒ»¨Ğ¡Õ»µØÍ¼ÃÅÍ¯´«Èë½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>M«n §ång: <color>%s muèn vµo §µo Hoa TiÓu S¹n kh«ng?",sName),2,"Ta muèn vµo/entrance","Kh«ng cÇn ®©u/do_nothing");
end

function entrance()
	--¸ù¾İÈÎÎñ¾ö¶¨½øÈëµÄµØÍ¼
	if IsHaveTaskOrCanGet2(21, 52) == 1 then
		NewWorld(6009,1579,3218);
		SetFightState(0);
		return 1;
	end
	if IsHaveTaskOrCanGet2(53, 61) == 1 then
		NewWorld(6010,1579,3218);
		SetFightState(0);
		return 1;
	end
	if IsHaveTaskOrCanGet2(62, 65) == 1 then
		NewWorld(6011,1579,3218);
		SetFightState(0);
		return 1;
	end
	Talk(1,"","c¸c h¹ kh«ng thÓ vµo khu vùc nµy.");
	return 0;
end

function do_nothing()
end