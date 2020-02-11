--Î÷µº´¬·ò½Å±¾

Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>ThuyÒn phu:<color>%s cã viÖc cÇn nhê?",sName),2,"Ta muèn rêi khái T©y §¶o/out_map","Kh«ng cÇn ®©u/do_nothing");
end

function out_map()
	NewWorld(104,1566,2974);
	SetFightState(1);
end

function do_nothing()
end