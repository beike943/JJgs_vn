--ºÚÄ¾ÑÂÉñÃØĞÂ½ÌÍ½½Å±¾

Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green> <color>%s cã viÖc cÇn nhê?",sName),2,"Ta muèn rêi khái H¾c Méc Nhai/out_map","Kh«ng cÇn ®©u/do_nothing");
end

function out_map()
	NewWorld(504,1283,2826);
	SetFightState(1);
	SetCampToPlayer("")
end

function do_nothing()
end