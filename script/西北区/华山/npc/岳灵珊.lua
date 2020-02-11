--华山地图岳灵珊脚本
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Nh筩 Linh San: <color>%s mong 頲 xu鑞g n骾?",sName),2,"Ta mu鑞 r阨 kh醝 Hoa S琻/xiashan","Kh玭g c莕 u/do_nothing");
end

function xiashan()
	NewWorld(500,1829,3260);
	SetFightState(0);
end

function do_nothing()
end