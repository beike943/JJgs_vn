--Ã·×¯µØÍ¼ÊéÍ¯´«Èë½Å±¾
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Mai Trang Th­ §ång:<color>%s muèn vµo Mai Trang kh«ng?",sName),2,"Ta muèn vµo/entrance","Kh«ng cÇn ®©u/do_nothing");
end

function entrance()
		NewWorld(6016,1490,3094);
		SetFightState(1)
end

function do_nothing()
end