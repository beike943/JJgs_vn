--Ã·×¯µØÍ¼´«³öÊéÍ¯½Å±¾
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Th­ §ång:<color>%s muèn rêi khái Mai Trang kh«ng?",sName),2,"Rêi khái/leave","Kh«ng cÇn ®©u/do_nothing");
end

function leave()
	NewWorld(106,1300,3110);
	SetFightState(1);
end

function do_nothing()
end