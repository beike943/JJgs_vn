--桃花小栈地图门童脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>M玭 уng: <color>%s mu鑞 r阨 kh醝 Уo Hoa Ti觰 S筺?",sName),2,"R阨 kh醝/leave","Kh玭g c莕 u/do_nothing");
end

function leave()
		NewWorld(102,1456,3066);
		SetFightState(1);	
		return 1;		
end

function do_nothing()
end