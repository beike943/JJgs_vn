--Ã·×¯µØÀÎµØÍ¼¿´ÊØ½Å±¾
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Thñ vÖ: <color>%s muèn rêi khái Mai Trang §Þa Lao?",sName),2,"Rêi khái/leave","Kh«ng cÇn ®©u/do_nothing");
end

function leave()
	NewWorld(6016,1586,3140);
	SetFightState(1);
end

function do_nothing()
end