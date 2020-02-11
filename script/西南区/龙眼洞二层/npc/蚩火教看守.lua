Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")

function main()
	local nMapId = GetWorldPos();
	local sName = gf_GetPlayerSexName();
	if nMapId == 413 then
		Say(format("<color=green>Kh¸n Thñ:<color> %s muèn vµo Xi Háa Gi¸o Ngôc Gi¸m?",sName),2,"Ta muèn vµo/_entrance","Kh«ng cÇn ®©u/do_nothing");
	elseif nMapId == 8010 then
		Say(format("<color=green>Kh¸n Thñ:<color> %s muèn tõ Xi Háa Gi¸o Ngôc Gi¸m ra ngoµi?",sName),2,"Ta muèn ra ngoµi/_outprison","Kh«ng cÇn ®©u/do_nothing");
	else
		Say("<color=green>Kh¸n Thñ:<color> Nhµ lao lµ n¬i träng ®Þa, h·y nhanh chãng rêi khái!", 0)
	end
end

function _entrance()
	if IsHaveTaskOrCanGet2(242, 246) == 1 then
		NewWorld(8010, 1605, 3212);
		SetFightState(1);
		return 1;	
	end
	Say("<color=green>Kh¸n Thñ:<color> Nhµ lao lµ n¬i träng ®Þa, h·y nhanh chãng rêi khái!", 0)
end

function _outprison()
	if IsNpcChangeModel(PIdx2NpcIdx()) == 1 then
		NpcChangeModel(PIdx2NpcIdx(),"");
		return 0;
	end
	NewWorld(413, 1861, 3305);
	SetFightState(1);
	return 1;	
end

function do_nothing()
end