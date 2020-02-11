--ÉÙÁÖÒéÊÂÌü¾»´È½Å±¾
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>TŞnh Tõ: <color>%s, A di ®µ phËt.",sName),2,"Ta muèn rêi khái ThiÕu L©m NghŞ Sù §­êng/out_map","Kh«ng cÇn ®©u/do_nothing");
end

function out_map()
	NewWorld(204,1682,3143);
	SetFightState(0);
end

function do_nothing()
end